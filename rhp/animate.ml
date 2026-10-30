type t

(* Each is the JavaScript value rhp reads as that kind of motion; t hides
   which. *)
external of_bool : bool -> t = "%identity"
external groups : string array -> t = "%identity"

external make :
  ?groups:string array ->
  ?duration:float ->
  ?ease:Ease.t ->
  ?slide:float ->
  unit ->
  t = ""
[@@mel.obj]

let all = of_bool true
