module S = Solidtype.Solid

(* Every island that imports this module shares the one signal. It is made
   on first use, never as the module loads. *)
let basket = lazy (S.create_signal 0)
let count () = S.get (fst (Lazy.force basket))
let add () = S.update (snd (Lazy.force basket)) succ
