external series_js : ?n:int -> unit -> ('row Row.t -> Color.t[@u]) = "series"
[@@mel.module "@bezda/rhp"]

let series ?n () =
  let f = series_js ?n () in
  fun d -> (f d [@u])

external cycle_js : 'a array -> ('row Row.t -> 'a[@u]) = "cycle"
[@@mel.module "@bezda/rhp"]

let cycle list =
  let f = cycle_js list in
  fun d -> (f d [@u])

type stack = { from : float option array; to_ : float option array }
type segments

external stack_up_js : float option array -> segments = "stackUp"
[@@mel.module "@bezda/rhp"]

external running_js : float option array -> segments = "running"
[@@mel.module "@bezda/rhp"]

external shares_js :
  float option array -> ?total:float -> unit -> float Js.Nullable.t array
  = "shares"
[@@mel.module "@bezda/rhp"]

external from_ : segments -> float Js.Nullable.t array = "from" [@@mel.get]
external to_ : segments -> float Js.Nullable.t array = "to" [@@mel.get]

(* rhp writes a missing value as null, which an option would read as Some. *)
let options = Array.map Js.Nullable.toOption
let stack s = { from = options (from_ s); to_ = options (to_ s) }
let stack_up values = stack (stack_up_js values)
let running changes = stack (running_js changes)
let shares ?total values = options (shares_js values ?total ())
