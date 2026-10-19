# solidtype

Solid, typed: OCaml front ends on [SolidJS](https://www.solidjs.com) and
[Kobalte](https://kobalte.dev), compiled by
[Melange](https://melange.re).

A component is written in OCaml's JSX and reaches the browser as the
code Solid's own compiler emits for the same JSX. A reactive read in the
wrong place does not compile, and neither does a prop left out, an
attribute an element does not take, or a `match` in a `Switch` that
misses a case.

```ocaml
let%component make ~(name : string) ?(greeting : string = "Hello") () =
  <p>(fun () -> Solidtype.Jsx.string (greeting () ^ ", " ^ name ()))</p>
```

Solid 1.9 is bound whole -- signals, computations, resources, stores,
its components and its renderer, server rendering included -- but for
what only its compiler emits; where OCaml cannot type a form, the `.mli`
says what replaces it. Each element's attributes are typed from Solid's
own JSX types.

Kobalte 0.13 is bound whole -- every component part by part, its hooks,
values and utilities, and the types they name -- generated from its own
declarations, each component tested beside its TSX twin for behaviour
and accessibility.

Kobalte itself, in TSX as in OCaml, falls short in six places the tests
found, each with what a page does about it:

- **Slider**: its `Slider.Input` sits inside the thumb, an input nested in
  a control, which axe refuses. Leave it out unless the slider is in a
  form that posts its value.
- **Toast**: a toast is an item of a list with the role `status`, which
  axe refuses. Nothing in the binding changes it.
- **NavigationMenu**: the viewport is an item of the menubar's list that
  holds no menu item. Give it `role=`presentation``, as Kobalte gives its
  triggers' items.
- **ColorChannelField**: once it changes, a channel writes its formatted
  text, unit and all, into `aria-valuenow`, which axe refuses for a hue's
  degrees and a percentage. A plain number channel, `red`, is not
  affected.
- **Dialog and Popover**: a close button is named "Dismiss" whatever its
  text says, since Kobalte gives it that `aria-label`. Give it one of its
  own.
- **Accordion**: an arrow key moves Kobalte's focused item but not the
  focus, so a header is reached by Tab.

An island mounts in an [Astro](https://astro.build) page as any Solid
island does, `client:only` or prerendered and hydrated as `client:load`:
the plugin runs under Astro's build, server side as client side.

Not released yet.

## License

MIT
