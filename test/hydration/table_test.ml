(* A virtualized HeroUI Table rendered on the server and hydrated: its grid
   tells a reader every row and column it holds, the header's row among them,
   as the server wrote it and once it hydrates, though it draws only those in
   view. *)

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

external function_of : string -> unit Solidtype.Solid.accessor = "Function"
[@@mel.new]

let run_script tagged =
  let start = Option.map succ (String.index_opt tagged '>') in
  let stop = Js.String.indexOf ~search:"</script>" tagged in
  match start with
  | Some start when start <= stop ->
      Solidtype.Solid.get (function_of (String.sub tagged start (stop - start)))
  | Some _ | None -> ()

let counts () =
  let grid = query "[role=grid]" in
  ( Js.Null.toOption (get_attribute grid "aria-rowcount"),
    Js.Null.toOption (get_attribute grid "aria-colcount") )

let () =
  Jest.describe "a virtualized Table hydrated" (fun () ->
      Jest.testPromise "counts every row and column" (fun () ->
          run_script (inject "script");
          set_inner_html body ("<div id=\"root\">" ^ inject "table" ^ "</div>");
          let served = counts () in
          let unmount = Web.hydrate Table_island.make (query "#root") in
          Js.Promise.then_
            (fun () ->
              let hydrated = counts () in
              unmount ();
              Js.Promise.resolve
                E.(
                  expect (served, hydrated)
                  |> toEqual ((Some "101", Some "3"), (Some "101", Some "3"))))
            (Js.Promise.resolve ())))
