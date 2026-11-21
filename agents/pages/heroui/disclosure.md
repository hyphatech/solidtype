# Disclosure

A disclosure is a collapsible section with a header containing a heading and a trigger button, and a panel that wraps the content.

A [`Button`](button.md) given `` slot=`trigger `` inside its
heading is its trigger too. Its content stays on the page while collapsed, and
the browser's find in page expands it to reach a word in it.

Original HeroUI documentation: [Disclosure](https://heroui.com/en/docs/react/components/disclosure).

## Usage

HeroUI's examples, with HeroUI's icons from [`solidtype-gravity-icons`](../heroui.md#icons) and Iconify.

```ocaml title="disclosure_usage.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Disclosure = Solidtype_heroui.Disclosure
module Gravity = Solidtype_gravity_icons

let make () =
  let expanded, set_expanded = S.create_signal true in
  <div class_="w-full max-w-md text-center">
    <Disclosure
      is_expanded=(S.get expanded) on_expanded_change=(S.set set_expanded)>
      <Disclosure.Heading>
        <Button slot=`trigger variant=`secondary>
          <Gravity.Qr_code /> "Preview HeroUI Native" <Disclosure.Indicator />
        </Button>
      </Disclosure.Heading>
      <Disclosure.Content>
        <Disclosure.Body
          class_="shadow-panel flex flex-col items-center rounded-3xl \
                  bg-surface p-4 text-center">
          <p class_="text-sm text-muted">
            "Scan this QR code with your camera app to preview the HeroUI \
             native components."
          </p>
          <img
            alt="Expo Go QR Code"
            class_="aspect-square w-full max-w-54 object-cover"
            src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/images/qr-code-native.png"
          />
          <p class_="text-sm text-muted">
            "Expo must be installed on your device."
          </p>
          <Button class_="mt-4" variant=`primary>
            <Iconify.Tabler_brand_apple_filled /> "Download on App Store"
          </Button>
        </Disclosure.Body>
      </Disclosure.Content>
    </Disclosure>
  </div>
```

## Parity

The same HeroUI Disclosure twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two triggers:
a marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads. Each trigger's `aria-controls` names its own content by
the id its framework made; Kobalte marks the trigger expanded or closed, and
disabled, with empty attributes, which no style of HeroUI's reads.

## Anatomy

```ocaml
<Disclosure>
  <Disclosure.Heading>
    <Disclosure.Trigger><Disclosure.Indicator /></Disclosure.Trigger>
  </Disclosure.Heading>
  <Disclosure.Content />
</Disclosure>
```

## Examples

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes; on `Disclosure.Body` it is the
inner element's, as in React.

```ocaml title="disclosure_tailwind.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Disclosure = Solidtype_heroui.Disclosure
module Gravity = Solidtype_gravity_icons

let make () =
  let expanded, set_expanded = S.create_signal false in
  <div class_="w-full max-w-sm">
    <Disclosure
      is_expanded=(S.get expanded) on_expanded_change=(S.set set_expanded)>
      <Disclosure.Heading>
        <Button
          class_="w-full justify-between rounded-xl border border-border/70 \
                  bg-linear-to-b from-neutral-50/90 to-white px-4 py-3 \
                  font-medium text-foreground shadow-sm ring-1 ring-black/5 \
                  hover:bg-muted/30 dark:from-neutral-900/80 \
                  dark:to-neutral-900 dark:ring-white/10"
          slot=`trigger
          variant=`ghost>
          <span class_="flex items-center gap-2">
            <Gravity.Shopping_bag class_="size-4 text-muted" />
            "Shipping details"
          </span>
          <Disclosure.Indicator class_="text-muted" />
        </Button>
      </Disclosure.Heading>
      <Disclosure.Content>
        <Disclosure.Body
          class_="mt-2 rounded-xl border border-border/70 bg-surface/50 p-4 \
                  text-sm leading-relaxed text-muted dark:bg-neutral-900/50">
          {js|Orders ship within 2 business days. Standard delivery takes 3–5 days; express is available at checkout.|js}
        </Disclosure.Body>
      </Disclosure.Content>
    </Disclosure>
  </div>
```

### Global CSS

To customize the Disclosure component classes, you can use the
`@layer components` directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .disclosure {
    @apply relative;
  }

  .disclosure__trigger {
    @apply cursor-pointer;
  }

  .disclosure__indicator {
    @apply transition-transform duration-300;
  }

  .disclosure__content {
    @apply overflow-hidden transition-all;
  }
}
```

## Styling Reference

### CSS Classes

- `.disclosure` - Base container styles
- `.disclosure__heading` - Heading wrapper
- `.disclosure__trigger` - Trigger button styles
- `.disclosure__indicator` - Chevron indicator styles
- `.disclosure__content` - Content container with animations, its height
  `--disclosure-panel-height`
- `.disclosure__body`, `.disclosure__body-inner` - The body inside the content

### Interactive States

- **Expanded**: `[data-expanded="true"]` on indicator for rotation, and on
  the root and the content
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]` on the trigger
- **Disabled**: `:disabled` or `[data-disabled="true"]` on the trigger and the
  root
- **Hidden**: `[aria-hidden="true"]` and `hidden="until-found"` on the content
  while collapsed

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Disclosure

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `id` | `id` | `string` | | Its key in a [`Disclosure_group`](disclosure-group.md) |
| `isExpanded` | `is_expanded` | `bool` | | Controls the expanded state |
| `defaultExpanded` | `default_expanded` | `bool` | `false` | Whether it is expanded at first (uncontrolled) |
| `onExpandedChange` | `on_expanded_change` | `bool -> unit` | | Callback when expanded state changes |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the disclosure is disabled |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Content to render, or a function of its state |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |

### Disclosure.Heading, Disclosure.Trigger, Disclosure.Content, Disclosure.Body

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | Its content |

### Disclosure.Indicator

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | — | | Not yet: HeroUI's chevron is always drawn |
