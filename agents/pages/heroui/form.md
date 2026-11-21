# Form

Wrapper component for form validation and submission handling.

A field validates nothing itself: it is invalid as its `is_invalid` says, and
a submit while one is invalid is refused.

Original HeroUI documentation: [Form](https://heroui.com/en/docs/react/components/form).

## Usage

The rules are the application's, from its signals; each error shows once its
field is left.

```ocaml title="form_usage.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

(* The form's rules, from its own state: each field's error, if any. *)
let email_error v =
  match String.index_opt v '@' with
  | Some at when at > 0 && String.contains_from v at '.' -> None
  | Some _ | None -> Some "Please enter a valid email address"

let password_error v =
  let has p = String.exists p v in
  if String.length v < 8 then Some "Password must be at least 8 characters"
  else if not (has (fun c -> c >= 'A' && c <= 'Z')) then
    Some "Password must contain at least one uppercase letter"
  else if not (has (fun c -> c >= '0' && c <= '9')) then
    Some "Password must contain at least one number"
  else None

let make () =
  let email, set_email = S.create_signal "" in
  let password, set_password = S.create_signal "" in
  (* An error shows once its field is left, or the form submitted. *)
  let left, set_left = S.create_signal [] in
  let leave name () = S.set set_left (name :: S.get left) in
  let shown name error () =
    if List.exists (String.equal name) (S.get left) then error () else None
  in
  let email_shown = shown "email" (fun () -> email_error (S.get email)) in
  let password_shown =
    shown "password" (fun () -> password_error (S.get password))
  in
  let sent, set_sent = S.create_signal false in
  <Form
    class_="flex w-96 flex-col gap-4"
    on_submit=(fun e ->
                prevent_default e;
                S.set set_sent true)
    on_reset=(fun _ ->
               S.set set_email "";
               S.set set_password "";
               S.set set_left [];
               S.set set_sent false)>
    <Text_field
      is_required=true
      name="email"
      value=(S.get email)
      on_change=(S.set set_email)
      on_blur=(fun _ -> leave "email" ())
      is_invalid=(Option.is_some (email_error (S.get email)))>
      <Label>"Email"</Label>
      <Input placeholder="john@example.com" />
      <Field_error>
        (Jsx.string (Option.value (email_shown ()) ~default:""))
      </Field_error>
    </Text_field>
    <Text_field
      is_required=true
      name="password"
      value=(S.get password)
      on_change=(S.set set_password)
      on_blur=(fun _ -> leave "password" ())
      is_invalid=(Option.is_some (password_error (S.get password)))>
      <Label>"Password"</Label>
      <Input placeholder="Enter your password" type_="password" />
      <Description>
        "Must be at least 8 characters with 1 uppercase and 1 number"
      </Description>
      <Field_error>
        (Jsx.string (Option.value (password_shown ()) ~default:""))
      </Field_error>
    </Text_field>
    <div class_="flex gap-2">
      <Button type_=`submit>"Submit"</Button>
      <Button type_=`reset variant=`secondary>"Reset"</Button>
    </div>
    <p class_="text-sm text-muted">
      (Jsx.string (if S.get sent then "Submitted." else ""))
    </p>
  </Form>
```

## Parity

HeroUI's Form has no classes and no state of its own to compare; its test runs
the same server error through the port and HeroUI's React Form, shown, typed
into and left.

## Anatomy

```ocaml
<Form on_submit=save>
  (* form fields go here *)
  <Button type_=`submit>"Submit"</Button>
  <Button type_=`reset>"Reset"</Button>
</Form>
```

## Examples

### Server Errors

`validation_errors`, a server's errors by field name, makes each field it names
invalid, shown by its `Field_error`, until the field is changed and then left,
as React's does, or until the errors are given again.

```ocaml title="form_server_errors.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

let make () =
  (* What a server answered, by field name: here, every name is taken. *)
  let errors, set_errors = S.create_signal [] in
  <Form
    class_="flex w-96 flex-col gap-4"
    validation_errors=(S.get errors)
    on_submit=(fun e ->
                prevent_default e;
                S.set set_errors [ ("username", "This username is taken.") ])>
    <Text_field name="username">
      <Label>"Username"</Label> <Input placeholder="jane_doe" /> <Field_error />
    </Text_field>
    <Button class_="self-start" type_=`submit>"Sign up"</Button>
  </Form>
```

### From a codec

A client wiretype prints for an application's routes checks a body against
the routes' own rules before it sends it, and reads a server's refusal: each
problem it finds is at a path in the body, with a sentence for that place.
A field's `name` is that path, so the problems are `validation_errors` in one
`List.map`, and `solidtype-heroui` needs no codec of its own. The example
board's form to add a task, whose title the routes say is 1 to 120
characters and its note at most 200:

```ocaml title="example/src/add_task.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Modal = Solidtype_heroui.Modal
module Select = Solidtype_heroui.Select
module Text_area = Solidtype_heroui.Text_area
module Text_field = Solidtype_heroui.Text_field
module Gravity = Solidtype_gravity_icons

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

(* The labels written in one field, split by commas, each once. *)
let labels written =
  List.fold_left
    (fun kept l ->
      match String.trim l with
      | "" -> kept
      | l when List.exists (String.equal l) kept -> kept
      | l -> kept @ [ l ])
    []
    (String.split_on_char ',' written)

let optional = function "" -> None | s -> Some s

(* The dialog that puts a task on a project's board, [project] chosen at
   first; [on_added] is told its title. What the server finds wrong with a
   field is shown on that field. *)
let%component make ~(projects : Api.project array) ~(project : float option)
    ~(on_added : string -> unit) () =
  let open_, set_open = S.create_signal false in
  let chosen, set_chosen = S.create_signal None in
  let title, set_title = S.create_signal "" in
  let note, set_note = S.create_signal "" in
  let link, set_link = S.create_signal "" in
  let written, set_written = S.create_signal "" in
  let refused, set_refused = S.create_signal [] in
  let problem, set_problem = S.create_signal "" in
  let target () =
    match S.get chosen with
    | Some id -> Some id
    | None -> (
        match S.get project with
        | Some id -> Some id
        | None ->
            Option.map
              (fun (p : Api.project) -> p.id)
              (Array.find_opt (fun _ -> true) (S.get projects)))
  in
  let opened o =
    S.batch (fun () ->
        if not o then (
          S.set set_chosen None;
          S.set set_title "";
          S.set set_note "";
          S.set set_link "";
          S.set set_written "";
          S.set set_refused [];
          S.set set_problem "");
        S.set set_open o)
  in
  let answered = function
    | Ok (t : Api.task) ->
        opened false;
        on_added t.title
    | Error e -> (
        match Said.on_fields e with
        | [] -> S.set set_problem (Said.error e)
        | on_fields -> S.set set_refused on_fields)
  in
  let submit e =
    prevent_default e;
    match target () with
    | Some project ->
        ignore
          (Js.Promise.then_
             (fun a -> Js.Promise.resolve (answered a))
             (Api.post_api_tasks
                ~body:
                  {
                    project;
                    title = S.get title;
                    note = optional (S.get note);
                    link = optional (String.trim (S.get link));
                    labels = Array.of_list (labels (S.get written));
                  }
                ())
            : unit Js.Promise.t)
    | None -> ()
  in
  <Modal is_open=(S.get open_) on_open_change=opened>
    <Button is_disabled=(Array.length (S.get projects) = 0)>
      <Gravity.Plus class_="size-4" /> "New task"
    </Button>
    <Modal.Backdrop variant=`blur>
      <Modal.Container>
        <Modal.Dialog class_="sm:max-w-md">
          <Modal.Close_trigger />
          <Modal.Header><Modal.Heading>"New task"</Modal.Heading></Modal.Header>
          <Form
            on_submit=submit
            validation_errors=(S.get refused)
            class_="flex flex-col gap-6">
            <Modal.Body class_="flex flex-col gap-4">
              <Select
                variant=`secondary
                name="project"
                value=(match target () with
                      | Some id -> [| Js.Float.toString id |]
                      | None -> [||])
                on_change=(fun keys ->
                            S.set set_chosen
                              (Option.bind
                                 (Array.find_opt (fun _ -> true) keys)
                                 Float.of_string_opt))>
                <Label>"Project"</Label>
                <Select.Trigger>
                  <Select.Value /> <Select.Indicator />
                </Select.Trigger>
                <Select.Popover>
                  <List_box>
                    <For each=(S.get projects)>
                      (fun (p : Api.project) _ ->
                        <List_box.Item
                          id=(Js.Float.toString p.id) text_value=p.name>
                          (Jsx.string p.name) <List_box.Item_indicator />
                        </List_box.Item>)
                    </For>
                  </List_box>
                </Select.Popover>
                <Field_error>"Choose a project."</Field_error>
              </Select>
              <Text_field
                variant=`secondary
                name="title"
                value=(S.get title)
                on_change=(S.set set_title)
                is_required=true>
                <Label>"Title"</Label>
                <Input placeholder="What is to be done" />
                <Field_error>"Give the task a title."</Field_error>
              </Text_field>
              <Text_field
                variant=`secondary
                name="note"
                value=(S.get note)
                on_change=(S.set set_note)>
                <Label>"Note"</Label>
                <Text_area placeholder="A line more about it" rows="2" />
                <Field_error>"The note is too long."</Field_error>
              </Text_field>
              <Text_field
                variant=`secondary
                name="link"
                value=(S.get link)
                on_change=(S.set set_link)>
                <Label>"Link"</Label>
                <Input type_="url" placeholder="https://" />
                <Field_error>
                  "Give a link that starts with https://."
                </Field_error>
              </Text_field>
              <Text_field
                variant=`secondary
                name="labels"
                value=(S.get written)
                on_change=(S.set set_written)>
                <Label>"Labels"</Label>
                <Input placeholder="bug, perf" />
                <Description>"Up to five, split by commas."</Description>
                <Field_error>
                  "Up to five labels, each a short word."
                </Field_error>
              </Text_field>
              <p class_="text-sm text-danger empty:hidden" role=`alert>
                (Jsx.string (S.get problem))
              </p>
            </Modal.Body>
            <Modal.Footer>
              <Button slot=`close variant=`tertiary>"Cancel"</Button>
              <Button type_=`submit>"Add"</Button>
            </Modal.Footer>
          </Form>
        </Modal.Dialog>
      </Modal.Container>
    </Modal.Backdrop>
  </Modal>
```

A body the client finds wrong is never sent: `Api.post_api_tasks` answers
`` `Invalid `` with its problems, at the body's own paths, `title` or `note`.
A server's refusal, `` `Refused ``, names each problem by where it is in the
request, `body.title`, so a form that shows those on its fields takes the
prefix off first:

```ocaml
| Error (`Refused ({ problems = Some problems; _ } : Api.refusal)) ->
    S.set set_refused
      (Array.to_list problems
      |> List.filter_map (fun (p : Api.problem) ->
          match String.split_on_char '.' p.at with
          | "body" :: path -> Some (String.concat "." path, p.message)
          | _ -> None))
```

### Focus on a refused submit

A refused submit calls `on_invalid` once, with a cancelable `invalid` event
on the form, before it focuses the first invalid field. A handler that calls
`preventDefault` keeps that focus from moving, and moves it as it chooses.
React's `onInvalid` is called once for each invalid field, as the browser's
own `invalid` event is; one submit refused here is one call.

```ocaml
<Form on_submit=save on_invalid=(fun e -> prevent_default e; focus_summary ())>
  (* fields *)
</Form>
```

## Styling Reference

`Form` renders a native `<form>` element without dedicated BEM classes. Apply
layout, spacing, and surface styles through `class_`. Field appearance and
validation states come from child components such as `Text_field`, `Input`,
`Label`, `Description`, and `Field_error`. For structured multi-field layouts,
compose with [Fieldset](fieldset.md).

## API Reference

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `onSubmit` | `on_submit` | `Dom.event -> unit` | | Handler called when the form is submitted, while every field is valid |
| `onReset` | `on_reset` | `Dom.event -> unit` | | Handler called when the form is reset |
| `validationErrors` | `validation_errors` | `(string * string) list` | | Server-side validation errors mapped by field name, cleared when the user changes the field and leaves it |
| `action` | `action` | `string` | | The URL to submit the form data to |
| `method` | `method_` | `` [ `get \| `post \| `dialog ] `` | | The HTTP method to use when submitting the form |
| `aria-label` | `aria_label` | `string` | | Accessibility label for the form |
| `aria-labelledby` | `aria_labelledby` | `string` | | ID of element that labels the form. Creates a form landmark when provided |
| `className` | `class_` | `string` | | Tailwind CSS classes applied to the form element |
| `onInvalid` | `on_invalid` | `Dom.event -> unit` | | Called once a submit is refused, before the first invalid field is focused; `preventDefault` keeps the focus where it is |
| `validationBehavior` | — | | | Left out: a field validates nothing itself, and is invalid as the application says |

### Form Submission

Forms can be submitted in several ways:

- **Traditional submission**: Set the `action` prop to submit to a URL
- **Handled in OCaml**: Use the `on_submit` handler to process the form data

### Integration with Form Fields

Every field inside a `Form` tells it its name and whether it is invalid:
`Text_field`, `Number_field`, `Search_field`, `Time_field`, `Color_field`,
`Checkbox`, `Checkbox_group`, `Radio_group`, `Switch`, `Slider`,
`Color_slider`, `Select`, `Combo_box` and `Autocomplete`.

## Accessibility

- Native `<form>` element semantics
- Form landmark creation with `aria_label` or `aria_labelledby`
- Automatic focus management on validation errors: a refused submit focuses
  the first invalid field
