# Spinner

A loading indicator component to show pending states.

A spinner is announced as a status named "Loading" unless its `aria_label`
names it otherwise.

Original HeroUI documentation: [Spinner](https://heroui.com/en/docs/react/components/spinner).

## Usage

```ocaml title="spinner_usage.mlx"
module Spinner = Solidtype_heroui.Spinner

let make () = <div class_="flex items-center gap-4"><Spinner /></div>
```

## Parity

The same HeroUI Spinner twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of the two spinners: a
marked row is one they disagree on.

## Examples

### Colors

```ocaml title="spinner_colors.mlx"
module Spinner = Solidtype_heroui.Spinner

let make () =
  <div class_="flex items-center gap-8">
    <div class_="flex flex-col items-center gap-2">
      <Spinner color=`current />
      <span class_="text-xs text-muted">"Current"</span>
    </div>
    <div class_="flex flex-col items-center gap-2">
      <Spinner color=`accent />
      <span class_="text-xs text-muted">"Accent"</span>
    </div>
    <div class_="flex flex-col items-center gap-2">
      <Spinner color=`success />
      <span class_="text-xs text-muted">"Success"</span>
    </div>
    <div class_="flex flex-col items-center gap-2">
      <Spinner color=`warning />
      <span class_="text-xs text-muted">"Warning"</span>
    </div>
    <div class_="flex flex-col items-center gap-2">
      <Spinner color=`danger />
      <span class_="text-xs text-muted">"Danger"</span>
    </div>
  </div>
```

### Sizes

```ocaml title="spinner_sizes.mlx"
module Spinner = Solidtype_heroui.Spinner

let make () =
  <div class_="flex items-center gap-8">
    <div class_="flex flex-col items-center gap-2">
      <Spinner size=`sm /> <span class_="text-xs text-muted">"Small"</span>
    </div>
    <div class_="flex flex-col items-center gap-2">
      <Spinner size=`md /> <span class_="text-xs text-muted">"Medium"</span>
    </div>
    <div class_="flex flex-col items-center gap-2">
      <Spinner size=`lg /> <span class_="text-xs text-muted">"Large"</span>
    </div>
    <div class_="flex flex-col items-center gap-2">
      <Spinner size=`xl />
      <span class_="text-xs text-muted">"Extra Large"</span>
    </div>
  </div>
```

### Speed

Apply an animation utility to change how fast a single spinner rotates. Pair
it with `motion-reduce:animate-none` so it stays still for users who prefer
reduced motion.

```ocaml title="spinner_speed.mlx"
module Spinner = Solidtype_heroui.Spinner

let make () =
  <div class_="flex items-center gap-8">
    <div class_="flex flex-col items-center gap-2">
      <Spinner
        class_="animate-[spin_1.5s_linear_infinite] motion-reduce:animate-none"
      />
      <span class_="text-xs text-muted">"Slow"</span>
    </div>
    <div class_="flex flex-col items-center gap-2">
      <Spinner /> <span class_="text-xs text-muted">"Default"</span>
    </div>
    <div class_="flex flex-col items-center gap-2">
      <Spinner
        class_="animate-[spin_0.4s_linear_infinite] motion-reduce:animate-none"
      />
      <span class_="text-xs text-muted">"Fast"</span>
    </div>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="spinner_tailwind.mlx"
module Spinner = Solidtype_heroui.Spinner

let make () =
  <div
    class_="flex items-center gap-4 rounded-xl border border-border bg-surface \
            px-5 py-4">
    <Spinner class_="text-accent" size=`sm />
    <Spinner class_="text-muted" size=`md />
    <Spinner class_="text-success" size=`lg />
  </div>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every spinner, as with
HeroUI in React:

```css
@layer components {
  .spinner {
    @apply animate-spin;
  }

  .spinner--accent {
    color: var(--accent);
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base & Size Classes

- `.spinner` - Base spinner styles with default size
- `.spinner--sm` - Small size variant
- `.spinner--md` - Medium size variant (default)
- `.spinner--lg` - Large size variant
- `.spinner--xl` - Extra large size variant

#### Color Classes

- `.spinner--current` - Inherits current text color
- `.spinner--accent` - Accent color variant
- `.spinner--danger` - Danger color variant
- `.spinner--success` - Success color variant
- `.spinner--warning` - Warning color variant

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Spinner

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `size` | `size` | `` [ `sm \| `md \| `lg \| `xl ] `` | `` `md `` | Size of the spinner |
| `color` | `color` | `` [ `accent \| `current \| `danger \| `success \| `warning ] `` | `` `accent `` | Color variant of the spinner |
| `aria-label` | `aria_label` | `string` | `"Loading"` | Its name, told to a reader |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
