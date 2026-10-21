(** Lowers each JSX element MLX parses -- an application marked [[@JSX]] -- into
    one call of [Solidtype.Jsx], the marker the Vite plugin rewrites into
    Solid's JSX, and writes a component from [let%component].

    An element [<div class_="x" />] becomes [Jsx.el "div"], and a component
    [<Counter initial=1 />] becomes [Jsx.c Counter.component]. A literal, a JSX
    element, a handler ([on_] and its event, [on_click]), a function literal
    other than [fun () -> ...] and a name, [<Row changed />], are static;
    anything else is a thunk, so a read outside a thunk does not compile. A
    function prop that takes no argument is written [(fun _ -> ...)], since
    [fun () -> ...] is a thunk. A string literal, however quoted, is written as
    a JavaScript string, [{js|...|js}], its backslashes doubled, so text that is
    not ASCII and a backslash reach the page as written; one written
    [{js|...|js}] is JavaScript's already, and left as it is.

    An element's attribute is annotated with its type from the element's module
    of [Solidtype.Html], [Html.Div.class_]. Its name is given back its
    JavaScript spelling by the rule's inverse -- a keyword's trailing underscore
    dropped, a hyphen after [aria_] and [data_], [aria_label], and a capital
    after any other underscore, [read_only] -- or by the tables the generators
    write of the names the inverse does not give, [stroke_width]. One of Solid's
    namespaces wraps the value, never the name: [on_click=(Jsx.capture f)] is
    [oncapture:click], and [Jsx.native], [Jsx.prop], [Jsx.attr] and [Jsx.bool]
    name the others.

    A [data_] attribute's value is a [Jsx.data], on an element and on a
    component alike, and a string literal is written as [Jsx.data] for it. A
    component's check takes none of them, as TSX checks no hyphenated attribute
    of a component: each is passed on as a prop of its JavaScript name,
    [data_hovered] as [data-hovered].

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
    thunk, [text ()], and a function prop is called, [on_pick v], an optional
    one giving [Some] of its result or [None]: each is a live read of Solid's
    props, so Solid tracks it.

    [-internal] lowers JSX inside solidtype itself, naming its modules without
    [Solidtype.]. *)
