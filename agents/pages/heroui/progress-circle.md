# ProgressCircle

A circular progress indicator that shows determinate or indeterminate progress.

No label names it, so give it an `aria_label`.

Original HeroUI documentation: [ProgressCircle](https://heroui.com/en/docs/react/components/progress-circle).

## Usage

```ocaml title="progress_circle_usage.mlx"
module Progress_circle = Solidtype_heroui.Progress_circle

let make () =
  <Progress_circle aria_label="Loading" value=60.>
    <Progress_circle.Track>
      <Progress_circle.Track_circle /> <Progress_circle.Fill_circle />
    </Progress_circle.Track>
  </Progress_circle>
```

## Parity

The same HeroUI ProgressCircle twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two circles: a
marked row is one they disagree on.

The marked row is Kobalte's own state, `data-progress`, `loading` or `complete`, which no style of HeroUI's reads.

## Anatomy

```ocaml
<Progress_circle value=60. aria_label="Loading">
  <Progress_circle.Track>
    <Progress_circle.Track_circle />
    <Progress_circle.Fill_circle />
  </Progress_circle.Track>
</Progress_circle>
```

## Examples

### Sizes

```ocaml title="progress_circle_sizes.mlx"
module Progress_circle = Solidtype_heroui.Progress_circle

let make () =
  <div class_="flex items-center gap-4">
    <Progress_circle aria_label="Loading" size=`sm value=60.>
      <Progress_circle.Track>
        <Progress_circle.Track_circle /> <Progress_circle.Fill_circle />
      </Progress_circle.Track>
    </Progress_circle>
    <Progress_circle aria_label="Loading" size=`md value=60.>
      <Progress_circle.Track>
        <Progress_circle.Track_circle /> <Progress_circle.Fill_circle />
      </Progress_circle.Track>
    </Progress_circle>
    <Progress_circle aria_label="Loading" size=`lg value=60.>
      <Progress_circle.Track>
        <Progress_circle.Track_circle /> <Progress_circle.Fill_circle />
      </Progress_circle.Track>
    </Progress_circle>
  </div>
```

### Colors

```ocaml title="progress_circle_colors.mlx"
module Progress_circle = Solidtype_heroui.Progress_circle

let make () =
  <div class_="flex items-center gap-4">
    <Progress_circle aria_label="Loading" color=`default value=70.>
      <Progress_circle.Track>
        <Progress_circle.Track_circle /> <Progress_circle.Fill_circle />
      </Progress_circle.Track>
    </Progress_circle>
    <Progress_circle aria_label="Loading" color=`accent value=70.>
      <Progress_circle.Track>
        <Progress_circle.Track_circle /> <Progress_circle.Fill_circle />
      </Progress_circle.Track>
    </Progress_circle>
    <Progress_circle aria_label="Loading" color=`success value=70.>
      <Progress_circle.Track>
        <Progress_circle.Track_circle /> <Progress_circle.Fill_circle />
      </Progress_circle.Track>
    </Progress_circle>
    <Progress_circle aria_label="Loading" color=`warning value=70.>
      <Progress_circle.Track>
        <Progress_circle.Track_circle /> <Progress_circle.Fill_circle />
      </Progress_circle.Track>
    </Progress_circle>
    <Progress_circle aria_label="Loading" color=`danger value=70.>
      <Progress_circle.Track>
        <Progress_circle.Track_circle /> <Progress_circle.Fill_circle />
      </Progress_circle.Track>
    </Progress_circle>
  </div>
```

### Indeterminate

Use `is_indeterminate` when progress cannot be determined.

```ocaml title="progress_circle_indeterminate.mlx"
module Progress_circle = Solidtype_heroui.Progress_circle

let make () =
  <Progress_circle aria_label="Loading" is_indeterminate=true>
    <Progress_circle.Track>
      <Progress_circle.Track_circle /> <Progress_circle.Fill_circle />
    </Progress_circle.Track>
  </Progress_circle>
```

### With Label

```ocaml title="progress_circle_label.mlx"
module Label = Solidtype_heroui.Label
module Progress_circle = Solidtype_heroui.Progress_circle

let make () =
  <div class_="flex items-center gap-3">
    <Progress_circle aria_label="Loading" value=75.>
      <Progress_circle.Track>
        <Progress_circle.Track_circle /> <Progress_circle.Fill_circle />
      </Progress_circle.Track>
    </Progress_circle>
    <Label>"75% Complete"</Label>
  </div>
```

### Custom SVG Props

Since each part is a composable component, you can override SVG attributes
like `stroke_width`, `r`, `cx`, `cy` and `view_box` directly. The fill's arc is
measured on its own radius, so a circle of any `r` shows its value.

```ocaml title="progress_circle_custom_svg.mlx"
module Progress_circle = Solidtype_heroui.Progress_circle

let make () =
  <div class_="flex items-end gap-6">
    <Progress_circle aria_label="Thin circle" value=60.>
      <Progress_circle.Track stroke_width=2. view_box="0 0 36 36">
        <Progress_circle.Track_circle cx=18. cy=18. r=17. stroke_width=2. />
        <Progress_circle.Fill_circle cx=18. cy=18. r=17. stroke_width=2. />
      </Progress_circle.Track>
    </Progress_circle>
    <Progress_circle aria_label="Default circle" value=60.>
      <Progress_circle.Track>
        <Progress_circle.Track_circle /> <Progress_circle.Fill_circle />
      </Progress_circle.Track>
    </Progress_circle>
    <Progress_circle aria_label="Thick circle" value=60.>
      <Progress_circle.Track stroke_width=6. view_box="0 0 36 36">
        <Progress_circle.Track_circle cx=18. cy=18. r=15. stroke_width=6. />
        <Progress_circle.Fill_circle cx=18. cy=18. r=15. stroke_width=6. />
      </Progress_circle.Track>
    </Progress_circle>
  </div>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base & Element Classes

- `.progress-circle` - Base container
- `.progress-circle__track` - SVG element
- `.progress-circle__track-circle` - Background circle
- `.progress-circle__fill-circle` - Progress arc

#### Size Classes

- `.progress-circle--sm` - Small size variant
- `.progress-circle--md` - Medium size variant (default)
- `.progress-circle--lg` - Large size variant

#### Color Classes

- `.progress-circle--default` - Default color variant
- `.progress-circle--accent` - Accent color variant
- `.progress-circle--success` - Success color variant
- `.progress-circle--warning` - Warning color variant
- `.progress-circle--danger` - Danger color variant

## API Reference

Each prop beside the name HeroUI's React component gives it.

### ProgressCircle

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `float` | `0.` | The current value |
| `minValue` | `min_value` | `float` | `0.` | The minimum value |
| `maxValue` | `max_value` | `float` | `100.` | The maximum value |
| `isIndeterminate` | `is_indeterminate` | `bool` | `false` | Whether progress is indeterminate |
| `color` | `color` | `` [ `default \| `accent \| `success \| `warning \| `danger ] `` | `` `accent `` | Color of the progress arc |
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | `` `md `` | Size of the circle |
| `formatOptions` | `format_options` | `Solidtype_kobalte.Types.NumberFormatOptions.t` | a percent | Number format for the value told to a reader |
| `aria-label` | `aria_label` | `string` | | Its name |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### ProgressCircle.Track

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `viewBox` | `view_box` | `string` | `"0 0 36 36"` | The drawing's box |
| `strokeWidth` | `stroke_width` | `float` | | Its circles' stroke, where they set none |
| `className` | `class_` | `string` | | Added after HeroUI's class |

### ProgressCircle.TrackCircle, ProgressCircle.FillCircle

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `cx`, `cy` | `cx`, `cy` | `float` | `18.` | Its center |
| `r` | `r` | `float` | `16.` | Its radius |
| `strokeWidth` | `stroke_width` | `float` | `4.` | Its stroke |
| `className` | `class_` | `string` | | Added after HeroUI's class |
