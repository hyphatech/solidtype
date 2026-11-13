open Ppxlib
open Result.Syntax
module B = Ast_builder.Default

let attribute ~loc ?(payload = PStr []) name =
  B.attribute ~loc ~name:{ txt = name; loc } ~payload

(* MLX marks every element it parses with this attribute. *)
let is_jsx (e : expression) =
  List.exists
    (fun (a : attribute) -> String.equal a.attr_name.txt "JSX")
    e.pexp_attributes

(* A spread is the attribute [props=p], as MLX has no syntax for one, so
   [props] is the name of no prop: an element reads it as a spread, a
   component's check takes it beside the props, and a component's parameter
   may not take it. *)
let spread = "props"

(* The names the spelling rule's inverse would not give back, from the tables
   the generators write. *)
let names =
  let t = Hashtbl.create 64 in
  List.iter
    (fun (l, js) -> Hashtbl.replace t l js)
    (Html_names.names @ Kobalte_names.names @ Rhp_names.names);
  t

let starts_with ~prefix s =
  String.length s >= String.length prefix
  && String.equal (String.sub s 0 (String.length prefix)) prefix

(* A name a user writes is Solid's or Kobalte's by one rule: a capital is an
   underscore and the lower case, a hyphen an underscore, and a keyword takes
   a trailing underscore. Its JavaScript name comes back from the generators'
   tables where the rule's inverse would not give it, and otherwise from that
   inverse: the keyword's underscore dropped, a hyphen after [aria_] and
   [data_], and a capital after any other underscore. *)
let js_name label =
  match Hashtbl.find_opt names label with
  | Some js -> js
  | None ->
      let n = String.length label in
      let bare =
        if n > 1 && Char.equal label.[n - 1] '_' then String.sub label 0 (n - 1)
        else label
      in
      if starts_with ~prefix:"aria_" bare || starts_with ~prefix:"data_" bare
      then String.map (function '_' -> '-' | c -> c) bare
      else
        let b = Buffer.create (String.length bare) in
        let raise_next = ref false in
        String.iteri
          (fun i c ->
            let next_is_word =
              i + 1 < String.length bare
              &&
              match bare.[i + 1] with
              | 'a' .. 'z' | '0' .. '9' -> true
              | _ -> false
            in
            if Char.equal c '_' && next_is_word then raise_next := true
            else (
              Buffer.add_char b
                (if !raise_next then Char.uppercase_ascii c else c);
              raise_next := false))
          bare;
        Buffer.contents b

(* A string written in JSX is text for the page, so it is a JavaScript
   string, {js|...|js}: Melange reads any other string as bytes, "..." or
   {|...|} alike, and writes "…" as the three characters of its UTF-8. It
   also reads escapes in {js|...|js}, where [s] is already the string's
   value, so each backslash is doubled to reach the page as one. A string
   written {js|...|js} is JavaScript's already, its escapes meant. *)
let js_string (e : expression) =
  match e.pexp_desc with
  | Pexp_constant (Pconst_string (_, _, Some "js")) -> e
  | Pexp_constant (Pconst_string (s, loc, _)) ->
      let s = String.concat {|\\|} (String.split_on_char '\\' s) in
      { e with pexp_desc = Pexp_constant (Pconst_string (s, loc, Some "js")) }
  | _ -> e

let last = function Ldot (_, name) | Lident name -> name | Lapply _ -> ""

let is_handler label =
  String.length label > 3 && starts_with ~prefix:"on_" label

let is_unit (p : pattern) =
  match p.ppat_desc with
  | Ppat_construct ({ txt = Lident "()"; _ }, None) -> true
  | _ -> false

let is_thunk (e : expression) =
  match e.pexp_desc with
  | Pexp_function ({ pparam_desc = Pparam_val (Nolabel, None, p); _ } :: _, _, _)
    ->
      is_unit p
  | _ -> false

(* A component's render function given by name, [render=f], as a slat rhp
   reads its layout from must be: marked as it is split from the props, and
   read as a function child. MLX names a component's children [children],
   which ocamlformat cannot print beside an attribute of that name. *)
let render = "render"
let named_render = "solidtype.render"

let is_named_render (e : expression) =
  List.exists
    (fun (a : attribute) -> String.equal a.attr_name.txt named_render)
    e.pexp_attributes

let unmark (e : expression) =
  {
    e with
    pexp_attributes =
      List.filter
        (fun (a : attribute) -> not (String.equal a.attr_name.txt named_render))
        e.pexp_attributes;
  }

let is_function (e : expression) =
  is_named_render e
  || match e.pexp_desc with Pexp_function _ -> not (is_thunk e) | _ -> false

(* What a prop is decides how Solid's compiler is handed it: a literal, an
   element, a function and a name as they are, a thunk as the expression it
   returns. The syntax decides, and the types hold it: an element's attribute
   is annotated, and a component's props go through its check. A name is
   passed as it is whatever it holds, a callback or a constant, since only
   its type could say whether it is a thunk, and that type then refuses one
   where a value belongs. *)
type kind = Literal | Element | Function | Thunk

let kind_of ~handler (e : expression) =
  match e.pexp_desc with
  | Pexp_constant _ | Pexp_construct (_, None) | Pexp_variant (_, None) ->
      Literal
  | _ when is_jsx e -> Element
  | Pexp_ident _ -> Function
  | _ when handler || is_function e -> Function
  | _ -> Thunk

(* A handler an expression makes, [on_click=(remove id)], is made as its
   element is, and so is a spread: Melange evaluates an expression before the
   element it is written in, outside a branch Solid has not yet drawn, unless
   it is in a thunk, which Melange never moves out of and the plugin unwraps.
   A name or a function literal makes nothing. *)
let is_made (e : expression) =
  match e.pexp_desc with Pexp_ident _ | Pexp_function _ -> false | _ -> true

(* Solid calls what it is handed with no argument, so each thunk the ppx
   hands it is a JavaScript function of none, which Melange writes whole for an
   uncurried [fun]: a curried [fun () -> fun x -> e] would be one function of
   two, run at once by a call of none. *)
let uncurried ~loc (e : expression) =
  (* A thunk's result type, [fun () : t -> e] or [fun () :> t -> e], as MLX
     may read [fun () -> (e :> t)], is written on its body instead: an
     uncurried function's result constraint is typed as an exact match on
     some versions of the compiler's tools, where a coercion on the body is a
     coercion on every one. *)
  let e =
    match e.pexp_desc with
    | Pexp_function (params, Some c, Pfunction_body body) ->
        let body =
          match c with
          | Pconstraint t -> B.pexp_constraint ~loc:body.pexp_loc body t
          | Pcoerce (from, t) -> B.pexp_coerce ~loc:body.pexp_loc body from t
        in
        { e with pexp_desc = Pexp_function (params, None, Pfunction_body body) }
    | _ -> e
  in
  let marked (e : expression) =
    if
      List.exists
        (fun (a : attribute) -> String.equal a.attr_name.txt "u")
        e.pexp_attributes
    then e
    else { e with pexp_attributes = attribute ~loc "u" :: e.pexp_attributes }
  in
  (* Melange reads [fun[@u] () -> fun x -> e] as one function of two, so a
     function the thunk gives is bound first, a value of its own. *)
  match e.pexp_desc with
  | Pexp_function (first :: (_ :: _ as rest), constraint_, body) ->
      let given =
        { e with pexp_desc = Pexp_function (rest, constraint_, body) }
      in
      marked
        {
          e with
          pexp_desc =
            Pexp_function
              ( [ first ],
                None,
                Pfunction_body
                  [%expr
                    let solidtype__given = [%e given] in
                    solidtype__given] );
        }
  | Pexp_function
      ( params,
        constraint_,
        Pfunction_body ({ pexp_desc = Pexp_function _; _ } as given) ) ->
      marked
        {
          e with
          pexp_desc =
            Pexp_function
              ( params,
                constraint_,
                Pfunction_body
                  [%expr
                    let solidtype__given = [%e given] in
                    solidtype__given] );
        }
  | _ -> marked e

let thunk ~loc (e : expression) = uncurried ~loc [%expr fun () -> [%e e]]

(* What changes is given as a thunk the caller writes, [fun () -> e], made
   one of no argument as it stands. Any other expression is refused where it
   is written: a thunk made elsewhere would reach Solid only through an
   adapter, and its laziness would not show where it is given. *)
let to_solid ~loc (e : expression) =
  if is_thunk e then uncurried ~loc e
  else
    B.pexp_extension ~loc:e.pexp_loc
      (Location.error_extensionf ~loc:e.pexp_loc
         "a value that changes is given as a thunk, (fun () -> ...)")

let call ~loc (f : expression) =
  let apply f =
    {
      (B.pexp_apply ~loc f [ (Nolabel, [%expr ()]) ]) with
      pexp_attributes = [ attribute ~loc "u" ];
    }
  in
  (* A thunk called where it is written is its body, which Melange would
     otherwise write as a function made and called at once. *)
  let rec body (f : expression) =
    match f.pexp_desc with
    | Pexp_function
        ( [ { pparam_desc = Pparam_val (Nolabel, None, p); _ } ],
          None,
          Pfunction_body b )
      when is_unit p ->
        Some b
    | Pexp_constraint (f, { ptyp_desc = Ptyp_arrow (Nolabel, _, result); _ }) ->
        Option.map (fun b -> B.pexp_constraint ~loc b result) (body f)
    | _ -> None
  in
  match (f.pexp_desc, body f) with
  | _, Some b -> b
  | Pexp_ident _, None -> apply f
  | _, None ->
      [%expr
        let solidtype__f = [%e f] in
        [%e apply [%expr solidtype__f]]]

let error ~loc message =
  B.pexp_extension ~loc (Location.error_extensionf ~loc "%s" message)

let rec all = function
  | [] -> Ok []
  | Ok x :: rest -> Result.map (fun xs -> x :: xs) (all rest)
  | (Error _ as e) :: _ -> e

let rec list_items (e : expression) =
  match e.pexp_desc with
  | Pexp_construct ({ txt = Lident "[]"; _ }, None) -> Ok []
  | Pexp_construct
      ({ txt = Lident "::"; _ }, Some { pexp_desc = Pexp_tuple [ x; rest ]; _ })
    ->
      Result.map (fun xs -> x :: xs) (list_items rest)
  | _ -> Error (e.pexp_loc, "JSX children are a list")

(* MLX writes [<x a=1>c</x>] as [x ~a:1 ~children:[c] ()]. *)
let split args =
  let children, props =
    List.partition_map
      (fun (label, (value : expression)) ->
        match (label, value.pexp_desc) with
        | Labelled "children", _ -> Left value
        | Nolabel, Pexp_construct ({ txt = Lident "()"; _ }, None) -> Right None
        | _ -> Right (Some (label, value)))
      args
  in
  let props = List.filter_map Fun.id props in
  let given, props =
    List.partition
      (fun (label, _) ->
        match label with Labelled l -> String.equal l render | _ -> false)
      props
  in
  let* cs =
    match children with
    | [] -> Ok []
    | [ list ] -> list_items list
    | _ :: extra :: _ -> Error (extra.pexp_loc, "children are given twice")
  in
  match (given, cs) with
  | [], cs -> Ok (props, cs)
  | [ (_, ({ pexp_desc = Pexp_function _; _ } as f)) ], _ ->
      Error
        ( f.pexp_loc,
          "a function written in place is the component's child, <C>(fun \
           ...)</C>; render=f gives one by its name" )
  | [ (_, (f : expression)) ], [] ->
      let loc = f.pexp_loc in
      Ok
        ( props,
          [
            {
              f with
              pexp_attributes = attribute ~loc named_render :: f.pexp_attributes;
            };
          ] )
  | (_, (f : expression)) :: _, _ ->
      Error (f.pexp_loc, "render=f is a component's only child")

let labelled ~loc = function
  | Labelled label -> Ok label
  | Optional label ->
      Error (loc, Printf.sprintf "?%s is not supported: pass ~%s" label label)
  | Nolabel -> Error (loc, "a JSX prop is labelled")

(* An optional prop, [?name=o]: a thunk of an option, or an accessor of one
   by its name -- a prop passed on, or a signal -- whose [None] Solid and
   Kobalte are given as [undefined], absent. OCaml's own [?name:] in the check
   refuses it where the prop is not optional. *)
let optional ~loc label (value : expression) =
  if starts_with ~prefix:"data_" label || String.equal label spread then
    Error (loc, Printf.sprintf "?%s is not optional: pass %s=" label label)
  else
    match value.pexp_desc with
    | _ when is_thunk value -> Ok (uncurried ~loc value)
    | _ ->
        Error
          ( loc,
            Printf.sprintf
              "an optional prop is a thunk of an option, as any value that \
               changes is: ?%s=(fun () -> o)"
              label )

let absent_or ~loc read =
  thunk ~loc [%expr Js.Undefined.fromOption [%e call ~loc read]]

(* A child is told apart before it is lowered, while an element still carries
   MLX's attribute. *)
let child map (e : expression) =
  let loc = e.pexp_loc in
  match e.pexp_desc with
  | Pexp_constant (Pconst_string _) ->
      Ok [%expr Solidtype.Jsx.text [%e js_string e]]
  | _ when is_jsx e -> Ok [%expr Solidtype.Jsx.node [%e map e]]
  | _ when is_function e ->
      Error
        ( loc,
          "a child is a string, an element or a thunk, (fun () -> ...); a \
           function is a component's only child" )
  | Pexp_ident _ ->
      Error
        ( loc,
          "a child is a string, an element or a thunk, (fun () -> ...); a \
           function given by its name is render=f" )
  | _ ->
      Ok
        [%expr
          Solidtype.Jsx.dynamic
            ([%e to_solid ~loc (map e)] : (unit -> Solidtype.Jsx.content[@u]))]

(* A namespace of Solid's is a wrapper of the value, never a part of the
   name: [on_click=(Jsx.native f)] is [on:click={f}]. The ppx reads the
   wrapper by its syntax, so a wrapper left out is Solid's default. *)
type namespace = Native | Capture | Prop | Attr | Bool

type wrapped =
  | Namespaced of namespace * expression
  | Listen of string * expression  (** [on=(Jsx.listen "myEvent" f)] *)
  | Named of string * expression  (** [attr=(Jsx.named "data-x" s)] *)

let wrapped (e : expression) =
  let string_literal (e : expression) =
    match e.pexp_desc with
    | Pexp_constant (Pconst_string (s, _, _)) -> Some s
    | _ -> None
  in
  match e.pexp_desc with
  | Pexp_apply
      ({ pexp_desc = Pexp_ident { txt = Ldot (path, name); _ }; _ }, args)
    when String.equal (last path) "Jsx" -> (
      match (name, args) with
      | "native", [ (Nolabel, v) ] -> Some (Ok (Namespaced (Native, v)))
      | "capture", [ (Nolabel, v) ] -> Some (Ok (Namespaced (Capture, v)))
      | "prop", [ (Nolabel, v) ] -> Some (Ok (Namespaced (Prop, v)))
      | "attr", [ (Nolabel, v) ] -> Some (Ok (Namespaced (Attr, v)))
      | "bool", [ (Nolabel, v) ] -> Some (Ok (Namespaced (Bool, v)))
      | ("listen" | "named"), [ (Nolabel, n); (Nolabel, v) ] -> (
          match (name, string_literal n) with
          | "listen", Some n -> Some (Ok (Listen (n, v)))
          | _, Some n -> Some (Ok (Named (n, v)))
          | _, None ->
              Some
                (Error
                   ( n.pexp_loc,
                     Printf.sprintf "Jsx.%s takes a name as a string literal"
                       name )))
      | _ -> None)
  | _ -> None

(* An element's attribute, from its OCaml label and its value: its
   JavaScript name, its type -- the element's own in [Solidtype.Html], or the
   namespace's -- and the value the wrapper held. *)
let dom_attribute ~loc ~tag label (value : expression) =
  let html =
    B.ptyp_constr ~loc
      {
        txt =
          Ldot
            ( Ldot
                (Ldot (Lident "Solidtype", "Html"), String.capitalize_ascii tag),
              label );
        loc;
      }
      []
  in
  (* A handler's event is its name after [on], as the DOM names it. *)
  let event () =
    let js = js_name label in
    String.lowercase_ascii (String.sub js 2 (String.length js - 2))
  in
  match wrapped value with
  | None -> Ok (js_name label, Some html, value, is_handler label)
  | Some (Error e) -> Error e
  | Some (Ok (Namespaced (Native, v))) when is_handler label ->
      Ok ("on:" ^ event (), Some html, v, true)
  | Some (Ok (Namespaced (Capture, v))) when is_handler label ->
      Ok ("oncapture:" ^ event (), Some html, v, true)
  | Some (Ok (Namespaced (Native, _))) ->
      Error
        (value.pexp_loc, "Jsx.native wraps a handler, on_<event>=(Jsx.native f)")
  | Some (Ok (Namespaced (Capture, _))) ->
      Error
        ( value.pexp_loc,
          "Jsx.capture wraps a handler, on_<event>=(Jsx.capture f)" )
  | Some (Ok (Namespaced (Prop, v))) ->
      Ok ("prop:" ^ js_name label, None, v, false)
  | Some (Ok (Namespaced (Attr, v))) ->
      Ok ("attr:" ^ js_name label, Some [%type: string], v, false)
  | Some (Ok (Namespaced (Bool, v))) ->
      Ok ("bool:" ^ js_name label, Some [%type: bool], v, false)
  | Some (Ok (Listen (name, v))) when String.equal label "on" ->
      Ok ("on:" ^ name, Some [%type: Dom.event -> unit], v, true)
  | Some (Ok (Named (name, v))) when String.equal label "attr" ->
      Ok (name, Some [%type: string], v, false)
  | Some (Ok (Listen _)) ->
      Error (value.pexp_loc, "Jsx.listen is given as on=(Jsx.listen \"name\" f)")
  | Some (Ok (Named _)) ->
      Error (value.pexp_loc, "Jsx.named is given as attr=(Jsx.named \"name\" s)")

(* A data- attribute's value is a [Jsx.data], on an element as on a
   component, which no check takes, as TSX checks no hyphenated attribute
   of a component: present, or absent while a flag is down, so the
   attribute is Solid's to write on the server as in the browser. A string
   literal, the common case, is written as [Jsx.data] for it. *)
let data ~loc label (value : expression) =
  let name = B.estring ~loc (js_name label) in
  match (value.pexp_desc, kind_of ~handler:false value) with
  | Pexp_constant (Pconst_string _), _ ->
      [%expr
        Solidtype.Jsx.s [%e name] (Solidtype.Jsx.data [%e js_string value])]
  | _, Thunk ->
      [%expr
        Solidtype.Jsx.d [%e name]
          ([%e to_solid ~loc value] : (unit -> Solidtype.Jsx.data[@u]))]
  | _, (Literal | Element | Function) ->
      [%expr Solidtype.Jsx.s [%e name] ([%e value] : Solidtype.Jsx.data)]

(* An attribute's namespace given to a component, which passes it on to its
   element unchecked, as a data- attribute: [attr:], [bool:], and a name the
   spelling rule cannot keep. A handler's and a property's are an element's
   alone, since a component's props name its own. *)
let passed_on ~loc label (value : expression) =
  match wrapped value with
  | Some (Ok (Namespaced (Attr, v))) ->
      Ok ("attr:" ^ js_name label, [%type: string], v)
  | Some (Ok (Namespaced (Bool, v))) ->
      Ok ("bool:" ^ js_name label, [%type: bool], v)
  | Some (Ok (Named (name, v))) when String.equal label "attr" ->
      Ok (name, [%type: string], v)
  | Some (Error e) -> Error e
  | Some (Ok (Named _)) ->
      Error (value.pexp_loc, "Jsx.named is given as attr=(Jsx.named \"name\" s)")
  | Some (Ok (Namespaced ((Native | Capture | Prop), _) | Listen _)) | None ->
      Error
        ( loc,
          "a component passes on Jsx.attr, Jsx.bool and Jsx.named to its \
           element; Jsx.native, Jsx.capture, Jsx.prop and Jsx.listen wrap an \
           element's attribute" )

let element map ~loc name args =
  (* [<button ?as_=(fun () -> o)>]: the element, or what [o] draws in its place,
     by Solid's [Show], one marker that defers both as any JSX is deferred. The
     element stays Solid's compiled template: [Dynamic] given a tag has none to
     fall back on while hydrating, so it throws on an element only the browser
     draws, where given a function it only calls it. *)
  let drawn_as, args =
    List.partition (function Optional "as_", _ -> true | _ -> false) args
  in
  let prop (label, (value : expression)) =
    let loc = value.pexp_loc in
    match label with
    | Labelled l when String.equal l spread ->
        Ok [%expr Solidtype.Jsx.spread [%e thunk ~loc (map value)]]
    | Labelled l
      when starts_with ~prefix:"data_" l && Option.is_none (wrapped value) ->
        Ok (data ~loc l (map value))
    | Optional l -> (
        let* js, t, value, handler = dom_attribute ~loc ~tag:name l value in
        let* value = optional ~loc l value in
        match t with
        | _ when handler || Option.is_some (wrapped value) ->
            Error (loc, Printf.sprintf "?%s takes a value, not a handler" l)
        | Some t ->
            let read = [%expr ([%e map value] : (unit -> [%t t] option[@u]))] in
            Ok
              [%expr
                Solidtype.Jsx.d [%e B.estring ~loc js] [%e absent_or ~loc read]]
        | None ->
            Ok
              [%expr
                Solidtype.Jsx.d [%e B.estring ~loc js]
                  [%e absent_or ~loc (map value)]])
    | _ -> (
        let* label = labelled ~loc label in
        let+ js, t, value, handler = dom_attribute ~loc ~tag:name label value in
        let js = B.estring ~loc js in
        let value = js_string (map value) in
        match (kind_of ~handler value, t) with
        | Function, Some t when is_made value ->
            [%expr
              Solidtype.Jsx.d [%e js]
                [%e thunk ~loc [%expr ([%e value] : [%t t])]]]
        | Function, None when is_made value ->
            [%expr Solidtype.Jsx.d [%e js] [%e thunk ~loc value]]
        | Thunk, Some t ->
            [%expr
              Solidtype.Jsx.d [%e js]
                ([%e to_solid ~loc value] : (unit -> [%t t][@u]))]
        | Thunk, None ->
            [%expr Solidtype.Jsx.d [%e js] [%e to_solid ~loc value]]
        | (Literal | Element | Function), Some t ->
            [%expr Solidtype.Jsx.s [%e js] ([%e value] : [%t t])]
        | (Literal | Element | Function), None ->
            [%expr Solidtype.Jsx.s [%e js] [%e value]])
  in
  let lowered args =
    match split args with
    | Error e -> Error e
    | Ok (props, children) -> (
        match
          (all (List.map prop props), all (List.map (child map) children))
        with
        | Error e, _ | _, Error e -> Error e
        | Ok props, Ok children -> Ok (props, children))
  in
  let plain args =
    match lowered args with
    | Error (loc, m) -> error ~loc m
    | Ok (props, children) ->
        [%expr
          Solidtype.Jsx.el [%e B.estring ~loc name] [%e B.pexp_array ~loc props]
            [%e B.pexp_array ~loc children]]
  in
  (* Solid calls a written [ref] and a spread's both on a plain element;
     [Dynamic]'s spread would replace the first, so it comes after the spread
     and calls the spread's. *)
  let drawn ~given args =
    let rest =
      match
        ( List.find_opt (function Labelled "ref", _ -> true | _ -> false) args,
          List.find_opt
            (function Labelled l, _ -> String.equal l spread | _ -> false)
            args )
      with
      | Some (_, written), Some (_, given) -> Some (written, given)
      | _ -> None
    in
    let args =
      match rest with
      | None -> args
      | Some (written, _) ->
          let rest = [%expr solidtype__rest ()] in
          List.concat_map
            (function
              | Labelled "ref", _ -> []
              | (Labelled l as label), _ when String.equal l spread ->
                  [
                    (label, rest);
                    ( Labelled "ref",
                      [%expr
                        fun solidtype__e ->
                          Solidtype.Jsx.ref_beside [%e written] [%e rest]
                            solidtype__e] );
                  ]
              | a -> [ a ])
            args
    in
    match lowered args with
    | Error (loc, m) -> error ~loc m
    | Ok (props, children) -> (
        let component =
          [%expr
            Solidtype.Jsx.d "component"
              [%e
                thunk ~loc
                  [%expr
                    Solidtype.Jsx.drawn_as [%e call ~loc given]
                      [%e B.estring ~loc name]]]]
        in
        let made =
          [%expr
            Solidtype.Jsx.c Solidtype.Dynamic.component
              [%e B.pexp_array ~loc (component :: props)]
              [%e B.pexp_array ~loc children]]
        in
        match rest with
        | Some (_, given) ->
            [%expr
              let solidtype__rest () = [%e map given] in
              [%e made]]
        | None -> made)
  in
  match drawn_as with
  | [] -> plain args
  | (_, given) :: _ ->
      let given =
        map (if is_thunk given then uncurried ~loc given else given)
      in
      [%expr
        Solidtype.Jsx.c Solidtype.Show.component
          [|
            Solidtype.Jsx.d "when"
              [%e thunk ~loc [%expr Option.is_some [%e call ~loc given]]];
            Solidtype.Jsx.s "fallback" [%e plain args];
          |]
          [| Solidtype.Jsx.node [%e drawn ~given args] |]]

(* A component's element also applies the component's [Props.check] to its
   props under [if false]: the compiler checks the application and Melange
   drops it. A prop that can hold JSX is bound once and named in both, since a
   copy in the check would double the code at every level of nesting; the
   Vite plugin puts each one back where it is used. *)
let component map ~loc path args =
  let bound label = "solidtype__" ^ label in
  let prop (label, (value : expression)) =
    let loc = value.pexp_loc in
    match label with
    | Labelled l when String.equal l spread ->
        let x = B.evar ~loc (bound spread) in
        Ok
          ( Some
              ( bound spread,
                (Some [%type: (unit -> _[@u])], thunk ~loc (map value)) ),
            Some (Labelled spread, call ~loc x),
            [%expr Solidtype.Jsx.spread [%e x]] )
    | Optional l when Option.is_some (wrapped value) ->
        let* js, t, v = passed_on ~loc l value in
        let+ v = optional ~loc l v in
        let read = [%expr ([%e map v] : (unit -> [%t t] option[@u]))] in
        ( None,
          None,
          [%expr
            Solidtype.Jsx.d [%e B.estring ~loc js] [%e absent_or ~loc read]] )
    | Labelled l when Option.is_some (wrapped value) -> (
        let+ js, t, v = passed_on ~loc l value in
        let js = B.estring ~loc js in
        let v = js_string (map v) in
        match kind_of ~handler:false v with
        | Thunk ->
            ( None,
              None,
              [%expr
                Solidtype.Jsx.d [%e js]
                  ([%e to_solid ~loc v] : (unit -> [%t t][@u]))] )
        | Literal | Element | Function ->
            (None, None, [%expr Solidtype.Jsx.s [%e js] ([%e v] : [%t t])]))
    | Labelled l when starts_with ~prefix:"data_" l ->
        Ok (None, None, data ~loc l (map value))
    | Optional "as_" ->
        let+ value = optional ~loc "as_" value in
        ( None,
          None,
          [%expr Solidtype.Jsx.d "as" [%e absent_or ~loc (map value)]] )
    | Optional l ->
        let+ value = optional ~loc l value in
        let x = B.evar ~loc (bound l) in
        ( Some (bound l, (Some [%type: (unit -> _ option[@u])], map value)),
          Some (Optional l, [%expr Solidtype.Check.optional [%e x]]),
          [%expr
            Solidtype.Jsx.d
              [%e B.estring ~loc (js_name l)]
              [%e absent_or ~loc x]] )
    | _ -> (
        let+ label = labelled ~loc label in
        let name = B.estring ~loc (js_name label) in
        let x = B.evar ~loc (bound label) in
        match kind_of ~handler:(is_handler label) value with
        | Literal ->
            let value = js_string value in
            ( None,
              Some (Labelled label, [%expr Solidtype.Check.literal [%e value]]),
              [%expr Solidtype.Jsx.s [%e name] [%e value]] )
        | Element ->
            ( None,
              Some (Labelled label, [%expr Solidtype.Check.element ()]),
              [%expr Solidtype.Jsx.s [%e name] [%e map value]] )
        | Function when is_made value ->
            ( Some
                ( bound label,
                  (Some [%type: (unit -> _[@u])], thunk ~loc (map value)) ),
              Some (Labelled label, [%expr Solidtype.Check.thunk [%e x]]),
              [%expr Solidtype.Jsx.d [%e name] [%e x]] )
        | Function ->
            ( Some (bound label, (None, map value)),
              Some (Labelled label, x),
              [%expr Solidtype.Jsx.s [%e name] [%e x]] )
        | Thunk ->
            ( Some
                ( bound label,
                  (Some [%type: (unit -> _[@u])], to_solid ~loc (map value)) ),
              Some (Labelled label, [%expr Solidtype.Check.thunk [%e x]]),
              [%expr Solidtype.Jsx.d [%e name] [%e x]] ))
  in
  let children = function
    | [] -> Ok (None, None, [])
    | [ f ] when is_function f ->
        let x = B.evar ~loc (bound "children") in
        Ok
          ( Some (bound "children", (None, map (unmark f))),
            Some (Labelled "children", [%expr Solidtype.Check.render [%e x]]),
            [ [%expr Solidtype.Jsx.render [%e x]] ] )
    | cs ->
        Result.map
          (fun cs ->
            ( None,
              Some (Labelled "children", [%expr Solidtype.Check.nodes ()]),
              cs ))
          (all (List.map (child map) cs))
  in
  match split args with
  | Error (loc, m) -> error ~loc m
  | Ok (props, cs) -> (
      match (all (List.map prop props), children cs) with
      | Error (loc, m), _ | _, Error (loc, m) -> error ~loc m
      | Ok props, Ok (child_binding, child_check, cs) ->
          let bindings =
            List.filter_map Fun.id
              (List.map (fun (b, _, _) -> b) props @ [ child_binding ])
          in
          let check =
            B.pexp_apply ~loc
              (B.pexp_ident ~loc
                 { txt = Ldot (Ldot (path, "Props"), "check"); loc })
              (List.filter_map (fun (_, c, _) -> c) props
              @ Option.to_list child_check
              @ [ (Nolabel, [%expr ()]) ])
          in
          let make =
            [%expr
              if false then [%e check];
              Solidtype.Jsx.c
                [%e B.pexp_ident ~loc { txt = Ldot (path, "component"); loc }]
                [%e B.pexp_array ~loc (List.map (fun (_, _, m) -> m) props)]
                [%e B.pexp_array ~loc cs]]
          in
          if List.is_empty bindings then make
          else
            (* A function of the bound names, applied to their values: OCaml
               types the function, the check in it, before its arguments, so
               each value is typed as the check expects it, and a record field
               a function child reads, [s.is_pressed], is found by its type.
               OCaml evaluates arguments last first, so they are given last
               first, and run in the order they are written. *)
            let bindings = List.rev bindings in
            B.pexp_apply ~loc
              (List.fold_right
                 (fun (name, (typ, _)) body ->
                   let pat = B.pvar ~loc name in
                   let pat =
                     match typ with
                     | Some typ -> B.ppat_constraint ~loc pat typ
                     | None -> pat
                   in
                   B.pexp_fun ~loc Nolabel None pat body)
                 bindings make)
              (List.map (fun (_, (_, expr)) -> (Nolabel, expr)) bindings))

(* A [Switch] whose only child is a thunk of a [match]: each case becomes a
   [Match], a case with variables a [Match.Keyed] given them, so the case's
   body sees their values as they are. *)

let with_last path name =
  match path with
  | Ldot (p, _) -> Ldot (p, name)
  | Lident _ | Lapply _ -> Lident name

let variables (p : pattern) =
  let collect =
    object
      inherit [string list] Ast_traverse.fold as super

      method! pattern p acc =
        match p.ppat_desc with
        | Ppat_var { txt; _ } -> super#pattern p (txt :: acc)
        | Ppat_alias (_, { txt; _ }) -> super#pattern p (txt :: acc)
        | _ -> super#pattern p acc
    end
  in
  List.sort_uniq String.compare (collect#pattern p [])

let jsx ~loc path args =
  {
    (B.pexp_apply ~loc
       (B.pexp_ident ~loc { txt = Ldot (path, "createElement"); loc })
       (args @ [ (Nolabel, [%expr ()]) ]))
    with
    pexp_attributes = [ attribute ~loc "JSX" ];
  }

let quiet ~loc warnings (e : expression) =
  {
    e with
    pexp_attributes =
      attribute ~loc "ocaml.warning"
        ~payload:(PStr [ B.pstr_eval ~loc (B.estring ~loc warnings) [] ])
      :: e.pexp_attributes;
  }

let switch_cases path args =
  let thunk_of_match (e : expression) =
    match e.pexp_desc with
    | Pexp_function
        ( [ { pparam_desc = Pparam_val (Nolabel, None, p); _ } ],
          None,
          Pfunction_body { pexp_desc = Pexp_match (scrutinee, cases); _ } )
      when is_unit p ->
        Some (scrutinee, cases)
    | _ -> None
  in
  if not (String.equal (last path) "Switch") then None
  else
    match split args with
    | Ok (props, [ child ]) -> (
        match thunk_of_match child with
        | None -> None
        | Some (scrutinee, cases) ->
            let match_path = with_last path "Match" in
            let case (c : case) =
              let loc = c.pc_lhs.ppat_loc in
              let test yes no =
                quiet ~loc "-11"
                  (B.pexp_match ~loc scrutinee
                     [
                       B.case ~lhs:c.pc_lhs ~guard:c.pc_guard ~rhs:yes;
                       B.case ~lhs:(B.ppat_any ~loc) ~guard:None ~rhs:no;
                     ])
              in
              match variables c.pc_lhs with
              | [] ->
                  let body =
                    if is_jsx c.pc_rhs then c.pc_rhs
                    else [%expr fun () -> Solidtype.Jsx.element [%e c.pc_rhs]]
                  in
                  jsx ~loc match_path
                    [
                      ( Labelled "when_",
                        [%expr fun () -> [%e test [%expr true] [%expr false]]]
                      );
                      (Labelled "children", [%expr [ [%e body] ]]);
                    ]
              | vars ->
                  let tuple =
                    match vars with
                    | [ v ] -> B.evar ~loc v
                    | vs -> B.pexp_tuple ~loc (List.map (B.evar ~loc) vs)
                  in
                  let pattern =
                    match vars with
                    | [ v ] -> B.pvar ~loc v
                    | vs -> B.ppat_tuple ~loc (List.map (B.pvar ~loc) vs)
                  in
                  jsx ~loc
                    (Ldot (match_path, "Keyed"))
                    [
                      ( Labelled "some",
                        [%expr
                          fun () ->
                            [%e test [%expr Some [%e tuple]] [%expr None]]] );
                      ( Labelled "children",
                        [%expr [ (fun [%p pattern] -> [%e c.pc_rhs]) ]] );
                    ]
            in
            let loc = child.pexp_loc in
            let exhaustive =
              quiet ~loc "-26-27"
                (B.pexp_match ~loc scrutinee
                   (List.map
                      (fun (c : case) ->
                        B.case ~lhs:c.pc_lhs ~guard:c.pc_guard ~rhs:[%expr ()])
                      cases))
            in
            let children =
              List.fold_right
                (fun c acc -> [%expr [%e case c] :: [%e acc]])
                cases [%expr []]
            in
            Some (exhaustive, props @ [ (Labelled "children", children) ]))
    | _ -> None

let lower map (e : expression) args =
  let loc = e.pexp_loc in
  match e.pexp_desc with
  | Pexp_apply ({ pexp_desc = Pexp_ident { txt = Lident name; _ }; _ }, _) ->
      element map ~loc name args
  | Pexp_apply
      ( { pexp_desc = Pexp_ident { txt = Ldot (path, "createElement"); _ }; _ },
        _ ) -> (
      match switch_cases path args with
      | Some (exhaustive, args) ->
          [%expr
            if false then [%e exhaustive];
            [%e component map ~loc path args]]
      | None -> component map ~loc path args)
  | _ -> error ~loc "a JSX tag is a lowercase element or a component module"

(* let%component: a component's props are its labelled parameters, each with
   its type. *)

type presence = Required | Optional | Default of expression

type prop = {
  label : string;
  var : string;
      (** What the body names it: the label, or [given] of [?ref:(given : t)].
      *)
  typ : core_type;  (** Without the [option] of an optional prop. *)
  presence : presence;
  arity : int;  (** How many arguments a function prop takes; 0 for a value. *)
}

let rec arity (t : core_type) =
  match t.ptyp_desc with
  | Ptyp_arrow (Nolabel, _, rest) -> Result.map succ (arity rest)
  | Ptyp_arrow (_, _, _) ->
      Error (t.ptyp_loc, "a function prop's arguments are not labelled")
  | _ -> Ok 0

let rec type_vars (t : core_type) =
  match t.ptyp_desc with
  | Ptyp_var v -> [ v ]
  | Ptyp_arrow (_, a, b) -> type_vars a @ type_vars b
  | Ptyp_constr (_, ts) | Ptyp_tuple ts -> List.concat_map type_vars ts
  | _ -> []

let prop_of (p : function_param) =
  let loc = p.pparam_loc in
  let prop label (var : string loc) typ presence =
    if String.equal label spread then
      Error
        ( var.loc,
          "props=p spreads a component's props, so no prop is named props: \
           give this one another name" )
    else
      Result.map
        (fun arity ->
          (* [as_] is handed on or drawn, never called by the body, so it is
             read whole. *)
          let arity = if String.equal label "as_" then 0 else arity in
          { label; var = var.txt; typ; presence; arity })
        (arity typ)
  in
  match p.pparam_desc with
  | Pparam_val
      ( Labelled label,
        None,
        {
          ppat_desc = Ppat_constraint ({ ppat_desc = Ppat_var var; _ }, typ);
          _;
        } ) ->
      prop label var typ Required
  | Pparam_val
      ( Optional label,
        Some default,
        {
          ppat_desc = Ppat_constraint ({ ppat_desc = Ppat_var var; _ }, typ);
          _;
        } ) ->
      prop label var typ (Default default)
  | Pparam_val
      ( Optional label,
        None,
        {
          ppat_desc =
            Ppat_constraint
              ( { ppat_desc = Ppat_var var; _ },
                {
                  ptyp_desc = Ptyp_constr ({ txt = Lident "option"; _ }, [ typ ]);
                  _;
                } );
          _;
        } ) ->
      prop label var typ Optional
  | _ ->
      Error
        ( loc,
          "a component's parameter is a prop with its type, ~(name : t), \
           ?(name : t option) or ?(name : t = default), and the last is ()" )

(* [loc] is the component's, where a parameter missing is reported. *)
let rec props_of ~loc = function
  | [ { pparam_desc = Pparam_val (Nolabel, None, p); _ } ] when is_unit p ->
      Ok []
  | p :: rest ->
      let* p = prop_of p in
      let+ ps = props_of ~loc rest in
      p :: ps
  | [] -> Error (loc, "a component's last parameter is ()")

(* Element children are a token in the check, so they never copy the
   elements; a function child is checked as the function, each of its kind. *)
let either_state p =
  match p.typ.ptyp_desc with
  | Ptyp_constr
      ( {
          txt =
            ( Ldot (Lident "Jsx", "children")
            | Ldot (Ldot (Lident "Solidtype", "Jsx"), "children") );
          _;
        },
        [ state ] )
    when String.equal p.label "children" ->
      Some state
  | _ -> None

let is_nodes p =
  String.equal p.label "children"
  && p.arity = 0
  && Option.is_none (either_state p)

(* The props module: an abstract type, one getter per prop -- a live read of
   Solid's props object, so Solid tracks it -- and the check. A function prop
   is read uncurried, the call Solid's JSX makes. *)
let props_module ~loc ~element ~drawn props =
  let vars =
    List.fold_left
      (fun acc v -> if List.mem v acc then acc else acc @ [ v ])
      []
      (List.concat_map (fun p -> type_vars p.typ) props)
  in
  let t =
    B.ptyp_constr ~loc { txt = Lident "t"; loc }
      (List.map (B.ptyp_var ~loc) vars)
  in
  let type_t =
    B.pstr_type ~loc Recursive
      [
        B.type_declaration ~loc ~name:{ txt = "t"; loc }
          ~params:
            (List.map
               (fun v -> (B.ptyp_var ~loc v, (NoVariance, NoInjectivity)))
               vars)
          ~cstrs:[] ~kind:Ptype_abstract ~private_:Public ~manifest:None;
      ]
  in
  let getter p =
    let field =
      if p.arity > 0 then
        { p.typ with ptyp_attributes = [ attribute ~loc "u" ] }
      else p.typ
    in
    let field =
      match p.presence with
      | Required -> field
      | Optional | Default _ -> [%type: [%t field] option]
    in
    let description =
      B.value_description ~loc
        ~name:{ txt = "get_" ^ p.label; loc }
        ~type_:[%type: [%t t] -> [%t field]]
        ~prim:[ js_name p.label ]
    in
    B.pstr_primitive ~loc
      { description with pval_attributes = [ attribute ~loc "mel.get" ] }
  in
  (* [make ~text:"x" ()]: props as a value, for a [Dynamic] or a spread. *)
  let constructor =
    let arg p =
      let typ =
        if String.equal (js_name p.label) p.label then p.typ
        else
          {
            p.typ with
            ptyp_attributes =
              [
                attribute ~loc "mel.as"
                  ~payload:
                    (PStr
                       [
                         B.pstr_eval ~loc (B.estring ~loc (js_name p.label)) [];
                       ]);
              ];
          }
      in
      match p.presence with
      | Required -> (Labelled p.label, typ)
      | Optional | Default _ -> (Optional p.label, typ)
    in
    let type_ =
      List.fold_right
        (fun p rest ->
          let label, typ = arg p in
          B.ptyp_arrow ~loc label typ rest)
        props [%type: unit -> [%t t]]
    in
    let description =
      B.value_description ~loc ~name:{ txt = "make"; loc } ~type_ ~prim:[ "" ]
    in
    B.pstr_primitive ~loc
      { description with pval_attributes = [ attribute ~loc "mel.obj" ] }
  in
  let checked p =
    match either_state p with
    | Some state ->
        [%type:
          ( [%t state] -> Solidtype.Jsx.element,
            [ `nodes | `render ] )
          Solidtype.Check.children]
    | None ->
        if is_nodes p then [%type: (_, [ `nodes ]) Solidtype.Check.children]
        else if String.equal p.label "children" then
          [%type: ([%t p.typ], [ `render ]) Solidtype.Check.children]
        else if p.arity > 0 || String.equal p.label "as_" then p.typ
        else [%type: [%t p.typ] Solidtype.Check.value]
  in
  let check_param p =
    let checked = checked p in
    let any typ = B.ppat_constraint ~loc (B.ppat_any ~loc) typ in
    match p.presence with
    | Required -> B.pparam_val ~loc (Labelled p.label) None (any checked)
    | Optional | Default _ ->
        B.pparam_val ~loc (Optional p.label) None
          (any [%type: [%t checked] option])
  in
  let check_fun =
    B.pexp_function ~loc
      (List.map check_param props
      @ [
          B.pparam_val ~loc (Optional spread) None
            (B.ppat_constraint ~loc (B.ppat_any ~loc)
               [%type: [%t t] Solidtype.Solid.rest option]);
          B.pparam_val ~loc Nolabel None [%pat? ()];
        ])
      None
      (Pfunction_body [%expr ()])
  in
  (* Given its element, the check ends in the element's own, as a part that
     passes the element's attributes on. An own prop of an attribute's name
     comes first, and an application fills the first parameter of a label, so
     the own prop is the component's whatever the element means by the name,
     as TSX types a part [Omit<DOM, keyof Own> & Own]; the element's is never
     filled. It is a function type a [fun] cannot be written for, so an
     external, which only the check under [if false] names. *)
  let check =
    match element with
    | None -> [%stri let check = [%e check_fun]]
    | Some path ->
        let arrow p rest =
          match p.presence with
          | Required -> B.ptyp_arrow ~loc (Labelled p.label) (checked p) rest
          | Optional | Default _ ->
              B.ptyp_arrow ~loc (Optional p.label) (checked p) rest
        in
        let type_ =
          List.fold_right arrow props
            (B.ptyp_arrow ~loc (Optional spread)
               [%type: [%t t] Solidtype.Solid.rest]
               (B.ptyp_constr ~loc
                  { txt = Ldot (path, "check"); loc }
                  [ [%type: unit -> unit] ]))
        in
        let description =
          B.value_description ~loc ~name:{ txt = "check"; loc } ~type_
            ~prim:[ "check" ]
        in
        B.pstr_primitive ~loc
          {
            description with
            pval_attributes =
              [
                attribute ~loc "mel.module"
                  ~payload:
                    (PStr
                       [
                         B.pstr_eval ~loc
                           (B.estring ~loc "vite-plugin-solidtype/markers")
                           [];
                       ]);
              ];
          }
  in
  (* [omit props [| Text |]] names the props it leaves out by a variant of
     the component's own, so a misspelt one does not compile; [others props]
     leaves out all of them, for the component to pass the rest on. *)
  let omit =
    match props with
    | [] -> []
    | _ ->
        let constructor p = String.capitalize_ascii p.label in
        let name =
          B.pstr_type ~loc Recursive
            [
              B.type_declaration ~loc ~name:{ txt = "name"; loc } ~params:[]
                ~cstrs:[]
                ~kind:
                  (Ptype_variant
                     (List.map
                        (fun p ->
                          B.constructor_declaration ~loc
                            ~name:{ txt = constructor p; loc }
                            ~args:(Pcstr_tuple []) ~res:None)
                        props))
                ~private_:Public ~manifest:None;
            ]
        in
        let js =
          B.pexp_function_cases ~loc
            (List.map
               (fun p ->
                 B.case
                   ~lhs:
                     (B.ppat_construct ~loc
                        { txt = Lident (constructor p); loc }
                        None)
                   ~guard:None
                   ~rhs:(B.estring ~loc (js_name p.label)))
               props)
        in
        [
          name;
          [%stri
            let omit (props : [%t t]) (names : name array) :
                [%t t] Solidtype.Solid.rest =
              Solidtype.Solid.omit props (Array.map [%e js] names)];
        ]
  in
  (* The rest keeps an [as_] the ppx gave the component, for the part or port
     beneath it, which draws it; [drawn_others] leaves it out, for a plain
     element, which [Dynamic] draws by it. *)
  let others =
    let own =
      B.pexp_array ~loc
        (List.filter_map
           (fun p ->
             if drawn && String.equal p.label "as_" then None
             else Some (B.estring ~loc (js_name p.label)))
           props)
    in
    [%stri
      let others (props : [%t t]) : _ Solidtype.Solid.rest =
        Solidtype.Solid.others props [%e own]]
  in
  let drawn_others =
    [%stri
      let drawn_others (props : [%t t]) : _ Solidtype.Solid.rest =
        Solidtype.Solid.others (others props) [| "as" |]]
  in
  (* An interface may export the component without its [omit] and [others]. *)
  let generated =
    B.pstr_attribute ~loc
      (attribute ~loc "ocaml.warning"
         ~payload:(PStr [ B.pstr_eval ~loc (B.estring ~loc "-32-37") [] ]))
  in
  ( vars,
    B.pmod_structure ~loc
      ((generated :: type_t :: List.map getter props)
      @ [ constructor; check; others ]
      @ (if drawn then [ drawn_others ] else [])
      @ omit) )

(* A value prop's read of Solid's props object, [props.text], which Solid
   tracks as it tracks a signal's call. *)
let value_read ~loc p =
  let field =
    B.pexp_apply ~loc
      (B.pexp_ident ~loc { txt = Ldot (Lident "Props", "get_" ^ p.label); loc })
      [ (Nolabel, [%expr props]) ]
  in
  match p.presence with
  | Required | Optional -> field
  | Default default ->
      [%expr match [%e field] with Some v -> v | None -> [%e default]]

(* [S.get text] in a component's body is written as the read itself, since
   Melange inlines no accessor: the page reads [props.text] as Solid's own JSX
   does. Solid is named as the library's code names it, [S], [Solid] or
   [Solidtype.Solid]; a read through another alias calls the accessor, which
   reads the same. A name the body binds again is its own. *)
let is_solid_get = function
  | Ldot ((Lident ("S" | "Solid") | Ldot (Lident "Solidtype", "Solid")), "get")
    ->
      true
  | _ -> false

let rec inline_reads reads (e : expression) =
  let without names =
    List.filter (fun (v, _) -> not (List.mem v names)) reads
  in
  let map =
    object
      inherit Ast_traverse.map as super

      method! expression e =
        match e.pexp_desc with
        | Pexp_apply
            ( ({ pexp_desc = Pexp_ident { txt; _ }; _ } as get),
              [ (Nolabel, { pexp_desc = Pexp_ident { txt = Lident v; _ }; _ }) ]
            )
          when is_solid_get txt && List.mem_assoc v reads ->
            let loc = e.pexp_loc in
            [%expr
              let (_ : _ Solidtype.Solid.accessor -> _) = [%e get] in
              [%e List.assoc v reads loc]]
        | Pexp_let (rec_flag, vbs, body) ->
            let bound = List.concat_map (fun vb -> variables vb.pvb_pat) vbs in
            let inner = without bound in
            let vbs =
              List.map
                (fun vb ->
                  {
                    vb with
                    pvb_expr =
                      inline_reads
                        (match rec_flag with
                        | Recursive -> inner
                        | Nonrecursive -> reads)
                        vb.pvb_expr;
                  })
                vbs
            in
            {
              e with
              pexp_desc = Pexp_let (rec_flag, vbs, inline_reads inner body);
            }
        | Pexp_function (params, constraint_, body) ->
            let bound =
              List.concat_map
                (fun (p : function_param) ->
                  match p.pparam_desc with
                  | Pparam_val (_, _, pat) -> variables pat
                  | Pparam_newtype _ -> [])
                params
            in
            let inner = without bound in
            let body =
              match body with
              | Pfunction_body b -> Pfunction_body (inline_reads inner b)
              | Pfunction_cases (cs, l, a) ->
                  Pfunction_cases (List.map (case inner) cs, l, a)
            in
            { e with pexp_desc = Pexp_function (params, constraint_, body) }
        | Pexp_match (s, cs) ->
            {
              e with
              pexp_desc =
                Pexp_match (inline_reads reads s, List.map (case reads) cs);
            }
        | Pexp_try (s, cs) ->
            {
              e with
              pexp_desc =
                Pexp_try (inline_reads reads s, List.map (case reads) cs);
            }
        | Pexp_letop _ | Pexp_for _ | Pexp_letmodule _ | Pexp_object _ -> e
        | _ -> super#expression e
    end
  in
  if List.is_empty reads then e else map#expression e

and case reads (c : case) =
  let inner =
    List.filter (fun (v, _) -> not (List.mem v (variables c.pc_lhs))) reads
  in
  {
    c with
    pc_guard = Option.map (inline_reads inner) c.pc_guard;
    pc_rhs = inline_reads inner c.pc_rhs;
  }

(* Each prop is read where it is used: a value as an accessor, [S.get text],
   as a signal is read, a function by calling it, [on_change v]; either is
   inlined to a read of Solid's props object, so Solid tracks it as it tracks
   [props.text]. *)
let reader ~loc p =
  let field =
    B.pexp_apply ~loc
      (B.pexp_ident ~loc { txt = Ldot (Lident "Props", "get_" ^ p.label); loc })
      [ (Nolabel, [%expr props]) ]
  in
  (* A function of unit alone is uncurried with no argument, so Melange calls
     it as [f () [@u]], with the unit written, never a variable of it. *)
  let of_unit =
    match p.typ.ptyp_desc with
    | Ptyp_arrow
        ( Nolabel,
          { ptyp_desc = Ptyp_constr ({ txt = Lident "unit"; _ }, []); _ },
          _ ) ->
        p.arity = 1
    | _ -> false
  in
  let expr =
    if p.arity > 0 then
      let xs = List.init p.arity (Printf.sprintf "solidtype__%d") in
      let arg x = if of_unit then [%expr ()] else B.evar ~loc x in
      let call f =
        {
          (B.pexp_apply ~loc f (List.map (fun x -> (Nolabel, arg x)) xs)) with
          pexp_attributes = [ attribute ~loc "u" ];
        }
      in
      let body =
        match p.presence with
        | Required ->
            [%expr
              let f = [%e field] in
              [%e call [%expr f]]]
        | Optional ->
            [%expr
              match [%e field] with
              | Some f -> Some [%e call [%expr f]]
              | None -> None]
        | Default default ->
            let default = [%expr ([%e default] : [%t p.typ])] in
            [%expr
              match [%e field] with
              | Some f -> [%e call [%expr f]]
              | None ->
                  [%e
                    B.pexp_apply ~loc default
                      (List.map (fun x -> (Nolabel, arg x)) xs)]]
      in
      List.fold_right
        (fun x body -> [%expr fun [%p B.pvar ~loc x] -> [%e body]])
        xs body
    else
      {
        ([%expr fun () -> [%e value_read ~loc p]]) with
        pexp_attributes = [ attribute ~loc "u" ];
      }
  in
  (* A component reads the props it needs; the others are still props. *)
  {
    (B.value_binding ~loc ~pat:(B.pvar ~loc p.var) ~expr) with
    pvb_attributes =
      [
        attribute ~loc "inline";
        attribute ~loc "ocaml.warning"
          ~payload:(PStr [ B.pstr_eval ~loc (B.estring ~loc "-26-27") [] ]);
      ];
  }

(* [[@@element button]]: the element a component draws and passes the rest of
   its props to, whose check its own then ends in: its [Solidtype.Html]
   module, which the compiler finds or reports unbound. *)
let element_of (vb : value_binding) =
  match
    List.filter
      (fun (a : attribute) -> String.equal a.attr_name.txt "element")
      vb.pvb_attributes
  with
  | [] -> Ok None
  | [
   {
     attr_payload =
       PStr
         [
           {
             pstr_desc =
               Pstr_eval
                 ({ pexp_desc = Pexp_ident { txt = Lident tag; _ }; _ }, _);
             _;
           };
         ];
     _;
   };
  ] ->
      Ok
        (Some
           (Ldot (Ldot (Lident "Solidtype", "Html"), String.capitalize_ascii tag)))
  | a :: _ ->
      Error
        ( a.attr_loc,
          "[@@element tag] names one element, by its tag: [@@element button]" )

(* A plain element a part spreads the rest of its props on is the element the
   part draws, so it draws what [as_] draws in its place. *)
let draw_by_as =
  object
    inherit Ast_traverse.map as super

    method! expression e =
      let e = super#expression e in
      match e.pexp_desc with
      | Pexp_apply
          (({ pexp_desc = Pexp_ident { txt = Lident _; _ }; _ } as f), args)
        when is_jsx e
             && List.exists
                  (function
                    | ( Labelled "props",
                        {
                          pexp_desc =
                            Pexp_apply
                              ( {
                                  pexp_desc =
                                    Pexp_ident
                                      {
                                        txt = Ldot (Lident "Props", "others");
                                        _;
                                      };
                                  _;
                                },
                                _ );
                          _;
                        } ) ->
                        true
                    | _ -> false)
                  args ->
          let loc = e.pexp_loc in
          let args =
            List.map
              (function
                | Labelled "props", _ ->
                    (Labelled "props", [%expr Props.drawn_others props])
                | a -> a)
              args
          in
          {
            e with
            pexp_desc =
              Pexp_apply
                ( f,
                  (Optional "as_", [%expr fun () -> Solidtype.Solid.get as_])
                  :: args );
          }
      | _ -> e
  end

let component_of (vb : value_binding) =
  let loc = vb.pvb_loc in
  match (vb.pvb_pat.ppat_desc, vb.pvb_expr.pexp_desc) with
  | ( Ppat_var { txt = "make"; _ },
      Pexp_function (params, None, Pfunction_body body) ) ->
      let* props = props_of ~loc params in
      let+ element = element_of vb in
      let drawn =
        Option.is_some element
        && not (List.exists (fun p -> String.equal p.label "as_") props)
      in
      let props =
        match element with
        | Some path when drawn ->
            let typ =
              [%type:
                [%t B.ptyp_constr ~loc { txt = Ldot (path, "props"); loc } []] ->
                Solidtype.Jsx.element]
            in
            props
            @ [
                {
                  label = "as_";
                  var = "as_";
                  typ;
                  presence = Optional;
                  arity = 0;
                };
              ]
        | Some _ | None -> props
      in
      let vars, props_module = props_module ~loc ~element ~drawn props in
      let props_t =
        B.ptyp_constr ~loc
          { txt = Ldot (Lident "Props", "t"); loc }
          (List.map (fun _ -> B.ptyp_any ~loc) vars)
      in
      (* With no props there is nothing to read, but still a rest to pass on. *)
      let make =
        if List.is_empty props then
          {
            ([%expr fun (props : [%t props_t]) -> [%e body]]) with
            pexp_attributes =
              [
                attribute ~loc "ocaml.warning"
                  ~payload:(PStr [ B.pstr_eval ~loc (B.estring ~loc "-27") [] ]);
              ];
          }
        else
          let reads =
            List.filter_map
              (fun p ->
                if p.arity = 0 then Some (p.var, fun loc -> value_read ~loc p)
                else None)
              props
          in
          [%expr
            fun (props : [%t props_t]) ->
              [%e
                B.pexp_let ~loc Nonrecursive
                  (List.map (reader ~loc) props)
                  (inline_reads reads body)]]
      in
      [%stri
        include struct
          module Props = [%m props_module]

          let make = [%e make]
          let component = Solidtype.Jsx.component make
        end]
  | _ ->
      Error
        ( loc,
          "a component is let%component make ~(prop : t) ... (), one per module"
        )

(* [S.accessor (fun () -> e)] is written as the function itself, uncurried,
   which Melange makes a JavaScript function of no argument: the external
   would make it one too, through a call. Solid is named as the library's code
   names it, and the external is named beside it, so another [accessor] does
   not compile. *)
let is_solid_accessor = function
  | Ldot
      ((Lident ("S" | "Solid") | Ldot (Lident "Solidtype", "Solid")), "accessor")
    ->
      true
  | _ -> false

let mapper =
  object (self)
    inherit Ast_traverse.map as super

    method! expression e =
      match e.pexp_desc with
      | Pexp_apply (_, args) when is_jsx e -> lower self#expression e args
      | Pexp_apply
          ( ({ pexp_desc = Pexp_ident { txt; _ }; _ } as accessor),
            [ (Nolabel, given) ] )
        when is_solid_accessor txt && is_thunk given ->
          let loc = e.pexp_loc in
          [%expr
            let (_ : (unit -> _) -> _ Solidtype.Solid.accessor) =
              [%e accessor]
            in
            [%e uncurried ~loc (self#expression given)]]
      | _ -> super#expression e

    method! structure_item item =
      match item.pstr_desc with
      | Pstr_extension
          ( ( { txt = "component"; _ },
              PStr [ { pstr_desc = Pstr_value (Nonrecursive, [ vb ]); _ } ] ),
            _ ) -> (
          let drawn =
            List.exists
              (fun (a : attribute) -> String.equal a.attr_name.txt "element")
              vb.pvb_attributes
            &&
            match vb.pvb_expr.pexp_desc with
            | Pexp_function (params, _, _) ->
                not
                  (List.exists
                     (fun (p : function_param) ->
                       match p.pparam_desc with
                       | Pparam_val ((Labelled "as_" | Optional "as_"), _, _) ->
                           true
                       | _ -> false)
                     params)
            | _ -> false
          in
          let body =
            if drawn then draw_by_as#expression vb.pvb_expr else vb.pvb_expr
          in
          match component_of { vb with pvb_expr = self#expression body } with
          | Ok item -> item
          | Error (loc, m) ->
              B.pstr_extension ~loc (Location.error_extensionf ~loc "%s" m) [])
      | _ -> super#structure_item item
  end

(* Inside the library its modules are named without [Solidtype.], which the
   library itself cannot name. *)
let internal = ref false

let unqualify =
  object
    inherit Ast_traverse.map as super

    method! longident =
      function
      | Ldot (Lident "Solidtype", name) -> Lident name
      | id -> super#longident id
  end

let () =
  Driver.add_arg "-internal" (Arg.Set internal)
    ~doc:" lower JSX inside solidtype itself";
  Driver.register_transformation "solidtype" ~impl:(fun s ->
      let s = mapper#structure s in
      if !internal then unqualify#structure s else s)
