# Chip

Small informational badges for displaying labels, statuses, and categories.

Original HeroUI documentation: [Chip](https://heroui.com/en/docs/react/components/chip).

## Usage

HeroUI's examples, with HeroUI's icons from [`solidtype-gravity-icons`](../heroui.md#icons).

```ocaml title="chip_usage.mlx"
module Chip = Solidtype_heroui.Chip

let make () =
  <div class_="flex flex-wrap items-center gap-3">
    <Chip>"Default"</Chip>
    <Chip color=`accent>"Accent"</Chip>
    <Chip color=`success>"Success"</Chip>
    <Chip color=`warning>"Warning"</Chip>
    <Chip color=`danger>"Danger"</Chip>
  </div>
```

## Parity

The same HeroUI Chip twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of the two chips: a
marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

## Anatomy

```ocaml
<Chip>"Label text"</Chip>
```

Plain-text children are automatically wrapped in `Chip.Label`.

## Examples

### Variants

```ocaml title="chip_variants.mlx"
module Chip = Solidtype_heroui.Chip
module Separator = Solidtype_heroui.Separator
module Gravity = Solidtype_gravity_icons

let variants =
  [|
    (`primary, "primary");
    (`secondary, "secondary");
    (`tertiary, "tertiary");
    (`soft, "soft");
  |]

let colors =
  [|
    (`accent, "accent");
    (`default, "default");
    (`success, "success");
    (`warning, "warning");
    (`danger, "danger");
  |]

let cell children =
  <div class_="flex shrink-0 items-center justify-center" style="width: 130px">
    (children ())
  </div>

let size_block (size, name) =
  <div class_="flex flex-col gap-4">
    <h3 class_="text-sm font-semibold text-muted capitalize">
      (Solidtype.Jsx.string name)
    </h3>
    <div class_="flex items-center gap-3">
      <div class_="w-24 shrink-0" />
      <Solidtype.For each=colors>
        (fun (_, color) _ ->
          cell (fun () ->
              <span class_="text-xs text-muted capitalize">
                (Solidtype.Jsx.string color)
              </span>))
      </Solidtype.For>
    </div>
    <div class_="flex flex-col gap-3">
      <Solidtype.For each=variants>
        (fun (variant, vname) _ ->
          <div class_="flex items-center gap-3">
            <div class_="w-24 shrink-0 text-sm text-muted capitalize">
              (Solidtype.Jsx.string vname)
            </div>
            <Solidtype.For each=colors>
              (fun (color, _) _ ->
                cell (fun () ->
                    <Chip color size variant>
                      <Gravity.Circle_dashed />
                      <Chip.Label>"Label"</Chip.Label>
                      <Gravity.Circle_dashed />
                    </Chip>))
            </Solidtype.For>
          </div>)
      </Solidtype.For>
    </div>
  </div>

let make () =
  <div class_="flex flex-col gap-8 overflow-x-auto">
    (size_block (`lg, "lg"))
    <Separator />
    (size_block (`md, "md"))
    <Separator />
    (size_block (`sm, "sm"))
  </div>
```

### Statuses

```ocaml title="chip_statuses.mlx"
module Chip = Solidtype_heroui.Chip
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-col gap-4">
    <div class_="flex flex-wrap items-center gap-3">
      <Chip variant=`primary>
        <Gravity.Circle_fill width="6" /> <Chip.Label>"Default"</Chip.Label>
      </Chip>
      <Chip color=`success variant=`primary>
        <Gravity.Circle_fill width="6" /> <Chip.Label>"Active"</Chip.Label>
      </Chip>
      <Chip color=`warning variant=`primary>
        <Gravity.Circle_fill width="6" /> <Chip.Label>"Pending"</Chip.Label>
      </Chip>
      <Chip color=`danger variant=`primary>
        <Gravity.Circle_fill width="6" /> <Chip.Label>"Inactive"</Chip.Label>
      </Chip>
    </div>
    <div class_="flex flex-wrap items-center gap-3">
      <Chip>
        <Gravity.Circle_info width="12" />
        <Chip.Label>"New Feature"</Chip.Label>
      </Chip>
      <Chip color=`success>
        <Gravity.Check width="12" /> <Chip.Label>"Available"</Chip.Label>
      </Chip>
      <Chip color=`warning>
        <Gravity.Triangle_exclamation width="12" />
        <Chip.Label>"Beta"</Chip.Label>
      </Chip>
      <Chip color=`danger>
        <Gravity.Ban width="12" /> <Chip.Label>"Deprecated"</Chip.Label>
      </Chip>
    </div>
  </div>
```

### With Icons

```ocaml title="chip_icons.mlx"
module Chip = Solidtype_heroui.Chip
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-wrap items-center gap-3">
    <Chip>
      <Gravity.Circle_fill width="6" /> <Chip.Label>"Information"</Chip.Label>
    </Chip>
    <Chip color=`success>
      <Gravity.Circle_check_fill width="12" />
      <Chip.Label>"Completed"</Chip.Label>
    </Chip>
    <Chip color=`warning>
      <Gravity.Clock width="12" /> <Chip.Label>"Pending"</Chip.Label>
    </Chip>
    <Chip color=`danger>
      <Gravity.Xmark width="12" /> <Chip.Label>"Failed"</Chip.Label>
    </Chip>
    <Chip color=`accent>
      <Chip.Label>"Label"</Chip.Label> <Gravity.Chevron_down width="12" />
    </Chip>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="chip_tailwind.mlx"
module Chip = Solidtype_heroui.Chip

let make () =
  <div class_="flex flex-wrap items-center gap-2">
    <Chip
      class_="rounded-full bg-default-soft px-3 text-default-soft-foreground">
      "Draft"
    </Chip>
    <Chip
      class_="rounded-full bg-warning-soft px-3 text-warning-soft-foreground">
      "In review"
    </Chip>
    <Chip
      class_="rounded-full bg-success-soft px-3 text-success-soft-foreground">
      "Published"
    </Chip>
  </div>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every one, as with
HeroUI in React:

```css
@layer components {
  .chip {
    @apply rounded-md;
  }
}
```

## Styling Reference

### CSS Classes

- `.chip` - Base chip container styles
- `.chip__label` - Label text slot styles
- `.chip--accent` - Accent color variant
- `.chip--danger` - Danger color variant
- `.chip--default` - Default color variant
- `.chip--success` - Success color variant
- `.chip--warning` - Warning color variant
- `.chip--primary` - Primary variant with filled background
- `.chip--secondary` - Secondary variant with border
- `.chip--tertiary` - Tertiary variant with transparent background
- `.chip--soft` - Soft variant with lighter background
- `.chip--sm` - Small size
- `.chip--md` - Medium size
- `.chip--lg` - Large size

Chips combine variant and color classes (e.g. `.chip--secondary.chip--accent`).
The `primary` and `soft` variants have default styles defined with the
`accent`, `success`, `warning` and `danger` colors; any other combination can
be styled with the `@layer components` directive.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Chip

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `color` | `color` | `` [ `accent \| `default \| `success \| `warning \| `danger ] `` | `` `default `` | Color variant of the chip |
| `variant` | `variant` | `` [ `primary \| `secondary \| `tertiary \| `soft ] `` | `` `secondary `` | Visual style variant |
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | none | Size of the chip; none adds no size class |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Content to display inside the chip; text becomes a `Chip.Label` |

### Chip.Label

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's class |
| `children` | `children` | elements | Label text content |
