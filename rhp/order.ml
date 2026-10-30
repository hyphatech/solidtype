type 'row t

(* A list of places is the JavaScript value rhp reads as one; t hides which
   kind of order it is. *)
external positions : float option array -> 'row t = "%identity"

external sort_by_js :
  ('row Row.t -> 'key) -> ?direction:[ `asc | `desc ] -> unit -> 'row t
  = "sortBy"
[@@mel.module "@bezda/rhp"]

let sort_by ?direction key = sort_by_js key ?direction ()
