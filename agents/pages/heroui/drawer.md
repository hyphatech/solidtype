# Drawer

Slide-out panel for supplementary content and actions.

It is a [Modal](modal.md) that slides in from the edge its
`placement` names, and is dragged toward that edge to close.

Original HeroUI documentation: [Drawer](https://heroui.com/en/docs/react/components/drawer).

## Usage

```ocaml title="drawer_usage.mlx"
module Button = Solidtype_heroui.Button
module Drawer = Solidtype_heroui.Drawer

let make () =
  <Drawer>
    <Button variant=`secondary>"Open Drawer"</Button>
    <Drawer.Backdrop>
      <Drawer.Content placement=`right>
        <Drawer.Dialog>
          <Drawer.Header>
            <Drawer.Heading>"Drawer Title"</Drawer.Heading>
          </Drawer.Header>
          <Drawer.Body>
            <p>
              "This is a bottom drawer built with React Aria's Modal \
               component. It slides up from the bottom of the screen with a \
               smooth CSS transition."
            </p>
          </Drawer.Body>
          <Drawer.Footer>
            <Button slot=`close variant=`secondary>"Cancel"</Button>
            <Button slot=`close>"Confirm"</Button>
          </Drawer.Footer>
        </Drawer.Dialog>
      </Drawer.Content>
    </Drawer.Backdrop>
  </Drawer>
```

## Parity

The same HeroUI Drawer twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of each trigger: a marked
row is one they disagree on, and a dimmed row is a framework's own, which no
style reads.

The marked row is Kobalte's: its trigger tells a reader it opens a dialog, `aria-haspopup="dialog"`, which React Aria's leaves out.

## Anatomy

```ocaml
<Drawer>
  <Button>"Open Drawer"</Button>
  <Drawer.Backdrop>
    <Drawer.Content placement=`bottom>
      <Drawer.Dialog>
        <Drawer.Handle /> (* Optional: drag handle *)
        <Drawer.Close_trigger /> (* Optional: close button *)
        <Drawer.Header>
          <Drawer.Heading>...</Drawer.Heading>
        </Drawer.Header>
        <Drawer.Body>...</Drawer.Body>
        <Drawer.Footer>...</Drawer.Footer>
      </Drawer.Dialog>
    </Drawer.Content>
  </Drawer.Backdrop>
</Drawer>
```

## Examples

### Placement

```ocaml title="drawer_placement.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Show = Solidtype.Show
module Button = Solidtype_heroui.Button
module Drawer = Solidtype_heroui.Drawer

let placements =
  [| (`bottom, "bottom"); (`top, "top"); (`left, "left"); (`right, "right") |]

let make () =
  <div class_="flex flex-wrap gap-4">
    <For each=placements>
      (fun (placement, name) _ ->
        <Drawer>
          <Button variant=`secondary>
            (Jsx.string (String.capitalize_ascii name))
          </Button>
          <Drawer.Backdrop>
            <Drawer.Content placement>
              <Drawer.Dialog>
                <Drawer.Close_trigger />
                <Show
                  when_=(match placement with
                        | `bottom -> true
                        | `top | `left | `right -> false)>
                  <Drawer.Handle />
                </Show>
                <Drawer.Header>
                  <Drawer.Heading>
                    (Jsx.string (String.capitalize_ascii name)) " Drawer"
                  </Drawer.Heading>
                </Drawer.Header>
                <Drawer.Body>
                  <p>
                    "This drawer slides in from the "
                    <strong>(Jsx.string name)</strong>
                    " edge of the screen."
                  </p>
                </Drawer.Body>
                <Drawer.Footer>
                  <Button slot=`close variant=`secondary>"Cancel"</Button>
                  <Button slot=`close>"Done"</Button>
                </Drawer.Footer>
                <Show
                  when_=(match placement with
                        | `top -> true
                        | `bottom | `left | `right -> false)>
                  <Drawer.Handle />
                </Show>
              </Drawer.Dialog>
            </Drawer.Content>
          </Drawer.Backdrop>
        </Drawer>)
    </For>
  </div>
```

### Non-Dismissable

Set `is_dismissable=false` on `Drawer.Backdrop` to prevent closing by clicking
outside or dragging. The user must interact with the drawer's action buttons.

```ocaml title="drawer_non_dismissable.mlx"
module Button = Solidtype_heroui.Button
module Drawer = Solidtype_heroui.Drawer

let make () =
  <Drawer>
    <Button variant=`secondary>"Important Action"</Button>
    <Drawer.Backdrop is_dismissable=false>
      <Drawer.Content>
        <Drawer.Dialog>
          <Drawer.Header>
            <Drawer.Heading>"Confirm Action"</Drawer.Heading>
          </Drawer.Header>
          <Drawer.Body>
            <p>
              "This drawer cannot be dismissed by clicking outside or \
               dragging. You must use one of the buttons below."
            </p>
          </Drawer.Body>
          <Drawer.Footer>
            <Button slot=`close variant=`secondary>"Cancel"</Button>
            <Button slot=`close>"Confirm"</Button>
          </Drawer.Footer>
        </Drawer.Dialog>
      </Drawer.Content>
    </Drawer.Backdrop>
  </Drawer>
```

### Scrollable Content

`Drawer.Body` automatically handles overflow with native scrolling.
Drag-to-dismiss is excluded from the body area to avoid scroll conflicts.

```ocaml title="drawer_scrollable.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Drawer = Solidtype_heroui.Drawer

let paragraphs = Array.init 20 (fun i -> i + 1)

let make () =
  <Drawer>
    <Button variant=`secondary>"Terms & Conditions"</Button>
    <Drawer.Backdrop>
      <Drawer.Content>
        <Drawer.Dialog>
          <Drawer.Handle />
          <Drawer.Close_trigger />
          <Drawer.Header>
            <Drawer.Heading>"Terms & Conditions"</Drawer.Heading>
          </Drawer.Header>
          <Drawer.Body>
            <For each=paragraphs>
              (fun n _ ->
                <p class_="mb-3">
                  "Paragraph "
                  (Jsx.int n)
                  ": Lorem ipsum dolor sit amet, consectetur adipiscing elit. \
                   Nullam pulvinar risus non risus hendrerit venenatis. \
                   Pellentesque sit amet hendrerit risus, sed porttitor quam."
                </p>)
            </For>
          </Drawer.Body>
          <Drawer.Footer>
            <Button slot=`close variant=`secondary>"Decline"</Button>
            <Button slot=`close>"Accept"</Button>
          </Drawer.Footer>
        </Drawer.Dialog>
      </Drawer.Content>
    </Drawer.Backdrop>
  </Drawer>
```

### Controlled State

Keep the open state in a signal, and give it to `is_open` and `on_open_change`.

```ocaml title="drawer_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Drawer = Solidtype_heroui.Drawer

(* HeroUI shows React's useState and its own useOverlayState; a signal is
   Solid's state, so both halves keep the drawer's in one. *)
let make () =
  let is_open, set_open = S.create_signal false in
  let state_open, set_state_open = S.create_signal false in
  <div class_="flex max-w-md flex-col gap-8">
    <div class_="flex flex-col gap-3">
      <h3 class_="text-lg font-semibold text-foreground">"With a signal"</h3>
      <p class_="text-sm leading-relaxed text-pretty text-muted">
        "Control the drawer using Solid's "
        <code class_="text-foreground">"signal"</code>
        " for simple state management."
      </p>
      <div
        class_="flex flex-col items-start gap-3 rounded-2xl bg-surface p-4 \
                shadow-sm">
        <div class_="flex w-full items-center justify-between">
          <p class_="text-xs text-muted">
            "Status: "
            <span class_="font-mono font-medium text-foreground">
              (Jsx.string (if S.get is_open then "open" else "closed"))
            </span>
          </p>
        </div>
        <div class_="flex gap-2">
          <Button
            size=`sm variant=`secondary on_click=(fun _ -> S.set set_open true)>
            "Open Drawer"
          </Button>
          <Button
            size=`sm variant=`tertiary on_click=(fun _ -> S.update set_open not)>
            "Toggle"
          </Button>
        </div>
      </div>
      <Drawer.Backdrop is_open=(S.get is_open) on_open_change=(S.set set_open)>
        <Drawer.Content placement=`right>
          <Drawer.Dialog>
            <Drawer.Close_trigger />
            <Drawer.Header>
              <Drawer.Heading>"Controlled with a signal"</Drawer.Heading>
            </Drawer.Header>
            <Drawer.Body>
              <p>
                "This drawer is controlled by Solid's "
                <code>"signal"</code>
                ". Pass "
                <code>"is_open"</code>
                " and "
                <code>"on_open_change"</code>
                " props to manage the drawer state externally."
              </p>
            </Drawer.Body>
            <Drawer.Footer>
              <Button slot=`close variant=`secondary>"Close"</Button>
            </Drawer.Footer>
          </Drawer.Dialog>
        </Drawer.Content>
      </Drawer.Backdrop>
    </div>
    <div class_="flex flex-col gap-3">
      <h3 class_="text-lg font-semibold text-foreground">
        "With a signal's setter"
      </h3>
      <p class_="text-sm leading-relaxed text-pretty text-muted">
        "Use the "
        <code class_="text-foreground">"signal"</code>
        "'s setter for a cleaner API with convenient calls like "
        <code>"S.set set_open true"</code>
        ", "
        <code>"S.set set_open false"</code>
        ", and "
        <code>"S.update set_open not"</code>
        "."
      </p>
      <div
        class_="flex flex-col items-start gap-3 rounded-2xl bg-surface p-4 \
                shadow-sm">
        <div class_="flex w-full items-center justify-between">
          <p class_="text-xs text-muted">
            "Status: "
            <span class_="font-mono font-medium text-foreground">
              (Jsx.string (if S.get state_open then "open" else "closed"))
            </span>
          </p>
        </div>
        <div class_="flex gap-2">
          <Button
            size=`sm
            variant=`secondary
            on_click=(fun _ -> S.set set_state_open true)>
            "Open Drawer"
          </Button>
          <Button
            size=`sm
            variant=`tertiary
            on_click=(fun _ -> S.update set_state_open not)>
            "Toggle"
          </Button>
        </div>
      </div>
      <Drawer.Backdrop
        is_open=(S.get state_open) on_open_change=(S.set set_state_open)>
        <Drawer.Content placement=`right>
          <Drawer.Dialog>
            <Drawer.Close_trigger />
            <Drawer.Header>
              <Drawer.Heading>
                "Controlled with a signal's setter"
              </Drawer.Heading>
            </Drawer.Header>
            <Drawer.Body>
              <p>
                "The "
                <code>"signal"</code>
                {js|'s setter covers the common operations. No need to manually create callbacks—just use |js}
                <code>"S.set set_open true"</code>
                ", "
                <code>"S.set set_open false"</code>
                ", or "
                <code>"S.update set_open not"</code>
                "."
              </p>
            </Drawer.Body>
            <Drawer.Footer>
              <Button slot=`close variant=`secondary>"Close"</Button>
            </Drawer.Footer>
          </Drawer.Dialog>
        </Drawer.Content>
      </Drawer.Backdrop>
    </div>
  </div>
```

### With Form

```ocaml title="drawer_form.mlx"
module Button = Solidtype_heroui.Button
module Drawer = Solidtype_heroui.Drawer
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field

let make () =
  <Drawer>
    <Button variant=`secondary>"Edit Profile"</Button>
    <Drawer.Backdrop>
      <Drawer.Content placement=`right>
        <Drawer.Dialog>
          <Drawer.Close_trigger />
          <Drawer.Header>
            <Drawer.Heading>"Edit Profile"</Drawer.Heading>
          </Drawer.Header>
          <Drawer.Body>
            <form class_="flex flex-col gap-4">
              <Text_field class_="w-full" name="name">
                <Label>"Name"</Label>
                <Input
                  type_="text" placeholder="Enter your name" variant=`secondary
                />
              </Text_field>
              <Text_field class_="w-full" name="email">
                <Label>"Email"</Label>
                <Input
                  type_="email"
                  placeholder="Enter your email"
                  variant=`secondary
                />
              </Text_field>
              <Text_field class_="w-full" name="bio">
                <Label>"Bio"</Label>
                <Input placeholder="Tell us about yourself" variant=`secondary
                />
              </Text_field>
            </form>
          </Drawer.Body>
          <Drawer.Footer>
            <Button slot=`close variant=`secondary>"Cancel"</Button>
            <Button slot=`close>"Save Changes"</Button>
          </Drawer.Footer>
        </Drawer.Dialog>
      </Drawer.Content>
    </Drawer.Backdrop>
  </Drawer>
```

### Navigation Drawer

```ocaml title="drawer_navigation.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Drawer = Solidtype_heroui.Drawer
module Gravity = Solidtype_gravity_icons

let nav_items =
  [|
    ((fun () -> <Gravity.House class_="size-5 text-muted" />), "Home");
    ((fun () -> <Gravity.Magnifier class_="size-5 text-muted" />), "Search");
    ((fun () -> <Gravity.Bell class_="size-5 text-muted" />), "Notifications");
    ((fun () -> <Gravity.Envelope class_="size-5 text-muted" />), "Messages");
    ((fun () -> <Gravity.Person class_="size-5 text-muted" />), "Profile");
    ((fun () -> <Gravity.Gear class_="size-5 text-muted" />), "Settings");
  |]

let make () =
  <Drawer>
    <Button variant=`secondary><Gravity.Bars /> "Menu"</Button>
    <Drawer.Backdrop>
      <Drawer.Content placement=`left>
        <Drawer.Dialog>
          <Drawer.Close_trigger />
          <Drawer.Header>
            <Drawer.Heading>"Navigation"</Drawer.Heading>
          </Drawer.Header>
          <Drawer.Body>
            <nav class_="flex flex-col gap-1">
              <For each=nav_items>
                (fun (icon, label) _ ->
                  <button
                    class_="flex items-center gap-3 rounded-xl px-3 py-2.5 \
                            text-sm text-foreground transition-colors \
                            hover:bg-default"
                    type_=`button>
                    (icon ()) (Jsx.string label)
                  </button>)
              </For>
            </nav>
          </Drawer.Body>
        </Drawer.Dialog>
      </Drawer.Content>
    </Drawer.Backdrop>
  </Drawer>
```

### Backdrop Variants

```ocaml title="drawer_backdrop_variants.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Drawer = Solidtype_heroui.Drawer

let variants =
  [| (`opaque, "opaque"); (`blur, "blur"); (`transparent, "transparent") |]

let make () =
  <div class_="flex flex-wrap gap-4">
    <For each=variants>
      (fun (variant, name) _ ->
        <Drawer>
          <Button variant=`secondary>
            (Jsx.string (String.capitalize_ascii name))
          </Button>
          <Drawer.Backdrop variant>
            <Drawer.Content>
              <Drawer.Dialog>
                <Drawer.Handle />
                <Drawer.Close_trigger />
                <Drawer.Header>
                  <Drawer.Heading>
                    "Backdrop: " (Jsx.string (String.capitalize_ascii name))
                  </Drawer.Heading>
                </Drawer.Header>
                <Drawer.Body>
                  <p>
                    "This drawer uses the "
                    <code>(Jsx.string name)</code>
                    " backdrop variant."
                  </p>
                </Drawer.Body>
                <Drawer.Footer>
                  <Button class_="w-full" slot=`close>"Close"</Button>
                </Drawer.Footer>
              </Drawer.Dialog>
            </Drawer.Content>
          </Drawer.Backdrop>
        </Drawer>)
    </For>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="drawer_tailwind.mlx"
module Button = Solidtype_heroui.Button
module Drawer = Solidtype_heroui.Drawer

let make () =
  <Drawer>
    <Button variant=`secondary>"Open filters"</Button>
    <Drawer.Backdrop variant=`blur>
      <Drawer.Content placement=`right>
        <Drawer.Dialog class_="border-l border-border/80 bg-surface">
          <Drawer.Header>
            <Drawer.Heading class_="text-foreground">"Filters"</Drawer.Heading>
          </Drawer.Header>
          <Drawer.Body>
            <p class_="text-sm text-muted">
              "Narrow results by status, owner, or date."
            </p>
          </Drawer.Body>
          <Drawer.Footer>
            <Button slot=`close variant=`secondary>"Cancel"</Button>
            <Button slot=`close>"Apply"</Button>
          </Drawer.Footer>
        </Drawer.Dialog>
      </Drawer.Content>
    </Drawer.Backdrop>
  </Drawer>
```

### Global CSS

To customize the Drawer component classes, you can use the
`@layer components` directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .drawer__dialog {
    @apply rounded-t-3xl;
  }

  .drawer__heading {
    @apply text-lg font-semibold;
  }
}
```

## Styling Reference

### CSS Classes

- `.drawer__trigger` - Trigger element that opens the drawer
- `.drawer__backdrop` - Overlay backdrop behind the drawer
- `.drawer__content` - Positioning wrapper for the drawer panel
- `.drawer__dialog` - The drawer panel itself
- `.drawer__header` - Header section for titles
- `.drawer__heading` - Main title text
- `.drawer__body` - Main scrollable content area
- `.drawer__footer` - Footer section for actions
- `.drawer__handle` - Visual drag handle indicator
- `.drawer__close-trigger` - Close button element
- `.drawer__backdrop--opaque` - Opaque colored backdrop (default)
- `.drawer__backdrop--blur` - Blurred backdrop with glass effect
- `.drawer__backdrop--transparent` - Transparent backdrop (no overlay)
- `.drawer__content--bottom` - Slides up from the bottom edge (default)
- `.drawer__content--top` - Slides down from the top edge
- `.drawer__content--left` - Slides in from the left edge
- `.drawer__content--right` - Slides in from the right edge
- `.drawer__dialog--top`, `--bottom`, `--left`, `--right` - The same, on the
  dialog

### Interactive States

- **Entering**: `[data-entering="true"]` on the backdrop and the content -
  Applied during drawer opening animation
- **Exiting**: `[data-exiting="true"]` on the backdrop and the content -
  Applied during drawer closing animation
- **Placement**: `[data-placement="*"]` on the content and the dialog -
  Applied based on drawer position (top, bottom, left, right)

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Drawer

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `isOpen` | `is_open` | `bool` | | Controlled open state |
| `defaultOpen` | `default_open` | `bool` | `false` | Whether it starts open (uncontrolled) |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Open state change handler |

### Drawer.Backdrop

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` `opaque `` \| `` `blur `` \| `` `transparent `` | `` `opaque `` | Backdrop overlay style |
| `isDismissable` | `is_dismissable` | `bool` | `true` | Close on backdrop click, or on a drag |
| `isKeyboardDismissDisabled` | `is_keyboard_dismiss_disabled` | `bool` | `false` | Disable ESC key to close |
| `isOpen` | `is_open` | `bool` | | With no `Drawer` around it, whether it is open |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | With no `Drawer` around it, told as it opens or closes |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### Drawer.Content

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `placement` | `placement` | `` `top `` \| `` `bottom `` \| `` `left `` \| `` `right `` | `` `bottom `` | Edge the drawer slides from |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### Drawer.Trigger, Dialog, Header, Body, Footer, Heading, Handle, CloseTrigger

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | What it holds, where it holds any |

## Accessibility

Implements the [WAI-ARIA Dialog pattern](https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal/):

- **Focus trap**: Focus locked within drawer when open, and given back as it
  closes
- **Keyboard**: `ESC` closes (when dismissable), `Tab` cycles elements
- **Screen readers**: the dialog is named by its heading
- **Scroll lock**: Body scroll disabled when open
- **Drag to dismiss**: from anywhere on the dialog but a button, a field, a
  link or its body; it closes past a third of its size or at a flick, else
  springs back
