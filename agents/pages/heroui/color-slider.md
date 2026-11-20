# ColorSlider

A color slider allows users to adjust an individual channel of a color value.

Its value is a `Types.Color.t`, read from any CSS colour by
`Solidtype_kobalte.Colors.parse_color`. A channel asked of a space that has
none of it -- red in HSL, hue in RGB -- is read in the space it is in.

Original HeroUI documentation: [ColorSlider](https://heroui.com/en/docs/react/components/color-slider).

## Usage

HeroUI's examples.

```ocaml title="color_slider_usage.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_slider = Solidtype_heroui.Color_slider
module Color_swatch = Solidtype_heroui.Color_swatch
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  <Color_slider
    channel=`hue
    class_="w-full max-w-xs"
    default_value=(Colors.parse_color "hsl(0, 100%, 50%)")>
    <Label>"Hue"</Label>
    <Color_slider.Output />
    <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
  </Color_slider>
```

## Parity

The same HeroUI ColorSlider twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two sliders:
a marked row is one they disagree on.

The marked row is Kobalte's: its slider is a `group` its label names, where React Aria's has no role.

## Anatomy

```ocaml
<Color_slider channel=`hue default_value=(Colors.parse_color "hsl(0, 100%, 50%)")>
  <Label>"Hue"</Label>
  <Color_slider.Output />
  <Color_slider.Track>
    <Color_slider.Thumb />
  </Color_slider.Track>
</Color_slider>
```

## Examples

### Disabled

```ocaml title="color_slider_disabled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_slider = Solidtype_heroui.Color_slider
module Color_swatch = Solidtype_heroui.Color_swatch
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  <Color_slider
    channel=`hue
    class_="w-full max-w-xs"
    default_value=(Colors.parse_color "hsl(200, 100%, 50%)")
    is_disabled=true>
    <Label>"Hue"</Label>
    <Color_slider.Output />
    <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
  </Color_slider>
```

### Vertical

```ocaml title="color_slider_vertical.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_slider = Solidtype_heroui.Color_slider
module Color_swatch = Solidtype_heroui.Color_swatch
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  <div class_="flex h-48 gap-4">
    <Color_slider
      channel=`hue
      default_value=(Colors.parse_color "hsl(0, 100%, 50%)")
      aria_label="Hue"
      orientation=`vertical>
      <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
    </Color_slider>
    <Color_slider
      channel=`saturation
      default_value=(Colors.parse_color "hsl(0, 100%, 50%)")
      aria_label="Saturation"
      orientation=`vertical>
      <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
    </Color_slider>
    <Color_slider
      channel=`lightness
      default_value=(Colors.parse_color "hsl(0, 100%, 50%)")
      aria_label="Lightness"
      orientation=`vertical>
      <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
    </Color_slider>
  </div>
```

### Controlled

```ocaml title="color_slider_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_slider = Solidtype_heroui.Color_slider
module Color_swatch = Solidtype_heroui.Color_swatch
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  let color, set_color =
    S.create_signal (Colors.parse_color "hsl(200, 100%, 50%)")
  in
  <div class_="flex w-full max-w-xs flex-col gap-4">
    <Color_slider channel=`hue value=(S.get color) on_change=(S.set set_color)>
      <Label>"Hue"</Label>
      <Color_slider.Output />
      <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
    </Color_slider>
    <div class_="flex items-center gap-2">
      <Color_swatch color=(S.get color) size=`sm />
      <p class_="text-sm text-muted">
        "Current color: "
        <code class_="font-mono">
          (Jsx.string (Color.to_string (S.get color) ~format:`hsl ()))
        </code>
      </p>
    </div>
  </div>
```

### HSL Channels

Use multiple `Color_slider`s to control different channels of a color value.
The sliders can share the same color value to create a complete color picker.

```ocaml title="color_slider_hsl_channels.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_slider = Solidtype_heroui.Color_slider
module Color_swatch = Solidtype_heroui.Color_swatch
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  let color, set_color =
    S.create_signal (Colors.parse_color "hsl(0, 100%, 50%)")
  in
  <div class_="flex w-full max-w-xs flex-col gap-4">
    <Color_slider channel=`hue value=(S.get color) on_change=(S.set set_color)>
      <Label>"Hue"</Label>
      <Color_slider.Output />
      <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
    </Color_slider>
    <Color_slider
      channel=`saturation value=(S.get color) on_change=(S.set set_color)>
      <Label>"Saturation"</Label>
      <Color_slider.Output />
      <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
    </Color_slider>
    <Color_slider
      channel=`lightness value=(S.get color) on_change=(S.set set_color)>
      <Label>"Lightness"</Label>
      <Color_slider.Output />
      <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
    </Color_slider>
    <div class_="flex items-center gap-2">
      <Color_swatch color=(S.get color) size=`sm />
      <p class_="text-sm text-muted">
        "Current color: "
        <code class_="font-mono">
          (Jsx.string (Color.to_string (S.get color) ~format:`hsl ()))
        </code>
      </p>
    </div>
  </div>
```

### Alpha Channel

The alpha channel slider shows a transparency checkerboard pattern to help
visualize the transparency level.

```ocaml title="color_slider_alpha_channel.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_slider = Solidtype_heroui.Color_slider
module Color_swatch = Solidtype_heroui.Color_swatch
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  <Color_slider
    channel=`alpha
    class_="w-full max-w-xs"
    default_value=(Colors.parse_color "hsla(0, 100%, 50%, 0.5)")>
    <Label>"Alpha"</Label>
    <Color_slider.Output />
    <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
  </Color_slider>
```

### RGB Channels

You can also use the RGB color space with red, green, and blue channels.

```ocaml title="color_slider_rgb_channels.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_slider = Solidtype_heroui.Color_slider
module Color_swatch = Solidtype_heroui.Color_swatch
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  let color, set_color =
    S.create_signal (Colors.parse_color "rgb(255, 100, 50)")
  in
  <div class_="flex w-full max-w-xs flex-col gap-4">
    <Color_slider channel=`red value=(S.get color) on_change=(S.set set_color)>
      <Label>"Red"</Label>
      <Color_slider.Output />
      <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
    </Color_slider>
    <Color_slider
      channel=`green value=(S.get color) on_change=(S.set set_color)>
      <Label>"Green"</Label>
      <Color_slider.Output />
      <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
    </Color_slider>
    <Color_slider channel=`blue value=(S.get color) on_change=(S.set set_color)>
      <Label>"Blue"</Label>
      <Color_slider.Output />
      <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
    </Color_slider>
    <div class_="flex items-center gap-2">
      <Color_swatch color=(S.get color) size=`sm />
      <p class_="text-sm text-muted">
        "Current color: "
        <code class_="font-mono">
          (Jsx.string (Color.to_string (S.get color) ~format:`rgb ()))
        </code>
      </p>
    </div>
  </div>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, on each part.

```ocaml title="color_slider_custom_styles.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_slider = Solidtype_heroui.Color_slider
module Color_swatch = Solidtype_heroui.Color_swatch
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  <Color_slider
    channel=`hue
    class_="w-full max-w-sm"
    default_value=(Colors.parse_color "hsl(220, 70%, 50%)")>
    <Label class_="font-medium text-foreground">"Hue"</Label>
    <Color_slider.Output class_="text-muted tabular-nums" />
    <Color_slider.Track
      class_="h-4! rounded-none! ring-1 ring-border [&::after]:rounded-r-sm! \
              [&::before]:rounded-l-sm!">
      <Color_slider.Thumb
        class_="size-4 rounded-sm! border-2 border-background shadow-md ring-1 \
                ring-black/10 dark:ring-white/20"
      />
    </Color_slider.Track>
  </Color_slider>
```

## Styling Reference

### CSS Classes

- `.color-slider` - Base slider container
- `.color-slider__output` - Output element displaying current value
- `.color-slider__track` - Track element with color gradient, its ends
  `--track-start-color` and `--track-end-color`
- `.color-slider__thumb` - Thumb element showing current color

### Interactive States

- **Hover**: `[data-hovered="true"]` on thumb
- **Focus**: `[data-focus-visible="true"]` on thumb
- **Dragging**: `[data-dragging="true"]` on thumb
- **Disabled**: `[data-disabled="true"]` on slider or thumb
- **Orientation**: `[data-orientation]` on slider

## API Reference

Each prop beside the name HeroUI's React component gives it.

### ColorSlider

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `channel` | `channel` | `Color_slider.channel` | | The color channel that the slider manipulates (hue, saturation, lightness, brightness, alpha, red, green, blue) |
| `colorSpace` | `color_space` | `` [ `rgb \| `hsl \| `hsb ] `` | its value's | The color space (hsl, hsb, rgb). Defaults to the color space of the value |
| `value` | `value` | `Types.Color.t` | | The current color value (controlled) |
| `defaultValue` | `default_value` | `Types.Color.t` | | The default color value (uncontrolled) |
| `onChange` | `on_change` | `Types.Color.t -> unit` | | Handler called when the value changes during dragging, with each colour other than its own |
| `onChangeEnd` | `on_change_end` | `Types.Color.t -> unit` | | Handler called when dragging ends |
| `orientation` | `orientation` | `` [ `horizontal \| `vertical ] `` | `` `horizontal `` | The orientation of the slider |
| `isDisabled` | `is_disabled` | `bool` | its fieldset's | Whether the slider is disabled |
| `name` | `name` | `string` | | The name of the input element for form submission |
| `aria-label` | `aria_label` | `string` | | Accessibility label for the slider |
| `onBlur` | `on_blur` | `Dom.focusEvent -> unit` | | Called as focus leaves it |
| `className` | `class_` | `string` | | Added after HeroUI's class |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |

### ColorSlider.Output, ColorSlider.Track, ColorSlider.Thumb

Each takes `class_`, added after HeroUI's class; the track and the thumb
`style`, after their own, a function of their state in React; the output and
the thumb their `children`, the output's in place of the channel's value.

## Accessibility

`Color_slider` implements the ARIA slider pattern and provides:

- Full keyboard navigation support (arrow keys, Home, End, Page Up and Page
  Down)
- Screen reader announcements for value changes, such as `0°, red`
- Proper focus management
- Support for disabled states
- HTML form integration via a hidden input element
