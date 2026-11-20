# AlertDialog

Modal dialog for critical confirmations requiring user attention and explicit action.

Original HeroUI documentation: [AlertDialog](https://heroui.com/en/docs/react/components/alert-dialog).

## Usage

```ocaml title="alert_dialog_usage.mlx"
module Button = Solidtype_heroui.Button
module Alert_dialog = Solidtype_heroui.Alert_dialog

let make () =
  <Alert_dialog>
    <Button variant=`danger>"Delete Project"</Button>
    <Alert_dialog.Backdrop>
      <Alert_dialog.Container>
        <Alert_dialog.Dialog class_="sm:max-w-[400px]">
          <Alert_dialog.Close_trigger />
          <Alert_dialog.Header>
            <Alert_dialog.Icon status=`danger />
            <Alert_dialog.Heading>
              "Delete project permanently?"
            </Alert_dialog.Heading>
          </Alert_dialog.Header>
          <Alert_dialog.Body>
            <p>
              "This will permanently delete "
              <strong>"My Awesome Project"</strong>
              " and all of its data. This action cannot be undone."
            </p>
          </Alert_dialog.Body>
          <Alert_dialog.Footer>
            <Button slot=`close variant=`tertiary>"Cancel"</Button>
            <Button slot=`close variant=`danger>"Delete Project"</Button>
          </Alert_dialog.Footer>
        </Alert_dialog.Dialog>
      </Alert_dialog.Container>
    </Alert_dialog.Backdrop>
  </Alert_dialog>
```

## Parity

The same HeroUI AlertDialog twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of each trigger: a
marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

The marked row is Kobalte's: its trigger tells a reader it opens a dialog, `aria-haspopup="dialog"`, which React Aria's leaves out.

## Anatomy

```ocaml
<Alert_dialog>
  <Button>"Open"</Button>
  <Alert_dialog.Backdrop>
    <Alert_dialog.Container>
      <Alert_dialog.Dialog>
        <Alert_dialog.Close_trigger />
        <Alert_dialog.Header>
          <Alert_dialog.Icon />
          <Alert_dialog.Heading>...</Alert_dialog.Heading>
        </Alert_dialog.Header>
        <Alert_dialog.Body>...</Alert_dialog.Body>
        <Alert_dialog.Footer>...</Alert_dialog.Footer>
      </Alert_dialog.Dialog>
    </Alert_dialog.Container>
  </Alert_dialog.Backdrop>
</Alert_dialog>
```

`Alert_dialog.Close_trigger` and `Alert_dialog.Icon` are optional. A
`Button` given `` slot=`close `` inside the dialog closes it.

## Examples

### Statuses

```ocaml title="alert_dialog_statuses.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Alert_dialog = Solidtype_heroui.Alert_dialog

type example = {
  cancel : string;
  confirm : string;
  body : string;
  classes : string;
  header : string;
  status : Solidtype_heroui.Status_icon.status;
  trigger : string;
}

let examples =
  [|
    {
      cancel = "Stay Signed In";
      confirm = "Sign Out";
      body =
        "You'll need to sign in again to access your account. Any unsaved \
         changes will be lost.";
      classes = "bg-accent-soft text-accent-soft-foreground";
      header = "Sign out of your account?";
      status = `accent;
      trigger = "Sign Out";
    };
    {
      cancel = "Not Yet";
      confirm = "Mark Complete";
      body =
        "This will mark the task as complete and notify all team members. The \
         task will be moved to your completed list.";
      classes = "bg-success-soft text-success-soft-foreground";
      header = "Complete this task?";
      status = `success;
      trigger = "Complete Task";
    };
    {
      cancel = "Keep Editing";
      confirm = "Discard";
      body =
        "You have unsaved changes that will be permanently lost. Are you sure \
         you want to discard them?";
      classes = "bg-warning-soft text-warning-soft-foreground";
      header = "Discard unsaved changes?";
      status = `warning;
      trigger = "Discard Changes";
    };
    {
      cancel = "Cancel";
      confirm = "Delete Account";
      body =
        "This will permanently delete your account and remove all your data \
         from our servers. This action is irreversible.";
      classes = "bg-danger-soft text-danger-soft-foreground";
      header = "Delete your account?";
      status = `danger;
      trigger = "Delete Account";
    };
  |]

let make () =
  <div class_="flex flex-wrap gap-4">
    <For each=examples>
      (fun (e : example) _ ->
        <Alert_dialog>
          <Button class_=e.classes>(Jsx.string e.trigger)</Button>
          <Alert_dialog.Backdrop>
            <Alert_dialog.Container>
              <Alert_dialog.Dialog class_="sm:max-w-[400px]">
                <Alert_dialog.Close_trigger />
                <Alert_dialog.Header>
                  <Alert_dialog.Icon status=e.status />
                  <Alert_dialog.Heading>
                    (Jsx.string e.header)
                  </Alert_dialog.Heading>
                </Alert_dialog.Header>
                <Alert_dialog.Body>
                  <p>(Jsx.string e.body)</p>
                </Alert_dialog.Body>
                <Alert_dialog.Footer>
                  <Button slot=`close variant=`tertiary>
                    (Jsx.string e.cancel)
                  </Button>
                  <Button
                    slot=`close
                    variant=(match e.status with
                            | `danger -> `danger
                            | `default | `accent | `success | `warning ->
                                `primary)>
                    (Jsx.string e.confirm)
                  </Button>
                </Alert_dialog.Footer>
              </Alert_dialog.Dialog>
            </Alert_dialog.Container>
          </Alert_dialog.Backdrop>
        </Alert_dialog>)
    </For>
  </div>
```

### Placements

```ocaml title="alert_dialog_placements.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Alert_dialog = Solidtype_heroui.Alert_dialog

let placements =
  [| (`auto, "auto"); (`top, "top"); (`center, "center"); (`bottom, "bottom") |]

let make () =
  <div class_="flex flex-wrap gap-4">
    <For each=placements>
      (fun (placement, name) _ ->
        <Alert_dialog>
          <Button variant=`secondary>
            (Jsx.string (String.capitalize_ascii name))
          </Button>
          <Alert_dialog.Backdrop>
            <Alert_dialog.Container placement>
              <Alert_dialog.Dialog class_="sm:max-w-[400px]">
                <Alert_dialog.Close_trigger />
                <Alert_dialog.Header>
                  <Alert_dialog.Icon status=`accent />
                  <Alert_dialog.Heading>
                    (Jsx.string
                       (match placement with
                       | `auto -> "Auto Placement"
                       | `top | `center | `bottom ->
                           String.capitalize_ascii name ^ " Position"))
                  </Alert_dialog.Heading>
                </Alert_dialog.Header>
                <Alert_dialog.Body>
                  <p>
                    (Jsx.string
                       (match placement with
                       | `auto ->
                           "Automatically positions at the bottom on mobile \
                            and center on desktop for optimal user experience."
                       | `top | `center | `bottom ->
                           "This dialog is positioned at the " ^ name
                           ^ " of the viewport. Critical confirmations are \
                              typically centered for maximum attention."))
                  </p>
                </Alert_dialog.Body>
                <Alert_dialog.Footer>
                  <Button slot=`close variant=`tertiary>"Cancel"</Button>
                  <Button slot=`close>"Confirm"</Button>
                </Alert_dialog.Footer>
              </Alert_dialog.Dialog>
            </Alert_dialog.Container>
          </Alert_dialog.Backdrop>
        </Alert_dialog>)
    </For>
  </div>
```

### Sizes

```ocaml title="alert_dialog_sizes.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Alert_dialog = Solidtype_heroui.Alert_dialog
module Gravity = Solidtype_gravity_icons

let sizes =
  [| (`xs, "xs"); (`sm, "sm"); (`md, "md"); (`lg, "lg"); (`cover, "cover") |]

let make () =
  <div class_="flex flex-wrap gap-4">
    <For each=sizes>
      (fun (size, name) _ ->
        <Alert_dialog>
          <Button variant=`secondary>
            (Jsx.string (String.capitalize_ascii name))
          </Button>
          <Alert_dialog.Backdrop>
            <Alert_dialog.Container size>
              <Alert_dialog.Dialog>
                <Alert_dialog.Close_trigger />
                <Alert_dialog.Header>
                  <Alert_dialog.Icon class_="bg-default text-foreground">
                    <Gravity.Rocket class_="size-5" />
                  </Alert_dialog.Icon>
                  <Alert_dialog.Heading>
                    "Size: " (Jsx.string (String.capitalize_ascii name))
                  </Alert_dialog.Heading>
                </Alert_dialog.Header>
                <Alert_dialog.Body>
                  <p>
                    "This alert dialog uses the "
                    <code>(Jsx.string name)</code>
                    (Jsx.string
                       (match size with
                       | `cover ->
                           " size variant. It spans the full screen with \
                            margins: 16px on mobile and 40px on desktop. \
                            Maintains rounded corners and standard padding. \
                            Perfect for critical confirmations that need \
                            maximum width while preserving alert dialog \
                            aesthetics."
                       | `xs | `sm | `md | `lg ->
                           " size variant. On mobile devices, all sizes adapt \
                            to near full-width for optimal viewing. On \
                            desktop, each size provides a different maximum \
                            width to suit various content needs."))
                  </p>
                </Alert_dialog.Body>
                <Alert_dialog.Footer>
                  <Button slot=`close variant=`tertiary>"Cancel"</Button>
                  <Button slot=`close>"Confirm"</Button>
                </Alert_dialog.Footer>
              </Alert_dialog.Dialog>
            </Alert_dialog.Container>
          </Alert_dialog.Backdrop>
        </Alert_dialog>)
    </For>
  </div>
```

### Controlled State

Keep the open state in a signal, given as `is_open` with `on_open_change`.

```ocaml title="alert_dialog_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Alert_dialog = Solidtype_heroui.Alert_dialog

(* HeroUI shows React's useState and its own useOverlayState; a signal is
   Solid's state, so both halves keep the dialog's in one. *)
let make () =
  let is_open, set_open = S.create_signal false in
  let state_open, set_state_open = S.create_signal false in
  <div class_="flex max-w-md flex-col gap-8">
    <div class_="flex flex-col gap-3">
      <h3 class_="text-lg font-semibold text-foreground">"With a signal"</h3>
      <p class_="text-sm leading-relaxed text-pretty text-muted">
        "Control the alert dialog using Solid's "
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
            "Open Dialog"
          </Button>
          <Button
            size=`sm variant=`tertiary on_click=(fun _ -> S.update set_open not)>
            "Toggle"
          </Button>
        </div>
      </div>
      <Alert_dialog.Backdrop
        is_open=(S.get is_open) on_open_change=(S.set set_open)>
        <Alert_dialog.Container>
          <Alert_dialog.Dialog class_="sm:max-w-[400px]">
            <Alert_dialog.Close_trigger />
            <Alert_dialog.Header>
              <Alert_dialog.Icon status=`accent />
              <Alert_dialog.Heading>
                "Controlled with a signal"
              </Alert_dialog.Heading>
            </Alert_dialog.Header>
            <Alert_dialog.Body>
              <p>
                "This alert dialog is controlled by Solid's "
                <code>"signal"</code>
                ". Pass "
                <code>"is_open"</code>
                " and "
                <code>"on_open_change"</code>
                " props to manage the dialog state externally."
              </p>
            </Alert_dialog.Body>
            <Alert_dialog.Footer>
              <Button slot=`close variant=`tertiary>"Cancel"</Button>
              <Button slot=`close>"Confirm"</Button>
            </Alert_dialog.Footer>
          </Alert_dialog.Dialog>
        </Alert_dialog.Container>
      </Alert_dialog.Backdrop>
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
            "Open Dialog"
          </Button>
          <Button
            size=`sm
            variant=`tertiary
            on_click=(fun _ -> S.update set_state_open not)>
            "Toggle"
          </Button>
        </div>
      </div>
      <Alert_dialog.Backdrop
        is_open=(S.get state_open) on_open_change=(S.set set_state_open)>
        <Alert_dialog.Container>
          <Alert_dialog.Dialog class_="sm:max-w-[400px]">
            <Alert_dialog.Close_trigger />
            <Alert_dialog.Header>
              <Alert_dialog.Icon status=`success />
              <Alert_dialog.Heading>
                "Controlled with a signal's setter"
              </Alert_dialog.Heading>
            </Alert_dialog.Header>
            <Alert_dialog.Body>
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
            </Alert_dialog.Body>
            <Alert_dialog.Footer>
              <Button slot=`close variant=`tertiary>"Cancel"</Button>
              <Button slot=`close>"Confirm"</Button>
            </Alert_dialog.Footer>
          </Alert_dialog.Dialog>
        </Alert_dialog.Container>
      </Alert_dialog.Backdrop>
    </div>
  </div>
```

### Custom Icon

```ocaml title="alert_dialog_custom_icon.mlx"
module Button = Solidtype_heroui.Button
module Alert_dialog = Solidtype_heroui.Alert_dialog
module Gravity = Solidtype_gravity_icons

let make () =
  <Alert_dialog>
    <Button variant=`secondary>"Reset Password"</Button>
    <Alert_dialog.Backdrop>
      <Alert_dialog.Container>
        <Alert_dialog.Dialog class_="sm:max-w-[400px]">
          <Alert_dialog.Close_trigger />
          <Alert_dialog.Header>
            <Alert_dialog.Icon status=`warning>
              <Gravity.Lock_open class_="size-5" />
            </Alert_dialog.Icon>
            <Alert_dialog.Heading>"Reset your password?"</Alert_dialog.Heading>
          </Alert_dialog.Header>
          <Alert_dialog.Body>
            <p>
              "We'll send a password reset link to your email address. You'll \
               need to create a new password to regain access to your account."
            </p>
          </Alert_dialog.Body>
          <Alert_dialog.Footer>
            <Button slot=`close variant=`tertiary>"Cancel"</Button>
            <Button slot=`close>"Send Reset Link"</Button>
          </Alert_dialog.Footer>
        </Alert_dialog.Dialog>
      </Alert_dialog.Container>
    </Alert_dialog.Backdrop>
  </Alert_dialog>
```

### Custom Trigger

```ocaml title="alert_dialog_custom_trigger.mlx"
module Button = Solidtype_heroui.Button
module Alert_dialog = Solidtype_heroui.Alert_dialog
module Gravity = Solidtype_gravity_icons

let make () =
  <Alert_dialog>
    <Alert_dialog.Trigger
      class_="group flex items-center gap-3 rounded-2xl bg-surface p-4 \
              shadow-xs select-none hover:bg-surface-secondary">
      <div
        class_="flex size-12 shrink-0 items-center justify-center rounded-xl \
                bg-danger-soft text-danger-soft-foreground">
        <Gravity.Trash_bin class_="size-6" />
      </div>
      <div class_="flex flex-1 flex-col gap-0.5">
        <p class_="text-sm font-semibold">"Delete Item"</p>
        <p class_="text-xs text-muted">"Permanently remove this item"</p>
      </div>
    </Alert_dialog.Trigger>
    <Alert_dialog.Backdrop>
      <Alert_dialog.Container>
        <Alert_dialog.Dialog class_="sm:max-w-[400px]">
          <Alert_dialog.Close_trigger />
          <Alert_dialog.Header>
            <Alert_dialog.Icon status=`danger>
              <Gravity.Trash_bin class_="size-5" />
            </Alert_dialog.Icon>
            <Alert_dialog.Heading>"Delete this item?"</Alert_dialog.Heading>
          </Alert_dialog.Header>
          <Alert_dialog.Body>
            <p>
              "Use "
              <code>"Alert_dialog.Trigger"</code>
              " to create custom trigger elements beyond standard buttons. \
               This example shows a card-style trigger with icons and \
               descriptive text."
            </p>
          </Alert_dialog.Body>
          <Alert_dialog.Footer>
            <Button slot=`close variant=`tertiary>"Cancel"</Button>
            <Button slot=`close variant=`danger>"Delete Item"</Button>
          </Alert_dialog.Footer>
        </Alert_dialog.Dialog>
      </Alert_dialog.Container>
    </Alert_dialog.Backdrop>
  </Alert_dialog>
```

### Backdrop Variants

```ocaml title="alert_dialog_backdrop_variants.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Alert_dialog = Solidtype_heroui.Alert_dialog

let variants =
  [| (`opaque, "opaque"); (`blur, "blur"); (`transparent, "transparent") |]

let make () =
  <div class_="flex flex-wrap gap-4">
    <For each=variants>
      (fun (variant, name) _ ->
        <Alert_dialog>
          <Button variant=`secondary>
            (Jsx.string (String.capitalize_ascii name))
          </Button>
          <Alert_dialog.Backdrop variant>
            <Alert_dialog.Container>
              <Alert_dialog.Dialog class_="sm:max-w-[400px]">
                <Alert_dialog.Close_trigger />
                <Alert_dialog.Header>
                  <Alert_dialog.Icon status=`accent />
                  <Alert_dialog.Heading>
                    "Backdrop: " (Jsx.string (String.capitalize_ascii name))
                  </Alert_dialog.Heading>
                </Alert_dialog.Header>
                <Alert_dialog.Body>
                  <p>
                    (Jsx.string
                       (match variant with
                       | `opaque ->
                           "An opaque dark backdrop that completely obscures \
                            the background, providing maximum focus on the \
                            dialog."
                       | `blur ->
                           "A blurred backdrop that softly obscures the \
                            background while maintaining visual context."
                       | `transparent ->
                           "A transparent backdrop that keeps the background \
                            fully visible, useful for less critical \
                            confirmations."))
                  </p>
                </Alert_dialog.Body>
                <Alert_dialog.Footer>
                  <Button slot=`close variant=`tertiary>"Cancel"</Button>
                  <Button slot=`close>"Confirm"</Button>
                </Alert_dialog.Footer>
              </Alert_dialog.Dialog>
            </Alert_dialog.Container>
          </Alert_dialog.Backdrop>
        </Alert_dialog>)
    </For>
  </div>
```

### Custom Backdrop

```ocaml title="alert_dialog_custom_backdrop.mlx"
module Button = Solidtype_heroui.Button
module Alert_dialog = Solidtype_heroui.Alert_dialog
module Gravity = Solidtype_gravity_icons

let make () =
  <Alert_dialog>
    <Button variant=`danger>"Delete Account"</Button>
    <Alert_dialog.Backdrop
      class_="bg-linear-to-t from-red-950/90 via-red-950/50 to-transparent \
              dark:from-red-950/95 dark:via-red-950/60"
      variant=`blur>
      <Alert_dialog.Container>
        <Alert_dialog.Dialog class_="sm:max-w-[420px]">
          <Alert_dialog.Close_trigger />
          <Alert_dialog.Header class_="items-center text-center">
            <Alert_dialog.Icon status=`danger>
              <Gravity.Triangle_exclamation class_="size-5" />
            </Alert_dialog.Icon>
            <Alert_dialog.Heading>
              "Permanently delete your account?"
            </Alert_dialog.Heading>
          </Alert_dialog.Header>
          <Alert_dialog.Body>
            <p>
              "This action cannot be undone. All your data, settings, and \
               content will be permanently removed from our servers. The \
               dramatic red backdrop emphasizes the severity and \
               irreversibility of this decision."
            </p>
          </Alert_dialog.Body>
          <Alert_dialog.Footer class_="flex-col-reverse">
            <Button class_="w-full" slot=`close>"Keep Account"</Button>
            <Button class_="w-full" slot=`close variant=`danger>
              "Delete Forever"
            </Button>
          </Alert_dialog.Footer>
        </Alert_dialog.Dialog>
      </Alert_dialog.Container>
    </Alert_dialog.Backdrop>
  </Alert_dialog>
```

### Dismiss Behavior

```ocaml title="alert_dialog_dismiss.mlx"
module Button = Solidtype_heroui.Button
module Alert_dialog = Solidtype_heroui.Alert_dialog
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex max-w-sm flex-col gap-6">
    <div class_="flex flex-col gap-2">
      <h3 class_="text-lg font-semibold">"is_dismissable"</h3>
      <p class_="text-sm text-muted">
        "Controls whether the alert dialog can be dismissed by clicking the \
         overlay backdrop. Alert dialogs typically require explicit action, so \
         this defaults to "
        <code>"false"</code>
        ". Set to "
        <code>"true"</code>
        " for less critical confirmations."
      </p>
      <Alert_dialog>
        <Button variant=`secondary>"Open Alert Dialog"</Button>
        <Alert_dialog.Backdrop is_dismissable=false>
          <Alert_dialog.Container>
            <Alert_dialog.Dialog class_="sm:max-w-[400px]">
              <Alert_dialog.Close_trigger />
              <Alert_dialog.Header>
                <Alert_dialog.Icon status=`danger>
                  <Gravity.Circle_info class_="size-5" />
                </Alert_dialog.Icon>
                <Alert_dialog.Heading>
                  "is_dismissable = false"
                </Alert_dialog.Heading>
                <p class_="text-sm leading-5 text-muted">
                  "Clicking the backdrop won't close this alert dialog"
                </p>
              </Alert_dialog.Header>
              <Alert_dialog.Body>
                <p>
                  "Try clicking outside this alert dialog on the overlay - it \
                   won't close. You must use the action buttons to dismiss it."
                </p>
              </Alert_dialog.Body>
              <Alert_dialog.Footer>
                <Button slot=`close variant=`tertiary>"Cancel"</Button>
                <Button slot=`close>"Confirm"</Button>
              </Alert_dialog.Footer>
            </Alert_dialog.Dialog>
          </Alert_dialog.Container>
        </Alert_dialog.Backdrop>
      </Alert_dialog>
    </div>
    <div class_="flex flex-col gap-2">
      <h3 class_="text-lg font-semibold">"is_keyboard_dismiss_disabled"</h3>
      <p class_="text-sm text-muted">
        "Controls whether the ESC key can dismiss the alert dialog. Alert \
         dialogs typically require explicit action, so this defaults to "
        <code>"true"</code>
        ". When set to "
        <code>"false"</code>
        ", the ESC key will be enabled."
      </p>
      <Alert_dialog>
        <Button variant=`secondary>"Open Alert Dialog"</Button>
        <Alert_dialog.Backdrop is_keyboard_dismiss_disabled=true>
          <Alert_dialog.Container>
            <Alert_dialog.Dialog class_="sm:max-w-[400px]">
              <Alert_dialog.Close_trigger />
              <Alert_dialog.Header>
                <Alert_dialog.Icon status=`accent>
                  <Gravity.Circle_info class_="size-5" />
                </Alert_dialog.Icon>
                <Alert_dialog.Heading>
                  "is_keyboard_dismiss_disabled = true"
                </Alert_dialog.Heading>
                <p class_="text-sm leading-5 text-muted">
                  "ESC key is disabled"
                </p>
              </Alert_dialog.Header>
              <Alert_dialog.Body>
                <p>
                  "Press ESC - nothing happens. You must use the action \
                   buttons to dismiss this alert dialog."
                </p>
              </Alert_dialog.Body>
              <Alert_dialog.Footer>
                <Button slot=`close variant=`tertiary>"Cancel"</Button>
                <Button slot=`close>"Confirm"</Button>
              </Alert_dialog.Footer>
            </Alert_dialog.Dialog>
          </Alert_dialog.Container>
        </Alert_dialog.Backdrop>
      </Alert_dialog>
    </div>
  </div>
```

### Close Methods

A dialog's function child is given `close`, which closes it.

```ocaml title="alert_dialog_close_methods.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Alert_dialog = Solidtype_heroui.Alert_dialog

(* HeroUI's second dialog closes itself through its render prop's close; here
   the page keeps the dialog's state, which the buttons set. *)
let make () =
  let is_open, set_open = S.create_signal false in
  <div class_="flex max-w-2xl flex-col gap-8">
    <div class_="flex flex-col gap-2">
      <h3 class_="text-lg font-semibold">"Using slot=`close"</h3>
      <p class_="text-sm text-muted">
        "The simplest way to close a dialog. Add "
        <code>"slot=`close"</code>
        " to any Button component within the dialog. When clicked, it will \
         automatically close the dialog."
      </p>
      <Alert_dialog>
        <Button variant=`secondary>"Open Dialog"</Button>
        <Alert_dialog.Backdrop>
          <Alert_dialog.Container>
            <Alert_dialog.Dialog class_="sm:max-w-[400px]">
              <Alert_dialog.Header>
                <Alert_dialog.Icon status=`accent />
                <Alert_dialog.Heading>"Using slot=`close"</Alert_dialog.Heading>
              </Alert_dialog.Header>
              <Alert_dialog.Body>
                <p>
                  "Click either button below - both have "
                  <code>"slot=`close"</code>
                  " and will close the dialog automatically."
                </p>
              </Alert_dialog.Body>
              <Alert_dialog.Footer>
                <Button slot=`close variant=`tertiary>"Cancel"</Button>
                <Button slot=`close>"Confirm"</Button>
              </Alert_dialog.Footer>
            </Alert_dialog.Dialog>
          </Alert_dialog.Container>
        </Alert_dialog.Backdrop>
      </Alert_dialog>
    </div>
    <div class_="flex flex-col gap-2">
      <h3 class_="text-lg font-semibold">"Using the dialog's state"</h3>
      <p class_="text-sm text-muted">
        "Keep the dialog's state in a "
        <code>"signal"</code>
        " and set it to "
        <code>"false"</code>
        ". This gives you full control over when and how to close the dialog, \
         allowing you to add custom logic before closing."
      </p>
      <Alert_dialog is_open=(S.get is_open) on_open_change=(S.set set_open)>
        <Button variant=`secondary>"Open Dialog"</Button>
        <Alert_dialog.Backdrop>
          <Alert_dialog.Container>
            <Alert_dialog.Dialog class_="sm:max-w-[400px]">
              <Alert_dialog.Header>
                <Alert_dialog.Icon status=`success />
                <Alert_dialog.Heading>
                  "Using the dialog's state"
                </Alert_dialog.Heading>
              </Alert_dialog.Header>
              <Alert_dialog.Body>
                <p>
                  "The buttons below set the "
                  <code>"signal"</code>
                  " to "
                  <code>"false"</code>
                  ". You can add validation or other logic before calling "
                  <code>"S.set set_open false"</code>
                  "."
                </p>
              </Alert_dialog.Body>
              <Alert_dialog.Footer>
                <Button
                  variant=`tertiary on_click=(fun _ -> S.set set_open false)>
                  "Cancel"
                </Button>
                <Button on_click=(fun _ -> S.set set_open false)>
                  "Confirm"
                </Button>
              </Alert_dialog.Footer>
            </Alert_dialog.Dialog>
          </Alert_dialog.Container>
        </Alert_dialog.Backdrop>
      </Alert_dialog>
    </div>
  </div>
```

### Custom Animations

```ocaml title="alert_dialog_custom_animations.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Alert_dialog = Solidtype_heroui.Alert_dialog
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
         Alert Dialogs and Modals.";
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
        <Alert_dialog>
          <Button variant=`secondary>(Jsx.string a.name)</Button>
          <Alert_dialog.Backdrop class_=a.backdrop>
            <Alert_dialog.Container class_=a.container>
              <Alert_dialog.Dialog class_="sm:max-w-[400px]">
                <Alert_dialog.Close_trigger />
                <Alert_dialog.Header>
                  <Alert_dialog.Icon status=`accent>
                    (match a.icon with
                    | `sparkles -> <Gravity.Sparkles class_="size-5" />
                    | `arrow_up_from_line ->
                        <Gravity.Arrow_up_from_line class_="size-5" />)
                  </Alert_dialog.Icon>
                  <Alert_dialog.Heading>
                    (Jsx.string a.name) " Animation"
                  </Alert_dialog.Heading>
                </Alert_dialog.Header>
                <Alert_dialog.Body>
                  <p class_="mt-1">(Jsx.string a.description)</p>
                </Alert_dialog.Body>
                <Alert_dialog.Footer>
                  <Button slot=`close variant=`tertiary>"Close"</Button>
                  <Button slot=`close>"Try Again"</Button>
                </Alert_dialog.Footer>
              </Alert_dialog.Dialog>
            </Alert_dialog.Container>
          </Alert_dialog.Backdrop>
        </Alert_dialog>)
    </For>
  </div>
```

### Custom Portal

The backdrop's `portal_container` draws it inside an element of the page
instead of at the end of its body. Any element a `ref` gives is taken.

```ocaml title="alert_dialog_custom_portal.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Alert_dialog = Solidtype_heroui.Alert_dialog

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
        "Render alert dialogs inside a custom container instead of "
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
          <Alert_dialog>
            <Button>"Open Alert Dialog"</Button>
            <Alert_dialog.Backdrop
              class_="h-full" portal_container=(S.get element)>
              <Alert_dialog.Container class_="h-full max-h-full">
                <Alert_dialog.Dialog class_="h-full max-h-full sm:max-w-md">
                  <Alert_dialog.Close_trigger />
                  <Alert_dialog.Header>
                    <Alert_dialog.Icon status=`accent />
                    <Alert_dialog.Heading>"Custom Portal"</Alert_dialog.Heading>
                  </Alert_dialog.Header>
                  <Alert_dialog.Body>
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
                  </Alert_dialog.Body>
                  <Alert_dialog.Footer>
                    <Button slot=`close variant=`tertiary>"Cancel"</Button>
                    <Button slot=`close>"Confirm"</Button>
                  </Alert_dialog.Footer>
                </Alert_dialog.Dialog>
              </Alert_dialog.Container>
            </Alert_dialog.Backdrop>
          </Alert_dialog>)
      </Solidtype.Show.Some>
    </div>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="alert_dialog_tailwind.mlx"
module Button = Solidtype_heroui.Button
module Alert_dialog = Solidtype_heroui.Alert_dialog

let make () =
  <Alert_dialog>
    <Button variant=`secondary>"Sign out"</Button>
    <Alert_dialog.Backdrop
      class_="bg-overlay/50 dark:bg-overlay/60" variant=`blur>
      <Alert_dialog.Container>
        <Alert_dialog.Dialog
          class_="relative overflow-hidden border border-border/80 bg-surface \
                  shadow-2xl ring-1 ring-accent/10 sm:max-w-[400px] \
                  dark:border-border/90 dark:bg-surface dark:ring-accent/15">
          <div
            aria_hidden=true
            class_="pointer-events-none absolute inset-x-0 top-0 h-24 \
                    bg-linear-to-b from-accent/6 to-transparent \
                    dark:from-accent/10"
          />
          <div
            aria_hidden=true
            class_="pointer-events-none absolute inset-x-8 top-0 h-px \
                    bg-linear-to-r from-transparent via-accent/35 \
                    to-transparent dark:via-accent/45"
          />
          <Alert_dialog.Header class_="relative">
            <Alert_dialog.Icon status=`accent />
            <Alert_dialog.Heading>
              "Sign out of your account?"
            </Alert_dialog.Heading>
          </Alert_dialog.Header>
          <Alert_dialog.Body class_="relative">
            <p class_="text-muted">
              "You will be signed out on this device. Unsaved work in "
              <strong class_="text-foreground">"Acme Workspace"</strong>
              " may be lost unless it was saved to the cloud."
            </p>
          </Alert_dialog.Body>
          <Alert_dialog.Footer>
            <Button slot=`close variant=`tertiary>"Stay signed in"</Button>
            <Button slot=`close>"Sign out"</Button>
          </Alert_dialog.Footer>
        </Alert_dialog.Dialog>
      </Alert_dialog.Container>
    </Alert_dialog.Backdrop>
  </Alert_dialog>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every one, as with
HeroUI in React:

```css
@layer components {
  .alert-dialog__dialog {
    @apply rounded-2xl;
  }

  .alert-dialog__heading {
    @apply text-lg font-semibold;
  }
}
```

## Styling Reference

### CSS Classes

- `.alert-dialog__trigger` - Trigger element that opens the alert dialog
- `.alert-dialog__backdrop` - Overlay backdrop behind the dialog
- `.alert-dialog__container` - Positioning wrapper with placement support
- `.alert-dialog__dialog` - Dialog content container
- `.alert-dialog__header` - Header section for icon and title
- `.alert-dialog__heading` - Heading text styles
- `.alert-dialog__body` - Main content area
- `.alert-dialog__footer` - Footer section for actions
- `.alert-dialog__icon` - Icon container with status colors
- `.alert-dialog__close-trigger` - Close button element
- `.alert-dialog__backdrop--opaque` - Opaque colored backdrop (default)
- `.alert-dialog__backdrop--blur` - Blurred backdrop with glass effect
- `.alert-dialog__backdrop--transparent` - Transparent backdrop (no overlay)
- `.alert-dialog__dialog--xs`, `--sm`, `--md`, `--lg`, `--cover` - Sizes
- `.alert-dialog__icon--default` - Default gray status
- `.alert-dialog__icon--accent` - Accent blue status
- `.alert-dialog__icon--success` - Success green status
- `.alert-dialog__icon--warning` - Warning orange status
- `.alert-dialog__icon--danger` - Danger red status

### Interactive States

- **Entering**: `[data-entering="true"]` on the backdrop and the container
- **Exiting**: `[data-exiting="true"]` on the backdrop and the container
- **Placement**: `[data-placement="auto"]`, and the others, on the container
  and the dialog

## API Reference

Each prop beside the name HeroUI's React component gives it.

### AlertDialog

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `isOpen` | `is_open` | `bool` | | Whether it is open, controlled |
| `defaultOpen` | `default_open` | `bool` | `false` | Whether it starts open |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Told as it opens or closes |

### AlertDialog.Backdrop

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` `opaque `` \| `` `blur `` \| `` `transparent `` | `` `opaque `` | Backdrop overlay style |
| `isDismissable` | `is_dismissable` | `bool` | `false` | Close on backdrop click |
| `isKeyboardDismissDisabled` | `is_keyboard_dismiss_disabled` | `bool` | `true` | Disable Escape key to close |
| `isOpen` | `is_open` | `bool` | | With no `Alert_dialog` around it, whether it is open |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | With no `Alert_dialog` around it, told as it opens or closes |
| `UNSTABLE_portalContainer` | `portal_container` | `_ Dom.element_like` | the page's body | Custom portal container |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### AlertDialog.Container

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `placement` | `placement` | `` `auto `` \| `` `center `` \| `` `top `` \| `` `bottom `` | `` `auto `` | Dialog position on screen |
| `size` | `size` | `` `xs `` \| `` `sm `` \| `` `md `` \| `` `lg `` \| `` `cover `` | `` `md `` | Alert Dialog size variant |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### AlertDialog.Icon

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `status` | `status` | `` `default `` \| `` `accent `` \| `` `success `` \| `` `warning `` \| `` `danger `` | `` `danger `` | Status color variant |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Custom icon element |

### AlertDialog.Dialog, Header, Body, Footer, Heading, CloseTrigger, Trigger

As [Modal's](modal.md#api-reference).

## Accessibility

Implements the [WAI-ARIA AlertDialog pattern](https://www.w3.org/WAI/ARIA/apg/patterns/alertdialog/):

- **Focus trap**: Focus locked within alert dialog
- **Keyboard**: Escape closes (when enabled), Tab cycles elements
- **Screen readers**: `role="alertdialog"`, named by its heading
- **Scroll lock**: Body scroll disabled when open
- **Required action**: Defaults to requiring explicit user action (no
  backdrop or Escape dismiss)
