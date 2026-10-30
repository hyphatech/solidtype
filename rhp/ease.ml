type t

(* Each is the JavaScript value rhp reads as that kind of curve; t hides
   which. *)
external of_string : string -> t = "%identity"
external of_floats : float array -> t = "%identity"
external of_function : (float -> float) -> t = "%identity"

(* A function is wrapped by a call Melange keeps: inlined, its identity would
   let Melange merge the function into the thunk it is written in,
   (fun () -> custom (fun ...)), into one JavaScript function of all their
   arguments, which rhp would call with its own. *)
let[@inline never] custom f = of_function f
let linear = of_string "linear"
let ease = of_string "ease"
let ease_in = of_string "ease-in"
let ease_out = of_string "ease-out"
let ease_in_out = of_string "ease-in-out"
let cubic_bezier x1 y1 x2 y2 = of_floats [| x1; y1; x2; y2 |]
