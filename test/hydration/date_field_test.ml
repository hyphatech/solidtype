(* A HeroUI DateField rendered on the server and hydrated in a browser that
   reads US English, jsdom's: it hydrates the server's nodes and stays day
   before month, as no provider names a locale. *)

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

external text : Dom.element -> string = "textContent" [@@mel.get]

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

let segments () = Js.Array.from (query_all "[data-type]")

(* Each segment's part and text, a literal by its text alone. *)
let shown () =
  segments ()
  |> Array.map (fun e ->
      match Js.Null.toOption (get_attribute e "data-type") with
      | Some "literal" | None -> text e
      | Some t -> t ^ "=" ^ text e)
  |> Array.to_list |> String.concat ""

let () =
  Jest.describe "a DateField hydrated" (fun () ->
      Jest.testPromise "hydrates the server's segments, day before month"
        (fun () ->
          run_script (inject "script");
          set_inner_html body
            ("<div id=\"root\">" ^ inject "dateField" ^ "</div>");
          let served = shown () in
          let unmount = Web.hydrate Date_field_island.make (query "#root") in
          Js.Promise.then_
            (fun () ->
              let held = (served, shown ()) in
              unmount ();
              Js.Promise.resolve
                E.(
                  expect held
                  |> toEqual
                       ("day=21/month=11/year=2026", "day=21/month=11/year=2026")))
            (Js.Promise.resolve ())))
