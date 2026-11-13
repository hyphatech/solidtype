(* A HeroUI CheckboxGroup rendered on the server and hydrated: the group is
   named by its label and described by its description in the HTML the server
   writes, as a reader meets a prerendered page, and once it hydrates. *)

module Web = Solidtype.Web
module E = Jest.Expect

external inject : string -> string = "inject" [@@mel.module "vitest"]
external body : Dom.element = "body" [@@mel.scope "document"]

external set_inner_html : Dom.element -> string -> unit = "innerHTML"
[@@mel.set]

external query : string -> Dom.element = "querySelector"
[@@mel.scope "document"]

external by_id : string -> Dom.element Js.null = "getElementById"
[@@mel.scope "document"]

external attribute : Dom.element -> string -> string Js.null = "getAttribute"
[@@mel.send]

external text : Dom.element -> string = "textContent" [@@mel.get]

external function_of : string -> unit Solidtype.Solid.accessor = "Function"
[@@mel.new]

(* The hydration script, run as the page would run it. *)
let run_script tagged =
  let start = Option.map succ (String.index_opt tagged '>') in
  let stop = Js.String.indexOf ~search:"</script>" tagged in
  match start with
  | Some start when start <= stop ->
      Solidtype.Solid.get (function_of (String.sub tagged start (stop - start)))
  | Some _ | None -> ()

(* The text of what the group's [name] attribute points to. *)
let told name =
  let group = query "[data-slot=checkbox-group]" in
  match Js.Null.toOption (attribute group name) with
  | None -> "nothing"
  | Some id -> (
      match Js.Null.toOption (by_id id) with
      | Some e -> text e
      | None -> "missing")

let () =
  Jest.describe "a CheckboxGroup hydrated" (fun () ->
      Jest.testPromise "is named and described by its label and description"
        (fun () ->
          run_script (inject "script");
          set_inner_html body
            ("<div id=\"root\">" ^ inject "checkboxGroup" ^ "</div>");
          let served = (told "aria-labelledby", told "aria-describedby") in
          let unmount =
            Web.hydrate Checkbox_group_island.make (query "#root")
          in
          Js.Promise.then_
            (fun () ->
              let hydrated =
                (told "aria-labelledby", told "aria-describedby")
              in
              unmount ();
              Js.Promise.resolve
                E.(
                  expect (served, hydrated)
                  |> toEqual
                       (("Interests", "Choose any"), ("Interests", "Choose any"))))
            (Js.Promise.resolve ())))
