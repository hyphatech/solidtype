type t

(* Each is the JavaScript value rhp reads as that kind of curve; t hides
   which. *)
external of_string : string -> t = "%identity"
external of_floats : float array -> t = "%identity"
external custom : (float -> float) -> t = "%identity"

let linear = of_string "linear"
let ease = of_string "ease"
let ease_in = of_string "ease-in"
let ease_out = of_string "ease-out"
let ease_in_out = of_string "ease-in-out"
let cubic_bezier x1 y1 x2 y2 = of_floats [| x1; y1; x2; y2 |]
