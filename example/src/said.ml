(* What a call came to, as a sentence for the page: the server's own, or
   what went wrong at this end. *)

let error = function
  | `Refused (r : Api.refusal) -> r.message
  | `Invalid (p :: _ : Api.Problem.t list) -> p.message
  | `Invalid [] -> "That is not quite right."
  | `Lost _ -> "The board cannot be reached."
  | `Unexpected _ -> "Something went wrong at our end."

(* The form field a problem is at: the first name of its path, the body's
   own, as the client checks a body before it goes, or the server's, which
   starts at the request. *)
let field at =
  let at =
    if String.starts_with ~prefix:"body." at then
      String.sub at 5 (String.length at - 5)
    else at
  in
  let ends =
    match (String.index_opt at '.', String.index_opt at '[') with
    | Some d, Some b -> Int.min d b
    | Some i, None | None, Some i -> i
    | None, None -> String.length at
  in
  String.sub at 0 ends

(* Each problem with a field of the form it was sent from, by that field's
   name; none where the call failed otherwise. *)
let on_fields = function
  | `Invalid (problems : Api.Problem.t list) ->
      List.map (fun (p : Api.Problem.t) -> (field p.at, p.message)) problems
  | `Refused (r : Api.refusal) ->
      List.map
        (fun (p : Api.problem) -> (field p.at, p.message))
        (Array.to_list (Option.value r.problems ~default:[||]))
  | `Lost _ | `Unexpected _ -> []
