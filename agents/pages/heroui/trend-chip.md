# TrendChip

A chip that shows a change, its arrow and colour from its trend.

A [Chip](chip.md) that shows a change: up is success, down
danger, neutral the default colour. Its look is a stylesheet the library
ships, imported as [Theming](theming.md#setup) shows.

## Usage

```ocaml title="trend_chip_usage.mlx"
module Trend_chip = Solidtype_heroui.Trend_chip

let make () =
  <div class_="flex items-center gap-3">
    <Trend_chip>"+3.3%"</Trend_chip>
    <Trend_chip trend=`down>"-2.1%"</Trend_chip>
    <Trend_chip trend=`neutral>"0.0%"</Trend_chip>
  </div>
```

## Anatomy

```ocaml
<Trend_chip trend=`up>
  <Trend_chip.Indicator />
  <Trend_chip.Prefix>"+"</Trend_chip.Prefix>
  "3.3%"
  <Trend_chip.Suffix>"MoM"</Trend_chip.Suffix>
</Trend_chip>
```

## Examples

### Custom Indicator

```ocaml title="trend_chip_custom_indicator.mlx"
module Trend_chip = Solidtype_heroui.Trend_chip
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex items-center gap-3">
    <Trend_chip>
      <Trend_chip.Indicator><Gravity.Arrow_up_right /></Trend_chip.Indicator>
      "+3.3%"
    </Trend_chip>
    <Trend_chip trend=`down>
      <Trend_chip.Indicator><Gravity.Arrow_down_right /></Trend_chip.Indicator>
      "-2.1%"
    </Trend_chip>
    <Trend_chip>
      <Trend_chip.Indicator>
        <Gravity.Chart_line_arrow_up />
      </Trend_chip.Indicator>
      "+12.5%"
    </Trend_chip>
    <Trend_chip trend=`neutral>
      <Trend_chip.Indicator><Gravity.Equal /></Trend_chip.Indicator> "0.0%"
    </Trend_chip>
  </div>
```

### Prefix And Suffix

```ocaml title="trend_chip_prefix_and_suffix.mlx"
module Trend_chip = Solidtype_heroui.Trend_chip

let make () =
  <div class_="flex flex-col items-start gap-3">
    <Trend_chip><Trend_chip.Prefix>"+$"</Trend_chip.Prefix> "1,234"</Trend_chip>
    <Trend_chip trend=`down>
      "-5.9%" <Trend_chip.Suffix>"vs last month"</Trend_chip.Suffix>
    </Trend_chip>
    <Trend_chip>
      <Trend_chip.Prefix>"+"</Trend_chip.Prefix>
      "3.3%"
      <Trend_chip.Suffix>"MoM"</Trend_chip.Suffix>
    </Trend_chip>
  </div>
```

### Sizes

```ocaml title="trend_chip_sizes.mlx"
module Trend_chip = Solidtype_heroui.Trend_chip

let make () =
  <div class_="flex items-center gap-3">
    <Trend_chip size=`sm>"+3.3%"</Trend_chip>
    <Trend_chip size=`md>"+3.3%"</Trend_chip>
    <Trend_chip size=`lg>"+3.3%"</Trend_chip>
  </div>
```

### Tabular Nums

The value is drawn in tabular figures, so changes line up.

```ocaml title="trend_chip_tabular_nums.mlx"
module Trend_chip = Solidtype_heroui.Trend_chip

let make () =
  <div class_="flex flex-col items-start gap-2">
    <Trend_chip>"+1.1%"</Trend_chip>
    <Trend_chip>"+22.2%"</Trend_chip>
    <Trend_chip trend=`down>"-333.3%"</Trend_chip>
    <Trend_chip trend=`neutral>"0.0%"</Trend_chip>
  </div>
```

### Variants

```ocaml title="trend_chip_variants.mlx"
module For = Solidtype.For
module Trend_chip = Solidtype_heroui.Trend_chip

let variants =
  [|
    (`primary, "primary");
    (`secondary, "secondary");
    (`tertiary, "tertiary");
    (`soft, "soft");
  |]

let make () =
  <div class_="flex flex-col gap-3">
    <For each=variants>
      (fun (variant, name) _ ->
        <div class_="flex items-center gap-3">
          <span class_="w-20 text-xs text-muted">
            (Solidtype.Jsx.string name)
          </span>
          <Trend_chip variant>"+3.3%"</Trend_chip>
          <Trend_chip variant trend=`down>"-2.1%"</Trend_chip>
          <Trend_chip variant trend=`neutral>"0.0%"</Trend_chip>
        </div>)
    </For>
  </div>
```

## Styling Reference

### CSS Classes

- `.trend-chip`, and its sizes `.trend-chip--sm`, `.trend-chip--md`, `.trend-chip--lg`
- `.trend-chip__indicator`
- `.trend-chip__value`
- `.trend-chip__prefix`
- `.trend-chip__suffix`

### Data Attributes

- `[data-trend="up"]`, `[data-trend="down"]`, `[data-trend="neutral"]`

## API Reference

### TrendChip

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `trend` | `trend` | `` [ `up \| `down \| `neutral ] `` | `` `up `` | Its arrow and colour |
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | `` `sm `` | Its size |
| `variant` | `variant` | `` [ `primary \| `secondary \| `soft \| `tertiary ] `` | `` `soft `` | Its look |
| `className` | `class_` | `string` | | Added after its own classes |
| `children` | `children` | elements | | The value, and its parts |

### TrendChip.Indicator

| React | solidtype | Type | Description |
|---|---|---|---|
| `children` | `children` | elements | An icon in place of the arrow |
| `className` | `class_` | `string` | Added after its own classes |

### TrendChip.Prefix, TrendChip.Suffix

| React | solidtype | Type | Description |
|---|---|---|---|
| `children` | `children` | elements | Their text |
| `className` | `class_` | `string` | Added after their own classes |
