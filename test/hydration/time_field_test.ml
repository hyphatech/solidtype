(* A HeroUI TimeField, on Kobalte, rendered on the server and hydrated: its
   segments are the server's nodes, kept, with one colon a reader sees
   between each, the one Kobalte's segment writes of its own hidden on both
   sides. *)

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
external hidden : Dom.element -> bool = "hidden" [@@mel.get]

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

let segments () = Js.Array.from (query_all "[role=spinbutton]")

(* The colons a reader sees: those not inside a hidden element. *)
let colons () =
  Js.Array.from
    (query_all "[data-slot=date-input-group-input] span:not([hidden] *)")
  |> Js.Array.filter ~f:(fun e -> String.equal (text e) ":" && not (hidden e))
  |> Array.length

let () =
  Jest.describe "a TimeField hydrated" (fun () ->
      Jest.testPromise "keeps its segments, one colon between each" (fun () ->
          run_script (inject "script");
          set_inner_html body
            ("<div id=\"root\">" ^ inject "timeField" ^ "</div>");
          let before = segments () in
          let colons_before = colons () in
          let unmount = Web.hydrate Time_field_island.make (query "#root") in
          Js.Promise.then_
            (fun () ->
              let after = segments () in
              let kept =
                Array.length before = Array.length after
                && Array.for_all2 ( == ) before after
              in
              let held = (Array.length after, kept, colons_before, colons ()) in
              unmount ();
              Js.Promise.resolve E.(expect held |> toEqual (3, true, 2, 2)))
            (Js.Promise.resolve ())))
