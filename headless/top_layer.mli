(** The browser's top layer, where an overlay is drawn above the whole page:
    above anything the page stacks by [z-index], and above every overlay opened
    before it, so what opened last is on top. React Aria writes a [z-index] on
    each overlay it places; Kobalte copies the one its content's style gives,
    which HeroUI's styles leave out of a popover's. The top layer leaves no
    number to agree on.

    An overlay is placed by giving its portal's element to [place], as a [ref]:
    Solid gives a portal's [ref] its element once it is in the document, where
    alone a browser places one.

    {[
      <Kobalte.Portal ref=(fun e -> Top_layer.place e)> ... </Kobalte.Portal>
    ]}

    It stays in the top layer until it leaves the document, as a portal's
    element does when its overlay closes. The element is drawn as a box of no
    size at the viewport's corner, through which the pointer passes, so what it
    holds is placed as before: a positioned popover against the viewport, a
    fixed backdrop over it.

    Where the browser has no top layer, an element placed stays where it is,
    stacked as the page stacks it. *)

val place : _ Dom.element_like -> unit
(** [place e] puts [e] in the top layer, above everything placed before it, then
    raises each element {!keep_on_top} keeps above it again. *)

val keep_on_top : _ Dom.element_like -> unit
(** [keep_on_top e] places [e], and raises it again above each element placed
    after it, as long as [e] is in the document: a toast's region, above a modal
    opened while it shows. A browser places only an element in the document, and
    Solid gives an element's [ref] its element before it is there, so an element
    of a component's own is kept on top once the component is mounted, by
    [Solidtype.Solid.on_mount]. *)
