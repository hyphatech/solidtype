# Kobalte

Zero-cost bindings to Kobalte, generated from its own types.

Kobalte is solidtype's layer of accessible components. [Kobalte](https://kobalte.dev)
is Solid's library of components with behaviour and no look: the keyboard,
focus and ARIA of a select, a dialog, a slider, done right once, styled by
whoever uses it. `solidtype-kobalte` binds every one of them, part by part,
with its hooks and the types they name, and HeroUI's port is built on
them.

```ocaml title="kobalte_tabs.mlx"
module Tabs = Solidtype_kobalte.Tabs

let trigger =
  "rounded-lg px-3 py-1.5 text-sm text-muted outline-none \
   data-[selected]:bg-surface data-[selected]:text-foreground \
   data-[selected]:shadow-sm focus-visible:ring-2 focus-visible:ring-focus"

let make () =
  <Tabs.Root default_value="profile" class_="flex w-80 flex-col gap-3">
    <Tabs.List
      aria_label="Settings"
      class_="flex gap-1 self-start rounded-xl bg-default p-1">
      <Tabs.Trigger value="profile" class_=trigger>"Profile"</Tabs.Trigger>
      <Tabs.Trigger value="account" class_=trigger>"Account"</Tabs.Trigger>
      <Tabs.Trigger value="billing" class_=trigger>"Billing"</Tabs.Trigger>
    </Tabs.List>
    <Tabs.Content value="profile" class_="text-sm">
      "Your name and photo."
    </Tabs.Content>
    <Tabs.Content value="account" class_="text-sm">
      "Your email and password."
    </Tabs.Content>
    <Tabs.Content value="billing" class_="text-sm">
      "Your plan and invoices."
    </Tabs.Content>
  </Tabs.Root>
```

The arrows move between the tabs, Home and End reach the ends, and each
panel is labelled by its tab: Kobalte's behaviour, as it is in TSX. The
look is a handful of Tailwind classes on the state Kobalte writes,
`data-[selected]`.

## What it holds

All of Kobalte 0.13: every component, and the context and colour utilities
they use.

| Kind | Components |
|---|---|
| Forms | `Button`, `Checkbox`, `Switch`, `RadioGroup`, `TextField`, `NumberField`, `TimeField`, `Search`, `Slider`, `Rating`, `FileField`, `SegmentedControl`, `ToggleButton`, `ToggleGroup`, `SpinButton` |
| Lists | `Select`, `Combobox`, `Listbox` |
| Overlays | `Dialog`, `AlertDialog`, `Popover`, `Tooltip`, `HoverCard`, `Toast` |
| Menus and navigation | `DropdownMenu`, `ContextMenu`, `Menubar`, `NavigationMenu`, `Tabs`, `Breadcrumbs`, `Link`, `Pagination` |
| Disclosure | `Accordion`, `Collapsible` |
| Status | `Alert`, `Badge`, `Meter`, `Progress`, `Skeleton`, `Separator`, `Image` |
| Colour | `ColorArea`, `ColorWheel`, `ColorSlider`, `ColorField`, `ColorChannelField`, `ColorSwatch`, `Colors` |
| Context | `I18n`, `ColorMode` |

Each is a module of `Solidtype_kobalte`, its parts modules of it named as
Kobalte names them, `Select.Trigger`, `Slider.Thumb`.

## Why it can be trusted

- **Generated from Kobalte's own declarations.** The binding is written by
  a generator from Kobalte's `.d.ts` files, so its types are Kobalte's,
  and taking a new Kobalte is generating again.
- **Typed as tightly as Kobalte's types allow.** A prop a part does not
  take, or a value of the wrong kind, does not compile; a select holding
  several values is a module of its own, with its own type.
- **Tested against Kobalte in TSX.** Every component is rendered from OCaml
  and from TSX side by side, checked alike -- roles, names, states, keys --
  and scanned by axe on both.

## In this section

[The binding](kobalte/binding.md) says how the binding is made and
how Kobalte's types become OCaml's. [Using Kobalte](kobalte/usage.md)
shows its components in use: a switch, a toggle group, a select, a slider
and a dialog. Kobalte's documentation stays the reference for what each
part does; each module's [`.mli`](reference.md) is the reference
for how it is written.

## Install

```sh
opam install solidtype-kobalte
bun add @kobalte/core
```

```lisp
(libraries solidtype solidtype-kobalte melange.dom)
```
