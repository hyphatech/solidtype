# Button

A clickable button component with multiple variants and states.

Original HeroUI documentation: [Button](https://heroui.com/en/docs/react/components/button).

## Usage

```ocaml title="button_usage.mlx"
module Button = Solidtype_heroui.Button

let make () = <Button on_click=(fun _ -> ())>"My Button"</Button>
```

## Parity

The same HeroUI Button twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two elements:
a marked row is one they disagree on, and a dimmed row is a framework's own --
Solid's hydration key, React Aria's markers and the id it generates -- which no
style reads. Hover, focus and press them to see the state each sets.

## Examples

### Variants

```ocaml title="button_variants.mlx"
module Button = Solidtype_heroui.Button

let make () =
  <div class_="flex flex-wrap items-center gap-3">
    <Button>"Primary"</Button>
    <Button variant=`secondary>"Secondary"</Button>
    <Button variant=`tertiary>"Tertiary"</Button>
    <Button variant=`outline>"Outline"</Button>
    <Button variant=`ghost>"Ghost"</Button>
    <Button variant=`danger>"Danger"</Button>
    <Button variant=`danger_soft>"Danger soft"</Button>
  </div>
```

### Sizes

```ocaml title="button_sizes.mlx"
module Button = Solidtype_heroui.Button

let make () =
  <div class_="flex flex-wrap items-center gap-3">
    <Button size=`sm>"Small"</Button>
    <Button size=`md>"Medium"</Button>
    <Button size=`lg>"Large"</Button>
  </div>
```

### With Icons

```ocaml title="button_icons.mlx"
module Gravity = Solidtype_gravity_icons
module Button = Solidtype_heroui.Button

let make () =
  <div class_="flex flex-wrap items-center gap-3">
    <Button><Gravity.Plus /> "New file"</Button>
    <Button variant=`secondary><Gravity.Check /> "Approve"</Button>
    <Button variant=`danger><Gravity.Trash_bin /> "Delete"</Button>
  </div>
```

### Icon Only

An icon-only button is named by its `aria_label`.

```ocaml title="button_icon_only.mlx"
module Button = Solidtype_heroui.Button
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-wrap items-center gap-3">
    <Button is_icon_only=true aria_label="New file"><Gravity.Plus /></Button>
    <Button is_icon_only=true aria_label="Approve" variant=`secondary>
      <Gravity.Check />
    </Button>
    <Button is_icon_only=true aria_label="Delete" variant=`danger>
      <Gravity.Trash_bin />
    </Button>
  </div>
```

### Loading

A pending button keeps its focus but takes no press: its click reaches
nothing, a submit button submits nothing, and it is `aria-disabled`. A reader
is told as it starts or stops pending while it has the focus. A function child
is given `is_pending` with the rest of its state.

```ocaml title="button_loading.mlx"
module Button = Solidtype_heroui.Button
module Spinner = Solidtype_heroui.Spinner

let make () =
  <Button is_pending=true>
    <Spinner color=`current size=`sm /> "Uploading..."
  </Button>
```

### Loading State

```ocaml title="button_loading_state.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Spinner = Solidtype_heroui.Spinner
module Gravity = Solidtype_gravity_icons

let make () =
  let loading, set_loading = S.create_signal false in
  let press _ =
    S.set set_loading true;
    ignore
      (Js.Global.setTimeout ~f:(fun () -> S.set set_loading false) 2000
        : Js.Global.timeoutId)
  in
  <Button is_pending=(S.get loading) on_click=press>
    (if S.get loading then <Spinner color=`current size=`sm />
     else <Gravity.Paperclip />)
    (Jsx.string (if S.get loading then "Uploading..." else "Upload File"))
  </Button>
```

### Full Width

```ocaml title="button_full_width.mlx"
module Button = Solidtype_heroui.Button

let make () =
  <div class_="flex w-72 flex-col gap-3">
    <Button full_width=true>"Full width"</Button>
    <Button full_width=true variant=`secondary>"Full width"</Button>
  </div>
```

### Disabled State

```ocaml title="button_disabled.mlx"
module Button = Solidtype_heroui.Button

let make () =
  <div class_="flex flex-wrap items-center gap-3">
    <Button is_disabled=true>"Primary"</Button>
    <Button is_disabled=true variant=`secondary>"Secondary"</Button>
    <Button is_disabled=true variant=`danger>"Danger"</Button>
  </div>
```

### Render Function

```ocaml title="button_render_function.mlx"
module Button = Solidtype_heroui.Button
module S = Solidtype.Solid

let make () =
  <Button
    as_=(fun p s ->
            <button
              data_custom=(Solidtype.Jsx.data
                             (if S.get s.is_pressed then "pressed" else "bar"))
              props=p
            />)>
    "Press me"
  </Button>
```

An animated element takes a button's place the same way: see [Composition](composition.md#custom-dom-element).

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="button_tailwind.mlx"
module Button = Solidtype_heroui.Button

let make () =
  <Button class_="bg-purple-500 text-white hover:bg-purple-600">
    "Custom button"
  </Button>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every button, as with
HeroUI in React:

```css
@layer components {
  .button {
    @apply font-semibold uppercase;
  }

  .button--primary {
    @apply bg-indigo-600 hover:bg-indigo-700;
  }
}
```

## Styling Reference

### CSS Classes

- `.button` - Base button styles
- `.button--sm` - Small size variant
- `.button--md` - Medium size variant
- `.button--lg` - Large size variant
- `.button--primary`, `.button--secondary`, `.button--tertiary`,
  `.button--outline`, `.button--ghost`, `.button--danger`,
  `.button--danger-soft` - Variants
- `.button--icon-only`, with `.button--sm` and `.button--lg` - Icon-only
  modifier
- `.button--full-width` - Full width modifier

### Interactive States

The button supports both CSS pseudo-classes and data attributes for
flexibility:

- **Hover**: `:hover` or `[data-hovered="true"]`, by a mouse but never a touch
- **Active/Pressed**: `:active` or `[data-pressed="true"]`, by a pointer or by
  Enter and Space (includes scale transform)
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]`, only after a
  key (shows focus ring)
- **Disabled**: `:disabled` or `[data-disabled="true"]` (reduced opacity, no
  pointer events)
- **Pending**: `[data-pending="true"]` (no pointer events during loading)

## API Reference

Each prop beside the name HeroUI's React component gives it. A tag is the
string React takes, a hyphen written as an underscore: `` `danger_soft `` is
`"danger-soft"`.

### Button

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `primary \| `secondary \| `tertiary \| `outline \| `ghost \| `danger \| `danger_soft ] `` | `` `primary `` | Visual style variant |
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | `` `md `` | Size of the button |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the button should take full width of its container |
| `isIconOnly` | `is_icon_only` | `bool` | `false` | Whether the button contains only an icon |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the button is disabled |
| `isPending` | `is_pending` | `bool` | `false` | Whether the button is in a loading state: focusable, pressed by nothing, `aria-disabled` |
| `id` | `id` | `string` | | Its id, which names it with its spinner while it is pending |
| `slot` | `slot` | `` [ `trigger \| `close \| `chevron \| `drag \| `increment \| `decrement ] `` | | Makes it a part of what it is in: the trigger of a [`Disclosure.Heading`](disclosure.md), what closes a [Modal](modal.md)'s dialog, what expands or drags a [Table](table.md)'s row, what steps a [NumberField](number-field.md) or [NumberStepper](number-stepper.md) |
| `type` | `type_` | `` [ `button \| `submit \| `reset \| `menu ] `` | `` `button `` | The button's type in a form |
| `aria-label` | `aria_label` | `string` | | Its name where it shows an icon alone |
| `onPress` | `on_click` | `Dom.mouseEvent -> unit` | | Handler called when the button is pressed, by mouse, touch or keyboard |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements, or a function of `state` | | Button content or render prop |
| `render` | `as_` | a function of its props and `state` | | Draws another element in its place |
