# Composition

Build flexible UI with component composition patterns.

HeroUI uses composition patterns to create flexible, customizable components.
Change the rendered element, compose components together, and maintain full
control over markup.

Original HeroUI documentation: [Composition](https://heroui.com/docs/react/getting-started/composition).

## Parts

HeroUI components are built as compound components: they export multiple
parts that work together. A component is a module and its parts are modules
inside it: `<Alert>` is HeroUI's `<Alert>` or `<Alert.Root>`, and
`<Alert.Title>` its `<Alert.Title>`.

```ocaml
module Alert = Solidtype_heroui.Alert

let saved () =
  <Alert status=`success>
    <Alert.Indicator />
    <Alert.Content>
      <Alert.Title>"Saved"</Alert.Title>
      <Alert.Description>"Your changes have been saved."</Alert.Description>
    </Alert.Content>
  </Alert>
```

## HeroUI's look on any element

Apply HeroUI styles to any element using variant functions or BEM classes.
`Solidtype_heroui.Styles` holds HeroUI's variant functions, one module each:
`buttonVariants` is `Styles.Button`, its variants the optional arguments of
`options`, and `classes` the class string; a component of several parts has
`slots`, and a function per part. HeroUI's BEM classes work as they are:

```ocaml title="composition_link.mlx"
module Styles = Solidtype_heroui.Styles

(* A button's look on a link: HeroUI's variant function, or its classes as
   they are. *)
let make () =
  let primary =
    Styles.Button.classes (Styles.Button.options ~variant:`primary ())
  in
  <div class_="flex gap-3">
    <a href="#composition" class_=primary>"Variant function"</a>
    <a href="#composition" class_="button button--tertiary">"BEM classes"</a>
  </div>
```

Such an element has HeroUI's look at rest and its `:hover` and `:active`
rules, but none of the state a port declares. `Solidtype_heroui.Interaction`
gives any element the hover, press and focus state HeroUI's styles read:

```ocaml title="composition_state.mlx"
module Jsx = Solidtype.Jsx
module Interaction = Solidtype_heroui.Interaction

(* An element no port renders, given HeroUI's classes and the state its styles
   read, as a port declares it. *)
let make () =
  let i = Interaction.create () in
  <a
    href="#composition"
    class_="button button--secondary"
    ref=(fun e -> Interaction.watch i e)
    data_hovered=(Jsx.flag (Interaction.hovered i))
    data_pressed=(Jsx.flag (Interaction.pressed i))
    data_focus_visible=(Jsx.flag (Interaction.focus_visible i))>
    "A link, pressed as a button"
  </a>
```

## Custom variants

Create custom variants by wrapping a port in a component of your own that
gives it classes. They come after HeroUI's, and a utility wins over HeroUI's
classes, which are in Tailwind's `components` layer:

```ocaml title="composition_variants.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button

(* A button of one's own: a variant HeroUI's has not, as classes given to
   HeroUI's, which its own variant function merges over its own. *)
module Pill_button = struct
  let%component make ?(radius : [ `full | `sm ] = `full)
      ~(children : Jsx.element) () =
    <Button
      class_=(match S.get radius with
             | `full -> "rounded-full font-semibold shadow-md"
             | `sm -> "rounded-sm font-semibold shadow-md")>
      (S.get children)
    </Button>
end

let make () =
  <div class_="flex gap-3">
    <Pill_button>"Full"</Pill_button>
    <Pill_button radius=`sm>"Small"</Pill_button>
  </div>
```

## Custom DOM Element

Use the `as_` prop, HeroUI's `render`, on a part that draws an element to
render a custom component in place of the default DOM element. It is a
function of the part's props and, where the part has one, its state.

For example, you can render a [Motion](https://motion.dev/) button and use the
state to drive an animation.

```ocaml title="composition_motion.mlx"
module Button = Solidtype_heroui.Button
module S = Solidtype.Solid

(* solid-motionone's button, bound by what this page uses of it. *)
module Motion_button = struct
  type keyframes

  external keyframes : scale:float -> keyframes = "" [@@mel.obj]

  module Props = struct
    external check :
      animate:keyframes Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Button.check = "check"
    [@@mel.module "vite-plugin-solidtype/markers"]
  end

  external component : unit Solidtype.Jsx.component = "button"
  [@@mel.module "solid-motionone"] [@@mel.scope "Motion"]
end

let make () =
  <Button
    as_=(fun p s ->
            <Motion_button
              animate=(Motion_button.keyframes
                         ~scale:(if S.get s.is_pressed then 0.9 else 1.))
              props=p
            />)>
    "Press me"
  </Button>
```

Follow these rules to avoid breaking the behavior and accessibility of the
component:

- Always render the expected element type (e.g. if `<button>` is expected, do
  not render an `<a>`).
- Only render a single root DOM element (no fragments).
- Always pass the provided props to the underlying DOM element: they hold the
  part's classes, attributes and handlers.

A router's link needs none of this: Solid's router takes every plain
same-origin `<a>` as its own unless told `explicitLinks`.

Kobalte's parts take `as_` too, a function of their props alone.
