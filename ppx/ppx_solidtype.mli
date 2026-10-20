(** Lowers each JSX element MLX parses -- an application marked [[@JSX]] -- into
    one call of [Solidtype.Jsx], the marker the Vite plugin rewrites into
    Solid's JSX, and writes a component from [let%component].

    An element [<div class_="x" />] becomes [Jsx.el "div"], and a component
    [<Counter initial=1 />] becomes [Jsx.c Counter.component]. A literal, a JSX
    element, a handler (a prop named [on] then a capital) and a function literal
    other than [fun () -> ...] are static; anything else is a thunk, so a read
    outside a thunk does not compile. A function prop that takes no argument is
    written [(fun _ -> ...)], since [fun () -> ...] is a thunk. A string
    literal, however quoted, is written as a JavaScript string, [{js|...|js}],
    its backslashes doubled, so text that is not ASCII and a backslash reach the
    page as written; one written [{js|...|js}] is JavaScript's already, and left
    as it is.

    An element's attribute is annotated with its type from the element's module
    of [Solidtype.Html], [Html.Div.class_]. Its name is the label's, a trailing
    underscore dropped and an underscore read as a hyphen, [aria_label]; the
    prefixes [on_], [oncapture_], [attr_], [bool_] and [prop_] name Solid's
    namespaces, [on:scroll], and [data_] a data attribute.

    A component's element also applies [Counter.Props.check] to its props under
    [if false], so a prop left out or not taken is a compile error, and Melange
    writes none of it. [props=p] spreads [p] without copying it, TSX's [{...p}],
    so no prop is named [props]. A child is a string literal, an element, or a
    thunk of [Solidtype.Jsx.content]; a component's only child may be a function
    the component calls. A [Switch] whose only child is a thunk of a [match]
    gets a [Match] per case, a [Match.Keyed] where the case binds variables, and
    the [match] is also checked whole, so a case left out is the compiler's
    warning.

    [let%component make ~(text : string) ?(count : int = 0) () = body] writes
    the module's [Props] -- its type, a getter per prop, [make], which builds
    props as a value, [check], and [omit], which names props by a variant of
    their own -- and [make] and [component]. In [body] a value prop is read as a
    thunk, [text ()], and a function prop is called, [onPick v]: each is a live
    read of Solid's props, so Solid tracks it.

    [-internal] lowers JSX inside solidtype itself, naming its modules without
    [Solidtype.]. *)
