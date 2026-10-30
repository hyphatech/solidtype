(* An rhp chart through the binding: the server's HTML on the page, the same
   chart hydrated over it, each bar the server's own node. *)

module Web = Solidtype.Web
module E = Jest.Expect

external inject : string -> string = "inject" [@@mel.module "vitest"]
external body : Dom.element = "body" [@@mel.scope "document"]

external set_inner_html : Dom.element -> string -> unit = "innerHTML"
[@@mel.set]

external query : string -> Dom.element = "querySelector"
[@@mel.scope "document"]

external query_all : string -> Dom.element array = "querySelectorAll"
[@@mel.scope "document"]
(* A NodeList, read by index and length alone, as an array is. *)

(* A function of the script's text, the script Solid generated: jsdom runs no
   script of a page in the test's own global, which the script sets up. *)
external function_of : string -> (unit -> unit[@u]) = "Function" [@@mel.new]

(* The hydration script, run as the page would run it: its body, between the
   tags the server wrote around it. *)
let run_script tagged =
  let start = Option.map succ (String.index_opt tagged '>') in
  let stop = Js.String.indexOf ~search:"</script>" tagged in
  match start with
  | Some start when start <= stop ->
      (function_of (String.sub tagged start (stop - start))) () [@u]
  | Some _ | None -> ()

let () =
  Jest.describe "hydrate a chart" (fun () ->
      Jest.test "keeps the server's bars" (fun () ->
          run_script (inject "script");
          set_inner_html body ("<div id=\"root\">" ^ inject "chart" ^ "</div>");
          let before = query_all ".rhp-bar" in
          let unmount = Web.hydrate Chart.make (query "#root") in
          let after = query_all ".rhp-bar" in
          let kept =
            Array.length before = Array.length after
            && Array.for_all2 ( == ) before after
          in
          unmount ();
          E.(expect (Array.length after, kept) |> toEqual (3, true))))
