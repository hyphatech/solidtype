(* A virtualized HeroUI List_view rendered on the server and hydrated: the
   rows the server drew are the rows it hydrates, each chosen by its checkbox
   once it has. *)

module Web = Solidtype.Web
module E = Jest.Expect

external inject : string -> string = "inject" [@@mel.module "vitest"]
external body : Dom.element = "body" [@@mel.scope "document"]

external set_inner_html : Dom.element -> string -> unit = "innerHTML"
[@@mel.set]

external query : string -> Dom.element = "querySelector"
[@@mel.scope "document"]

external query_all : string -> Dom.element Js.Array.array_like
  = "querySelectorAll"
[@@mel.scope "document"]

external get_attribute : Dom.element -> string -> string Js.null
  = "getAttribute"
[@@mel.send]

external click : Dom.element -> unit = "click" [@@mel.send]

external function_of : string -> unit Solidtype.Solid.accessor = "Function"
[@@mel.new]

let run_script tagged =
  let start = Option.map succ (String.index_opt tagged '>') in
  let stop = Js.String.indexOf ~search:"</script>" tagged in
  match start with
  | Some start when start <= stop ->
      Solidtype.Solid.get (function_of (String.sub tagged start (stop - start)))
  | Some _ | None -> ()

let rows () =
  Js.Array.from (query_all "[role=row]")
  |> Array.map (fun r -> Js.Null.toOption (get_attribute r "aria-label"))

let () =
  Jest.describe "a virtualized List_view hydrated" (fun () ->
      Jest.testPromise "keeps the rows the server drew, and chooses them"
        (fun () ->
          run_script (inject "script");
          set_inner_html body
            ("<div id=\"root\">" ^ inject "listView" ^ "</div>");
          let served = rows () in
          let unmount = Web.hydrate List_view_island.make (query "#root") in
          Js.Promise.then_
            (fun () ->
              let hydrated = rows () in
              click (query "[role=row] input");
              let chosen =
                Js.Null.toOption
                  (get_attribute (query "[role=row]") "aria-selected")
              in
              unmount ();
              Js.Promise.resolve
                E.(
                  expect (Array.length served > 0, hydrated, chosen)
                  |> toEqual (true, served, Some "true")))
            (Js.Promise.resolve ())))
