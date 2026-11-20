# Kbd

Display keyboard shortcuts and key combinations.

Original HeroUI documentation: [Kbd](https://heroui.com/en/docs/react/components/kbd).

## Usage

```ocaml title="kbd_usage.mlx"
module Kbd = Solidtype_heroui.Kbd

let make () =
  <div class_="flex items-center gap-4">
    <Kbd><Kbd.Abbr key_value=`command /> <Kbd.Content>"K"</Kbd.Content></Kbd>
    <Kbd><Kbd.Abbr key_value=`shift /> <Kbd.Content>"P"</Kbd.Content></Kbd>
    <Kbd><Kbd.Abbr key_value=`ctrl /> <Kbd.Content>"C"</Kbd.Content></Kbd>
    <Kbd><Kbd.Abbr key_value=`option /> <Kbd.Content>"D"</Kbd.Content></Kbd>
  </div>
```

## Parity

The same HeroUI Kbd twice, under the same props: in solidtype on the left, in
React on the right. Below them, every attribute of the two keys: a marked row
is one they disagree on.

## Anatomy

```ocaml
<Kbd>
  <Kbd.Abbr key_value=`command />
  <Kbd.Content>"K"</Kbd.Content>
</Kbd>
```

`Kbd.Abbr`'s `key_value` draws the key's symbol, ⌘ here, with its name as
the title for accessibility.

## Examples

### Variants

```ocaml title="kbd_variants.mlx"
module Kbd = Solidtype_heroui.Kbd

let make () =
  <div class_="flex flex-col gap-4">
    <div class_="flex items-center gap-2">
      <span>"Copy:"</span>
      <Kbd><Kbd.Abbr key_value=`command /> <Kbd.Content>"C"</Kbd.Content></Kbd>
      <Kbd variant=`light>
        <Kbd.Abbr key_value=`command /> <Kbd.Content>"C"</Kbd.Content>
      </Kbd>
    </div>
    <div class_="flex items-center gap-2">
      <span>"Paste:"</span>
      <Kbd><Kbd.Abbr key_value=`command /> <Kbd.Content>"V"</Kbd.Content></Kbd>
      <Kbd variant=`light>
        <Kbd.Abbr key_value=`command /> <Kbd.Content>"V"</Kbd.Content>
      </Kbd>
    </div>
    <div class_="flex items-center gap-2">
      <span>"Cut:"</span>
      <Kbd><Kbd.Abbr key_value=`command /> <Kbd.Content>"X"</Kbd.Content></Kbd>
      <Kbd variant=`light>
        <Kbd.Abbr key_value=`command /> <Kbd.Content>"X"</Kbd.Content>
      </Kbd>
    </div>
    <div class_="flex items-center gap-2">
      <span>"Undo:"</span>
      <Kbd><Kbd.Abbr key_value=`command /> <Kbd.Content>"Z"</Kbd.Content></Kbd>
      <Kbd variant=`light>
        <Kbd.Abbr key_value=`command /> <Kbd.Content>"Z"</Kbd.Content>
      </Kbd>
    </div>
    <div class_="flex items-center gap-2">
      <span>"Redo:"</span>
      <Kbd>
        <Kbd.Abbr key_value=`command />
        <Kbd.Abbr key_value=`shift />
        <Kbd.Content>"Z"</Kbd.Content>
      </Kbd>
      <Kbd variant=`light>
        <Kbd.Abbr key_value=`command />
        <Kbd.Abbr key_value=`shift />
        <Kbd.Content>"Z"</Kbd.Content>
      </Kbd>
    </div>
  </div>
```

### Navigation Keys

```ocaml title="kbd_navigation.mlx"
module Kbd = Solidtype_heroui.Kbd

let make () =
  <div class_="flex flex-col gap-4">
    <div class_="flex items-center gap-2">
      <span class_="text-sm text-muted">"Arrow Keys:"</span>
      <div class_="flex items-center gap-2">
        <Kbd><Kbd.Abbr key_value=`up /></Kbd>
        <Kbd><Kbd.Abbr key_value=`down /></Kbd>
        <Kbd><Kbd.Abbr key_value=`left /></Kbd>
        <Kbd><Kbd.Abbr key_value=`right /></Kbd>
      </div>
    </div>
    <div class_="flex items-center gap-2">
      <span class_="text-sm text-muted">"Page Navigation:"</span>
      <div class_="flex items-center gap-2">
        <Kbd><Kbd.Abbr key_value=`pageup /></Kbd>
        <Kbd><Kbd.Abbr key_value=`pagedown /></Kbd>
        <Kbd><Kbd.Abbr key_value=`home /></Kbd>
        <Kbd><Kbd.Abbr key_value=`end_ /></Kbd>
      </div>
    </div>
  </div>
```

### Inline Usage

```ocaml title="kbd_inline.mlx"
module Kbd = Solidtype_heroui.Kbd

let make () =
  <div class_="space-y-4">
    <p class_="text-sm">
      "Press "
      <Kbd><Kbd.Content>"Esc"</Kbd.Content></Kbd>
      " to close the dialog."
    </p>
    <p class_="text-sm">
      "Use "
      <Kbd><Kbd.Abbr key_value=`command /> <Kbd.Content>"K"</Kbd.Content></Kbd>
      " to open the command palette."
    </p>
    <p class_="text-sm">
      "Navigate with "
      <Kbd><Kbd.Abbr key_value=`up /></Kbd>
      " and "
      <Kbd><Kbd.Abbr key_value=`down /></Kbd>
      " arrow keys."
    </p>
    <p class_="text-sm">
      "Save your work with "
      <Kbd><Kbd.Abbr key_value=`command /> <Kbd.Content>"S"</Kbd.Content></Kbd>
      " regularly."
    </p>
  </div>
```

### Special Keys

```ocaml title="kbd_special.mlx"
module Kbd = Solidtype_heroui.Kbd

let make () =
  <div class_="space-y-3">
    <p class_="text-sm">
      "Press "
      <Kbd><Kbd.Abbr key_value=`enter /></Kbd>
      " to confirm or "
      <Kbd><Kbd.Abbr key_value=`escape /></Kbd>
      " to cancel."
    </p>
    <p class_="text-sm">
      "Use "
      <Kbd><Kbd.Abbr key_value=`tab /></Kbd>
      " to navigate between form fields and "
      <Kbd><Kbd.Abbr key_value=`shift /> <Kbd.Abbr key_value=`tab /></Kbd>
      " to go back."
    </p>
    <p class_="text-sm">
      "Hold "
      <Kbd><Kbd.Abbr key_value=`space /></Kbd>
      " to temporarily enable panning mode."
    </p>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, on the key and on each part.

```ocaml title="kbd_tailwind.mlx"
module Kbd = Solidtype_heroui.Kbd

let make () =
  <div class_="flex items-center gap-3">
    <Kbd class_="rounded-lg bg-accent-soft px-2.5 text-accent-soft-foreground">
      <Kbd.Abbr key_value=`command /> <Kbd.Content>"K"</Kbd.Content>
    </Kbd>
    <Kbd class_="rounded-lg bg-default px-2.5 text-muted">
      <Kbd.Abbr key_value=`shift /> <Kbd.Content>"P"</Kbd.Content>
    </Kbd>
  </div>
```

### Global CSS

To customize the Kbd component classes, you can use the `@layer components`
directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .kbd {
    @apply bg-gray-100 dark:bg-gray-800 border-gray-300;
  }

  .kbd__abbr {
    @apply font-bold;
  }

  .kbd__content {
    @apply text-sm;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.kbd` - Base keyboard key styles with background, border, and spacing
- `.kbd--default`, `.kbd--light` - Variants
- `.kbd__abbr` - Abbreviation element for modifier keys
- `.kbd__content` - Content wrapper for key text

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Kbd

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `default \| `light ] `` | `` `default `` | Variant of the keyboard key |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Content of the key |

### Kbd.Abbr

| React | solidtype | Type | Description |
|---|---|---|---|
| `keyValue` | `key_value` | `Kbd.key` | The key whose symbol it draws, titled with its name for accessibility (e.g., "Command" for ⌘) |
| `className` | `class_` | `string` | Added after HeroUI's class |

### Kbd.Content

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's class |
| `children` | `children` | elements | Text content of the key |

### Kbd.key

Available key values for the `key_value` prop, the name React gives each, and
its symbol and title:

| solidtype | React | Drawn |
|---|---|---|
| `` `command `` | `"command"` | ⌘ Command |
| `` `shift `` | `"shift"` | ⇧ Shift |
| `` `ctrl `` | `"ctrl"` | ⌃ Control |
| `` `option `` | `"option"` | ⌥ Option |
| `` `enter `` | `"enter"` | ↵ Enter |
| `` `delete `` | `"delete"` | ⌫ Delete |
| `` `escape `` | `"escape"` | ⎋ Escape |
| `` `tab `` | `"tab"` | ⇥ Tab |
| `` `capslock `` | `"capslock"` | ⇪ Caps Lock |
| `` `up `` | `"up"` | ↑ Up |
| `` `right `` | `"right"` | → Right |
| `` `down `` | `"down"` | ↓ Down |
| `` `left `` | `"left"` | ← Left |
| `` `pageup `` | `"pageup"` | ⇞ Page Up |
| `` `pagedown `` | `"pagedown"` | ⇟ Page Down |
| `` `home `` | `"home"` | ↖ Home |
| `` `end_ `` | `"end"` | ↘ End |
| `` `help `` | `"help"` | ? Help |
| `` `space `` | `"space"` | ␣ Space |
| `` `fn `` | `"fn"` | Fn Fn |
| `` `win `` | `"win"` | ⌘ Win |
| `` `alt `` | `"alt"` | ⌥ Alt |
