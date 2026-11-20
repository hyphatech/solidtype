# ProgressBar

A progress bar shows either determinate or indeterminate progress of an operation over time.

Original HeroUI documentation: [ProgressBar](https://heroui.com/en/docs/react/components/progress-bar).

## Usage

```ocaml title="progress_bar_usage.mlx"
module Label = Solidtype_heroui.Label
module Progress_bar = Solidtype_heroui.Progress_bar

let make () =
  <Progress_bar class_="w-64" value=60.>
    <Label>"Loading"</Label>
    <Progress_bar.Output />
    <Progress_bar.Track><Progress_bar.Fill /></Progress_bar.Track>
  </Progress_bar>
```

## Parity

The same HeroUI ProgressBar twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two bars: a
marked row is one they disagree on.

The marked row is Kobalte's own state, `data-progress`, `loading` or `complete`, which no style of HeroUI's reads.

## Anatomy

```ocaml
<Progress_bar value=60.>
  <Label>"Loading"</Label>
  <Progress_bar.Output />
  <Progress_bar.Track>
    <Progress_bar.Fill />
  </Progress_bar.Track>
</Progress_bar>
```

## Examples

### Sizes

```ocaml title="progress_bar_sizes.mlx"
module Label = Solidtype_heroui.Label
module Progress_bar = Solidtype_heroui.Progress_bar

let make () =
  <div class_="flex w-64 flex-col gap-6">
    <Progress_bar size=`sm value=40.>
      <Label>"Small"</Label>
      <Progress_bar.Output />
      <Progress_bar.Track><Progress_bar.Fill /></Progress_bar.Track>
    </Progress_bar>
    <Progress_bar size=`md value=60.>
      <Label>"Medium"</Label>
      <Progress_bar.Output />
      <Progress_bar.Track><Progress_bar.Fill /></Progress_bar.Track>
    </Progress_bar>
    <Progress_bar size=`lg value=80.>
      <Label>"Large"</Label>
      <Progress_bar.Output />
      <Progress_bar.Track><Progress_bar.Fill /></Progress_bar.Track>
    </Progress_bar>
  </div>
```

### Colors

```ocaml title="progress_bar_colors.mlx"
module Label = Solidtype_heroui.Label
module Progress_bar = Solidtype_heroui.Progress_bar

let make () =
  <div class_="flex w-64 flex-col gap-6">
    <Progress_bar color=`default value=50.>
      <Label>"Default"</Label>
      <Progress_bar.Output />
      <Progress_bar.Track><Progress_bar.Fill /></Progress_bar.Track>
    </Progress_bar>
    <Progress_bar color=`accent value=50.>
      <Label>"Accent"</Label>
      <Progress_bar.Output />
      <Progress_bar.Track><Progress_bar.Fill /></Progress_bar.Track>
    </Progress_bar>
    <Progress_bar color=`success value=50.>
      <Label>"Success"</Label>
      <Progress_bar.Output />
      <Progress_bar.Track><Progress_bar.Fill /></Progress_bar.Track>
    </Progress_bar>
    <Progress_bar color=`warning value=50.>
      <Label>"Warning"</Label>
      <Progress_bar.Output />
      <Progress_bar.Track><Progress_bar.Fill /></Progress_bar.Track>
    </Progress_bar>
    <Progress_bar color=`danger value=50.>
      <Label>"Danger"</Label>
      <Progress_bar.Output />
      <Progress_bar.Track><Progress_bar.Fill /></Progress_bar.Track>
    </Progress_bar>
  </div>
```

### Without Label

When no visible label is needed, use `aria_label` for accessibility.

```ocaml title="progress_bar_without_label.mlx"
module Progress_bar = Solidtype_heroui.Progress_bar

let make () =
  <Progress_bar class_="w-64" aria_label="Loading progress" value=45.>
    <Progress_bar.Track><Progress_bar.Fill /></Progress_bar.Track>
  </Progress_bar>
```

### Indeterminate

Use `is_indeterminate` when progress cannot be determined: the bar has no
value for a reader and its fill moves along the track.

```ocaml title="progress_bar_indeterminate.mlx"
module Label = Solidtype_heroui.Label
module Progress_bar = Solidtype_heroui.Progress_bar

let make () =
  <Progress_bar class_="w-64" is_indeterminate=true>
    <Label>"Loading..."</Label>
    <Progress_bar.Track><Progress_bar.Fill /></Progress_bar.Track>
  </Progress_bar>
```

### Custom Value Scale

Use `min_value`, `max_value`, and `format_options` to customize the value
range and display format.

```ocaml title="progress_bar_custom_scale.mlx"
module Label = Solidtype_heroui.Label
module Progress_bar = Solidtype_heroui.Progress_bar

let make () =
  <Progress_bar class_="w-64" max_value=1000. min_value=0. value=750.>
    <Label>"Progress"</Label>
    <Progress_bar.Output />
    <Progress_bar.Track><Progress_bar.Fill /></Progress_bar.Track>
  </Progress_bar>
```

### Format Options

`format_options` formats the output and what a reader is told, in the
reader's locale: a percent, the default, is the value's share of its range,
and any other style the value itself.

```ocaml title="progress_bar_format.mlx"
module Label = Solidtype_heroui.Label
module Progress_bar = Solidtype_heroui.Progress_bar
module Format = Solidtype_kobalte.Types.NumberFormatOptions

let make () =
  <Progress_bar
    class_="w-64"
    max_value=1000.
    value=750.
    format_options=(Format.make ~style:`unit ~unit:"mile" ())>
    <Label>"Distance"</Label>
    <Progress_bar.Output />
    <Progress_bar.Track><Progress_bar.Fill /></Progress_bar.Track>
  </Progress_bar>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.progress-bar` - Base container (grid layout)
- `.progress-bar__output` - Value text display
- `.progress-bar__track` - Track background
- `.progress-bar__fill` - Filled portion of the track
- `.progress-bar--sm` - Small size variant (thinner track)
- `.progress-bar--md` - Medium size variant (default)
- `.progress-bar--lg` - Large size variant (thicker track)
- `.progress-bar--default` - Default color variant
- `.progress-bar--accent` - Accent color variant
- `.progress-bar--success` - Success color variant
- `.progress-bar--warning` - Warning color variant
- `.progress-bar--danger` - Danger color variant

## API Reference

Each prop beside the name HeroUI's React component gives it.

### ProgressBar

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `float` | `0.` | The current value |
| `minValue` | `min_value` | `float` | `0.` | The minimum value |
| `maxValue` | `max_value` | `float` | `100.` | The maximum value |
| `isIndeterminate` | `is_indeterminate` | `bool` | `false` | Whether progress is indeterminate |
| `color` | `color` | `` [ `default \| `accent \| `success \| `warning \| `danger ] `` | `` `accent `` | Color of the fill bar |
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | `` `md `` | Size of the progress track |
| `aria-label` | `aria_label` | `string` | | Its name where no label names it |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `valueLabel` | — | | | The output's `children` instead |
| `formatOptions` | `format_options` | `Solidtype_kobalte.Types.NumberFormatOptions.t` | a percent | Number format for the value display |

### ProgressBar.Output, ProgressBar.Track, ProgressBar.Fill

Each takes `class_`, added after HeroUI's class; the output `children`, in
place of its value.
