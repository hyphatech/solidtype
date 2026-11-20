# DisclosureGroup

Container that manages multiple Disclosure items with coordinated expanded states.

It holds the [`Disclosure`](disclosure.md)s inside it, each
by its `id`: one expanded at a time, or several.

Original HeroUI documentation: [DisclosureGroup](https://heroui.com/en/docs/react/components/disclosure-group).

## Usage

HeroUI's examples, with HeroUI's icons from [`solidtype-gravity-icons`](../heroui.md#icons) and Iconify.

```ocaml title="disclosure_group_usage.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Disclosure = Solidtype_heroui.Disclosure
module Disclosure_group = Solidtype_heroui.Disclosure_group
module Separator = Solidtype_heroui.Separator
module Gravity = Solidtype_gravity_icons

(* A disclosure whose trigger is secondary while it is expanded, and
   transparent while it is not. *)
let item ~expanded ~id ~icon ~title ~body =
  let open_ () = Array.exists (String.equal id) (S.get expanded) in
  <Disclosure id>
    <Disclosure.Heading>
      <Button
        slot=`trigger
        variant=(if open_ () then `secondary else `tertiary)
        class_=(if open_ () then "w-full border-none"
                else "w-full border-none bg-transparent")>
        <div class_="flex w-full items-center justify-start gap-2">
          (icon ()) (Solidtype.Jsx.string title)
        </div>
        <Disclosure.Indicator class_="text-muted" />
      </Button>
    </Disclosure.Heading>
    <Disclosure.Content>
      <Disclosure.Body
        class_="mx-2 flex flex-col items-center gap-2 p-4 text-center">
        (body ())
      </Disclosure.Body>
    </Disclosure.Content>
  </Disclosure>

let qr_code =
  "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/images/qr-code-native.png"

let preview () =
  Solidtype.Jsx.fragment
    [|
      <p class_="text-sm text-muted">
        "Scan this QR code with your camera app to preview the HeroUI native \
         components."
      </p>;
      <img
        alt="Expo Go QR Code"
        class_="aspect-square w-full max-w-54 object-cover"
        src=qr_code
      />;
      <p class_="text-sm text-muted">
        "Expo must be installed on your device."
      </p>;
      <Button class_="mt-4" variant=`primary>
        <Iconify.Logos_expo_icon class_="[&_path]:fill-accent-foreground" />
        "Preview on Expo Go"
      </Button>;
    |]

let download () =
  Solidtype.Jsx.fragment
    [|
      <p class_="text-sm text-muted">
        "Download the HeroUI native app to explore our mobile components \
         directly on your device."
      </p>;
      <img
        alt="App Store QR Code"
        class_="aspect-square w-full max-w-54 object-cover"
        src=qr_code
      />;
      <p class_="text-sm text-muted">"Available on iOS and Android devices."</p>;
      <Button class_="mt-4" variant=`primary>
        <Iconify.Tabler_brand_apple_filled /> "Download on App Store"
      </Button>;
    |]

let make () =
  let expanded, set_expanded = S.create_signal [| "preview" |] in
  <div class_="w-full max-w-md">
    <div class_="flex flex-col gap-4 bg-transparent p-4">
      <Disclosure_group
        expanded_keys=(S.get expanded) on_expanded_change=(S.set set_expanded)>
        (item ~expanded ~id:"preview"
           ~icon:(fun () -> <Gravity.Qr_code />)
           ~title:"Preview HeroUI Native" ~body:preview)
        <Separator class_="my-2" />
        (item ~expanded ~id:"download"
           ~icon:(fun () -> <Iconify.Tabler_brand_apple_filled />)
           ~title:"Download App" ~body:download)
      </Disclosure_group>
    </div>
  </div>
```

## Parity

The same HeroUI DisclosureGroup twice, under the same props: in solidtype on
the left, in React on the right. Below them, every attribute of the two
groups: a marked row is one they disagree on, and a dimmed row is a
framework's own, which no style reads.

## Anatomy

```ocaml
<Disclosure_group>
  <Disclosure id="item1">
    <Disclosure.Heading>
      <Disclosure.Trigger><Disclosure.Indicator /></Disclosure.Trigger>
    </Disclosure.Heading>
    <Disclosure.Content />
  </Disclosure>
</Disclosure_group>
```

## Examples

### Controlled

You can control which disclosures are expanded with external navigation
controls using the `expanded_keys` and `on_expanded_change` props.
`Disclosure_group.navigation`, HeroUI's `useDisclosureGroupNavigation`, gives
previous and next buttons over the group's disclosures. Where several may be
expanded, next expands the one after the last expanded and previous the one
before the first.

```ocaml title="disclosure_group_controlled.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Disclosure_group = Solidtype_heroui.Disclosure_group
module Separator = Solidtype_heroui.Separator
module Usage = Disclosure_group_usage
module Gravity = Solidtype_gravity_icons

let make () =
  let expanded, set_expanded = S.create_signal [| "preview" |] in
  let n =
    Disclosure_group.navigation
      ~expanded_keys:(fun () -> S.get expanded)
      ~item_ids:[| "preview"; "download" |]
      ~on_expanded_change:(S.set set_expanded) ()
  in
  <div class_="w-full max-w-md">
    <div class_="flex flex-col gap-4 rounded-3xl p-4">
      <div class_="mb-2 flex items-center justify-between">
        <h3 class_="text-lg font-semibold">"HeroUI Native"</h3>
        <div class_="flex gap-2">
          <Button
            aria_label="Previous disclosure"
            is_disabled=(S.get n.is_prev_disabled)
            size=`sm
            variant=`secondary
            on_click=(fun _ -> n.on_previous ())>
            <Gravity.Chevron_up class_="size-4" />
          </Button>
          <Button
            aria_label="Next disclosure"
            is_disabled=(S.get n.is_next_disabled)
            size=`sm
            variant=`secondary
            on_click=(fun _ -> n.on_next ())>
            <Gravity.Chevron_down class_="size-4" />
          </Button>
        </div>
      </div>
      <Disclosure_group
        expanded_keys=(S.get expanded) on_expanded_change=(S.set set_expanded)>
        (Usage.item ~expanded ~id:"preview"
           ~icon:(fun () -> <Gravity.Qr_code />)
           ~title:"Preview HeroUI Native" ~body:Usage.preview)
        <Separator class_="my-2" />
        (Usage.item ~expanded ~id:"download"
           ~icon:(fun () -> <Iconify.Tabler_brand_apple_filled />)
           ~title:"Download App" ~body:Usage.download)
      </Disclosure_group>
    </div>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's class.

```ocaml title="disclosure_group_tailwind.mlx"
module Button = Solidtype_heroui.Button
module Disclosure = Solidtype_heroui.Disclosure
module Disclosure_group = Solidtype_heroui.Disclosure_group
module Separator = Solidtype_heroui.Separator

let make () =
  <Disclosure_group class_="w-full max-w-sm rounded-xl bg-default-soft p-2">
    <Disclosure id="billing">
      <Disclosure.Heading>
        <Button class_="w-full justify-between" slot=`trigger variant=`ghost>
          "Billing" <Disclosure.Indicator class_="text-muted" />
        </Button>
      </Disclosure.Heading>
      <Disclosure.Content>
        <Disclosure.Body class_="text-sm text-muted">
          "Invoices are issued on the first of each month."
        </Disclosure.Body>
      </Disclosure.Content>
    </Disclosure>
    <Separator class_="my-1" />
    <Disclosure id="support">
      <Disclosure.Heading>
        <Button class_="w-full justify-between" slot=`trigger variant=`ghost>
          "Support" <Disclosure.Indicator class_="text-muted" />
        </Button>
      </Disclosure.Heading>
      <Disclosure.Content>
        <Disclosure.Body class_="text-sm text-muted">
          "Reach us at help@heroui.com. Typical response time is under one \
           business day."
        </Disclosure.Body>
      </Disclosure.Content>
    </Disclosure>
  </Disclosure_group>
```

### Global CSS

To customize the DisclosureGroup component classes, you can use the
`@layer components` directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .disclosure-group {
    @apply w-full;
  }
}
```

## Styling Reference

### CSS Classes

- `.disclosure-group` - Base container styles with layout containment

### Interactive States

- **Disabled**: `[data-disabled="true"]` on entire group, and on each
  disclosure disabled with it
- **Expanded Management**: Automatically manages `[data-expanded="true"]`
  states on child Disclosure items

## API Reference

Each prop beside the name HeroUI's React component gives it.

### DisclosureGroup

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `expandedKeys` | `expanded_keys` | `string array` | | The currently expanded items (controlled) |
| `defaultExpandedKeys` | `default_expanded_keys` | `string array` | `[\|\|]` | The initially expanded items (uncontrolled) |
| `onExpandedChange` | `on_expanded_change` | `string array -> unit` | | Handler called when expanded items change |
| `allowsMultipleExpanded` | `allows_multiple_expanded` | `bool` | `false` | Whether multiple items can be expanded simultaneously |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether all disclosures in the group are disabled |
| `className` | `class_` | `string` | | Added after HeroUI's class |
| `children` | `children` | elements, or a function of `state` | | Disclosure items to render |

### navigation

| React | solidtype | Type | Description |
|---|---|---|---|
| `expandedKeys` | `expanded_keys` | `unit -> string array` | The expanded ids, read as they change |
| `itemIds` | `item_ids` | `string array` | The disclosures' ids, in order |
| `onExpandedChange` | `on_expanded_change` | `string array -> unit` | Sets the expanded ids |
| `allowsMultipleExpanded` | `allows_multiple_expanded` | `bool` | Whether a step expands one beside those expanded |
| `currentIndex` | `current_index` | `unit -> int` | The first expanded's index |
| `isPrevDisabled`, `isNextDisabled` | `is_prev_disabled`, `is_next_disabled` | `unit -> bool` | Whether a step has nowhere to go |
| `onPrevious`, `onNext` | `on_previous`, `on_next` | `unit -> unit` | Steps |
