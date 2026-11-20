# Breadcrumbs

Navigation breadcrumbs showing the current page's location within a hierarchy.

Original HeroUI documentation: [Breadcrumbs](https://heroui.com/en/docs/react/components/breadcrumbs).

## Usage

```ocaml title="breadcrumbs_usage.mlx"
module Breadcrumbs = Solidtype_heroui.Breadcrumbs

let make () =
  <Breadcrumbs>
    <Breadcrumbs.Item href="#">"Home"</Breadcrumbs.Item>
    <Breadcrumbs.Item href="#">"Products"</Breadcrumbs.Item>
    <Breadcrumbs.Item href="#">"Electronics"</Breadcrumbs.Item>
    <Breadcrumbs.Item>"Laptop"</Breadcrumbs.Item>
  </Breadcrumbs>
```

## Parity

The same HeroUI Breadcrumbs twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the first link of
each: a marked row is one they disagree on, and a dimmed row is a framework's
own, which no style reads.

## Anatomy

```ocaml
<Breadcrumbs>
  <Breadcrumbs.Item href="#">"Home"</Breadcrumbs.Item>
  <Breadcrumbs.Item href="#">"Category"</Breadcrumbs.Item>
  <Breadcrumbs.Item>"Current Page"</Breadcrumbs.Item>
</Breadcrumbs>
```

## Examples

### Navigation Levels

```ocaml title="breadcrumbs_level2.mlx"
module Breadcrumbs = Solidtype_heroui.Breadcrumbs

let make () =
  <Breadcrumbs>
    <Breadcrumbs.Item href="#">"Home"</Breadcrumbs.Item>
    <Breadcrumbs.Item>"Current Page"</Breadcrumbs.Item>
  </Breadcrumbs>
```

```ocaml title="breadcrumbs_level3.mlx"
module Breadcrumbs = Solidtype_heroui.Breadcrumbs

let make () =
  <Breadcrumbs>
    <Breadcrumbs.Item href="#">"Home"</Breadcrumbs.Item>
    <Breadcrumbs.Item href="#">"Category"</Breadcrumbs.Item>
    <Breadcrumbs.Item>"Current Page"</Breadcrumbs.Item>
  </Breadcrumbs>
```

### Disabled State

```ocaml title="breadcrumbs_disabled.mlx"
module Breadcrumbs = Solidtype_heroui.Breadcrumbs

let make () =
  <Breadcrumbs is_disabled=true>
    <Breadcrumbs.Item href="#">"Home"</Breadcrumbs.Item>
    <Breadcrumbs.Item href="#">"Products"</Breadcrumbs.Item>
    <Breadcrumbs.Item href="#">"Electronics"</Breadcrumbs.Item>
    <Breadcrumbs.Item>"Laptop"</Breadcrumbs.Item>
  </Breadcrumbs>
```

### Custom Separator

`separator` is drawn between items in place of the chevron, in a 12-pixel
square hidden from a reader. An icon fills it with `size-full`.

```ocaml title="breadcrumbs_custom_separator.mlx"
module Breadcrumbs = Solidtype_heroui.Breadcrumbs

let make () =
  <Breadcrumbs
    separator=(<svg
                 class_="size-full"
                 view_box="0 0 256 512"
                 xmlns="http://www.w3.org/2000/svg">
                 <path
                   d="M249.3 235.8c10.2 12.6 9.5 31.1-2.2 42.8l-128 128c-9.2 \
                      9.2-22.9 11.9-34.9 6.9S64.5 396.9 64.5 384l0-256c0-12.9 \
                      7.8-24.6 19.8-29.6s25.7-2.2 34.9 6.9l128 128 2.2 2.4z"
                 />
               </svg>)>
    <Breadcrumbs.Item href="#">"Home"</Breadcrumbs.Item>
    <Breadcrumbs.Item href="#">"Products"</Breadcrumbs.Item>
    <Breadcrumbs.Item href="#">"Electronics"</Breadcrumbs.Item>
    <Breadcrumbs.Item>"Laptop"</Breadcrumbs.Item>
  </Breadcrumbs>
```

### Render Function

HeroUI's `render` is `as_`, on the trail and on each item, as
[Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes: the trail's on its list, an item's
on its `<li>`.

```ocaml title="breadcrumbs_tailwind.mlx"
module Breadcrumbs = Solidtype_heroui.Breadcrumbs

let make () =
  <Breadcrumbs class_="rounded-lg bg-default-soft px-3 py-2">
    <Breadcrumbs.Item class_="text-muted hover:text-accent" href="#">
      "Home"
    </Breadcrumbs.Item>
    <Breadcrumbs.Item class_="text-muted hover:text-accent" href="#">
      "Products"
    </Breadcrumbs.Item>
    <Breadcrumbs.Item class_="font-medium text-foreground">
      "Laptop"
    </Breadcrumbs.Item>
  </Breadcrumbs>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every one, as with
HeroUI in React:

```css
@layer components {
  .breadcrumbs {
    @apply gap-4 text-lg;
  }

  .breadcrumbs__link {
    @apply font-semibold;
  }

  .breadcrumbs__separator {
    @apply text-blue-500;
  }
}
```

## Styling Reference

### CSS Classes

- `.breadcrumbs` - Base breadcrumbs container
- `.breadcrumbs__item` - Individual breadcrumb item wrapper
- `.breadcrumbs__link` - Breadcrumb link element
- `.breadcrumbs__separator` - Separator icon between items

### Interactive States

- **Current**: `[data-current="true"]` on the link and its item
- **Hover**: `:hover` or `[data-hovered="true"]` on a link
- **Focus**: `[data-focus-visible="true"]` on a link
- **Disabled**: `[aria-disabled="true"]` on a link

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Breadcrumbs

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `separator` | `separator` | element | HeroUI's chevron | Custom separator between breadcrumb items |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether all breadcrumb links are disabled |
| `onAction` | `on_action` | `string -> unit` | | Told the `id` of an item whose link is pressed |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | The breadcrumb items |

### Breadcrumbs.Item

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `id` | `id` | `string` | | What `on_action` is told |
| `href` | `href` | `string` | | The URL to link to (omit for current page) |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether its link is disabled |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Item content |

## Accessibility

Breadcrumbs provides:

- A navigation landmark named "Breadcrumbs"
- Current page indication via `aria-current="page"`
- Keyboard navigation support: each link but the current page's is reached by
  Tab

The last breadcrumb item automatically becomes the current page indicator,
on the server too; an item added later by a `For` becomes it if it is last.

## Note

- A context given between `Breadcrumbs` and an item does not reach the
  item's children
- An item without an `id` tells `on_action` nothing
