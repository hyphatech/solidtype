# Meter

A meter represents a quantity within a known range, or a fractional value.

Original HeroUI documentation: [Meter](https://heroui.com/en/docs/react/components/meter).

## Usage

```ocaml title="meter_usage.mlx"
module Label = Solidtype_heroui.Label
module Meter = Solidtype_heroui.Meter

let make () =
  <Meter class_="w-64" value=60.>
    <Label>"Storage"</Label>
    <Meter.Output />
    <Meter.Track><Meter.Fill /></Meter.Track>
  </Meter>
```

## Parity

The same HeroUI Meter twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of the two meters: a marked
row is one they disagree on.

## Anatomy

```ocaml
<Meter value=60.>
  <Label>"Storage"</Label>
  <Meter.Output />
  <Meter.Track>
    <Meter.Fill />
  </Meter.Track>
</Meter>
```

## Examples

### Sizes

```ocaml title="meter_sizes.mlx"
module Label = Solidtype_heroui.Label
module Meter = Solidtype_heroui.Meter

let make () =
  <div class_="flex w-64 flex-col gap-6">
    <Meter class_="w-64" size=`sm value=30.>
      <Label>"Size sm"</Label>
      <Meter.Output />
      <Meter.Track><Meter.Fill /></Meter.Track>
    </Meter>
    <Meter class_="w-64" size=`md value=50.>
      <Label>"Size md"</Label>
      <Meter.Output />
      <Meter.Track><Meter.Fill /></Meter.Track>
    </Meter>
    <Meter class_="w-64" size=`lg value=70.>
      <Label>"Size lg"</Label>
      <Meter.Output />
      <Meter.Track><Meter.Fill /></Meter.Track>
    </Meter>
  </div>
```

### Colors

```ocaml title="meter_colors.mlx"
module Label = Solidtype_heroui.Label
module Meter = Solidtype_heroui.Meter

let make () =
  <div class_="flex w-64 flex-col gap-6">
    <Meter class_="w-64" color=`default value=50.>
      <Label>"Default"</Label>
      <Meter.Output />
      <Meter.Track><Meter.Fill /></Meter.Track>
    </Meter>
    <Meter class_="w-64" color=`accent value=60.>
      <Label>"Accent"</Label>
      <Meter.Output />
      <Meter.Track><Meter.Fill /></Meter.Track>
    </Meter>
    <Meter class_="w-64" color=`success value=70.>
      <Label>"Success"</Label>
      <Meter.Output />
      <Meter.Track><Meter.Fill /></Meter.Track>
    </Meter>
    <Meter class_="w-64" color=`warning value=80.>
      <Label>"Warning"</Label>
      <Meter.Output />
      <Meter.Track><Meter.Fill /></Meter.Track>
    </Meter>
    <Meter class_="w-64" color=`danger value=90.>
      <Label>"Danger"</Label>
      <Meter.Output />
      <Meter.Track><Meter.Fill /></Meter.Track>
    </Meter>
  </div>
```

### Without Label

When no visible label is needed, use `aria_label` for accessibility.

```ocaml title="meter_without_label.mlx"
module Label = Solidtype_heroui.Label
module Meter = Solidtype_heroui.Meter

let make () =
  <Meter class_="w-64" aria_label="Storage usage" value=45.>
    <Meter.Track><Meter.Fill /></Meter.Track>
  </Meter>
```

### Custom Value Scale

Use `min_value`, `max_value`, and `format_options` to customize the value
range and display format.

```ocaml title="meter_custom_scale.mlx"
module Label = Solidtype_heroui.Label
module Meter = Solidtype_heroui.Meter

let make () =
  <Meter class_="w-64" max_value=1000. min_value=0. value=750.>
    <Label>"Revenue"</Label>
    <Meter.Output />
    <Meter.Track><Meter.Fill /></Meter.Track>
  </Meter>
```

### Format Options

`format_options` formats the output and what a reader is told, in the
reader's locale: a percent, the default, is the value's share of its range,
and any other style the value itself.

```ocaml title="meter_format.mlx"
module Label = Solidtype_heroui.Label
module Meter = Solidtype_heroui.Meter
module Format = Solidtype_kobalte.Types.NumberFormatOptions

let make () =
  <Meter
    class_="w-64"
    max_value=1000.
    value=750.
    format_options=(Format.make ~style:`currency ~currency:"USD" ())>
    <Label>"Revenue"</Label>
    <Meter.Output />
    <Meter.Track><Meter.Fill /></Meter.Track>
  </Meter>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.meter` - Base container (grid layout)
- `.meter__output` - Value text display
- `.meter__track` - Track background
- `.meter__fill` - Filled portion of the track
- `.meter--sm` - Small size variant (thinner track)
- `.meter--md` - Medium size variant (default)
- `.meter--lg` - Large size variant (thicker track)
- `.meter--default` - Default color variant
- `.meter--accent` - Accent color variant
- `.meter--success` - Success color variant
- `.meter--warning` - Warning color variant
- `.meter--danger` - Danger color variant

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Meter

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `float` | required | The current value |
| `minValue` | `min_value` | `float` | `0.` | The minimum value |
| `maxValue` | `max_value` | `float` | `100.` | The maximum value |
| `color` | `color` | `` [ `default \| `accent \| `success \| `warning \| `danger ] `` | `` `accent `` | Color of the fill bar |
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | `` `md `` | Size of the meter track |
| `aria-label` | `aria_label` | `string` | | Its name where no label names it |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `formatOptions` | `format_options` | `Solidtype_kobalte.Types.NumberFormatOptions.t` | a percent | Number format for the value display |

### Meter.Output, Meter.Track, Meter.Fill

Each takes `class_`, added after HeroUI's class; the output `children`, in
place of its value.
