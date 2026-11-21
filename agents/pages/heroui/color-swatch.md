# ColorSwatch

A visual preview of a color value with accessibility support.

Its colour is a `Types.Color.t`, read from any CSS colour by
`Solidtype_kobalte.Colors.parse_color`.

Original HeroUI documentation: [ColorSwatch](https://heroui.com/en/docs/react/components/color-swatch).

## Usage

HeroUI's examples.

```ocaml title="color_swatch_usage.mlx"
module Color_swatch = Solidtype_heroui.Color_swatch
module Colors = Solidtype_kobalte.Colors

let make () =
  <div class_="flex items-center gap-3">
    <Color_swatch aria_label="Blue" color=(Colors.parse_color "#0485F7") />
    <Color_swatch aria_label="Red" color=(Colors.parse_color "#EF4444") />
    <Color_swatch aria_label="Amber" color=(Colors.parse_color "#F59E0B") />
    <Color_swatch aria_label="Green" color=(Colors.parse_color "#10B981") />
    <Color_swatch aria_label="Fuchsia" color=(Colors.parse_color "#D946EF") />
  </div>
```

## Parity

The same HeroUI ColorSwatch twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two swatches:
a marked row is one they disagree on.

## Examples

### Sizes

```ocaml title="color_swatch_sizes.mlx"
module Color_swatch = Solidtype_heroui.Color_swatch
module Colors = Solidtype_kobalte.Colors

let make () =
  <div class_="flex items-center gap-3">
    <Color_swatch color=(Colors.parse_color "#0485F7") size=`xs />
    <Color_swatch color=(Colors.parse_color "#EF4444") size=`sm />
    <Color_swatch color=(Colors.parse_color "#F59E0B") size=`md />
    <Color_swatch color=(Colors.parse_color "#10B981") size=`lg />
    <Color_swatch color=(Colors.parse_color "#D946EF") size=`xl />
  </div>
```

### Shapes

```ocaml title="color_swatch_shapes.mlx"
module Color_swatch = Solidtype_heroui.Color_swatch
module Colors = Solidtype_kobalte.Colors

let make () =
  <div class_="flex items-center gap-3">
    <Color_swatch color=(Colors.parse_color "#0485F7") shape=`circle />
    <Color_swatch color=(Colors.parse_color "#0485F7") shape=`square />
  </div>
```

### Transparency

```ocaml title="color_swatch_transparency.mlx"
module Color_swatch = Solidtype_heroui.Color_swatch
module Colors = Solidtype_kobalte.Colors

let make () =
  <div class_="flex items-center gap-3">
    <Color_swatch
      aria_label="100% opacity"
      color=(Colors.parse_color "rgba(4, 133, 247, 1)")
    />
    <Color_swatch
      aria_label="75% opacity"
      color=(Colors.parse_color "rgba(4, 133, 247, 0.75)")
    />
    <Color_swatch
      aria_label="50% opacity"
      color=(Colors.parse_color "rgba(4, 133, 247, 0.5)")
    />
    <Color_swatch
      aria_label="25% opacity"
      color=(Colors.parse_color "rgba(4, 133, 247, 0.25)")
    />
    <Color_swatch
      aria_label="0% opacity" color=(Colors.parse_color "rgba(4, 133, 247, 0)")
    />
  </div>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

### Accessibility

Use `color_name` to provide a custom accessible name for the color, and
`aria_label` to add context about how the color is used.

```ocaml title="color_swatch_accessibility.mlx"
module Color_swatch = Solidtype_heroui.Color_swatch
module Colors = Solidtype_kobalte.Colors

let make () =
  <div class_="flex items-center gap-3">
    <Color_swatch
      aria_label="Primary brand color"
      color=(Colors.parse_color "#0485F7")
      color_name="Ocean Blue"
    />
    <Color_swatch
      aria_label="Error state color"
      color=(Colors.parse_color "#EF4444")
      color_name="Coral Red"
    />
    <Color_swatch
      aria_label="Warning color"
      color=(Colors.parse_color "#F59E0B")
      color_name="Sunset Orange"
    />
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, and `style` after the swatch's
colour, which it may paint over.

```ocaml title="color_swatch_custom_styles.mlx"
module Color_swatch = Solidtype_heroui.Color_swatch
module Colors = Solidtype_kobalte.Colors
module For = Solidtype.For

let colors = [| "#0485F7"; "#EF4444"; "#F59E0B"; "#10B981"; "#D946EF" |]

let make () =
  <div class_="flex flex-col gap-8">
    <div class_="flex flex-col gap-2">
      <span class_="text-sm text-muted">"Glow Effect"</span>
      <div class_="flex items-center gap-4">
        <For each=colors>
          (fun color _ ->
            <Color_swatch
              color=(Colors.parse_color color)
              size=`xl
              style=("box-shadow: 0 0 20px 2px " ^ color)
            />)
        </For>
      </div>
    </div>
    <div class_="flex flex-col gap-2">
      <span class_="text-sm text-muted">"Gradient"</span>
      <div class_="flex items-center gap-4">
        <For each=colors>
          (fun color _ ->
            <Color_swatch
              color=(Colors.parse_color color)
              size=`xl
              style=("background: linear-gradient(135deg, " ^ color ^ ", white)")
            />)
        </For>
      </div>
    </div>
  </div>
```

## Styling Reference

### CSS Classes

- `.color-swatch` - Base swatch styles with checkered background for
  transparency, its colour `--color-swatch-current`
- `.color-swatch--circle` - Circular shape (default)
- `.color-swatch--square` - Square shape with rounded corners
- `.color-swatch--xs` - Extra small (16px)
- `.color-swatch--sm` - Small (24px)
- `.color-swatch--md` - Medium (32px, default)
- `.color-swatch--lg` - Large (36px)
- `.color-swatch--xl` - Extra large (40px)

## API Reference

Each prop beside the name HeroUI's React component gives it.

### ColorSwatch

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `color` | `color` | `Types.Color.t` | its picker's, else transparent | The color value to display |
| `colorName` | `color_name` | `string` | Kobalte's | Accessible name for the color (overrides auto-generated description) |
| `aria-label` | `aria_label` | `string` | | Accessible label for the swatch, told after the colour's name |
| `shape` | `shape` | `` [ `circle \| `square ] `` | `` `circle `` | Shape of the swatch |
| `size` | `size` | `` [ `xs \| `sm \| `md \| `lg \| `xl ] `` | `` `md `` | Size of the swatch |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `style` | `style` | `string` | | Inline styles, added after its colour; a function of the colour in React |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |
