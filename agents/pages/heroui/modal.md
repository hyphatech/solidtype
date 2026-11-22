# Modal

Dialog overlay for focused user interactions and important content.

Original HeroUI documentation: [Modal](https://heroui.com/en/docs/react/components/modal).

## Usage

```ocaml title="modal_usage.mlx"
module Button = Solidtype_heroui.Button
module Modal = Solidtype_heroui.Modal
module Gravity = Solidtype_gravity_icons

let make () =
  <Modal>
    <Button variant=`secondary>"Open Modal"</Button>
    <Modal.Backdrop>
      <Modal.Container>
        <Modal.Dialog class_="sm:max-w-[360px]">
          <Modal.Close_trigger />
          <Modal.Header>
            <Modal.Icon class_="bg-default text-foreground">
              <Gravity.Rocket class_="size-5" />
            </Modal.Icon>
            <Modal.Heading>"Welcome to HeroUI"</Modal.Heading>
          </Modal.Header>
          <Modal.Body>
            <p>
              "A beautiful, fast, and modern React UI library for building \
               accessible and customizable web applications with ease."
            </p>
          </Modal.Body>
          <Modal.Footer>
            <Button class_="w-full" slot=`close>"Continue"</Button>
          </Modal.Footer>
        </Modal.Dialog>
      </Modal.Container>
    </Modal.Backdrop>
  </Modal>
```

## Parity

The same HeroUI Modal twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of each trigger: a marked
row is one they disagree on, and a dimmed row is a framework's own, which no
style reads.

The marked row is Kobalte's: its trigger tells a reader it opens a dialog, `aria-haspopup="dialog"`, which React Aria's leaves out.

## Anatomy

```ocaml
<Modal>
  <Button>"Open Modal"</Button>
  <Modal.Backdrop>
    <Modal.Container>
      <Modal.Dialog>
        <Modal.Close_trigger /> (* Optional: close button *)
        <Modal.Header>
          <Modal.Icon>...</Modal.Icon> (* Optional: icon *)
          <Modal.Heading>...</Modal.Heading>
        </Modal.Header>
        <Modal.Body>...</Modal.Body>
        <Modal.Footer>...</Modal.Footer>
      </Modal.Dialog>
    </Modal.Container>
  </Modal.Backdrop>
</Modal>
```

A `Button` inside `Modal` is its trigger; wrap anything else in
`Modal.Trigger`. A `Button` given `` slot=`close `` inside the dialog closes
it.

## Examples

### Sizes

```ocaml title="modal_sizes.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Modal = Solidtype_heroui.Modal
module Gravity = Solidtype_gravity_icons

let sizes =
  [|
    (`xs, "xs");
    (`sm, "sm");
    (`md, "md");
    (`lg, "lg");
    (`cover, "cover");
    (`full, "full");
  |]

let make () =
  <div class_="flex flex-wrap gap-4">
    <For each=sizes>
      (fun (size, name) _ ->
        <Modal>
          <Button variant=`secondary>
            (Jsx.string (String.capitalize_ascii name))
          </Button>
          <Modal.Backdrop>
            <Modal.Container size>
              <Modal.Dialog>
                <Modal.Close_trigger />
                <Modal.Header>
                  <Modal.Icon class_="bg-default text-foreground">
                    <Gravity.Rocket class_="size-5" />
                  </Modal.Icon>
                  <Modal.Heading>
                    "Size: " (Jsx.string (String.capitalize_ascii name))
                  </Modal.Heading>
                </Modal.Header>
                <Modal.Body>
                  <p>
                    "This modal uses the "
                    <code>(Jsx.string name)</code>
                    (Jsx.string
                       (match size with
                       | `cover ->
                           " size variant. It spans the full screen with \
                            margins: 16px on mobile and 40px on desktop. \
                            Maintains rounded corners and standard padding. \
                            Perfect for cover-style content that needs maximum \
                            width while preserving modal aesthetics."
                       | `full ->
                           " size variant. It occupies the entire viewport \
                            without any margins, rounded corners, or shadows, \
                            creating a true fullscreen experience. Ideal for \
                            immersive content or full-page interactions."
                       | `xs | `sm | `md | `lg ->
                           " size variant. On mobile devices, all sizes adapt \
                            to near full-width for optimal viewing. On \
                            desktop, each size provides a different maximum \
                            width to suit various content needs."))
                  </p>
                </Modal.Body>
                <Modal.Footer>
                  <Button slot=`close variant=`secondary>"Cancel"</Button>
                  <Button slot=`close>"Confirm"</Button>
                </Modal.Footer>
              </Modal.Dialog>
            </Modal.Container>
          </Modal.Backdrop>
        </Modal>)
    </For>
  </div>
```

### Placement

```ocaml title="modal_placement.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Modal = Solidtype_heroui.Modal
module Gravity = Solidtype_gravity_icons

let placements =
  [| (`auto, "auto"); (`top, "top"); (`center, "center"); (`bottom, "bottom") |]

let make () =
  <div class_="flex flex-wrap gap-4">
    <For each=placements>
      (fun (placement, name) _ ->
        <Modal>
          <Button variant=`secondary>
            (Jsx.string (String.capitalize_ascii name))
          </Button>
          <Modal.Backdrop>
            <Modal.Container placement>
              <Modal.Dialog class_="sm:max-w-[360px]">
                <Modal.Close_trigger />
                <Modal.Header>
                  <Modal.Icon class_="bg-default text-foreground">
                    <Gravity.Rocket class_="size-5" />
                  </Modal.Icon>
                  <Modal.Heading>
                    "Placement: " (Jsx.string (String.capitalize_ascii name))
                  </Modal.Heading>
                </Modal.Header>
                <Modal.Body>
                  <p>
                    "This modal uses the "
                    <code>(Jsx.string name)</code>
                    " placement option. Try different placements to see how \
                     the modal positions itself on the screen."
                  </p>
                </Modal.Body>
                <Modal.Footer>
                  <Button class_="w-full" slot=`close>"Continue"</Button>
                </Modal.Footer>
              </Modal.Dialog>
            </Modal.Container>
          </Modal.Backdrop>
        </Modal>)
    </For>
  </div>
```

### Scroll Behavior

```ocaml title="modal_scroll.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Modal = Solidtype_heroui.Modal
module Radio = Solidtype_heroui.Radio
module Radio_group = Solidtype_heroui.Radio_group

let paragraphs = Array.init 30 (fun i -> i + 1)

let make () =
  let scroll, set_scroll = S.create_signal "inside" in
  let label () = String.capitalize_ascii (S.get scroll) in
  <div class_="flex flex-col gap-4">
    <Radio_group
      orientation=`horizontal
      value=(Js.Null.return (S.get scroll))
      on_change=(S.set set_scroll)>
      <Radio value="inside">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Inside"
        </Radio.Content>
      </Radio>
      <Radio value="outside">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Outside"
        </Radio.Content>
      </Radio>
    </Radio_group>
    <Modal>
      <Button variant=`secondary>
        "Open Modal (" (Jsx.string (label ())) ")"
      </Button>
      <Modal.Backdrop>
        <Modal.Container
          scroll=(match S.get scroll with
                 | "outside" -> `outside
                 | _ -> `inside)>
          <Modal.Dialog class_="sm:max-w-[360px]">
            <Modal.Header>
              <Modal.Heading>"Scroll: " (Jsx.string (label ()))</Modal.Heading>
              <p class_="text-sm leading-5 text-muted">
                "Compare scroll behaviors - inside keeps content scrollable \
                 within the modal, outside allows page scrolling"
              </p>
            </Modal.Header>
            <Modal.Body>
              <For each=paragraphs>
                (fun n _ ->
                  <p class_="mb-3">
                    "Paragraph "
                    (Jsx.int n)
                    ": Lorem ipsum dolor sit amet, consectetur adipiscing \
                     elit. Nullam pulvinar risus non risus hendrerit \
                     venenatis. Pellentesque sit amet hendrerit risus, sed \
                     porttitor quam."
                  </p>)
              </For>
            </Modal.Body>
            <Modal.Footer>
              <Button slot=`close variant=`secondary>"Cancel"</Button>
              <Button slot=`close>"Confirm"</Button>
            </Modal.Footer>
            <Modal.Close_trigger />
          </Modal.Dialog>
        </Modal.Container>
      </Modal.Backdrop>
    </Modal>
  </div>
```

### Controlled State

Keep the open state in a signal, and give it to `is_open` and
`on_open_change`.

```ocaml title="modal_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Modal = Solidtype_heroui.Modal
module Gravity = Solidtype_gravity_icons

(* HeroUI shows React's useState and its own useOverlayState; a signal is
   Solid's state, so both halves keep the modal's in one. *)
let make () =
  let is_open, set_open = S.create_signal false in
  let state_open, set_state_open = S.create_signal false in
  <div class_="flex max-w-md flex-col gap-8">
    <div class_="flex flex-col gap-3">
      <h3 class_="text-lg font-semibold text-foreground">"With a signal"</h3>
      <p class_="text-sm leading-relaxed text-pretty text-muted">
        "Control the modal using Solid's "
        <code class_="text-foreground">"signal"</code>
        " for simple state management. Perfect for basic use cases."
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
            "Open Modal"
          </Button>
          <Button
            size=`sm variant=`tertiary on_click=(fun _ -> S.update set_open not)>
            "Toggle"
          </Button>
        </div>
      </div>
      <Modal.Backdrop is_open=(S.get is_open) on_open_change=(S.set set_open)>
        <Modal.Container>
          <Modal.Dialog class_="sm:max-w-[360px]">
            <Modal.Close_trigger />
            <Modal.Header>
              <Modal.Icon class_="bg-accent-soft text-accent-soft-foreground">
                <Gravity.Circle_check class_="size-5" />
              </Modal.Icon>
              <Modal.Heading>"Controlled with a signal"</Modal.Heading>
            </Modal.Header>
            <Modal.Body>
              <p>
                "This modal is controlled by Solid's "
                <code>"signal"</code>
                ". Pass "
                <code>"is_open"</code>
                " and "
                <code>"on_open_change"</code>
                " props to manage the modal state externally."
              </p>
            </Modal.Body>
            <Modal.Footer>
              <Button slot=`close variant=`secondary>"Cancel"</Button>
              <Button slot=`close>"Confirm"</Button>
            </Modal.Footer>
          </Modal.Dialog>
        </Modal.Container>
      </Modal.Backdrop>
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
            "Open Modal"
          </Button>
          <Button
            size=`sm
            variant=`tertiary
            on_click=(fun _ -> S.update set_state_open not)>
            "Toggle"
          </Button>
        </div>
      </div>
      <Modal.Backdrop
        is_open=(S.get state_open) on_open_change=(S.set set_state_open)>
        <Modal.Container>
          <Modal.Dialog class_="sm:max-w-[360px]">
            <Modal.Close_trigger />
            <Modal.Header>
              <Modal.Icon class_="bg-success-soft text-success-soft-foreground">
                <Gravity.Circle_check class_="size-5" />
              </Modal.Icon>
              <Modal.Heading>"Controlled with a signal's setter"</Modal.Heading>
            </Modal.Header>
            <Modal.Body>
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
            </Modal.Body>
            <Modal.Footer>
              <Button slot=`close variant=`secondary>"Cancel"</Button>
              <Button slot=`close>"Confirm"</Button>
            </Modal.Footer>
          </Modal.Dialog>
        </Modal.Container>
      </Modal.Backdrop>
    </div>
  </div>
```

### With Form

```ocaml title="modal_form.mlx"
module Button = Solidtype_heroui.Button
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Modal = Solidtype_heroui.Modal
module Surface = Solidtype_heroui.Surface
module Text_field = Solidtype_heroui.Text_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Modal>
    <Button variant=`secondary>"Open Contact Form"</Button>
    <Modal.Backdrop>
      <Modal.Container placement=`auto>
        <Modal.Dialog class_="sm:max-w-md">
          <Modal.Close_trigger />
          <Modal.Header>
            <Modal.Icon class_="bg-accent-soft text-accent-soft-foreground">
              <Gravity.Envelope class_="size-5" />
            </Modal.Icon>
            <Modal.Heading>"Contact Us"</Modal.Heading>
            <p class_="mt-1.5 text-sm leading-5 text-muted">
              "Fill out the form below and we'll get back to you. The modal \
               adapts automatically when the keyboard appears on mobile."
            </p>
          </Modal.Header>
          <Modal.Body class_="p-6">
            <Surface variant=`default>
              <form class_="flex flex-col gap-4">
                <Text_field class_="w-full" name="name" variant=`secondary>
                  <Label>"Name"</Label>
                  <Input type_="text" placeholder="Enter your name" />
                </Text_field>
                <Text_field class_="w-full" name="email" variant=`secondary>
                  <Label>"Email"</Label>
                  <Input type_="email" placeholder="Enter your email" />
                </Text_field>
                <Text_field class_="w-full" name="phone" variant=`secondary>
                  <Label>"Phone"</Label>
                  <Input type_="tel" placeholder="Enter your phone number" />
                </Text_field>
                <Text_field class_="w-full" name="company" variant=`secondary>
                  <Label>"Company"</Label>
                  <Input placeholder="Enter your company name" />
                </Text_field>
                <Text_field class_="w-full" name="message" variant=`secondary>
                  <Label>"Message"</Label>
                  <Input placeholder="Enter your message" />
                </Text_field>
              </form>
            </Surface>
          </Modal.Body>
          <Modal.Footer>
            <Button slot=`close variant=`secondary>"Cancel"</Button>
            <Button slot=`close>"Send Message"</Button>
          </Modal.Footer>
        </Modal.Dialog>
      </Modal.Container>
    </Modal.Backdrop>
  </Modal>
```

### Custom Trigger

Use `Modal.Trigger` to create custom trigger elements beyond standard
buttons.

```ocaml title="modal_custom_trigger.mlx"
module Button = Solidtype_heroui.Button
module Modal = Solidtype_heroui.Modal
module Gravity = Solidtype_gravity_icons

let make () =
  <Modal>
    <Modal.Trigger
      class_="group flex items-center gap-3 rounded-2xl bg-surface p-4 \
              shadow-xs select-none hover:bg-surface-secondary">
      <div
        class_="flex size-12 shrink-0 items-center justify-center rounded-xl \
                bg-accent-soft text-accent-soft-foreground">
        <Gravity.Gear class_="size-6" />
      </div>
      <div class_="flex flex-1 flex-col gap-0.5">
        <p class_="text-sm font-semibold">"Settings"</p>
        <p class_="text-xs text-muted">"Manage your preferences"</p>
      </div>
    </Modal.Trigger>
    <Modal.Backdrop>
      <Modal.Container>
        <Modal.Dialog class_="sm:max-w-[360px]">
          <Modal.Close_trigger />
          <Modal.Header>
            <Modal.Icon class_="bg-accent-soft text-accent-soft-foreground">
              <Gravity.Gear class_="size-5" />
            </Modal.Icon>
            <Modal.Heading>"Settings"</Modal.Heading>
          </Modal.Header>
          <Modal.Body>
            <p>
              "Use "
              <code>"Modal.Trigger"</code>
              " to create custom trigger elements beyond standard buttons. \
               This example shows a card-style trigger with icons and \
               descriptive text."
            </p>
          </Modal.Body>
          <Modal.Footer>
            <Button slot=`close variant=`secondary>"Cancel"</Button>
            <Button slot=`close>"Save"</Button>
          </Modal.Footer>
        </Modal.Dialog>
      </Modal.Container>
    </Modal.Backdrop>
  </Modal>
```

### Backdrop Variants

```ocaml title="modal_backdrop_variants.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Modal = Solidtype_heroui.Modal
module Gravity = Solidtype_gravity_icons

let variants =
  [| (`opaque, "opaque"); (`blur, "blur"); (`transparent, "transparent") |]

let make () =
  <div class_="flex flex-wrap gap-4">
    <For each=variants>
      (fun (variant, name) _ ->
        <Modal>
          <Button variant=`secondary>
            (Jsx.string (String.capitalize_ascii name))
          </Button>
          <Modal.Backdrop variant>
            <Modal.Container>
              <Modal.Dialog class_="sm:max-w-[360px]">
                <Modal.Close_trigger />
                <Modal.Header>
                  <Modal.Icon class_="bg-default text-foreground">
                    <Gravity.Rocket class_="size-5" />
                  </Modal.Icon>
                  <Modal.Heading>
                    "Backdrop: " (Jsx.string (String.capitalize_ascii name))
                  </Modal.Heading>
                </Modal.Header>
                <Modal.Body>
                  <p>
                    "This modal uses the "
                    <code>(Jsx.string name)</code>
                    " backdrop variant. Compare the different visual effects: \
                     opaque provides full opacity, blur adds a backdrop \
                     filter, and transparent removes the background."
                  </p>
                </Modal.Body>
                <Modal.Footer>
                  <Button class_="w-full" slot=`close>"Continue"</Button>
                </Modal.Footer>
              </Modal.Dialog>
            </Modal.Container>
          </Modal.Backdrop>
        </Modal>)
    </For>
  </div>
```

### Custom Backdrop

```ocaml title="modal_custom_backdrop.mlx"
module Button = Solidtype_heroui.Button
module Modal = Solidtype_heroui.Modal
module Gravity = Solidtype_gravity_icons

let make () =
  <Modal>
    <Button variant=`secondary>"Custom Backdrop"</Button>
    <Modal.Backdrop
      class_="bg-linear-to-t from-black/80 via-black/40 to-transparent \
              dark:from-zinc-800/80 dark:via-zinc-800/40"
      variant=`blur>
      <Modal.Container>
        <Modal.Dialog class_="sm:max-w-[360px]">
          <Modal.Header class_="items-center text-center">
            <Modal.Icon class_="bg-accent-soft text-accent-soft-foreground">
              <Gravity.Sparkles class_="size-5" />
            </Modal.Icon>
            <Modal.Heading>"Premium Backdrop"</Modal.Heading>
          </Modal.Header>
          <Modal.Body>
            <p>
              "This backdrop features a sophisticated gradient that \
               transitions from a dark color at the bottom to complete \
               transparency at the top, combined with a smooth blur effect. \
               The gradient automatically adapts its intensity for optimal \
               contrast in both light and dark modes."
            </p>
          </Modal.Body>
          <Modal.Footer class_="flex-col-reverse">
            <Button class_="w-full" slot=`close>"Amazing!"</Button>
            <Button class_="w-full" slot=`close variant=`secondary>
              "Close"
            </Button>
          </Modal.Footer>
          <Modal.Close_trigger />
        </Modal.Dialog>
      </Modal.Container>
    </Modal.Backdrop>
  </Modal>
```

### Dismiss Behavior

`is_dismissable` on `Modal.Backdrop` controls whether the modal can be
dismissed by clicking the backdrop; it defaults to `true`.
`is_keyboard_dismiss_disabled` set to `true` disables the Escape key, and
users must use explicit close actions.

```ocaml title="modal_dismiss.mlx"
module Button = Solidtype_heroui.Button
module Modal = Solidtype_heroui.Modal
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex max-w-sm flex-col gap-6">
    <div class_="flex flex-col gap-2">
      <h3 class_="text-lg font-semibold">"is_dismissable"</h3>
      <p class_="text-sm text-muted">
        "Controls whether the modal can be dismissed by clicking the overlay \
         backdrop. Defaults to "
        <code>"true"</code>
        ". Set to "
        <code>"false"</code>
        " to require explicit close action."
      </p>
      <Modal>
        <Button variant=`secondary>"Open Modal"</Button>
        <Modal.Backdrop is_dismissable=false>
          <Modal.Container>
            <Modal.Dialog class_="sm:max-w-[360px]">
              <Modal.Close_trigger />
              <Modal.Header>
                <Modal.Icon class_="bg-default text-foreground">
                  <Gravity.Circle_info class_="size-5" />
                </Modal.Icon>
                <Modal.Heading>"is_dismissable = false"</Modal.Heading>
                <p class_="text-sm leading-5 text-muted">
                  "Clicking the backdrop won't close this modal"
                </p>
              </Modal.Header>
              <Modal.Body>
                <p>
                  "Try clicking outside this modal on the overlay - it won't \
                   close. You must use the close button or press ESC to \
                   dismiss it."
                </p>
              </Modal.Body>
              <Modal.Footer>
                <Button class_="w-full" slot=`close>"Close"</Button>
              </Modal.Footer>
            </Modal.Dialog>
          </Modal.Container>
        </Modal.Backdrop>
      </Modal>
    </div>
    <div class_="flex flex-col gap-2">
      <h3 class_="text-lg font-semibold">"is_keyboard_dismiss_disabled"</h3>
      <p class_="text-sm text-muted">
        "Controls whether the ESC key can dismiss the modal. When set to "
        <code>"true"</code>
        ", the ESC key will be disabled and users must use explicit close \
         actions."
      </p>
      <Modal>
        <Button variant=`secondary>"Open Modal"</Button>
        <Modal.Backdrop is_keyboard_dismiss_disabled=true>
          <Modal.Container>
            <Modal.Dialog class_="sm:max-w-[360px]">
              <Modal.Close_trigger />
              <Modal.Header>
                <Modal.Icon class_="bg-default text-foreground">
                  <Gravity.Circle_info class_="size-5" />
                </Modal.Icon>
                <Modal.Heading>
                  "is_keyboard_dismiss_disabled = true"
                </Modal.Heading>
                <p class_="text-sm leading-5 text-muted">
                  "ESC key is disabled"
                </p>
              </Modal.Header>
              <Modal.Body>
                <p>
                  "Press ESC - nothing happens. You must use the close button \
                   or click the overlay backdrop to dismiss this modal."
                </p>
              </Modal.Body>
              <Modal.Footer>
                <Button class_="w-full" slot=`close>"Close"</Button>
              </Modal.Footer>
            </Modal.Dialog>
          </Modal.Container>
        </Modal.Backdrop>
      </Modal>
    </div>
  </div>
```

### Close Methods

Add `` slot=`close `` to any `Button` within the modal to close it when
clicked. A dialog's function child is given `close`, to add custom logic
before closing.

```ocaml title="modal_close_methods.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Modal = Solidtype_heroui.Modal
module Gravity = Solidtype_gravity_icons

(* HeroUI's second dialog closes itself through its render prop's close; here
   the page keeps the modal's state, which the buttons set. *)
let make () =
  let is_open, set_open = S.create_signal false in
  <div class_="flex max-w-2xl flex-col gap-8">
    <div class_="flex flex-col gap-2">
      <h3 class_="text-lg font-semibold">"Using slot=`close"</h3>
      <p class_="text-sm text-muted">
        "The simplest way to close a modal. Add "
        <code>"slot=`close"</code>
        " to any Button component within the modal. When clicked, it will \
         automatically close the modal."
      </p>
      <Modal>
        <Button variant=`secondary>"Open Modal"</Button>
        <Modal.Backdrop>
          <Modal.Container>
            <Modal.Dialog class_="sm:max-w-[360px]">
              <Modal.Header>
                <Modal.Icon class_="bg-accent-soft text-accent-soft-foreground">
                  <Gravity.Circle_info class_="size-5" />
                </Modal.Icon>
                <Modal.Heading>"Using slot=`close"</Modal.Heading>
              </Modal.Header>
              <Modal.Body>
                <p>
                  "Click either button below - both have "
                  <code>"slot=`close"</code>
                  " and will close the modal automatically."
                </p>
              </Modal.Body>
              <Modal.Footer>
                <Button slot=`close variant=`secondary>"Cancel"</Button>
                <Button slot=`close>"Confirm"</Button>
              </Modal.Footer>
            </Modal.Dialog>
          </Modal.Container>
        </Modal.Backdrop>
      </Modal>
    </div>
    <div class_="flex flex-col gap-2">
      <h3 class_="text-lg font-semibold">"Using the modal's state"</h3>
      <p class_="text-sm text-muted">
        "Keep the modal's state in a "
        <code>"signal"</code>
        " and set it to "
        <code>"false"</code>
        ". This gives you full control over when and how to close the modal, \
         allowing you to add custom logic before closing."
      </p>
      <Modal is_open=(S.get is_open) on_open_change=(S.set set_open)>
        <Button variant=`secondary>"Open Modal"</Button>
        <Modal.Backdrop>
          <Modal.Container>
            <Modal.Dialog class_="sm:max-w-[360px]">
              <Modal.Header>
                <Modal.Icon
                  class_="bg-success-soft text-success-soft-foreground">
                  <Gravity.Circle_check class_="size-5" />
                </Modal.Icon>
                <Modal.Heading>"Using the modal's state"</Modal.Heading>
              </Modal.Header>
              <Modal.Body>
                <p>
                  "The buttons below set the "
                  <code>"signal"</code>
                  " to "
                  <code>"false"</code>
                  ". You can add validation or other logic before calling "
                  <code>"S.set set_open false"</code>
                  "."
                </p>
              </Modal.Body>
              <Modal.Footer>
                <Button
                  variant=`secondary on_click=(fun _ -> S.set set_open false)>
                  "Cancel"
                </Button>
                <Button on_click=(fun _ -> S.set set_open false)>
                  "Confirm"
                </Button>
              </Modal.Footer>
            </Modal.Dialog>
          </Modal.Container>
        </Modal.Backdrop>
      </Modal>
    </div>
  </div>
```

### Custom Animations

```ocaml title="modal_custom_animations.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Modal = Solidtype_heroui.Modal
module Gravity = Solidtype_gravity_icons

type animation = {
  backdrop : string;
  container : string;
  description : string;
  icon : [ `sparkles | `arrow_up_from_line ];
  name : string;
}

let animations =
  [|
    {
      backdrop =
        String.concat " "
          [
            "data-[entering]:duration-400";
            "data-[entering]:ease-[cubic-bezier(0.16,1,0.3,1)]";
            "data-[exiting]:duration-200";
            "data-[exiting]:ease-[cubic-bezier(0.7,0,0.84,0)]";
          ];
      container =
        String.concat " "
          [
            "data-[entering]:animate-in";
            "data-[entering]:fade-in-0";
            "data-[entering]:zoom-in-95";
            "data-[entering]:duration-400";
            "data-[entering]:ease-[cubic-bezier(0.16,1,0.3,1)]";
            "data-[exiting]:animate-out";
            "data-[exiting]:fade-out-0";
            "data-[exiting]:zoom-out-95";
            "data-[exiting]:duration-200";
            "data-[exiting]:ease-[cubic-bezier(0.7,0,0.84,0)]";
          ];
      description =
        "Physics-based elastic scaling. Simulates a high-damping spring system \
         with fast transient response and prolonged settling time. Ideal for \
         Modals and Popovers.";
      icon = `sparkles;
      name = "Kinematic Scale";
    };
    {
      backdrop =
        String.concat " "
          [
            "data-[entering]:duration-500";
            "data-[entering]:ease-[cubic-bezier(0.25,1,0.5,1)]";
            "data-[exiting]:duration-200";
            "data-[exiting]:ease-[cubic-bezier(0.5,0,0.75,0)]";
          ];
      container =
        String.concat " "
          [
            "data-[entering]:animate-in";
            "data-[entering]:fade-in-0";
            "data-[entering]:slide-in-from-bottom-4";
            "data-[entering]:duration-500";
            "data-[entering]:ease-[cubic-bezier(0.25,1,0.5,1)]";
            "data-[exiting]:animate-out";
            "data-[exiting]:fade-out-0";
            "data-[exiting]:slide-out-to-bottom-2";
            "data-[exiting]:duration-200";
            "data-[exiting]:ease-[cubic-bezier(0.5,0,0.75,0)]";
          ];
      description =
        "Simulates movement through a medium with fluid resistance. Eliminates \
         mechanical linearity for a natural, grounded feel. Perfect for Bottom \
         Sheets or Toasts.";
      icon = `arrow_up_from_line;
      name = "Fluid Slide";
    };
  |]

let make () =
  <div class_="flex flex-wrap gap-4">
    <For each=animations>
      (fun (a : animation) _ ->
        <Modal>
          <Button variant=`secondary>(Jsx.string a.name)</Button>
          <Modal.Backdrop class_=a.backdrop>
            <Modal.Container class_=a.container>
              <Modal.Dialog class_="sm:max-w-[360px]">
                <Modal.Close_trigger />
                <Modal.Header>
                  <Modal.Icon class_="bg-default text-foreground">
                    (match a.icon with
                    | `sparkles -> <Gravity.Sparkles class_="size-5" />
                    | `arrow_up_from_line ->
                        <Gravity.Arrow_up_from_line class_="size-5" />)
                  </Modal.Icon>
                  <Modal.Heading>
                    (Jsx.string a.name) " Animation"
                  </Modal.Heading>
                </Modal.Header>
                <Modal.Body>
                  <p class_="mt-1">(Jsx.string a.description)</p>
                </Modal.Body>
                <Modal.Footer>
                  <Button slot=`close variant=`tertiary>"Close"</Button>
                  <Button slot=`close>"Try Again"</Button>
                </Modal.Footer>
              </Modal.Dialog>
            </Modal.Container>
          </Modal.Backdrop>
        </Modal>)
    </For>
  </div>
```

### Custom Portal

The backdrop's `portal_container` draws it inside an element of the page
instead of at the end of its body. Any element a `ref` gives is taken.

```ocaml title="modal_custom_portal.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Modal = Solidtype_heroui.Modal

let make () =
  (* The box is known once it is on the page, as React's ref and state know
     it; the modal is made after the page hydrates, as the server, with no
     box, never made it. *)
  let box = ref None in
  let container, set_container = S.create_signal None in
  S.on_mount (fun () -> S.set set_container !box);
  <div class_="flex flex-col gap-4">
    <div>
      <p class_="text-sm">
        "Render modals inside a custom container instead of "
        <code>"document.body"</code>
      </p>
      <p class_="text-sm text-muted">
        "Apply "
        <code class_="rounded px-1 py-0.5 text-xs">
          "transform: translateZ(0)"
        </code>
        " to the container to create a new stacking context."
      </p>
    </div>
    <div
      ref=(fun e -> box := Some e)
      class_="relative flex h-[380px] items-center justify-center \
              overflow-hidden rounded bg-muted/20"
      style="transform: translate(0);">
      <Solidtype.Show.Some some=(S.get container)>
        (fun element ->
          <Modal>
            <Button>"Open Modal"</Button>
            <Modal.Backdrop class_="h-full" portal_container=(S.get element)>
              <Modal.Container class_="h-full max-h-full">
                <Modal.Dialog class_="h-full max-h-full sm:max-w-md">
                  <Modal.Close_trigger />
                  <Modal.Header>
                    <Modal.Heading>"Custom Portal"</Modal.Heading>
                  </Modal.Header>
                  <Modal.Body>
                    <p class_="text-sm text-muted">
                      "Lorem ipsum dolor sit amet, consectetur adipiscing \
                       elit. Sed do eiusmod tempor incididunt ut labore et \
                       dolore magna aliqua. Ut enim ad minim veniam, quis \
                       nostrud exercitation ullamco laboris nisi ut aliquip ex \
                       ea commodo consequat."
                    </p>
                    <p class_="text-sm text-muted">
                      "Lorem ipsum dolor sit amet, consectetur adipiscing \
                       elit. Sed do eiusmod tempor incididunt ut labore et \
                       dolore magna aliqua. Ut enim ad minim veniam, quis \
                       nostrud exercitation ullamco laboris nisi ut aliquip ex \
                       ea commodo consequat."
                    </p>
                    <p class_="text-sm text-muted">
                      "Lorem ipsum dolor sit amet, consectetur adipiscing \
                       elit. Sed do eiusmod tempor incididunt ut labore et \
                       dolore magna aliqua. Ut enim ad minim veniam, quis \
                       nostrud exercitation ullamco laboris nisi ut aliquip ex \
                       ea commodo consequat."
                    </p>
                  </Modal.Body>
                  <Modal.Footer>
                    <Button slot=`close variant=`secondary>"Close"</Button>
                  </Modal.Footer>
                </Modal.Dialog>
              </Modal.Container>
            </Modal.Backdrop>
          </Modal>)
      </Solidtype.Show.Some>
    </div>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="modal_tailwind.mlx"
module Button = Solidtype_heroui.Button
module Modal = Solidtype_heroui.Modal
module Gravity = Solidtype_gravity_icons

let make () =
  <Modal>
    <Button variant=`secondary>"Open"</Button>
    <Modal.Backdrop class_="bg-overlay/50 dark:bg-overlay/65" variant=`blur>
      <Modal.Container>
        <Modal.Dialog
          class_="relative overflow-hidden border border-border/80 \
                  bg-surface/90 shadow-2xl ring-1 ring-black/5 \
                  backdrop-blur-xl sm:max-w-[340px] dark:border-border/90 \
                  dark:bg-surface/85 dark:ring-white/10">
          <div
            aria_hidden=true
            class_="pointer-events-none absolute inset-x-0 top-0 h-20 \
                    bg-linear-to-b from-neutral-500/8 to-transparent \
                    dark:from-neutral-400/10"
          />
          <div
            aria_hidden=true
            class_="pointer-events-none absolute inset-x-10 top-0 h-px \
                    bg-linear-to-r from-transparent via-neutral-400/40 \
                    to-transparent dark:via-neutral-500/35"
          />
          <Modal.Close_trigger />
          <Modal.Header class_="relative">
            <Modal.Icon
              class_="bg-neutral-100 text-neutral-700 dark:bg-neutral-800 \
                      dark:text-neutral-200">
              <Gravity.Circle_check class_="size-5" />
            </Modal.Icon>
            <Modal.Heading>"Changes saved"</Modal.Heading>
          </Modal.Header>
          <Modal.Body class_="relative">
            <p class_="text-sm text-muted">
              "Your draft is synced across devices."
            </p>
          </Modal.Body>
          <Modal.Footer>
            <Button class_="w-full" slot=`close>"Done"</Button>
          </Modal.Footer>
        </Modal.Dialog>
      </Modal.Container>
    </Modal.Backdrop>
  </Modal>
```

### Global CSS

To customize the Modal component classes, you can use the
`@layer components` directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .modal__dialog {
    @apply rounded-2xl;
  }

  .modal__heading {
    @apply text-lg font-semibold;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.modal__trigger` - Trigger element that opens the modal
- `.modal__backdrop` - Overlay backdrop behind the modal
- `.modal__container` - Positioning wrapper with placement support
- `.modal__dialog` - Modal content container
- `.modal__header` - Header section for titles and icons
- `.modal__heading` - Heading text
- `.modal__icon` - Icon beside the heading
- `.modal__body` - Main content area
- `.modal__footer` - Footer section for actions
- `.modal__close-trigger` - Close button element
- `.modal__backdrop--opaque` - Opaque colored backdrop (default)
- `.modal__backdrop--blur` - Blurred backdrop with glass effect
- `.modal__backdrop--transparent` - Transparent backdrop (no overlay)
- `.modal__container--scroll-outside` - Enables scrolling the entire modal
- `.modal__dialog--scroll-inside` - Constrains modal height for body
  scrolling
- `.modal__dialog--scroll-outside` - Lets the dialog grow with its content
- `.modal__body--scroll-inside` - Makes only the body scrollable
- `.modal__body--scroll-outside` - Allows full-page scrolling
- `.modal__dialog--xs`, `--sm`, `--md`, `--lg`, `--cover`, `--full`, and
  `.modal__container--full` - Sizes

The backdrop and the container read `--visual-viewport-height`, which a
phone's keyboard shortens.

### Interactive States

- **Focus**: `:focus-visible` or `[data-focus-visible="true"]` - Applied to
  the close button
- **Hover**: `:hover` or `[data-hovered="true"]` - Applied to the close
  button on hover
- **Active**: `:active` or `[data-pressed="true"]` - Applied to the close
  button when pressed
- **Entering**: `[data-entering="true"]` on the backdrop and the container -
  Applied during modal opening animation
- **Exiting**: `[data-exiting="true"]` on the backdrop and the container -
  Applied during modal closing animation
- **Placement**: `[data-placement="*"]` on the container and the dialog -
  Applied based on modal position (auto, top, center, bottom)

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Modal

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `isOpen` | `is_open` | `bool` | | Controlled open state |
| `defaultOpen` | `default_open` | `bool` | `false` | Whether it starts open (uncontrolled) |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Open state change handler |
| `children` | `children` | elements | | Trigger and container elements |

### Modal.Backdrop

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` `opaque `` \| `` `blur `` \| `` `transparent `` | `` `opaque `` | Backdrop overlay style |
| `isDismissable` | `is_dismissable` | `bool` | `true` | Close on backdrop click |
| `isKeyboardDismissDisabled` | `is_keyboard_dismiss_disabled` | `bool` | `false` | Disable ESC key to close |
| `isOpen` | `is_open` | `bool` | | With no `Modal` around it, whether it is open |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | With no `Modal` around it, told as it opens or closes |
| `UNSTABLE_portalContainer` | `portal_container` | `_ Dom.element_like` | the page's body | Custom portal container |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### Modal.Container

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `placement` | `placement` | `` `auto `` \| `` `center `` \| `` `top `` \| `` `bottom `` | `` `auto `` | Modal position on screen |
| `scroll` | `scroll` | `` `inside `` \| `` `outside `` | `` `inside `` | Scroll behavior |
| `size` | `size` | `` `xs `` \| `` `sm `` \| `` `md `` \| `` `lg `` \| `` `cover `` \| `` `full `` | `` `md `` | Modal size variant |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### Modal.Dialog, Header, Body, Footer, Icon, Heading

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | Content; a dialog's may be a function given `close` |

### Modal.Trigger

| React | solidtype | Type | Description |
|---|---|---|---|
| `aria-label` | `aria_label` | `string` | Its name, where its children give none |
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | Custom trigger content |

### Modal.CloseTrigger

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | Custom close button |

## Accessibility

Implements the [WAI-ARIA Dialog pattern](https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal/):

- **Focus trap**: Focus locked within modal; the dialog takes it as the modal
  opens, and it goes back to what had it as the modal closes
- **Keyboard**: `ESC` closes (when enabled), `Tab` cycles elements
- **Screen readers**: the dialog is named by its heading, and the page
  outside is hidden from a reader; a dismiss button only a reader finds
  closes a dismissable modal
- **Scroll lock**: Body scroll disabled when open
