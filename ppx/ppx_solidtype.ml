open Ppxlib
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

(* A name a user writes is Solid's or Kobalte's by one rule: a capital is an
   underscore and the lower case, a hyphen an underscore, and a keyword takes
   a trailing underscore. Its JavaScript name comes back from the tables the
   generators write, where the rule's inverse would not give it, *)
let names =
  let t = Hashtbl.create 64 in
  List.iter
    (fun (l, js) -> Hashtbl.replace t l js)
    (Html_names.names @ Kobalte_names.names);
  t

let starts_with ~prefix s =
  String.length s >= String.length prefix
  && String.equal (String.sub s 0 (String.length prefix)) prefix

(* and otherwise from that inverse: the keyword's underscore dropped, a hyphen
   after [aria_] and [data_], and a capital after any other underscore. *)
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

let is_function (e : expression) =
  match e.pexp_desc with Pexp_function _ -> not (is_thunk e) | _ -> false

(* What a prop is decides how Solid's compiler is handed it: a literal, an
   element and a function as they are, a thunk as the expression it returns.
   The syntax decides, and the types hold it: an element's attribute is
   annotated, and a component's props go through its check. *)
type kind = Literal | Element | Function | Thunk

let kind_of ~handler (e : expression) =
  match e.pexp_desc with
  | Pexp_constant _ | Pexp_construct (_, None) | Pexp_variant (_, None) ->
      Literal
  | _ when is_jsx e -> Element
  | _ when handler || is_function e -> Function
  | _ -> Thunk

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
  match children with
  | [] -> Ok (props, [])
  | [ list ] -> Result.map (fun cs -> (props, cs)) (list_items list)
  | _ :: extra :: _ -> Error (extra.pexp_loc, "children are given twice")

let labelled ~loc = function
  | Labelled label -> Ok label
  | Optional label ->
      Error (loc, Printf.sprintf "?%s is not supported: pass ~%s" label label)
  | Nolabel -> Error (loc, "a JSX prop is labelled")

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
  | _ ->
      Ok
        [%expr
          Solidtype.Jsx.dynamic ([%e map e] : unit -> Solidtype.Jsx.content)]

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
  | None when starts_with ~prefix:"data_" label ->
      Ok (js_name label, Some [%type: string], value, false)
  | None -> Ok (js_name label, Some html, value, is_handler label)
  | Some (Error e) -> Error e
  | Some (Ok (Namespaced (((Native | Capture) as ns), v))) ->
      if is_handler label then
        let prefix = match ns with Native -> "on:" | _ -> "oncapture:" in
        Ok (prefix ^ event (), Some html, v, true)
      else
        Error
          ( value.pexp_loc,
            Printf.sprintf "Jsx.%s wraps a handler, on_<event>=(Jsx.%s f)"
              (match ns with Native -> "native" | _ -> "capture")
              (match ns with Native -> "native" | _ -> "capture") )
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

let element map ~loc name args =
  let prop (label, (value : expression)) =
    let loc = value.pexp_loc in
    match label with
    | Labelled l when String.equal l spread ->
        Ok [%expr Solidtype.Jsx.spread [%e map value]]
    | _ ->
        Result.bind (labelled ~loc label) (fun label ->
            Result.map
              (fun (js, t, value, handler) ->
                let js = B.estring ~loc js in
                let value = js_string (map value) in
                match (kind_of ~handler value, t) with
                | Thunk, Some t ->
                    [%expr
                      Solidtype.Jsx.d [%e js] ([%e value] : unit -> [%t t])]
                | Thunk, None -> [%expr Solidtype.Jsx.d [%e js] [%e value]]
                | (Literal | Element | Function), Some t ->
                    [%expr Solidtype.Jsx.s [%e js] ([%e value] : [%t t])]
                | (Literal | Element | Function), None ->
                    [%expr Solidtype.Jsx.s [%e js] [%e value]])
              (dom_attribute ~loc ~tag:name label value))
  in
  match split args with
  | Error (loc, m) -> error ~loc m
  | Ok (props, children) -> (
      match
        (all (List.map prop props), all (List.map (child map) children))
      with
      | Error (loc, m), _ | _, Error (loc, m) -> error ~loc m
      | Ok props, Ok children ->
          [%expr
            Solidtype.Jsx.el [%e B.estring ~loc name]
              [%e B.pexp_array ~loc props] [%e B.pexp_array ~loc children]])

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
          ( Some (bound spread, (None, map value)),
            (Labelled spread, x),
            [%expr Solidtype.Jsx.spread [%e x]] )
    | _ when Option.is_some (wrapped value) ->
        Error
          ( loc,
            "a namespace is an element's: Jsx.native, Jsx.capture, Jsx.prop, \
             Jsx.attr, Jsx.bool, Jsx.listen and Jsx.named wrap an element's \
             attribute" )
    | _ ->
        Result.map
          (fun label ->
            let name = B.estring ~loc (js_name label) in
            let x = B.evar ~loc (bound label) in
            match kind_of ~handler:(is_handler label) value with
            | Literal ->
                let value = js_string value in
                ( None,
                  (Labelled label, [%expr Solidtype.Check.literal [%e value]]),
                  [%expr Solidtype.Jsx.s [%e name] [%e value]] )
            | Element ->
                ( None,
                  (Labelled label, [%expr Solidtype.Check.element ()]),
                  [%expr Solidtype.Jsx.s [%e name] [%e map value]] )
            | Function ->
                ( Some (bound label, (None, map value)),
                  (Labelled label, x),
                  [%expr Solidtype.Jsx.s [%e name] [%e x]] )
            | Thunk ->
                ( Some (bound label, (Some [%type: unit -> _], map value)),
                  (Labelled label, [%expr Solidtype.Check.thunk [%e x]]),
                  [%expr Solidtype.Jsx.d [%e name] [%e x]] ))
          (labelled ~loc label)
  in
  let children = function
    | [] -> Ok (None, None, [])
    | [ f ] when is_function f ->
        let x = B.evar ~loc (bound "children") in
        Ok
          ( Some (bound "children", (None, map f)),
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
              (List.map (fun (_, c, _) -> c) props
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
            B.pexp_let ~loc Nonrecursive
              (List.map
                 (fun (name, (typ, expr)) ->
                   let pat = B.pvar ~loc name in
                   let pat =
                     match typ with
                     | Some typ -> B.ppat_constraint ~loc pat typ
                     | None -> pat
                   in
                   B.value_binding ~loc ~pat ~expr)
                 bindings)
              make)

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
  let prop label typ presence =
    if String.equal label spread then
      Error
        ( loc,
          "props=p spreads a component's props, so no prop is named props: \
           give this one another name" )
    else Result.map (fun arity -> { label; typ; presence; arity }) (arity typ)
  in
  match p.pparam_desc with
  | Pparam_val
      ( Labelled label,
        None,
        { ppat_desc = Ppat_constraint ({ ppat_desc = Ppat_var _; _ }, typ); _ }
      ) ->
      prop label typ Required
  | Pparam_val
      ( Optional label,
        Some default,
        { ppat_desc = Ppat_constraint ({ ppat_desc = Ppat_var _; _ }, typ); _ }
      ) ->
      prop label typ (Default default)
  | Pparam_val
      ( Optional label,
        None,
        {
          ppat_desc =
            Ppat_constraint
              ( { ppat_desc = Ppat_var _; _ },
                {
                  ptyp_desc = Ptyp_constr ({ txt = Lident "option"; _ }, [ typ ]);
                  _;
                } );
          _;
        } ) ->
      prop label typ Optional
  | _ ->
      Error
        ( loc,
          "a component's parameter is a prop with its type, ~(name : t), \
           ?(name : t option) or ?(name : t = default), and the last is ()" )

let rec props_of = function
  | [ { pparam_desc = Pparam_val (Nolabel, None, p); _ } ] when is_unit p ->
      Ok []
  | p :: rest ->
      Result.bind (prop_of p) (fun p ->
          Result.map (fun ps -> p :: ps) (props_of rest))
  | [] -> Error (Location.none, "a component's last parameter is ()")

(* Element children are a token in the check, so they never copy the
   elements; a function child is checked as the function, each of its kind. *)
let is_nodes p = String.equal p.label "children" && p.arity = 0

(* The props module: an abstract type, one getter per prop -- a live read of
   Solid's props object, so Solid tracks it -- and the check. A function prop
   is read uncurried, the call Solid's JSX makes. *)
let props_module ~loc props =
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
  let check_param p =
    let checked =
      if is_nodes p then [%type: (_, [ `nodes ]) Solidtype.Check.children]
      else if String.equal p.label "children" then
        [%type: ([%t p.typ], [ `render ]) Solidtype.Check.children]
      else if p.arity > 0 then p.typ
      else [%type: [%t p.typ] Solidtype.Check.value]
    in
    let any typ = B.ppat_constraint ~loc (B.ppat_any ~loc) typ in
    match p.presence with
    | Required -> B.pparam_val ~loc (Labelled p.label) None (any checked)
    | Optional | Default _ ->
        B.pparam_val ~loc (Optional p.label) None
          (any [%type: [%t checked] option])
  in
  let check =
    B.pexp_function ~loc
      (List.map check_param props
      @ [
          B.pparam_val ~loc (Optional spread) None
            (B.ppat_constraint ~loc (B.ppat_any ~loc) [%type: [%t t] option]);
          B.pparam_val ~loc Nolabel None [%pat? ()];
        ])
      None
      (Pfunction_body [%expr ()])
  in
  (* [omit props [| Text |]] names the props it leaves out by a variant of
     the component's own, so a misspelt one does not compile. *)
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
  (* An interface may export the component without its [omit]. *)
  let generated =
    B.pstr_attribute ~loc
      (attribute ~loc "ocaml.warning"
         ~payload:(PStr [ B.pstr_eval ~loc (B.estring ~loc "-32-37") [] ]))
  in
  ( vars,
    B.pmod_structure ~loc
      ((generated :: type_t :: List.map getter props)
      @ [ constructor; [%stri let check = [%e check]] ]
      @ omit) )

(* Each prop is read where it is used: a value through a thunk, [text ()], a
   function by calling it, [onChange v]; either is inlined to a read of Solid's
   props object, so Solid tracks it as it tracks [props.text]. *)
let reader ~loc p =
  let field =
    B.pexp_apply ~loc
      (B.pexp_ident ~loc { txt = Ldot (Lident "Props", "get_" ^ p.label); loc })
      [ (Nolabel, [%expr props]) ]
  in
  let expr =
    if p.arity > 0 then
      let xs = List.init p.arity (Printf.sprintf "solidtype__%d") in
      let call f =
        {
          (B.pexp_apply ~loc f
             (List.map (fun x -> (Nolabel, B.evar ~loc x)) xs))
          with
          pexp_attributes = [ attribute ~loc "u" ];
        }
      in
      let body =
        match p.presence with
        | Required ->
            [%expr
              let f = [%e field] in
              [%e call [%expr f]]]
        | Optional | Default _ ->
            [%expr
              match [%e field] with
              | Some f -> Some [%e call [%expr f]]
              | None -> None]
      in
      List.fold_right
        (fun x body -> [%expr fun [%p B.pvar ~loc x] -> [%e body]])
        xs body
    else
      match p.presence with
      | Required | Optional -> [%expr fun () -> [%e field]]
      | Default default ->
          [%expr
            fun () -> match [%e field] with Some v -> v | None -> [%e default]]
  in
  (* A component reads the props it needs; the others are still props. *)
  {
    (B.value_binding ~loc ~pat:(B.pvar ~loc p.label) ~expr) with
    pvb_attributes =
      [
        attribute ~loc "inline";
        attribute ~loc "ocaml.warning"
          ~payload:(PStr [ B.pstr_eval ~loc (B.estring ~loc "-26-27") [] ]);
      ];
  }

let component_of (vb : value_binding) =
  let loc = vb.pvb_loc in
  match (vb.pvb_pat.ppat_desc, vb.pvb_expr.pexp_desc) with
  | ( Ppat_var { txt = "make"; _ },
      Pexp_function (params, None, Pfunction_body body) ) ->
      Result.map
        (fun props ->
          let vars, props_module = props_module ~loc props in
          let props_t =
            B.ptyp_constr ~loc
              { txt = Ldot (Lident "Props", "t"); loc }
              (List.map (fun _ -> B.ptyp_any ~loc) vars)
          in
          (* With no props there is nothing to read, and nothing to spread. *)
          let make =
            if List.is_empty props then
              [%expr fun (_ : [%t props_t]) -> [%e body]]
            else
              [%expr
                fun (props : [%t props_t]) ->
                  [%e
                    B.pexp_let ~loc Nonrecursive
                      (List.map (reader ~loc) props)
                      body]]
          in
          [%stri
            include struct
              module Props = [%m props_module]

              let make = [%e make]
              let component = Solidtype.Jsx.component make
            end])
        (props_of params)
  | _ ->
      Error
        ( loc,
          "a component is let%component make ~(prop : t) ... (), one per module"
        )

let mapper =
  object (self)
    inherit Ast_traverse.map as super

    method! expression e =
      match e.pexp_desc with
      | Pexp_apply (_, args) when is_jsx e -> lower self#expression e args
      | _ -> super#expression e

    method! structure_item item =
      match item.pstr_desc with
      | Pstr_extension
          ( ( { txt = "component"; _ },
              PStr [ { pstr_desc = Pstr_value (Nonrecursive, [ vb ]); _ } ] ),
            _ ) -> (
          match
            component_of { vb with pvb_expr = self#expression vb.pvb_expr }
          with
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
