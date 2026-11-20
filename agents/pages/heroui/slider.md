# Slider

A slider allows a user to select one or more values within a range.

Original HeroUI documentation: [Slider](https://heroui.com/en/docs/react/components/slider).

## Usage

```ocaml title="slider_usage.mlx"
module Label = Solidtype_heroui.Label
module Slider = Solidtype_heroui.Slider

let make () =
  <Slider class_="w-full max-w-xs" default_value=[| 30. |]>
    <Label>"Volume"</Label>
    <Slider.Output />
    <Slider.Track><Slider.Fill /> <Slider.Thumb /></Slider.Track>
  </Slider>
```

## Parity

The same HeroUI Slider twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of the two thumbs: a marked
row is one they disagree on -- Kobalte's thumb is a `slider`, where React
Aria's holds a range input.

The marked rows are where each puts what a reader reaches: Kobalte's thumb is itself the `slider`, named, valued and reached by Tab, where React Aria's thumb holds a hidden range input that is; and Kobalte writes the thumb's place in a style of its own.

## Anatomy

```ocaml
<Slider default_value=([| 25.; 75. |])>
  <Label>"Range"</Label>
  <Slider.Output />
  <Slider.Track>
    <Slider.Fill />
    <Slider.Thumb index=0 />
    <Slider.Thumb index=1 />
  </Slider.Track>
</Slider>
```

## Examples

### Disabled

```ocaml title="slider_disabled.mlx"
module Label = Solidtype_heroui.Label
module Slider = Solidtype_heroui.Slider

let make () =
  <Slider class_="w-full max-w-xs" default_value=[| 30. |] is_disabled=true>
    <Label>"Volume"</Label>
    <Slider.Output />
    <Slider.Track><Slider.Fill /> <Slider.Thumb /></Slider.Track>
  </Slider>
```

### Vertical

```ocaml title="slider_vertical.mlx"
module Label = Solidtype_heroui.Label
module Slider = Solidtype_heroui.Slider

let make () =
  <div class_="flex h-64 items-center justify-center">
    <Slider class_="h-full" default_value=[| 30. |] orientation=`vertical>
      <Label>"Volume"</Label>
      <Slider.Output />
      <Slider.Track><Slider.Fill /> <Slider.Thumb /></Slider.Track>
    </Slider>
  </div>
```

### Range

Each thumb of a range is bounded, for a reader, by its neighbours.

```ocaml title="slider_range.mlx"
module Label = Solidtype_heroui.Label
module Slider = Solidtype_heroui.Slider

let make () =
  <Slider
    class_="w-full max-w-xs"
    default_value=[| 100.; 500. |]
    max_value=1000.
    min_value=0.
    step=50.>
    <Label>"Price Range"</Label>
    <Slider.Output />
    <Slider.Track>
      <Slider.Fill /> <Slider.Thumb index=0 /> <Slider.Thumb index=1 />
    </Slider.Track>
  </Slider>
```

### Controlled Value

Control the value with `value` and `on_change`.

```ocaml title="slider_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Label = Solidtype_heroui.Label
module Slider = Solidtype_heroui.Slider

let make () =
  let value, set_value = S.create_signal [| 25. |] in
  <div class_="flex w-full max-w-xs flex-col gap-4">
    <Slider value=(S.get value) on_change=(S.set set_value)>
      <Label>"Volume"</Label>
      <Slider.Output />
      <Slider.Track><Slider.Fill /> <Slider.Thumb /></Slider.Track>
    </Slider>
    <p class_="text-sm text-muted">
      (Jsx.string
         ("Current value: "
         ^ String.concat ", "
             (Array.to_list (Array.map Js.Float.toString (S.get value)))))
    </p>
  </div>
```

### Custom Output

Customize `Slider.Output` to control how the selected values are shown: its
children take the place of its values.

```ocaml title="slider_custom_output.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Label = Solidtype_heroui.Label
module Slider = Solidtype_heroui.Slider

let make () =
  let values, set_values = S.create_signal [| 25.; 75. |] in
  <Slider
    class_="w-full max-w-xs" value=(S.get values) on_change=(S.set set_values)>
    <Label>"Range"</Label>
    <Slider.Output>
      (match S.get values with
      | [| low; high |] ->
          Jsx.string
            (Js.Float.toString low ^ "% to " ^ Js.Float.toString high ^ "%")
      | _ -> Jsx.string "")
    </Slider.Output>
    <Slider.Track>
      <Slider.Fill /> <Slider.Thumb index=0 /> <Slider.Thumb index=1 />
    </Slider.Track>
  </Slider>
```

### Custom Value Formatting

Use `format_options` to format the displayed value. This example formats it
as USD. Each thumb tells a reader its value in the same format, in the
reader's locale.

```ocaml title="slider_format.mlx"
module Label = Solidtype_heroui.Label
module Slider = Solidtype_heroui.Slider
module Format = Solidtype_kobalte.Types.NumberFormatOptions

let make () =
  <Slider
    class_="w-64"
    default_value=[| 200.; 800. |]
    max_value=1000.
    format_options=(Format.make ~style:`currency ~currency:"USD" ())>
    <Label>"Price"</Label>
    <Slider.Output />
    <Slider.Track>
      <Slider.Fill /> <Slider.Thumb index=0 /> <Slider.Thumb index=1 />
    </Slider.Track>
  </Slider>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base Classes

- `.slider` - Base slider container
- `.slider__output` - Output element displaying current value(s)
- `.slider__track` - Track element containing fill and thumbs
- `.slider__fill` - Fill element showing selected range
- `.slider__thumb` - Individual thumb element

#### State Classes

- `.slider[data-disabled="true"]` - Disabled slider state
- `.slider[data-orientation="vertical"]` - Vertical orientation
- `.slider__thumb[data-dragging="true"]` - Thumb being dragged
- `.slider__thumb[data-focus-visible="true"]` - Thumb keyboard focused
- `.slider__thumb[data-disabled="true"]` - Disabled thumb state
- `.slider__track[data-fill-start="true"]` - Fill starts at beginning
- `.slider__track[data-fill-end="true"]` - Fill ends at end

### Interactive States

The component supports both CSS pseudo-classes and data attributes for
flexibility:

- **Hover**: `:hover` or `[data-hovered="true"]` on thumb
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]` on thumb, and
  `[data-focused="true"]`
- **Dragging**: `[data-dragging="true"]` on thumb
- **Disabled**: `[data-disabled="true"]` on slider or thumb

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Slider

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `float array` | | The current value (controlled) |
| `defaultValue` | `default_value` | `float array` | `[\| min_value \|]` | The default value (uncontrolled) |
| `onChange` | `on_change` | `float array -> unit` | | Handler called when the value changes |
| `onChangeEnd` | `on_change_end` | `float array -> unit` | | Handler called when dragging ends |
| `minValue` | `min_value` | `float` | `0.` | The slider's minimum value |
| `maxValue` | `max_value` | `float` | `100.` | The slider's maximum value |
| `step` | `step` | `float` | `1.` | Value increment |
| `orientation` | `orientation` | `` [ `horizontal \| `vertical ] `` | `` `horizontal `` | The orientation of the slider |
| `isDisabled` | `is_disabled` | `bool` | | Whether the slider is disabled; else as its fieldset is |
| `name` | `name` | `string` | | The name of the input, used when submitting an HTML form |
| `aria-label` | `aria_label` | `string` | | Accessibility label for the slider |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `onBlur` | `on_blur` | `Dom.focusEvent -> unit` | | Called once focus leaves its thumbs for an element outside it; React's Slider has none |
| `formatOptions` | `format_options` | `Solidtype_kobalte.Types.NumberFormatOptions.t` | a decimal | The display format of the value label |

### Slider.Thumb

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `index` | `index` | `int` | `0` | Index of the thumb within the slider |
| `className` | `class_` | `string` | | Added after HeroUI's class |
| `children` | `children` | elements | | Thumb content |

### Slider.Output, Slider.Track, Slider.Fill

Each takes `class_`, added after HeroUI's class; the output `children`, in
place of its values.

## Accessibility

The Slider component implements the ARIA slider pattern and provides:

- Full keyboard navigation support (Arrow keys, Home, End, Page Up/Down)
- Screen reader announcements for value changes
- Proper focus management
- Support for disabled states
- HTML form integration via hidden input elements
- Internationalization support with locale-aware value formatting
