(* A HeroUI Select, on Kobalte, rendered on the server and hydrated: the value
   it is given is Kobalte's once it hydrates, its options in Kobalte's hidden
   select and its value no placeholder. Kobalte's list is built as the page
   hydrates, and options joining it then would never reach it. *)

module Web = Solidtype.Web
module E = Jest.Expect

external inject : string -> string = "inject" [@@mel.module "vitest"]
external body : Dom.element = "body" [@@mel.scope "document"]

external set_inner_html : Dom.element -> string -> unit = "innerHTML"
[@@mel.set]

external query : string -> Dom.element = "querySelector"
[@@mel.scope "document"]

external get_attribute : Dom.element -> string -> string Js.null
  = "getAttribute"
[@@mel.send]

external value : Dom.element -> string = "value" [@@mel.get]

external options : Dom.element -> Dom.element Js.Array.array_like = "options"
[@@mel.get]

external function_of : string -> (unit -> unit[@u]) = "Function" [@@mel.new]

(* The hydration script, run as the page would run it. *)
let run_script tagged =
  let start = Option.map succ (String.index_opt tagged '>') in
  let stop = Js.String.indexOf ~search:"</script>" tagged in
  match start with
  | Some start when start <= stop ->
      (function_of (String.sub tagged start (stop - start))) () [@u]
  | Some _ | None -> ()

let () =
  Jest.describe "a Select hydrated" (fun () ->
      Jest.testPromise "holds the value it is given, no placeholder" (fun () ->
          run_script (inject "script");
          set_inner_html body ("<div id=\"root\">" ^ inject "select" ^ "</div>");
          let unmount = Web.hydrate Select_island.make (query "#root") in
          Js.Promise.then_
            (fun () ->
              let hidden = query "select" in
              let held =
                ( value hidden,
                  Js.Array.length (Js.Array.from (options hidden)),
                  Js.Null.toOption
                    (get_attribute
                       (query "[data-slot=select-value]")
                       "data-placeholder") )
              in
              unmount ();
              Js.Promise.resolve E.(expect held |> toEqual ("texas", 2, None)))
            (Js.Promise.resolve ())))
