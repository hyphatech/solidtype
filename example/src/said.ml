(* What a call came to, as a sentence for the page: the server's own, or
   what went wrong at this end. *)

let error = function
  | `Refused (r : Api.refusal) -> r.message
  | `Invalid (p :: _ : Api.Problem.t list) -> p.message
  | `Invalid [] -> "That is not quite right."
  | `Lost _ -> "The shelf cannot be reached."
  | `Unexpected _ -> "Something went wrong at our end."
