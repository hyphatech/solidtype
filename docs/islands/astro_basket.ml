module S = Solidtype.Solid

(* Islands share no owner, so no context reaches from one to another; they
   share the modules they import, which the browser loads once. The signal is
   made the first time an island reads it, never as the module loads. *)
let basket = lazy (S.create_signal ([||] : string array))
let teas () = S.get (fst (Lazy.force basket))

let add tea =
  let _, set = Lazy.force basket in
  S.update set (fun teas -> Array.append teas [| tea |])
