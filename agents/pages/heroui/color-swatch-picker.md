# ColorSwatchPicker

A list of color swatches that allows users to select a color from a predefined palette.

Its colours are `Types.Color.t`s, read from any CSS colour by
`Solidtype_kobalte.Colors.parse_color`. A value is its swatch's when the two
are one colour, however each is written: `rgb(139, 92, 246)` chooses
`#8B5CF6`.

Original HeroUI documentation: [ColorSwatchPicker](https://heroui.com/en/docs/react/components/color-swatch-picker).

## Usage

HeroUI's examples.

```ocaml title="color_swatch_picker_usage.mlx"
module For = Solidtype.For
module Color_swatch_picker = Solidtype_heroui.Color_swatch_picker
module Colors = Solidtype_kobalte.Colors

let colors =
  [|
    "#F43F5E"; "#D946EF"; "#8B5CF6"; "#3B82F6"; "#06B6D4"; "#10B981"; "#84CC16";
  |]

let make () =
  <Color_swatch_picker>
    <For each=colors>
      (fun c _ ->
        <Color_swatch_picker.Item color=(Colors.parse_color c)>
          <Color_swatch_picker.Swatch /> <Color_swatch_picker.Indicator />
        </Color_swatch_picker.Item>)
    </For>
  </Color_swatch_picker>
```

## Parity

The same HeroUI ColorSwatchPicker twice, under the same props: in solidtype
on the left, in React on the right. Below them, every attribute of the two
pickers: a marked row is one they disagree on.

## Anatomy

```ocaml
<Color_swatch_picker>
  <Color_swatch_picker.Item color=(Colors.parse_color "#F43F5E")>
    <Color_swatch_picker.Swatch />
    <Color_swatch_picker.Indicator />
  </Color_swatch_picker.Item>
</Color_swatch_picker>
```

## Examples

### Variants

```ocaml title="color_swatch_picker_variants.mlx"
module For = Solidtype.For
module Color_swatch_picker = Solidtype_heroui.Color_swatch_picker
module Colors = Solidtype_kobalte.Colors

let colors =
  [|
    "#F43F5E"; "#D946EF"; "#8B5CF6"; "#3B82F6"; "#06B6D4"; "#10B981"; "#84CC16";
  |]

let make () =
  <div class_="flex flex-col gap-6">
    <div class_="flex flex-col gap-2">
      <span class_="text-sm text-muted">"Circle (default)"</span>
      <Color_swatch_picker variant=`circle>
        <For each=colors>
          (fun c _ ->
            <Color_swatch_picker.Item color=(Colors.parse_color c)>
              <Color_swatch_picker.Swatch /> <Color_swatch_picker.Indicator />
            </Color_swatch_picker.Item>)
        </For>
      </Color_swatch_picker>
    </div>
    <div class_="flex flex-col gap-2">
      <span class_="text-sm text-muted">"Square"</span>
      <Color_swatch_picker variant=`square>
        <For each=colors>
          (fun c _ ->
            <Color_swatch_picker.Item color=(Colors.parse_color c)>
              <Color_swatch_picker.Swatch /> <Color_swatch_picker.Indicator />
            </Color_swatch_picker.Item>)
        </For>
      </Color_swatch_picker>
    </div>
  </div>
```

### Sizes

```ocaml title="color_swatch_picker_sizes.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Color_swatch_picker = Solidtype_heroui.Color_swatch_picker
module Colors = Solidtype_kobalte.Colors

let colors =
  [|
    "#F43F5E"; "#D946EF"; "#8B5CF6"; "#3B82F6"; "#06B6D4"; "#10B981"; "#84CC16";
  |]

let sizes =
  [| (`xs, "xs"); (`sm, "sm"); (`md, "md"); (`lg, "lg"); (`xl, "xl") |]

let make () =
  <div class_="flex flex-col gap-6">
    <For each=sizes>
      (fun (size, name) _ ->
        <div class_="flex items-center gap-4">
          <span class_="w-8 text-sm text-muted">(Jsx.string name)</span>
          <Color_swatch_picker size>
            <For each=colors>
              (fun c _ ->
                <Color_swatch_picker.Item color=(Colors.parse_color c)>
                  <Color_swatch_picker.Swatch />
                  <Color_swatch_picker.Indicator />
                </Color_swatch_picker.Item>)
            </For>
          </Color_swatch_picker>
        </div>)
    </For>
  </div>
```

### Disabled

```ocaml title="color_swatch_picker_disabled.mlx"
module For = Solidtype.For
module Color_swatch_picker = Solidtype_heroui.Color_swatch_picker
module Colors = Solidtype_kobalte.Colors

let colors =
  [|
    "#F43F5E"; "#D946EF"; "#8B5CF6"; "#3B82F6"; "#06B6D4"; "#10B981"; "#84CC16";
  |]

let make () =
  <Color_swatch_picker>
    <For each=colors>
      (fun c _ ->
        <Color_swatch_picker.Item is_disabled=true color=(Colors.parse_color c)>
          <Color_swatch_picker.Swatch /> <Color_swatch_picker.Indicator />
        </Color_swatch_picker.Item>)
    </For>
  </Color_swatch_picker>
```

### Stack Layout

A stack is a list the keys walk by Up and Down.

```ocaml title="color_swatch_picker_stack.mlx"
module For = Solidtype.For
module Color_swatch_picker = Solidtype_heroui.Color_swatch_picker
module Colors = Solidtype_kobalte.Colors

let colors =
  [|
    "#F43F5E"; "#D946EF"; "#8B5CF6"; "#3B82F6"; "#06B6D4"; "#10B981"; "#84CC16";
  |]

let make () =
  <Color_swatch_picker layout=`stack>
    <For each=colors>
      (fun c _ ->
        <Color_swatch_picker.Item color=(Colors.parse_color c)>
          <Color_swatch_picker.Swatch /> <Color_swatch_picker.Indicator />
        </Color_swatch_picker.Item>)
    </For>
  </Color_swatch_picker>
```

### Default Value

```ocaml title="color_swatch_picker_default_value.mlx"
module For = Solidtype.For
module Color_swatch_picker = Solidtype_heroui.Color_swatch_picker
module Colors = Solidtype_kobalte.Colors

let colors =
  [|
    "#F43F5E"; "#D946EF"; "#8B5CF6"; "#3B82F6"; "#06B6D4"; "#10B981"; "#84CC16";
  |]

let make () =
  <Color_swatch_picker default_value=(Colors.parse_color "#8B5CF6")>
    <For each=colors>
      (fun c _ ->
        <Color_swatch_picker.Item color=(Colors.parse_color c)>
          <Color_swatch_picker.Swatch /> <Color_swatch_picker.Indicator />
        </Color_swatch_picker.Item>)
    </For>
  </Color_swatch_picker>
```

### Controlled

```ocaml title="color_swatch_picker_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Color_swatch_picker = Solidtype_heroui.Color_swatch_picker
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let colors =
  [|
    "#F43F5E"; "#D946EF"; "#8B5CF6"; "#3B82F6"; "#06B6D4"; "#10B981"; "#84CC16";
  |]

let make () =
  let value, set_value = S.create_signal (Colors.parse_color "#F43F5E") in
  <div class_="flex flex-col gap-4">
    <Color_swatch_picker value=(S.get value) on_change=(S.set set_value)>
      <For each=colors>
        (fun c _ ->
          <Color_swatch_picker.Item color=(Colors.parse_color c)>
            <Color_swatch_picker.Swatch /> <Color_swatch_picker.Indicator />
          </Color_swatch_picker.Item>)
      </For>
    </Color_swatch_picker>
    <p class_="text-sm text-muted">
      "Selected: "
      <span class_="font-medium">
        (Jsx.string (Color.to_string (S.get value) ~format:`hex ()))
      </span>
    </p>
  </div>
```

### Custom Indicator

`Color_swatch_picker.Indicator` takes its children in place of the
checkmark. Inside an item, `Solidtype_headless.Color_swatch_picker.Item.Context.use`
reads its colour and whether it is chosen or disabled.

```ocaml title="color_swatch_picker_custom_indicator.mlx"
module For = Solidtype.For
module Color_swatch_picker = Solidtype_heroui.Color_swatch_picker
module Colors = Solidtype_kobalte.Colors
module Gravity = Solidtype_gravity_icons

let colors =
  [|
    "#F43F5E"; "#D946EF"; "#8B5CF6"; "#3B82F6"; "#06B6D4"; "#10B981"; "#84CC16";
  |]

let make () =
  <Color_swatch_picker>
    <For each=colors>
      (fun c _ ->
        <Color_swatch_picker.Item color=(Colors.parse_color c)>
          <Color_swatch_picker.Swatch />
          <Color_swatch_picker.Indicator>
            <Gravity.Heart_fill />
          </Color_swatch_picker.Indicator>
        </Color_swatch_picker.Item>)
    </For>
  </Color_swatch_picker>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, on each part, and an item's `style`
after its colour.

```ocaml title="color_swatch_picker_custom_styles.mlx"
module For = Solidtype.For
module Color_swatch_picker = Solidtype_heroui.Color_swatch_picker
module Colors = Solidtype_kobalte.Colors

let colors =
  [|
    "#F43F5E"; "#D946EF"; "#8B5CF6"; "#3B82F6"; "#06B6D4"; "#10B981"; "#84CC16";
  |]

let make () =
  <Color_swatch_picker
    class_="rounded-2xl border border-border/80 bg-surface p-4 shadow-sm \
            ring-1 ring-accent/5"
    default_value=(Colors.parse_color "#8B5CF6")
    variant=`square>
    <For each=colors>
      (fun c _ ->
        <Color_swatch_picker.Item color=(Colors.parse_color c)>
          <Color_swatch_picker.Swatch /> <Color_swatch_picker.Indicator />
        </Color_swatch_picker.Item>)
    </For>
  </Color_swatch_picker>
```

## Styling Reference

### CSS Classes

- `.color-swatch-picker` - Base container (flex layout)
- `.color-swatch-picker__item` - Individual swatch item wrapper
- `.color-swatch-picker__swatch` - The color swatch visual element
- `.color-swatch-picker__indicator` - The checkmark over a chosen swatch
- `.color-swatch-picker--xs` - Extra small (16px)
- `.color-swatch-picker--sm` - Small (24px)
- `.color-swatch-picker--md` - Medium (32px, default)
- `.color-swatch-picker--lg` - Large (36px)
- `.color-swatch-picker--xl` - Extra large (40px)
- `.color-swatch-picker--circle` - Circle shape (default)
- `.color-swatch-picker--square` - Square shape with rounded corners
- `.color-swatch-picker--grid` - Horizontal wrapping layout (default)
- `.color-swatch-picker--stack` - Vertical stacked layout

### Interactive States

Each item:

- **Hover**: `[data-hovered="true"]` - Scale up to 1.1 (only when not
  selected)
- **Focus**: `[data-focus-visible="true"]` - Focus ring, and
  `[data-focused="true"]`
- **Pressed**: `[data-pressed="true"]`
- **Selected**: `[data-selected="true"]` - Inner border with same color as
  swatch
- **Disabled**: `[data-disabled="true"]` - Reduced opacity

An item's colour is `--color-swatch-current`. The list declares
`[data-layout]`, `grid` or `stack`. The indicator declares
`[data-light-color="true"]` over a light colour, which draws its checkmark
black.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### ColorSwatchPicker

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `Types.Color.t` | | The current selected color (controlled) |
| `defaultValue` | `default_value` | `Types.Color.t` | | The default selected color (uncontrolled) |
| `onChange` | `on_change` | `Types.Color.t -> unit` | | Handler called when selection changes |
| `size` | `size` | `` [ `xs \| `sm \| `md \| `lg \| `xl ] `` | `` `md `` | Size of the swatches |
| `variant` | `variant` | `` [ `circle \| `square ] `` | `` `circle `` | Shape of the swatches |
| `layout` | `layout` | `` [ `grid \| `stack ] `` | `` `grid `` | Layout direction: wrapped in rows, or one above another |
| `aria-label` | `aria_label` | `string` | "Color swatches" | Its name |
| `aria-labelledby` | `aria_labelledby` | `string` | | The id of what names it |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |

### ColorSwatchPicker.Item

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `color` | `color` | `Types.Color.t` | required | The color of the swatch |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the item is disabled |
| `className` | `class_` | `string` | | Added after HeroUI's class |
| `style` | `style` | `string` | | Added after its colour |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |

### ColorSwatchPicker.Swatch

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `colorName` | `color_name` | `string` | Kobalte's | The colour's name, which names its item |
| `className` | `class_` | `string` | | Added after HeroUI's class |

### ColorSwatchPicker.Indicator

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `children` | `children` | nodes | a checkmark | What it shows once its item is chosen |
| `className` | `class_` | `string` | | Added after HeroUI's class |

## Accessibility

- Tab reaches the chosen swatch, or the first.
- In a grid, Left and Right move to the swatch before and after, as the page's
  direction reads them, and Up and Down to the one above and below; in a
  stack, Up and Down move to the one before and after.
- Home and End reach the ends, Page Up and Page Down too unless the list
  scrolls, and typing the start of a colour's name reaches its swatch.
- A disabled swatch is passed over. A press, Space or Enter chooses a swatch.
