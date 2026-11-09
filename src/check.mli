(** The types of a component's props check, which [ppx_solidtype] applies to
    each element of the component under [if false], so the compiler checks it
    and Melange writes none of it. Write JSX, never these.

    A component's [Props.check] takes one labelled argument per prop, optional
    where the prop is, and ends in [unit]: a value prop as a {!value}, a
    function prop as the function, a JSX element as {!element}, and its children
    as {!children} of the kinds it takes. An optional prop, a value or a
    function alike, is given or left out by one option, [?name=(fun () -> o)].
*)

type 'a value = 'a
(** A value prop, as the check reads it: a literal, or what a thunk returns, so
    a thunk given where a function belongs is refused, its result not being the
    function. *)

type ('f, 'kind) children
(** A component's children: elements, [`nodes], or a function ['f] it calls,
    [`render]. A check names the kinds it takes, [[ `render ]] for [For]'s,
    [[ `nodes | `render ]] for children that may be either. *)

external literal : 'a -> 'a value = "%identity"
external thunk : (unit -> 'a) -> 'a value = "%identity"
external nodes : unit -> ('f, [> `nodes ]) children = "%identity"
external render : 'f -> ('f, [> `render ]) children = "%identity"
external element : unit -> Jsx.element value = "%identity"

external optional : (unit -> 'a option) -> 'a value option = "%identity"
(** An optional prop given as [?name=(fun () -> o)], passed to the check as
    [?name:]: refused where the prop is not optional. *)
