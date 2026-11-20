# Theming

Customize HeroUI's design system with CSS variables and global styles.

HeroUI uses CSS variables and [BEM](https://bem.info/en/methodology/) classes
for theming. Customize everything from colors to component styles using
standard CSS; nothing is set in OCaml.

Original HeroUI documentation:
[Theming](https://heroui.com/docs/react/getting-started/theming) and
[Colors](https://heroui.com/docs/react/getting-started/colors).

## How It Works

HeroUI's theming system is built on top of
[Tailwind CSS v4](https://tailwindcss.com/docs/theme)'s theme. When you import
`@heroui/styles`, it uses Tailwind's built-in color palettes, maps them to
semantic variables, automatically switches between light and dark themes, and
uses CSS layers and the `@theme` directive for organization.

**Naming pattern:**

- Colors without a suffix are backgrounds (e.g., `--accent`)
- Colors with `-foreground` are for text on that background (e.g.,
  `--accent-foreground`)

## Setup

```css
/* app.css */
@import "tailwindcss";
@import "@heroui/styles";

/* Segment, TrendChip, TextShimmer and Data Grid, which HeroUI has no styles
   for, and what of the Table HeroUI's styles do not draw */
@import "vite-plugin-solidtype/heroui-extras.css";

/* Your own .mlx */
@source "./src";
```

Write each class whole, as a literal in the `.mlx`: Tailwind does not find a
class built from pieces. HeroUI's selective imports work as on HeroUI's page.

## Light and Dark

HeroUI's light theme is `:root`; its dark theme applies under `.dark` or
`data-theme="dark"`, on `<html>` or any element above a component:

```html
<!-- Light theme -->
<html class="light" data-theme="light">

<!-- Dark theme -->
<html class="dark" data-theme="dark">
```

Nothing chooses the theme for you, so set it before the page paints:

```html
<script>
  if (matchMedia("(prefers-color-scheme: dark)").matches)
    document.documentElement.classList.add("dark");
</script>
```

`Theme.use`, HeroUI's `useTheme`, keeps a visitor's choice and writes it on
`<html>` as its class and `data-theme`. It is shown here, not run, since it
would set this site's own theme:

```ocaml title="theming_switch.mlx"
module S = Solidtype.Solid
module Segment = Solidtype_heroui.Segment
module Theme = Solidtype_heroui.Theme
module Gravity = Solidtype_gravity_icons

let make () =
  let t = Theme.use () in
  <Segment
    size=`sm
    aria_label="Theme"
    selected_key=(S.get t.theme)
    on_selection_change=t.set_theme>
    <Segment.Item id="light" aria_label="Light"><Gravity.Sun /></Segment.Item>
    <Segment.Item id="dark" aria_label="Dark"><Gravity.Moon /></Segment.Item>
    <Segment.Item id="system" aria_label="System">
      <Gravity.Display />
    </Segment.Item>
  </Segment>
```

- `theme` is what was chosen: `"system"`, `"light"`, `"dark"` or a theme of
  your own
- `resolved` is what `<html>` shows: the system's while `"system"` is chosen,
  and `None` on the server
- `set_theme` chooses a theme, keeps it, and writes it on `<html>`

The stored choice is read once the page is mounted, so a prerendered page
hydrates. Call `Theme.use` once per application.

## Override Colors

Set a variable on `:root`, or in a theme's block, to change it everywhere:

```css
:root {
  --accent: oklch(0.7 0.25 260);
  --success: oklch(0.65 0.15 155);
}
```

Its hover and soft shades, such as `--accent-hover` and
`--accent-soft-foreground`, are derived from it there. Set on an element, a
variable reaches only what reads it directly: the primary button here, not
the secondary's soft shade.

```ocaml title="theming_accent.mlx"
module Button = Solidtype_heroui.Button

(* HeroUI's colours are CSS variables: one set on an element holds for every
   component inside it. *)
let make () =
  <div
    class_="flex gap-3"
    style="--accent: oklch(0.55 0.2 300); --accent-foreground: oklch(0.99 0 0)">
    <Button>"Purple accent"</Button>
    <Button variant=`secondary>"Secondary"</Button>
  </div>
```

## Create Your Own Theme

A theme is a pair of blocks, `[data-theme="ocean"]` and
`[data-theme="ocean-dark"]`, in a stylesheet imported into the `theme` layer,
as HeroUI's page shows. Apply it on `<html>`:

```html
<html data-theme="ocean">
```

## Customize Components

Override any component using its BEM classes:

```css
@layer components {
  .button {
    @apply font-semibold tracking-wide;
  }

  .accordion__trigger {
    @apply text-lg font-bold;
  }
}
```

Each component's page lists its classes under Styling Reference.

## Adding Custom Colors

Declare your own semantic color in both light and dark themes, and make it
available to Tailwind:

```css
:root,
[data-theme="light"] {
  --info: oklch(0.6 0.15 210);
  --info-foreground: oklch(0.98 0 0);
}

.dark,
[data-theme="dark"] {
  --info: oklch(0.7 0.12 210);
  --info-foreground: oklch(0.15 0 0);
}

@theme inline {
  --color-info: var(--info);
  --color-info-foreground: var(--info-foreground);
}
```

Now `bg-info` and `text-info-foreground` are classes like any other.

## Scrollbars

HeroUI applies a shared scrollbar style to component scroll areas. Set
`data-scrollbar` on `<html>`, a component, or a scroll slot:

| Mode | `data-scrollbar` | Behavior |
|---|---|---|
| HeroUI thin | *(unset)* or `thin` | Thin thumb from theme tokens |
| OS / browser | `default` | Native scrollbars |
| Hidden | `none` | No visible scrollbar |

A component takes it as `data_scrollbar`, and passes it to its element:

```ocaml
<List_box data_scrollbar="none" ...>
```

## Vibrant Palette

By default, HeroUI uses accessible soft foreground colors that mix the
semantic color with the foreground for better contrast. Add
`data-vibrant-palette="true"` to your root element for more saturated soft
foreground colors, closer to the raw color. They may not meet WCAG contrast
guidelines for some color combinations.

## Reduced Motion

`data-reduce-motion="true"` turns off transitions, as
`prefers-reduced-motion` does.
