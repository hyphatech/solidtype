(** A JavaScript component's props that are functions of several arguments,
    called as OCaml calls a function.

    JavaScript calls such a prop with every argument at once, and an OCaml
    function's type does not say whether it takes them so: [fun a b -> ...] and
    [fun a -> ...; fun b -> ...] are one type, and Melange writes the second as
    a function of one argument. A binding whose component takes such a prop
    gives it through {!adapted}, so whatever function a caller gives is called
    with the arguments JavaScript passes. A caller writes nothing: a generated
    binding's parts are made with it. *)

val adapted :
  string -> ('given -> 'called) -> 'props Jsx.component -> 'props Jsx.component
(** [adapted name at_arity component] is [component], its prop [name] given as
    [at_arity] makes it of what the caller gave: a function JavaScript calls
    with every argument at once, of the caller's, which it applies as OCaml
    does, [fun f -> fun [@u] a b -> f a b]. [name] is the prop's JavaScript
    name, and ['given] the type the component's check holds the prop to, which
    only the binding that writes this knows. A prop left out stays left out, and
    is read as the component reads it, so Solid tracks it there. *)

val of2 : string -> 'props Jsx.component -> 'props Jsx.component
(** [of2 name component] is {!adapted} for a function of two arguments, for a
    binding written by hand, which writes no [[@u]] of its own. *)

val of3 : string -> 'props Jsx.component -> 'props Jsx.component
(** As {!of2}, of three. *)
