type 'row t

(* The row is rhp's proxy, which reads each of the row's fields from the
   plot's rows as it is read: it is the row, each field where the row has
   it. *)
external data : 'row t -> 'row = "%identity"
external index : 'row t -> int = "index" [@@mel.get]
external position_js : 'row t -> int Js.Nullable.t = "position" [@@mel.get]

let position d = Js.Nullable.toOption (position_js d)
