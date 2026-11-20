# Skeleton

Skeleton is a placeholder to show a loading state and the expected shape of a component.

A skeleton takes its shape from its `class_`.

Original HeroUI documentation: [Skeleton](https://heroui.com/en/docs/react/components/skeleton).

## Usage

```ocaml title="skeleton_usage.mlx"
module Skeleton = Solidtype_heroui.Skeleton

let make () =
  <div class_="shadow-panel w-[250px] space-y-5 rounded-lg bg-transparent p-4">
    <Skeleton class_="h-32 rounded-lg" />
    <div class_="space-y-3">
      <Skeleton class_="h-3 w-3/5 rounded-lg" />
      <Skeleton class_="h-3 w-4/5 rounded-lg" />
      <Skeleton class_="h-3 w-2/5 rounded-lg" />
    </div>
  </div>
```

## Parity

The same HeroUI Skeleton twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two: a marked
row is one they disagree on.

## Examples

### Text Content

```ocaml title="skeleton_text.mlx"
module Skeleton = Solidtype_heroui.Skeleton

let make () =
  <div class_="w-full max-w-md space-y-3">
    <Skeleton class_="h-4 w-full rounded" />
    <Skeleton class_="h-4 w-5/6 rounded" />
    <Skeleton class_="h-4 w-4/6 rounded" />
    <Skeleton class_="h-4 w-full rounded" />
    <Skeleton class_="h-4 w-3/6 rounded" />
  </div>
```

### User Profile

```ocaml title="skeleton_profile.mlx"
module Skeleton = Solidtype_heroui.Skeleton

let make () =
  <div class_="flex items-center gap-3">
    <Skeleton class_="h-10 w-10 shrink-0 rounded-full" />
    <div class_="flex-1 space-y-2">
      <Skeleton class_="h-3 w-36 rounded-lg" />
      <Skeleton class_="h-3 w-24 rounded-lg" />
    </div>
  </div>
```

### List Items

```ocaml title="skeleton_list.mlx"
module Skeleton = Solidtype_heroui.Skeleton

let make () =
  <div class_="w-full max-w-sm space-y-4">
    <div class_="flex items-center gap-3">
      <Skeleton class_="h-10 w-10 shrink-0 rounded-lg" />
      <div class_="flex-1 space-y-2">
        <Skeleton class_="h-3 w-full rounded" />
        <Skeleton class_="h-3 w-4/5 rounded" />
      </div>
    </div>
    <div class_="flex items-center gap-3">
      <Skeleton class_="h-10 w-10 shrink-0 rounded-lg" />
      <div class_="flex-1 space-y-2">
        <Skeleton class_="h-3 w-full rounded" />
        <Skeleton class_="h-3 w-4/5 rounded" />
      </div>
    </div>
    <div class_="flex items-center gap-3">
      <Skeleton class_="h-10 w-10 shrink-0 rounded-lg" />
      <div class_="flex-1 space-y-2">
        <Skeleton class_="h-3 w-full rounded" />
        <Skeleton class_="h-3 w-4/5 rounded" />
      </div>
    </div>
  </div>
```

### Grid

```ocaml title="skeleton_grid.mlx"
module Skeleton = Solidtype_heroui.Skeleton

let make () =
  <div class_="grid w-full max-w-xl grid-cols-3 gap-4">
    <Skeleton class_="h-24 rounded-xl" />
    <Skeleton class_="h-24 rounded-xl" />
    <Skeleton class_="h-24 rounded-xl" />
  </div>
```

### Single Shimmer

A synchronized shimmer effect that passes over all skeleton elements at once.
Apply the `skeleton--shimmer` class to a parent container and set
`` animation_type=`none `` on child skeletons.

```ocaml title="skeleton_single_shimmer.mlx"
module Skeleton = Solidtype_heroui.Skeleton

let make () =
  <div
    class_="skeleton--shimmer relative grid w-full max-w-xl grid-cols-3 gap-4 \
            overflow-hidden rounded-xl">
    <Skeleton animation_type=`none class_="h-24 rounded-xl" />
    <Skeleton animation_type=`none class_="h-24 rounded-xl" />
    <Skeleton animation_type=`none class_="h-24 rounded-xl" />
  </div>
```

### Animation Types

```ocaml title="skeleton_animation_types.mlx"
module Skeleton = Solidtype_heroui.Skeleton

let make () =
  <div
    class_="grid w-full max-w-xl grid-cols-1 gap-6 sm:grid-cols-2 \
            lg:grid-cols-3">
    <div class_="space-y-2">
      <p class_="truncate text-xs text-muted">"Shimmer"</p>
      <div class_="shadow-panel space-y-3 rounded-lg bg-transparent p-4">
        <Skeleton animation_type=`shimmer class_="h-20 rounded-lg" />
        <Skeleton animation_type=`shimmer class_="h-3 w-3/5 rounded-lg" />
        <Skeleton animation_type=`shimmer class_="h-3 w-4/5 rounded-lg" />
      </div>
    </div>
    <div class_="space-y-2">
      <p class_="truncate text-xs text-muted">"Pulse"</p>
      <div class_="shadow-panel space-y-3 rounded-lg bg-transparent p-4">
        <Skeleton animation_type=`pulse class_="h-20 rounded-lg" />
        <Skeleton animation_type=`pulse class_="h-3 w-3/5 rounded-lg" />
        <Skeleton animation_type=`pulse class_="h-3 w-4/5 rounded-lg" />
      </div>
    </div>
    <div class_="space-y-2">
      <p class_="truncate text-xs text-muted">"None"</p>
      <div class_="shadow-panel space-y-3 rounded-lg bg-transparent p-4">
        <Skeleton animation_type=`none class_="h-20 rounded-lg" />
        <Skeleton animation_type=`none class_="h-3 w-3/5 rounded-lg" />
        <Skeleton animation_type=`none class_="h-3 w-4/5 rounded-lg" />
      </div>
    </div>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="skeleton_tailwind.mlx"
module Skeleton = Solidtype_heroui.Skeleton

let bone = "animate-shine rounded-lg bg-neutral-200/90 dark:bg-neutral-800/90"

let make () =
  <div
    class_="w-[250px] space-y-5 rounded-xl border border-border/80 bg-surface \
            p-4 shadow-sm ring-1 ring-black/5 dark:ring-white/10">
    <Skeleton class_=("h-32 " ^ bone) />
    <div class_="space-y-3">
      <Skeleton class_=("h-3 w-3/5 " ^ bone) />
      <Skeleton class_=("h-3 w-4/5 " ^ bone) />
      <Skeleton class_=("h-3 w-2/5 " ^ bone) />
    </div>
  </div>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every skeleton, as with
HeroUI in React:

```css
@layer components {
  .skeleton {
    @apply bg-surface-secondary/50;
  }

  .skeleton--pulse {
    @apply animate-pulse opacity-75;
  }

  .skeleton--none {
    @apply opacity-50;
  }
}
```

### Global Animation Configuration

You can set a default animation type for all Skeleton components in your
application by defining the `--skeleton-animation` CSS variable, `shimmer`,
`pulse` or `none`:

```css
:root {
  --skeleton-animation: pulse;
}

.dark, [data-theme="dark"] {
  --skeleton-animation: shimmer;
}
```

This global setting will be overridden by the `animation_type` prop when
specified on individual components. A skeleton reads it once it is in the
browser, never on the server, so a prerendered skeleton shows a shimmer until
it hydrates. A value it does not know is a shimmer.

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base Class

- `.skeleton` - Base skeleton styles with background and rounded corners

#### Animation Variant Classes

- `.skeleton--shimmer` - Adds shimmer animation with gradient effect (default)
- `.skeleton--pulse` - Adds pulse animation using Tailwind's animate-pulse
- `.skeleton--none` - No animation, static skeleton

### Animation

The Skeleton component supports three animation types, each with different
visual effects.

The shimmer effect creates a gradient that moves across the skeleton element:

```css
.skeleton--shimmer:before {
  @apply animate-skeleton via-surface-3 absolute inset-0 -translate-x-full
         bg-gradient-to-r from-transparent to-transparent content-[''];
}
```

The shimmer animation is defined in the theme using:

```css
@theme inline {
  --animate-skeleton: skeleton 2s linear infinite;

  @keyframes skeleton {
    100% {
      transform: translateX(200%);
    }
  }
}
```

The pulse animation uses Tailwind's built-in `animate-pulse` utility, and
`.skeleton--none` applies no animation.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Skeleton

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `animationType` | `animation_type` | `` [ `shimmer \| `pulse \| `none ] `` | the page's `--skeleton-animation`, else `` `shimmer `` | The animation type for the skeleton. Can be globally configured via `--skeleton-animation` CSS variable |
| `className` | `class_` | `string` | | Added after HeroUI's classes: its shape |
