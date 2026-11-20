# Link

A styled anchor component for navigation with built-in icon support.

Original HeroUI documentation: [Link](https://heroui.com/en/docs/react/components/link).

## Usage

HeroUI's examples, with HeroUI's icons from [`solidtype-gravity-icons`](../heroui.md#icons).

```ocaml title="link_usage.mlx"
module Link = Solidtype_heroui.Link

let make () = <Link href="#">"Call to action" <Link.Icon /></Link>
```

## Parity

The same HeroUI Link twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of the two links: a
marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

## Anatomy

```ocaml
<Link href="#">
  "Call to action"
  <Link.Icon />
</Link>
```

## Examples

### Icon Placement

```ocaml title="link_placement.mlx"
module Link = Solidtype_heroui.Link

let make () =
  <div class_="flex flex-col gap-3">
    <Link href="#">"Icon at end (default)" <Link.Icon /></Link>
    <Link class_="gap-1" href="#"><Link.Icon /> "Icon at start"</Link>
  </div>
```

### Text Decoration with Tailwind CSS

Link is underlined on hover by default. Use Tailwind CSS text-decoration
utilities to make the underline always visible, remove it entirely, or
customize its color, style, thickness, and offset.

```ocaml title="link_decoration.mlx"
module Link = Solidtype_heroui.Link

let make () =
  <div class_="flex flex-col gap-6">
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">"Default hover underline"</p>
      <Link href="#">"Hover to see the underline" <Link.Icon /></Link>
    </div>
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">"Always visible underline"</p>
      <Link class_="underline" href="#">
        "Underline always visible" <Link.Icon />
      </Link>
    </div>
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">"No underline"</p>
      <Link class_="no-underline" href="#">
        "Link without any underline" <Link.Icon />
      </Link>
    </div>
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">
        "Changing the underline offset"
      </p>
      <div class_="flex flex-col gap-3">
        <Link class_="underline-offset-1" href="#">
          "Offset 1 (1px space)" <Link.Icon />
        </Link>
        <Link class_="underline-offset-2" href="#">
          "Offset 2 (2px space)" <Link.Icon />
        </Link>
        <Link class_="underline-offset-3" href="#">
          "Offset 3 (3px space)" <Link.Icon />
        </Link>
        <Link class_="underline-offset-4" href="#">
          "Offset 4 (4px space)" <Link.Icon />
        </Link>
      </div>
    </div>
  </div>
```

**Text Decoration Line:**

- `underline` - Always visible underline
- `no-underline` - Remove underline
- default `Link` styles - Underline appears on hover

**Text Decoration Color:**

- `decoration-accent`, `decoration-muted`, etc. - Set underline color using
  theme colors
- `decoration-muted/50` - Use opacity modifiers for semi-transparent
  underlines

**Text Decoration Style:**

- `decoration-solid` - Solid line (default)
- `decoration-double` - Double line
- `decoration-dotted` - Dotted line
- `decoration-dashed` - Dashed line
- `decoration-wavy` - Wavy line

**Text Decoration Thickness:**

- `decoration-1`, `decoration-2`, `decoration-4`, etc. - Control underline
  thickness

**Underline Offset:**

- `underline-offset-1`, `underline-offset-2`, `underline-offset-4`, etc. -
  Adjust spacing between text and underline

For more details, see the Tailwind CSS documentation:
[text-decoration-line](https://tailwindcss.com/docs/text-decoration-line),
[text-decoration-color](https://tailwindcss.com/docs/text-decoration-color),
[text-decoration-style](https://tailwindcss.com/docs/text-decoration-style),
[text-decoration-thickness](https://tailwindcss.com/docs/text-decoration-thickness),
[text-underline-offset](https://tailwindcss.com/docs/text-underline-offset).

### Custom Icon

```ocaml title="link_custom_icon.mlx"
module Link = Solidtype_heroui.Link
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-col gap-3">
    <Link href="#">
      "External link"
      <Link.Icon class_="ms-1.5 size-3">
        <Gravity.Arrow_up_right_from_square />
      </Link.Icon>
    </Link>
    <Link class_="gap-1" href="#">
      "Go to page" <Link.Icon class_="size-3"><Gravity.Link /></Link.Icon>
    </Link>
  </div>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="link_tailwind.mlx"
module Link = Solidtype_heroui.Link

let make () =
  <Link
    class_="font-medium text-neutral-700 underline decoration-neutral-300/80 \
            underline-offset-4 transition-colors hover:text-neutral-900 \
            dark:text-neutral-300 dark:decoration-neutral-600/80 \
            dark:hover:text-neutral-100"
    href="#">
    "Call to action" <Link.Icon />
  </Link>
```

### Global CSS

To customize the Link component classes, you can use the `@layer components`
directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .link {
    @apply font-semibold;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.link` - Base link styles
- `.link__icon` - Link icon styles

### Interactive States

The component supports both CSS pseudo-classes and data attributes for
flexibility:

- **Focus**: `:focus-visible` or `[data-focus-visible="true"]`
- **Hover**: `:hover` or `[data-hovered="true"]`
- **Pressed**: `:active` or `[data-pressed="true"]`
- **Disabled**: `[aria-disabled="true"]`

A disabled link stays an `<a>`, with `aria-disabled="true"` and
`data-disabled="true"`.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Link

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `href` | `href` | `string` | required | Destination URL for the anchor |
| `isDisabled` | `is_disabled` | `bool` | `false` | Disables pointer and keyboard interaction |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Content rendered inside the link |

### Link.Icon

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's class |
| `children` | `children` | elements | Custom icon element; defaults to the built-in arrow icon when omitted |
