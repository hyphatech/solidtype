(* The examples' stand-in for a server's answer: a value that arrives after a
   while. JavaScript's own [Promise] constructor makes it, given an OCaml
   function, which Melange writes as a JavaScript one. *)

external promise : ((('a -> unit) -> unit)[@mel.uncurry]) -> 'a Js.Promise.t
  = "Promise"
[@@mel.new]

let after ms value =
  promise (fun resolve ->
      ignore
        (Js.Global.setTimeout ~f:(fun () -> resolve value) ms
          : Js.Global.timeoutId))
