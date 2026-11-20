# Separator

Visually divide content sections.

Original HeroUI documentation: [Separator](https://heroui.com/en/docs/react/components/separator).

## Usage

```ocaml title="separator_usage.mlx"
module Separator = Solidtype_heroui.Separator

let make () =
  <div class_="max-w-md">
    <div class_="space-y-1">
      <h4 class_="text-medium font-medium">"HeroUI v3 Components"</h4>
      <p class_="text-small text-default-400">
        "Beautiful, fast and modern React UI library."
      </p>
    </div>
    <Separator class_="my-4" />
    <div class_="text-small flex h-5 items-center space-x-4">
      <div>"Blog"</div>
      <Separator orientation=`vertical />
      <div>"Docs"</div>
      <Separator orientation=`vertical />
      <div>"Source"</div>
    </div>
  </div>
```

## Parity

The same HeroUI Separator twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of the two separators: a
marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

## Examples

### Variants

```ocaml title="separator_variants.mlx"
module Separator = Solidtype_heroui.Separator

let make () =
  <div class_="flex max-w-md flex-col items-center gap-3">
    <div>"Default Variant"</div>
    <Separator variant=`default />
    <div>"Secondary Variant"</div>
    <Separator variant=`secondary />
    <div>"Tertiary Variant"</div>
    <Separator variant=`tertiary />
  </div>
```

### With Surface

The Separator component adapts to different surface backgrounds for better
visibility.

```ocaml title="separator_surface.mlx"
module Separator = Solidtype_heroui.Separator
module Surface = Solidtype_heroui.Surface

let surface ~title ~variant ~separator ?(border = "") () =
  <Surface
    class_=("flex min-w-[320px] flex-col gap-3 rounded-3xl " ^ border ^ "p-6")
    variant>
    <h3 class_="text-base font-semibold text-foreground">
      (Solidtype.Jsx.string title)
    </h3>
    <Separator variant=separator />
    <p class_="text-sm text-muted">"Surface Content"</p>
  </Surface>

let make () =
  <div class_="flex flex-col gap-8">
    <div class_="flex flex-col gap-2">
      (surface ~title:"Default Surface" ~variant:`default ~separator:`default ())
    </div>
    <div class_="flex flex-col gap-2">
      (surface ~title:"Secondary Surface" ~variant:`secondary
         ~separator:`secondary ())
    </div>
    <div class_="flex flex-col gap-2">
      (surface ~title:"Tertiary Surface" ~variant:`tertiary ~separator:`tertiary
         ())
    </div>
    <div class_="flex flex-col gap-2">
      (surface ~title:"Transparent Surface" ~variant:`transparent
         ~separator:`default ~border:"border " ())
    </div>
  </div>
```

### Vertical

```ocaml title="separator_vertical.mlx"
module Separator = Solidtype_heroui.Separator

let make () =
  <div class_="text-small flex h-5 items-center space-x-4">
    <div>"Blog"</div>
    <Separator orientation=`vertical />
    <div>"Docs"</div>
    <Separator orientation=`vertical />
    <div>"Source"</div>
  </div>
```

### With Content

```ocaml title="separator_content.mlx"
module Separator = Solidtype_heroui.Separator

let assets =
  "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/docs/3dicons/"

let items =
  [|
    ( assets ^ "bell-small.png",
      "Receive account activity updates",
      "Set Up Notifications" );
    ( assets ^ "compass-small.png",
      "Connect your browser to your account",
      "Set up Browser Extension" );
    ( assets ^ "mint-collective-small.png",
      "Create your first collectible",
      "Mint Collectible" );
  |]

let make () =
  <div class_="max-w-md space-y-4">
    <Solidtype.For each=items>
      (fun (icon, subtitle, title) index ->
        <div>
          <div class_="flex items-center gap-3">
            <img alt=title class_="size-12" src=icon />
            <div class_="flex-1 space-y-0">
              <h4 class_="text-small font-medium">
                (Solidtype.Jsx.string title)
              </h4>
              <p class_="text-sm text-muted">(Solidtype.Jsx.string subtitle)</p>
            </div>
          </div>
          (if Solidtype.Solid.get index < Array.length items - 1 then
             <Separator class_="my-4" />
           else Solidtype.Jsx.string "")
        </div>)
    </Solidtype.For>
  </div>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="separator_tailwind.mlx"
module Separator = Solidtype_heroui.Separator

let make () =
  <div class_="max-w-xs space-y-4">
    <p class_="text-sm font-medium text-foreground">"Account settings"</p>
    <Separator class_="bg-separator-secondary" />
    <div class_="flex items-center gap-3 text-sm text-muted">
      <span>"Profile"</span>
      <Separator class_="h-4 bg-separator" orientation=`vertical />
      <span>"Billing"</span>
      <Separator class_="h-4 bg-separator" orientation=`vertical />
      <span>"Security"</span>
    </div>
  </div>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every one, as with
HeroUI in React:

```css
@layer components {
  .separator {
    @apply bg-accent;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base & Orientation Classes

- `.separator` - Base separator styles with default horizontal orientation
- `.separator--horizontal` - Horizontal orientation (full width, 1px height)
- `.separator--vertical` - Vertical orientation (full height, 1px width)

#### Variant Classes

- `.separator--default` - Default variant with standard contrast
- `.separator--secondary` - Secondary variant with medium contrast
- `.separator--tertiary` - Tertiary variant with subtle contrast

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Separator

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `orientation` | `orientation` | `` [ `horizontal \| `vertical ] `` | `` `horizontal `` | The orientation of the separator |
| `variant` | `variant` | `` [ `default \| `secondary \| `tertiary ] `` | `` `default `` | The visual variant of the separator |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
