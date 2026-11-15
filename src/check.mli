(** The types of a component's props check, which [ppx_solidtype] applies to
    each element of the component under [if false], so the compiler checks it
    and Melange writes none of it. Write JSX, never these.

    A component's [Props.check] takes one labelled argument per prop, optional
    where the prop is, and ends in [unit]: a value prop as a {!value}, a
    function prop as the function, a JSX element as {!element}, and its children
    as {!children} of the kinds it takes. An optional prop, a value or a
    function alike, is given as OCaml gives an optional argument: a value,
    [count=3], or an option, [?count=o], left out while it is [None]. *)

type 'a value = 'a
(** A value prop, as the check reads it: what its expression gives, so a
    function given where a value belongs is refused. *)

type ('f, 'kind) children
(** A component's children: elements, [`elements], or a function ['f] it calls,
    [`render]. A check names the kinds it takes, [[ `render ]] for [For]'s,
    [[ `elements | `render ]] for children that may be either. *)

external literal : 'a -> 'a value = "%identity"
external thunk : ((unit -> 'a)[@u]) -> 'a value = "%identity"
external elements : unit -> ('f, [> `elements ]) children = "%identity"
external render : 'f -> ('f, [> `render ]) children = "%identity"
external element : unit -> Jsx.element value = "%identity"

external optional : ((unit -> 'a option)[@u]) -> 'a value option = "%identity"
(** An optional prop given as [?name=o], passed to the check as [?name:]:
    refused where the prop is not optional. *)
