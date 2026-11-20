# Toast

Display temporary notifications and messages to users with automatic dismissal and customizable placement.

Original HeroUI documentation: [Toast](https://heroui.com/en/docs/react/components/toast).

## Usage

```ocaml title="toast_usage.mlx"
module Button = Solidtype_heroui.Button
module Toast = Solidtype_heroui.Toast
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex h-full max-w-xl flex-col items-center justify-center">
    <Button
      size=`sm
      variant=`secondary
      on_click=(fun _ ->
                   let key = ref None in
                   key :=
                     Some
                       (Toast.show
                          ~action:
                            (Toast.action ~variant:`tertiary
                               ~on_press:(fun () ->
                                 Option.iter (fun k -> Toast.close k) !key)
                               "Dismiss")
                          ~description:
                            "Bob sent you an invitation to join HeroUI team"
                          ~indicator:(Toast.Icon <Gravity.Persons />)
                          ~variant:`default
                          "You have been invited to join a team"))>
      "Show toast"
    </Button>
  </div>
```

## Parity

A toast's region is fixed to the page, so this page shows no two side by side.
Its test runs the same steps through the port and HeroUI's React Toast --
three shown, the stack hovered and left, the frontmost closed through its
exit, one updated, two more than it shows -- and compares the region and every
toast after each.

## Anatomy

```ocaml
<Toast.Provider>
  (fun toast ->
    <Toast toast=(toast)>
      <Toast.Indicator />
      <Toast.Content>
        <Toast.Title /> <Toast.Description />
      </Toast.Content>
      <Toast.Action_button />
      <Toast.Close_button key=(Toast.key toast) />
    </Toast>)
</Toast.Provider>
```

A `Toast.Provider`, rendered once at the root of the page, shows the toasts;
`Toast.show` and its kin add, change and close them, from anywhere.

## Examples

### Variants

```ocaml title="toast_variants.mlx"
module Button = Solidtype_heroui.Button
module Toast = Solidtype_heroui.Toast
module Gravity = Solidtype_gravity_icons

(* A toast whose action closes it, as each of HeroUI's here does. *)
let closing show =
  let key = ref None in
  key := Some (show (fun () -> Option.iter (fun k -> Toast.close k) !key))

let make () =
  <div class_="flex h-full max-w-xl flex-col items-center justify-center">
    <div class_="flex w-full flex-wrap items-center justify-center gap-4">
      <Button
        size=`sm
        variant=`tertiary
        on_click=(fun _ ->
                     closing (fun close ->
                         Toast.show
                           ~action:
                             (Toast.action ~variant:`tertiary ~on_press:close
                                "Dismiss")
                           ~description:
                             "Bob sent you an invitation to join HeroUI team"
                           ~indicator:(Toast.Icon <Gravity.Persons />)
                           ~variant:`default
                           "You have been invited to join a team"))>
        "Default toast"
      </Button>
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ ->
                     closing (fun close ->
                         Toast.info
                           ~action:(Toast.action ~on_press:close "Upgrade")
                           ~description:"Get a paid plan for more credits"
                           "You have 2 credits left"))>
        "Accent toast"
      </Button>
      <Button
        class_="text-success-soft-foreground"
        size=`sm
        variant=`tertiary
        on_click=(fun _ ->
                     closing (fun close ->
                         Toast.success
                           ~action:
                             (Toast.action
                                ~class_:"bg-success text-success-foreground"
                                ~on_press:close "Billing")
                           ~description:"You can continue using HeroUI Chat"
                           "You have upgraded your plan"))>
        "Success toast"
      </Button>
      <Button
        class_="text-warning-soft-foreground"
        size=`sm
        variant=`tertiary
        on_click=(fun _ ->
                     closing (fun close ->
                         Toast.warning
                           ~action:
                             (Toast.action
                                ~class_:"bg-warning text-warning-foreground"
                                ~on_press:close "Upgrade")
                           ~description:"Upgrade to a paid plan to continue"
                           "You have no credits left"))>
        "Warning toast"
      </Button>
      <Button
        size=`sm
        variant=`danger_soft
        on_click=(fun _ ->
                     closing (fun close ->
                         Toast.danger
                           ~action:
                             (Toast.action ~variant:`danger ~on_press:close
                                "Remove")
                           ~description:
                             "Remove files to release space. Adding more text \
                              to demonstrate longer content display"
                           ~indicator:(Toast.Icon <Gravity.Hard_drive />)
                           "Storage is full"))>
        "Danger toast"
      </Button>
    </div>
  </div>
```

### Placements

Each placement here has a queue of its own, shown by its own provider.

```ocaml title="toast_placements.mlx"
module Button = Solidtype_heroui.Button
module Toast = Solidtype_heroui.Toast

let placements =
  [|
    (`top_start, "top start");
    (`top, "top");
    (`top_end, "top end");
    (`bottom_start, "bottom start");
    (`bottom, "bottom");
    (`bottom_end, "bottom end");
  |]

let make () =
  (* A queue and a region for each placement. *)
  let queues =
    Array.map
      (fun (p, name) -> (p, name, Toast.Queue.create ~max_visible_toasts:3 ()))
      placements
  in
  <div class_="flex h-full flex-col items-center justify-center gap-6">
    (Solidtype.Jsx.fragment
       (Array.map
          (fun (p, _, q) -> <Toast.Provider placement=p queue=q />)
          queues))
    <div class_="flex max-w-xs flex-wrap justify-center gap-2">
      (Solidtype.Jsx.fragment
         (Array.map
            (fun (_, name, q) ->
              <Button
                size=`sm
                variant=`secondary
                on_click=(fun _ ->
                           ignore
                             (Toast.show ~queue:q
                                ~description:"Event has been created"
                                "Event created"
                               : Toast.key))>
                (Solidtype.Jsx.string name)
              </Button>)
            queues))
    </div>
  </div>
```

### Expanded Stack

`is_expanded` forces the stack into its expanded layout; it does not pause
timers.

```ocaml title="toast_expanded.mlx"
module Button = Solidtype_heroui.Button
module Toast = Solidtype_heroui.Toast

let make () =
  let q = Toast.Queue.create () in
  let add ~variant title =
    ignore (Toast.show ~queue:q ~variant title : Toast.key)
  in
  let later ms f = ignore (Js.Global.setTimeout ~f ms : Js.Global.timeoutId) in
  <div class_="flex h-full max-w-xl flex-col items-center justify-center">
    <Toast.Provider is_expanded=true placement=`bottom queue=q />
    <Button
      size=`sm
      variant=`secondary
      on_click=(fun _ ->
                   add ~variant:`default "Simple message";
                   later 400 (fun () ->
                       add ~variant:`success "Operation completed");
                   later 800 (fun () ->
                       add ~variant:`accent "New update available"))>
      "Show 3 toasts"
    </Button>
  </div>
```

### Simple Toasts

```ocaml title="toast_simple.mlx"
module Button = Solidtype_heroui.Button
module Toast = Solidtype_heroui.Toast

let make () =
  <div class_="flex h-full max-w-xl flex-col items-center justify-center">
    <div class_="flex w-full flex-wrap items-center justify-center gap-4">
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ -> ignore (Toast.show "Simple message" : Toast.key))>
        "Default"
      </Button>
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ ->
                     ignore (Toast.success "Operation completed" : Toast.key))>
        "Success"
      </Button>
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ ->
                     ignore (Toast.info "New update available" : Toast.key))>
        "Info"
      </Button>
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ ->
                     ignore
                       (Toast.warning "Please check your settings" : Toast.key))>
        "Warning"
      </Button>
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ ->
                     ignore (Toast.danger "Something went wrong" : Toast.key))>
        "Error"
      </Button>
    </div>
  </div>
```

### Custom Indicators

```ocaml title="toast_indicators.mlx"
module Button = Solidtype_heroui.Button
module Toast = Solidtype_heroui.Toast
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex h-full max-w-xl flex-col items-center justify-center">
    <Button
      size=`sm
      variant=`secondary
      on_click=(fun _ ->
                   ignore
                     (Toast.show
                        ~indicator:(Toast.Icon <Gravity.Star />)
                        "Custom icon indicator"
                       : Toast.key))>
      "Custom indicator"
    </Button>
  </div>
```

### Custom Toast Rendering

```ocaml title="toast_custom.mlx"
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Toast = Solidtype_heroui.Toast

let make () =
  let q = Toast.Queue.create () in
  <div class_="flex h-full max-w-xl flex-col items-center justify-center">
    <Toast.Provider placement=`bottom queue=q>
      (fun toast ->
        let variant () = Toast.toast_variant toast in
        <Toast
          class_="rounded-xl border border-border" toast variant=(variant ())>
          <Toast.Content>
            <div class_="flex items-center gap-2">
              <Toast.Indicator
                class_="text-accent-soft-foreground" variant=(variant ())
              />
              <div class_="flex flex-col pe-6">
                <Toast.Title class_="text-accent-soft-foreground">
                  (Jsx.string (Toast.title toast))
                </Toast.Title>
                (match Toast.description toast with
                | Some d ->
                    <Toast.Description>(Jsx.string d)</Toast.Description>
                | None -> Jsx.string "")
              </div>
            </div>
          </Toast.Content>
          <Toast.Close_button
            class_="absolute end-2 top-1/2 -translate-y-1/2 border-none \
                    bg-transparent opacity-100 [&>svg]:size-4"
            key=(Toast.key toast)
          />
        </Toast>)
    </Toast.Provider>
    <Button
      size=`sm
      variant=`secondary
      on_click=(fun _ ->
                   ignore
                     (Toast.show ~queue:q ~variant:`default
                        ~description:"This uses a custom render function"
                        "Custom layout toast"
                       : Toast.key))>
      "Custom toast"
    </Button>
  </div>
```

### Promise & Loading

`Toast.promise` shows a spinner, then changes the same toast in place as the
promise settles. `Toast.update` keeps what it does not name.

```ocaml title="toast_promise.mlx"
module Button = Solidtype_heroui.Button
module Toast = Solidtype_heroui.Toast

(* What HeroUI's example rejects with: an Error, its message read. *)
external message : Js.Promise.error -> string = "message" [@@mel.get]
external error : string -> Js.Exn.t = "Error" [@@mel.new]
external reject : Js.Exn.t -> 'a Js.Promise.t = "reject" [@@mel.scope "Promise"]
external random : unit -> float = "random" [@@mel.scope "Math"]

let after ms f = Wait.after ms () |> Js.Promise.then_ f

let upload_file () =
  after 2000 (fun () -> Js.Promise.resolve ("document.pdf", 1024))

let create_event () =
  after 2000 (fun () -> reject (error "Network error. Please try again."))

let save_data () =
  after 2000 (fun () ->
      if random () > 0.5 then Js.Promise.resolve 42
      else reject (error "Failed to save data"))

let fetch_user () = after 2000 (fun () -> Js.Promise.resolve "John Doe")
let later ms f = ignore (Js.Global.setTimeout ~f ms : Js.Global.timeoutId)

(* A toast loading until it is told how it ended, as HeroUI's manual
   examples are. *)
let loading ?description ~ms title ended =
  let key = Toast.show ?description ~is_loading:true ~timeout_ms:0. title in
  later ms (fun () -> ignore (ended key : Toast.key))

let make () =
  <div
    class_="flex h-full max-w-2xl flex-col items-center justify-center gap-8">
    <div class_="w-full space-y-3">
      <div class_="text-center">
        <h3 class_="text-sm font-medium">"Using toast.promise()"</h3>
        <p class_="text-xs text-muted">
          "Automatically handles loading, success, and error states"
        </p>
      </div>
      <div class_="flex w-full flex-wrap items-center justify-center gap-4">
        <Button
          size=`sm
          variant=`secondary
          on_click=(fun _ ->
                       ignore
                         (Toast.promise (upload_file ())
                            ~error:(fun _ -> "Failed to upload file")
                            ~loading:"Uploading file..."
                            ~success:(fun (name, size) ->
                              "File " ^ name ^ " uploaded ("
                              ^ string_of_int size ^ "KB)")
                           : Toast.key))>
          "Upload file"
        </Button>
        <Button
          size=`sm
          variant=`secondary
          on_click=(fun _ ->
                       ignore
                         (Toast.promise (create_event ()) ~error:message
                            ~loading:"Creating event..." ~success:(fun () ->
                              "Event created")
                           : Toast.key))>
          "Create event (error)"
        </Button>
        <Button
          size=`sm
          variant=`secondary
          on_click=(fun _ ->
                       ignore
                         (Toast.promise (save_data ()) ~error:message
                            ~loading:"Saving changes..." ~success:(fun count ->
                              "Saved " ^ string_of_int count ^ " items")
                           : Toast.key))>
          "Save data (random)"
        </Button>
        <Button
          size=`sm
          variant=`secondary
          on_click=(fun _ ->
                       ignore
                         (Toast.promise (fetch_user ())
                            ~error:(fun _ -> "Failed to fetch user")
                            ~loading:"Loading user..."
                            ~success:(fun name -> "Welcome back, " ^ name ^ "!")
                           : Toast.key))>
          "Fetch user"
        </Button>
      </div>
    </div>
    <div class_="w-full space-y-3">
      <div class_="text-center">
        <h3 class_="text-sm font-medium">"Manual Loading State"</h3>
        <p class_="text-xs text-muted">
          "Manually control loading state with isLoading prop"
        </p>
      </div>
      <div class_="flex w-full flex-wrap items-center justify-center gap-4">
        <Button
          size=`sm
          variant=`secondary
          on_click=(fun _ ->
                       loading
                         ~description:"Please wait while we upload your file"
                         ~ms:3000 "Uploading file..." (fun key ->
                           Toast.update key
                             ~description:
                               "Your file has been uploaded successfully"
                             ~variant:`success ~is_loading:false
                             ~timeout_ms:4000. "File uploaded"))>
          "Upload with loading"
        </Button>
        <Button
          size=`sm
          variant=`secondary
          on_click=(fun _ ->
                       loading ~ms:2500 "Processing payment..." (fun key ->
                           Toast.update key
                             ~description:
                               "Your payment has been processed successfully"
                             ~variant:`success ~is_loading:false
                             ~timeout_ms:4000. "Payment processed"))>
          "Payment processing"
        </Button>
        <Button
          size=`sm
          variant=`secondary
          on_click=(fun _ ->
                       loading ~ms:2000 "Saving changes..." (fun key ->
                           Toast.update key ~description:"Please try again"
                             ~variant:`danger ~is_loading:false
                             ~timeout_ms:4000. "Failed to save"))>
          "Loading to error"
        </Button>
      </div>
    </div>
  </div>
```

### Callbacks

```ocaml title="toast_callbacks.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Toast = Solidtype_heroui.Toast

external now : unit -> Js.Date.t = "Date" [@@mel.new]
external local_time : Js.Date.t -> string = "toLocaleTimeString" [@@mel.send]

let make () =
  let history, set_history = S.create_signal [||] in
  (* The latest five, the newest first, as HeroUI's example keeps them. *)
  let remember message () =
    S.update set_history (fun was ->
        let all = Array.append [| (message, local_time (now ())) |] was in
        Array.sub all 0 (min 5 (Array.length all)))
  in
  <div
    class_="flex h-full max-w-2xl flex-col items-center justify-center gap-6">
    <div class_="flex w-full flex-wrap items-center justify-center gap-4">
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ ->
                     ignore
                       (Toast.show ~timeout_ms:3000.
                          ~on_close:
                            (remember "File saved (closed after 3 seconds)")
                          "File saved"
                         : Toast.key))>
        "Custom timeout (3s)"
      </Button>
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ ->
                     ignore
                       (Toast.show ~timeout_ms:10000.
                          ~on_close:
                            (remember "Changes saved (closed after 10 seconds)")
                          "Changes saved"
                         : Toast.key))>
        "Custom timeout (10s)"
      </Button>
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ ->
                     ignore
                       (Toast.success
                          ~on_close:
                            (remember
                               "Event created (closed after default timeout)")
                          "Event created"
                         : Toast.key))>
        "With onClose callback"
      </Button>
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ ->
                     ignore
                       (Toast.show
                          ~description:"This toast will stay until dismissed"
                          ~timeout_ms:0.
                          ~on_close:
                            (remember "Important notification (manually closed)")
                          "Important notification"
                         : Toast.key))>
        "Persistent toast"
      </Button>
    </div>
    <div class_="w-full space-y-2">
      <div class_="flex items-center justify-between">
        <h3 class_="text-sm font-medium">"Closed History"</h3>
        (if Array.length (S.get history) > 0 then
           <Button
             class_="h-6 text-xs"
             size=`sm
             variant=`tertiary
             on_click=(fun _ -> S.set set_history [||])>
             "Clear"
           </Button>
         else Jsx.string "")
      </div>
      <div
        class_="min-h-[120px] space-y-2 rounded-lg border border-border \
                bg-surface p-4">
        (match S.get history with
        | [||] ->
            <p class_="text-sm text-muted">
              "No toasts closed yet. Try closing one above!"
            </p>
        | items ->
            Jsx.fragment
              (Array.map
                 (fun (message, time) ->
                   <div
                     class_="flex animate-in items-start justify-between gap-3 \
                             rounded-md border border-border bg-default px-3 \
                             py-2 text-sm duration-200 fade-in \
                             slide-in-from-top-2">
                     <div class_="flex-1">
                       <span class_="font-medium">(Jsx.string message)</span>
                       <span class_="ms-2 text-xs text-muted">
                         (Jsx.string ("(" ^ time ^ ")"))
                       </span>
                     </div>
                     <div
                       class_="flex h-5 w-5 shrink-0 items-center \
                               justify-center rounded-full bg-success/10 \
                               text-success-soft-foreground">
                       <svg
                         class_="size-3"
                         fill="none"
                         stroke="currentColor"
                         stroke_width="2"
                         view_box="0 0 24 24">
                         <path
                           d="M5 13l4 4L19 7"
                           stroke_linecap="round"
                           stroke_linejoin="round"
                         />
                       </svg>
                     </div>
                   </div>)
                 items))
      </div>
    </div>
  </div>
```

### Custom Queues

```ocaml title="toast_queues.mlx"
module Button = Solidtype_heroui.Button
module Toast = Solidtype_heroui.Toast

external now : unit -> float = "now" [@@mel.scope "Date"]

let make () =
  let notifications = Toast.Queue.create ~max_visible_toasts:2 () in
  let errors = Toast.Queue.create ~max_visible_toasts:3 () in
  let successes = Toast.Queue.create ~max_visible_toasts:1 () in
  <div class_="flex h-full max-w-4xl items-center justify-center gap-4">
    <Toast.Provider placement=`bottom queue=notifications />
    <div class_="flex justify-center gap-2">
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ ->
                     ignore
                       (Toast.show ~queue:notifications ~variant:`default
                          ~description:"You have a new message"
                          "New notification"
                         : Toast.key))>
        "Add notification (max 2)"
      </Button>
    </div>
    <Toast.Provider placement=`bottom_start queue=errors />
    <div class_="flex justify-center gap-2">
      <Button
        size=`sm
        variant=`danger_soft
        on_click=(fun _ ->
                     ignore
                       (Toast.danger ~queue:errors
                          ~description:"Failed to save changes" "Error occurred"
                         : Toast.key))>
        "Add error (max 3)"
      </Button>
    </div>
    <Toast.Provider placement=`bottom_end queue=successes />
    <div class_="flex justify-center gap-2">
      <Button
        class_="text-success-soft-foreground"
        size=`sm
        variant=`secondary
        on_click=(fun _ ->
                     ignore
                       (Toast.success ~queue:successes
                          ~description:
                            ("Operation " ^ Js.Float.toString (now ()))
                          "Success!"
                         : Toast.key))>
        "Add success (max 1)"
      </Button>
    </div>
  </div>
```

### Setup

Render the provider in the root of your app.

```ocaml
let make () =
  <main>
    <Toast.Provider />
    <Button on_click=(fun _ -> ignore (Toast.show "Simple message" : Toast.key))>
      "Show toast"
    </Button>
  </main>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, on a toast and each of its parts,
and on an action's button by `Toast.action`'s.

```ocaml title="toast_tailwind.mlx"
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Toast = Solidtype_heroui.Toast

let make () =
  let q = Toast.Queue.create () in
  <div class_="flex flex-col items-center gap-4">
    <Toast.Provider placement=`bottom queue=q>
      (fun toast ->
        let variant () = Toast.toast_variant toast in
        <Toast
          class_="rounded-xl border border-border/80 bg-surface shadow-lg \
                  ring-1 ring-black/5 dark:ring-white/10"
          toast
          variant=(variant ())>
          <Toast.Content>
            <div class_="flex items-center gap-2.5">
              <Toast.Indicator
                class_="text-neutral-600 dark:text-neutral-400"
                variant=(variant ())
              />
              <div class_="flex flex-col gap-0.5">
                <Toast.Title
                  class_="text-sm font-medium text-neutral-900 \
                          dark:text-neutral-50">
                  (Jsx.string (Toast.title toast))
                </Toast.Title>
                (match Toast.description toast with
                | Some d ->
                    <Toast.Description
                      class_="text-sm text-neutral-600 dark:text-neutral-400">
                      (Jsx.string d)
                    </Toast.Description>
                | None -> Jsx.string "")
              </div>
            </div>
          </Toast.Content>
        </Toast>)
    </Toast.Provider>
    <Button
      size=`sm
      variant=`secondary
      on_click=(fun _ ->
                   ignore
                     (Toast.show ~queue:q ~variant:`default
                        ~description:"Draft synced" "Saved"
                       : Toast.key))>
      "Show toast"
    </Button>
  </div>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base Classes

- `.toast` - Base toast container
- `.toast-region` - Toast region container
- `.toast__content` - Content wrapper for title and description
- `.toast__indicator` - Icon/indicator container
- `.toast__title` - Toast title text
- `.toast__description` - Toast description text
- `.toast__action` - Action button container
- `.toast__close-button` - Close button container

#### Variant Classes

- `.toast--default` - Default gray variant
- `.toast--accent` - Accent blue variant
- `.toast--success` - Success green variant
- `.toast--warning` - Warning yellow/orange variant
- `.toast--danger` - Danger red variant

#### Placement Classes

- `.toast-region--top-start` to `.toast-region--bottom-end` - The region's
  placement

### Interactive States

- **Frontmost**: `[data-frontmost]` - Applied to the topmost visible toast
- **Index**: `[data-index]` - Applied based on toast position in stack
- **Placement**: `[data-placement="*"]` - Applied based on toast region
  placement
- **Entering**: `[data-entering]` - Applied on first paint of a new toast
- **Exiting**: `[data-exiting]` - Applied while a closing toast plays its exit
  transition
- **Expanded**: `[data-expanded]` - Applied to every toast while the stack is
  expanded
- **Hidden**: `[data-hidden]` - Applied to toasts beyond `max_visible_toasts`

## API Reference

### Toast.Provider

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `placement` | `placement` | `` [ `top_start \| `top \| `top_end \| `bottom_start \| `bottom \| `bottom_end ] `` | `` `bottom `` | Placement of the toast region |
| `gap` | `gap` | `float` | `12.` | The gap between toasts in pixels |
| `isExpanded` | `is_expanded` | `bool` | `false` | Force the stack into its expanded layout (does not pause timers) |
| `maxVisibleToasts` | `max_visible_toasts` | `int` | `3` | Maximum number of toasts to display at once |
| `hotkey` | `hotkey` | `string array` | `[\| "altKey"; "KeyT" \|]` | Hotkey that moves focus to the toast region and expands the stack. Modifiers match `KeyboardEvent` boolean properties (e.g. `"altKey"`), other keys match `event.code` (e.g. `"KeyT"`). Modifiers you leave out must be up. Pass `[\|\|]` to disable |
| `scaleFactor` | `scale_factor` | `float` | `0.05` | Scale factor for stacked toasts (0-1) |
| `width` | `width` | `string` | `"460px"` | Width of the toast as a CSS value |
| `queue` | `queue` | `Toast.Queue.t` | the default | Custom toast queue instance |
| `children` | `children` | `Toast.queued -> element` | HeroUI's toast | Custom render function |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### toast

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `toast(title, options)` | `Toast.show title` | `Toast.key` | | Add a toast, returns its key |
| `toast.success`, `info`, `warning`, `danger` | `Toast.success`, `info`, `warning`, `danger` | `Toast.key` | | Adds one of that variant, `info` the accent |
| `toast.update` | `Toast.update key title` | `Toast.key` | | Update a toast in place, preserving its stack position and keeping what it does not name |
| `toast.promise` | `Toast.promise p ~loading ~success ~error` | `Toast.key` | | A loading toast, then the message for its outcome |
| `toast.close`, `clear`, `pauseAll`, `resumeAll` | `Toast.close`, `clear`, `pause_all`, `resume_all` | | | |
| `description` | `description` | `string` | | Optional description text |
| `variant` | `variant` | `` [ `default \| `accent \| `success \| `warning \| `danger ] `` | `` `default `` | Visual variant |
| `indicator` | `indicator` | `Toast.Variant_icon \| Icon of element \| No_icon` | `Variant_icon` | Indicator icon: the variant's, a custom one, or none |
| `actionProps` | `action` | `Toast.action ~on_press label` | | An action button |
| `isLoading` | `is_loading` | `bool` | `false` | Show loading spinner instead of indicator |
| `timeout` | `timeout_ms` | `float` | `4000.` | Auto-dismiss timeout in milliseconds. Set to `0.` for persistent toasts that don't auto-dismiss |
| `onClose` | `on_close` | `unit -> unit` | | Called when the toast is dismissed, as its exit animation starts |

### ToastQueue

A queue manages the state for a `Toast.Provider`, outside any component, so
you can trigger toasts from anywhere in your application.
`Toast.Queue.create ?max_visible_toasts ?exit_duration_ms ()` makes one of
your own, shown by a provider given it as `queue`; each function above takes
it as `?queue`.

## Accessibility

- **Landmark region**: Toasts render in a labeled region; `Alt` + `T` moves
  focus straight to it. The hotkey is configurable via the `hotkey` prop and
  can be disabled by passing an empty array
- **Keyboard**: `Tab` reaches the controls of visible toasts, and `Escape`
  collapses the expanded stack
- **Screen readers**: New toasts are announced automatically
- **Timers**: Auto-dismiss pauses while the stack is hovered or focused, and
  while the page is in a background tab
