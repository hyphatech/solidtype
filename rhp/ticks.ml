type t

(* Each is the JavaScript value rhp reads as that kind of ticks; t hides
   which. *)
external values : float array -> t = "%identity"
external of_int : int -> t = "%identity"
external custom : (float * float -> float array) -> t = "%identity"
external of_bool : bool -> t = "%identity"

let count = of_int
let none = of_bool false
