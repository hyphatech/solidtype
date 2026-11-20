# Using Kobalte

Kobalte's components in OCaml's JSX, styled by their own data attributes.

A Kobalte component is used as Kobalte's documentation shows it, part by
part, in OCaml's JSX. Kobalte has no look of its own: it writes its state
as `data-` attributes -- `data-checked`, `data-pressed`, `data-highlighted`
-- which a stylesheet or Tailwind's `data-[...]:` variants style. The
examples below are styled with Tailwind on HeroUI's colours.

## Switch

```ocaml title="kobalte_switch.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Switch = Solidtype_kobalte.Switch

let make () =
  let on, set_on = S.create_signal false in
  <div class_="flex flex-col items-start gap-3">
    <Switch.Root
      class_="inline-flex items-center gap-3"
      checked=(S.get on)
      on_change=(S.set set_on)>
      <Switch.Input class_="peer" />
      <Switch.Control
        class_="inline-flex h-6 w-11 items-center rounded-full bg-default \
                px-0.5 transition-colors data-[checked]:bg-accent \
                peer-focus-visible:ring-2 peer-focus-visible:ring-focus">
        <Switch.Thumb
          class_="size-5 rounded-full bg-white shadow transition-transform \
                  data-[checked]:translate-x-5"
        />
      </Switch.Control>
      <Switch.Label>"Airplane mode"</Switch.Label>
    </Switch.Root>
    <p class_="text-sm text-muted">
      (Jsx.string (if S.get on then "On" else "Off"))
    </p>
  </div>
```

The switch is controlled: `checked` reads a signal, and `on_change`
is given the new value, a `bool`, as Kobalte's `onChange` is. Left out,
`default_checked` sets where an uncontrolled switch starts. `Switch.Input`
is the native checkbox Kobalte hides, which a form submits and focus
reaches, so the control's focus ring is styled from it, `peer-focus-visible`.

## Toggle group

```ocaml title="kobalte_toggle_group.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module ToggleGroup = Solidtype_kobalte.ToggleGroup

let item =
  "rounded-lg px-3 py-1 text-sm text-foreground hover:bg-default \
   data-[pressed]:bg-accent data-[pressed]:text-accent-foreground"

let make () =
  let align, set_align = S.create_signal (Js.Nullable.return "left") in
  let styles, set_styles = S.create_signal [| "bold" |] in
  <div class_="flex flex-col items-start gap-3">
    <ToggleGroup.Root
      class_="flex gap-1"
      aria_label="Alignment"
      value=(S.get align)
      on_change=(S.set set_align)>
      <ToggleGroup.Item class_=item value="left">"Left"</ToggleGroup.Item>
      <ToggleGroup.Item class_=item value="center">"Center"</ToggleGroup.Item>
      <ToggleGroup.Item class_=item value="right">"Right"</ToggleGroup.Item>
    </ToggleGroup.Root>
    <ToggleGroup.Root_multiple
      class_="flex gap-1"
      aria_label="Style"
      multiple=true
      value=(S.get styles)
      on_change=(S.set set_styles)>
      <ToggleGroup.Item class_=item value="bold">"Bold"</ToggleGroup.Item>
      <ToggleGroup.Item class_=item value="italic">"Italic"</ToggleGroup.Item>
    </ToggleGroup.Root_multiple>
    <p class_="text-sm text-muted">
      (let align =
         Option.value (Js.Nullable.toOption (S.get align)) ~default:"none"
       in
       Jsx.string
         (align ^ "; " ^ String.concat ", " (Array.to_list (S.get styles))))
    </p>
  </div>
```

`ToggleGroup.Root` holds one value, or none: its `value` is a
`string Js.Nullable.t`, since Kobalte reads `undefined` as uncontrolled and
`null` as a controlled group with nothing pressed. `ToggleGroup.Root_multiple`
holds several, a `string array`, and takes `multiple=true`. Each has the
exact type of its value, where TypeScript has one component whose type
turns on `multiple`.

`class_=item` gives each item a class held in a name, passed as it is.

## Select

```ocaml title="kobalte_select.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module K = Solidtype_kobalte
module Select = K.Select
module Node = K.Types.CollectionNode
module Item_props = K.Types.SelectBaseItemComponentProps
module Value_state = K.Types.SelectValueState

let make () =
  <Select.Root
    class_="flex w-56 flex-col gap-1"
    options=(Array.map K.Types.Either.left [| "Apple"; "Banana"; "Cherry" |])
    placeholder=(<span class_="text-muted">"Pick a fruit"</span>)
    item_component=(fun props ->
                     <Select.Item
                       class_="flex cursor-default items-center \
                               justify-between rounded-lg px-2 py-1 \
                               outline-none data-[highlighted]:bg-default"
                       item=(Item_props.item props)>
                       <Select.ItemLabel>
                         (Jsx.string (Node.raw_value (Item_props.item props)))
                       </Select.ItemLabel>
                       <Select.ItemIndicator>{js|✓|js}</Select.ItemIndicator>
                     </Select.Item>)>
    <Select.Label class_="text-sm">"Fruit"</Select.Label>
    <Select.Trigger
      class_="flex items-center justify-between rounded-xl border \
              border-border bg-field px-3 py-2 text-left">
      <Select.Value>
        (fun state ->
          <span>(Jsx.string (S.get (Value_state.selected_option state)))</span>)
      </Select.Value>
      <Select.Icon>{js|▾|js}</Select.Icon>
    </Select.Trigger>
    <Select.Portal>
      <Select.Content
        class_="heroui-ground rounded-xl border border-border bg-overlay p-1 \
                shadow-lg">
        <Select.Listbox />
      </Select.Content>
    </Select.Portal>
  </Select.Root>
```

A select shows more of the binding:

- **`options`** is an array of `(string, Types.<group>) Either.t`: Kobalte
  takes an option or a group of options, values of different JavaScript
  kinds, so each is wrapped by `Either.left` or `Either.right`, which
  writes the value as it is.
- **`item_component`** is a function prop, given Kobalte's item props, a
  `Types.SelectBaseItemComponentProps.t`, read by its getters:
  `Item_props.item props` is the item's collection node, and
  `Node.raw_value` the option it holds.
- **`Select.Value`**'s child is a function given the value's state,
  `Types.SelectValueState.t`, whose `selected_option` is an accessor.
- **`Select.Portal`** mounts the list in `document.body`, outside the
  page's flow, as Kobalte's own does; the list is given HeroUI's ground
  there, since it no longer inherits the example's.

## Slider

```ocaml title="kobalte_slider.mlx"
module Slider = Solidtype_kobalte.Slider

let make () =
  <Slider.Root default_value=[| 20.; 60. |] class_="flex w-72 flex-col gap-2">
    <div class_="flex justify-between text-sm">
      <Slider.Label>"Price"</Slider.Label>
      <Slider.ValueLabel class_="text-muted" />
    </div>
    <Slider.Track class_="relative h-2 w-full rounded-full bg-default">
      <Slider.Fill class_="absolute h-full rounded-full bg-accent" />
      <Slider.Thumb
        class_="-top-1 block size-4 rounded-full bg-white shadow outline-none \
                focus-visible:ring-2 focus-visible:ring-focus">
        <Slider.Input />
      </Slider.Thumb>
      <Slider.Thumb
        class_="-top-1 block size-4 rounded-full bg-white shadow outline-none \
                focus-visible:ring-2 focus-visible:ring-focus">
        <Slider.Input />
      </Slider.Thumb>
    </Slider.Track>
  </Slider.Root>
```

A slider's value is a `float array`, one number for each thumb: two
thumbs make a range. `default_value`, read once, is where the
uncontrolled slider starts; `value` and `on_change` would control it.
Each thumb holds a `Slider.Input`, the native range input a form submits,
and the arrows move the focused thumb by its step, Page Up and Down by a
tenth of the range, and Home and End to its ends.

## Dialog

```ocaml title="kobalte_dialog.mlx"
module Dialog = Solidtype_kobalte.Dialog

let make () =
  <Dialog.Root>
    <Dialog.Trigger
      class_="rounded-xl bg-accent px-4 py-2 text-sm text-accent-foreground \
              outline-none focus-visible:ring-2 focus-visible:ring-focus">
      "Open settings"
    </Dialog.Trigger>
    <Dialog.Portal>
      <Dialog.Overlay class_="fixed inset-0 z-50 bg-black/40" />
      <div class_="fixed inset-0 z-50 grid place-items-center p-4">
        <Dialog.Content
          class_="heroui-ground flex w-80 flex-col gap-2 rounded-2xl \
                  bg-overlay p-5 shadow-lg">
          <Dialog.Title class_="text-lg font-semibold">"Settings"</Dialog.Title>
          <Dialog.Description class_="text-sm text-muted">
            "Focus stays in here until it closes, by Escape, a click outside, \
             or the button."
          </Dialog.Description>
          <Dialog.CloseButton
            class_="self-end rounded-xl bg-default px-3 py-1.5 text-sm \
                    outline-none focus-visible:ring-2 focus-visible:ring-focus">
            "Done"
          </Dialog.CloseButton>
        </Dialog.Content>
      </div>
    </Dialog.Portal>
  </Dialog.Root>
```

`Dialog.Trigger` opens it, and Escape, a click outside or
`Dialog.CloseButton` closes it. While it is open, focus stays inside it and
the page behind is hidden from a screen reader, and on closing focus goes
back to the trigger. `Dialog.Title` and `Dialog.Description` label it.
`Dialog.Portal` mounts it in `document.body`, so it is given HeroUI's
ground there, as the select's list is.

## Every component

The binding holds every component in Kobalte's documentation, from
Accordion to Tooltip, by the same rules. Each module's `.mli` is the
reference for its parts and their props, in OCaml; Kobalte's documentation
is the reference for what they do.

[HeroUI](../heroui.md) is built on these components: each port is
a Kobalte component with HeroUI's classes, and its page shows it beside
HeroUI's own.
