# Surface

Container component that provides surface-level styling and context for child components.

Original HeroUI documentation: [Surface](https://heroui.com/en/docs/react/components/surface).

## Usage

```ocaml title="surface_usage.mlx"
module Surface = Solidtype_heroui.Surface

let make () =
  <Surface
    class_="flex min-w-[320px] flex-col gap-3 rounded-3xl p-6" variant=`default>
    <h3 class_="text-base font-semibold text-foreground">"Surface Content"</h3>
    <p class_="text-sm text-muted">
      "This is a default surface variant. It uses bg-surface styling."
    </p>
  </Surface>
```

## Parity

The same HeroUI Surface twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of the two elements: a
marked row is one they disagree on.

## Examples

### Variants

Surface comes in semantic variants that describe their prominence level:

- **`` `default ``** - Standard surface appearance (`bg-surface`)
- **`` `secondary ``** - Medium prominence (`bg-surface-secondary`)
- **`` `tertiary ``** - Higher prominence (`bg-surface-tertiary`)
- **`` `transparent ``** - No background

```ocaml title="surface_variants.mlx"
module Surface = Solidtype_heroui.Surface

let make () =
  <div class_="flex flex-col gap-4">
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">"Default"</p>
      <Surface
        class_="flex min-w-[320px] flex-col gap-3 rounded-3xl p-6"
        variant=`default>
        <h3 class_="text-base font-semibold text-foreground">
          "Surface Content"
        </h3>
        <p class_="text-sm text-muted">
          "This is a default surface variant. It uses bg-surface styling."
        </p>
      </Surface>
    </div>
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">"Secondary"</p>
      <Surface
        class_="flex min-w-[320px] flex-col gap-3 rounded-3xl p-6"
        variant=`secondary>
        <h3 class_="text-base font-semibold text-foreground">
          "Surface Content"
        </h3>
        <p class_="text-sm text-muted">
          "This is a secondary surface variant. It uses bg-surface-secondary \
           styling."
        </p>
      </Surface>
    </div>
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">"Tertiary"</p>
      <Surface
        class_="flex min-w-[320px] flex-col gap-3 rounded-3xl p-6"
        variant=`tertiary>
        <h3 class_="text-base font-semibold text-foreground">
          "Surface Content"
        </h3>
        <p class_="text-sm text-muted">
          "This is a tertiary surface variant. It uses bg-surface-tertiary \
           styling."
        </p>
      </Surface>
    </div>
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">"Transparent"</p>
      <Surface
        class_="flex min-w-[320px] flex-col gap-3 rounded-3xl border p-6"
        variant=`transparent>
        <h3 class_="text-base font-semibold text-foreground">
          "Surface Content"
        </h3>
        <p class_="text-sm text-muted">
          "This is a transparent surface variant. It has no background, \
           suitable for overlays and cards with custom backgrounds."
        </p>
      </Surface>
    </div>
  </div>
```

### Reading the surface

Child components can read `Surface.Context` to get the current variant, an
accessor read with `S.get` to follow it as it changes, or `None` on no
surface:

```ocaml
let surface = Surface.Context.use () in
let on_surface () =
  match surface with Some variant -> S.get variant | None -> `default
```

### With Form Components

A field on a surface takes `variant=` `` `secondary ``, the quieter look
meant for a surface's background.

```ocaml title="surface_with_form_components.mlx"
module Input = Solidtype_heroui.Input
module Surface = Solidtype_heroui.Surface
module Text_area = Solidtype_heroui.Text_area

let make () =
  <Surface
    class_="flex min-w-[320px] flex-col gap-4 rounded-3xl p-6" variant=`default>
    <Input
      aria_label="Input"
      placeholder="Input with secondary variant"
      variant=`secondary
    />
    <Text_area
      aria_label="TextArea"
      placeholder="TextArea with secondary variant"
      variant=`secondary
    />
  </Surface>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="surface_tailwind.mlx"
module Surface = Solidtype_heroui.Surface

let make () =
  <Surface
    class_="w-full max-w-sm rounded-xl border border-accent/15 bg-linear-to-br \
            from-accent/8 via-surface to-surface-secondary p-4"
    variant=`default>
    <h3 class_="text-sm font-semibold text-foreground">"Billing overview"</h3>
    <p class_="text-sm text-muted">
      "View invoices and payment methods in one place."
    </p>
  </Surface>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every surface, as with
HeroUI in React:

```css
@layer components {
  .surface {
    @apply rounded-2xl border border-border;
  }

  .surface--secondary {
    @apply bg-gradient-to-br from-blue-50 to-purple-50;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base Classes

- `.surface` - Base surface container

#### Variant Classes

- `.surface--default` - Default surface variant (`bg-surface`)
- `.surface--secondary` - Secondary surface variant (`bg-surface-secondary`)
- `.surface--tertiary` - Tertiary surface variant (`bg-surface-tertiary`)
- `.surface--transparent` - Transparent surface variant

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Surface

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `default \| `secondary \| `tertiary \| `transparent ] `` | `` `default `` | The visual variant of the surface |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | The surface content |
| `SurfaceContext` | `Surface.Context` | `(unit -> variant) option` | | The variant a part inside it reads |
