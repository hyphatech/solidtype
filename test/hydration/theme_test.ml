(* A theme on a prerendered page: the server, which knows no visitor, draws the
   default and resolves nothing; hydrated, the page shows the visitor's. *)

module Web = Solidtype.Web
module E = Jest.Expect

external inject : string -> string = "inject" [@@mel.module "vitest"]
external body : Dom.element = "body" [@@mel.scope "document"]
external html : Dom.element = "documentElement" [@@mel.scope "document"]

external set_inner_html : Dom.element -> string -> unit = "innerHTML"
[@@mel.set]

external query : string -> Dom.element = "querySelector"
[@@mel.scope "document"]

external get_attribute : Dom.element -> string -> string Js.null
  = "getAttribute"
[@@mel.send]

external set_item : string -> string -> unit = "setItem"
[@@mel.scope "localStorage"]

external clear : unit -> unit = "clear" [@@mel.scope "localStorage"]
external function_of : string -> (unit -> unit[@u]) = "Function" [@@mel.new]

let run_script tagged =
  let start = Option.map succ (String.index_opt tagged '>') in
  let stop = Js.String.indexOf ~search:"</script>" tagged in
  match start with
  | Some start when start <= stop ->
      (function_of (String.sub tagged start (stop - start))) () [@u]
  | Some _ | None -> ()

let attribute e name = Js.Null.toOption (get_attribute e name)

let () =
  Jest.describe "a theme hydrated" (fun () ->
      Jest.test "the server draws the default and resolves nothing" (fun () ->
          set_inner_html body ("<div id=\"root\">" ^ inject "theme" ^ "</div>");
          let e = query "#theme" in
          E.(
            expect (attribute e "data-theme", attribute e "data-resolved")
            |> toEqual (Some "system", Some "none")));
      Jest.test "hydrated, shows the theme the visitor chose" (fun () ->
          run_script (inject "script");
          set_item "heroui-theme" "dark";
          set_inner_html body ("<div id=\"root\">" ^ inject "theme" ^ "</div>");
          let unmount = Web.hydrate Theme_island.make (query "#root") in
          let e = query "#theme" in
          let held =
            ( attribute e "data-theme",
              attribute e "data-resolved",
              attribute html "data-theme" )
          in
          unmount ();
          clear ();
          E.(expect held |> toEqual (Some "dark", Some "dark", Some "dark"))))
