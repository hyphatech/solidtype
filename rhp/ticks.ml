type t

(* Each is the JavaScript value rhp reads as that kind of ticks; t hides
   which. *)
external values : float array -> t = "%identity"
external of_int : int -> t = "%identity"
external of_function : (float * float -> float array) -> t = "%identity"
external of_bool : bool -> t = "%identity"

let count = of_int

(* A function is wrapped by a call Melange keeps: inlined, its identity would
   let Melange merge the function into the thunk it is written in,
   (fun () -> custom (fun ...)), into one JavaScript function of all their
   arguments, which rhp would call with its own. *)
let[@inline never] custom f = of_function f
let none = of_bool false
