# SearchField

Search input field with clear button and search icon.

Original HeroUI documentation: [SearchField](https://heroui.com/en/docs/react/components/search-field).

## Usage

HeroUI's examples, with HeroUI's icons from [`solidtype-gravity-icons`](../heroui.md#icons).

```ocaml title="search_field_usage.mlx"
module Label = Solidtype_heroui.Label
module Search_field = Solidtype_heroui.Search_field

let make () =
  <Search_field name="search">
    <Label>"Search"</Label>
    <Search_field.Group>
      <Search_field.Search_icon />
      <Search_field.Input class_="w-[280px]" placeholder="Search..." />
      <Search_field.Clear_button />
    </Search_field.Group>
  </Search_field>
```

## Parity

The same HeroUI SearchField twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two groups: a
marked row is one they disagree on.

## Anatomy

```ocaml
<Search_field>
  <Label />
  <Search_field.Group>
    <Search_field.Search_icon />
    <Search_field.Input />
    <Search_field.Clear_button />
  </Search_field.Group>
  <Description />
  <Field_error />
</Search_field>
```

`Search_field` allows users to enter and clear a search query. It includes a
search icon and an optional clear button for easy reset.

## Examples

### Variants

The SearchField component supports two visual variants:

- **`` `primary ``** (default) - Standard styling with shadow, suitable for
  most use cases
- **`` `secondary ``** - Lower emphasis variant without shadow, suitable for
  use in Surface components

```ocaml title="search_field_variants.mlx"
module Label = Solidtype_heroui.Label
module Search_field = Solidtype_heroui.Search_field

let make () =
  <div class_="flex flex-col gap-4">
    <Search_field name="primary-search" variant=`primary>
      <Label>"Primary variant"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input class_="w-[280px]" placeholder="Search..." />
        <Search_field.Clear_button />
      </Search_field.Group>
    </Search_field>
    <Search_field name="secondary-search" variant=`secondary>
      <Label>"Secondary variant"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input class_="w-[280px]" placeholder="Search..." />
        <Search_field.Clear_button />
      </Search_field.Group>
    </Search_field>
  </div>
```

### In Surface

When used inside a [Surface](surface.md) component, use
`` variant=`secondary `` to apply the lower emphasis variant suitable for
surface backgrounds.

```ocaml title="search_field_surface.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Search_field = Solidtype_heroui.Search_field
module Surface = Solidtype_heroui.Surface

let make () =
  <Surface class_="flex w-full max-w-sm flex-col gap-4 rounded-3xl p-6">
    <Search_field name="search" variant=`secondary>
      <Label>"Search"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input class_="w-full" placeholder="Search..." />
        <Search_field.Clear_button />
      </Search_field.Group>
      <Description>"Enter keywords to search"</Description>
    </Search_field>
    <Search_field name="search-2" variant=`secondary>
      <Label>"Advanced search"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input class_="w-full" placeholder="Advanced search..." />
        <Search_field.Clear_button />
      </Search_field.Group>
      <Description>"Use filters to refine your search"</Description>
    </Search_field>
  </Surface>
```

### With Description

```ocaml title="search_field_description.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Search_field = Solidtype_heroui.Search_field

let make () =
  <div class_="flex flex-col gap-4">
    <Search_field name="search">
      <Label>"Search products"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input class_="w-[280px]" placeholder="Search products..."
        />
        <Search_field.Clear_button />
      </Search_field.Group>
      <Description>"Enter keywords to search for products"</Description>
    </Search_field>
    <Search_field name="search-users">
      <Label>"Search users"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input class_="w-[280px]" placeholder="Search users..." />
        <Search_field.Clear_button />
      </Search_field.Group>
      <Description>"Search by name, email, or username"</Description>
    </Search_field>
  </div>
```

### Required Field

```ocaml title="search_field_required.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Search_field = Solidtype_heroui.Search_field

let make () =
  <div class_="flex flex-col gap-4">
    <Search_field is_required=true name="search">
      <Label>"Search"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input class_="w-[280px]" placeholder="Search..." />
        <Search_field.Clear_button />
      </Search_field.Group>
    </Search_field>
    <Search_field is_required=true name="search-query">
      <Label>"Search query"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input
          class_="w-[280px]" placeholder="Enter search query..."
        />
        <Search_field.Clear_button />
      </Search_field.Group>
      <Description>"Minimum 3 characters required"</Description>
    </Search_field>
  </div>
```

### Disabled State

```ocaml title="search_field_disabled.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Search_field = Solidtype_heroui.Search_field

let make () =
  <div class_="flex flex-col gap-4">
    <Search_field is_disabled=true name="search" value="Disabled search">
      <Label>"Search"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input class_="w-[280px]" placeholder="Search..." />
        <Search_field.Clear_button />
      </Search_field.Group>
      <Description>"This search field is disabled"</Description>
    </Search_field>
    <Search_field is_disabled=true name="search-empty">
      <Label>"Search"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input class_="w-[280px]" placeholder="Search..." />
        <Search_field.Clear_button />
      </Search_field.Group>
      <Description>"This search field is disabled"</Description>
    </Search_field>
  </div>
```

### Full Width

```ocaml title="search_field_full_width.mlx"
module Label = Solidtype_heroui.Label
module Search_field = Solidtype_heroui.Search_field

let make () =
  <div class_="w-[400px] space-y-4">
    <Search_field full_width=true name="search">
      <Label>"Search"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input placeholder="Search..." />
        <Search_field.Clear_button />
      </Search_field.Group>
    </Search_field>
  </div>
```

### Validation

Use `is_invalid` together with `Field_error` to surface validation messages.

```ocaml title="search_field_validation.mlx"
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Search_field = Solidtype_heroui.Search_field

let make () =
  <div class_="flex flex-col gap-4">
    <Search_field is_invalid=true is_required=true name="search" value="ab">
      <Label>"Search"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input class_="w-[280px]" placeholder="Search..." />
        <Search_field.Clear_button />
      </Search_field.Group>
      <Field_error>"Search query must be at least 3 characters"</Field_error>
    </Search_field>
    <Search_field is_invalid=true name="search-invalid" value="invalid@query">
      <Label>"Search"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input class_="w-[280px]" placeholder="Search..." />
        <Search_field.Clear_button />
      </Search_field.Group>
      <Field_error>"Invalid characters in search query"</Field_error>
    </Search_field>
  </div>
```

### Controlled

Control the value to synchronize with other components or perform custom
formatting.

```ocaml title="search_field_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Search_field = Solidtype_heroui.Search_field

let make () =
  let value, set_value = S.create_signal "" in
  <div class_="flex flex-col gap-4">
    <Search_field name="search" value=(S.get value) on_change=(S.set set_value)>
      <Label>"Search"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input class_="w-[280px]" placeholder="Search..." />
        <Search_field.Clear_button />
      </Search_field.Group>
      <Description>
        (Jsx.string
           ("Current value: "
           ^ match S.get value with "" -> "(empty)" | v -> v))
      </Description>
    </Search_field>
    <div class_="flex gap-2">
      <Button variant=`tertiary on_click=(fun _ -> S.set set_value "")>
        "Clear"
      </Button>
      <Button
        variant=`tertiary on_click=(fun _ -> S.set set_value "example query")>
        "Set example"
      </Button>
    </div>
  </div>
```

### Form Example

Complete form integration with validation and submission handling.
HeroUI's button takes `isPending` while the search is sent; the port's button has no pending state yet, so this one shows the spinner alone.

```ocaml title="search_field_form.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Show = Solidtype.Show
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Label = Solidtype_heroui.Label
module Search_field = Solidtype_heroui.Search_field
module Spinner = Solidtype_heroui.Spinner

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

let min_length = 3

let make () =
  let value, set_value = S.create_signal "" in
  let is_submitting, set_is_submitting = S.create_signal false in
  let is_invalid () =
    let n = String.length (S.get value) in
    n > 0 && n < min_length
  in
  let handle_submit e =
    prevent_default e;
    if String.length (S.get value) >= min_length then (
      S.set set_is_submitting true;
      (* Simulate API call *)
      ignore
        (Js.Global.setTimeout
           ~f:(fun () ->
             Js.log2 "Search submitted, query:" (S.get value);
             S.set set_value "";
             S.set set_is_submitting false)
           1500
          : Js.Global.timeoutId))
  in
  <Form class_="flex w-[280px] flex-col gap-4" on_submit=handle_submit>
    <Search_field
      is_required=true
      is_invalid=(is_invalid ())
      name="search"
      value=(S.get value)
      on_change=(S.set set_value)>
      <Label>"Search products"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input class_="w-full" placeholder="Search products..." />
        <Search_field.Clear_button />
      </Search_field.Group>
      <Show
        when_=(is_invalid ())
        fallback=(<Description>
                    (Jsx.string
                       ("Enter at least " ^ string_of_int min_length
                      ^ " characters to search"))
                  </Description>)>
        <Field_error>
          (Jsx.string
             ("Search query must be at least " ^ string_of_int min_length
            ^ " characters"))
        </Field_error>
      </Show>
    </Search_field>
    <Button
      class_="w-full"
      is_disabled=(String.length (S.get value) < min_length)
      type_=`submit
      variant=`primary>
      <Show when_=(not (S.get is_submitting))>"Search"</Show>
      <Show when_=(S.get is_submitting)>
        <Spinner color=`current size=`sm /> "Searching..."
      </Show>
    </Button>
  </Form>
```

### With Validation

Implement custom validation logic with controlled values.

```ocaml title="search_field_with_validation.mlx"
module S = Solidtype.Solid
module Show = Solidtype.Show
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Search_field = Solidtype_heroui.Search_field

let make () =
  let value, set_value = S.create_signal "" in
  let is_invalid () =
    let n = String.length (S.get value) in
    n > 0 && n < 3
  in
  <div class_="flex flex-col gap-4">
    <Search_field
      is_required=true
      is_invalid=(is_invalid ())
      name="search"
      value=(S.get value)
      on_change=(S.set set_value)>
      <Label>"Search"</Label>
      <Search_field.Group>
        <Search_field.Search_icon />
        <Search_field.Input class_="w-[280px]" placeholder="Search..." />
        <Search_field.Clear_button />
      </Search_field.Group>
      <Show
        when_=(is_invalid ())
        fallback=(<Description>
                    "Enter at least 3 characters to search"
                  </Description>)>
        <Field_error>"Search query must be at least 3 characters"</Field_error>
      </Show>
    </Search_field>
  </div>
```

### Custom Icons

Customize the search icon and clear button icons.

```ocaml title="search_field_custom_icons.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Search_field = Solidtype_heroui.Search_field
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-col gap-4">
    <Search_field name="search-custom">
      <Label>"Search (Custom Icons)"</Label>
      <Search_field.Group>
        <Search_field.Search_icon><Gravity.Funnel /></Search_field.Search_icon>
        <Search_field.Input class_="w-[280px]" placeholder="Search..." />
        <Search_field.Clear_button>
          <Gravity.Circle_xmark_fill />
        </Search_field.Clear_button>
      </Search_field.Group>
      <Description>"Custom icon children"</Description>
    </Search_field>
  </div>
```

### With Keyboard Shortcut

Add keyboard shortcuts to quickly focus the search field.

```ocaml title="search_field_keyboard_shortcut.mlx"
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description
module Kbd = Solidtype_heroui.Kbd
module Label = Solidtype_heroui.Label
module Search_field = Solidtype_heroui.Search_field

type window

external window : window = "window"

type controller
type signal
type listening

external controller : unit -> controller = "AbortController" [@@mel.new]
external signal : controller -> signal = "signal" [@@mel.get]
external abort : controller -> unit = "abort" [@@mel.send]
external listening : signal:signal -> unit -> listening = "" [@@mel.obj]

(* A listener that stays until its signal aborts. *)
external add_key_down :
  window ->
  (_[@mel.as "keydown"]) ->
  ((Dom.keyboardEvent -> unit)[@mel.uncurry]) ->
  listening ->
  unit = "addEventListener"
[@@mel.send]

external key : Dom.keyboardEvent -> string = "key" [@@mel.get]
external shift_key : Dom.keyboardEvent -> bool = "shiftKey" [@@mel.get]
external meta_key : Dom.keyboardEvent -> bool = "metaKey" [@@mel.get]
external ctrl_key : Dom.keyboardEvent -> bool = "ctrlKey" [@@mel.get]
external alt_key : Dom.keyboardEvent -> bool = "altKey" [@@mel.get]

external prevent_default : Dom.keyboardEvent -> unit = "preventDefault"
[@@mel.send]

external query : Dom.htmlDivElement -> string -> Dom.htmlElement Js.null
  = "querySelector"
[@@mel.send]

external active_element : Dom.htmlElement Js.null = "activeElement"
[@@mel.scope "document"]

external focus : Dom.htmlElement -> unit = "focus" [@@mel.send]
external blur : Dom.htmlElement -> unit = "blur" [@@mel.send]

let make () =
  let value, set_value = S.create_signal "" in
  (* The element around the field, whose input a key focuses. *)
  let around = ref None in
  let handle_key_down e =
    let input =
      Option.bind !around (fun d -> Js.Null.toOption (query d "input"))
    in
    (* Check for Shift+S *)
    if
      shift_key e
      && String.equal (key e) "S"
      && not (meta_key e || ctrl_key e || alt_key e)
    then (
      prevent_default e;
      Option.iter focus input);
    (* Check for ESC key to blur the input *)
    match (key e, input, Js.Null.toOption active_element) with
    | "Escape", Some i, Some active when i == active -> blur i
    | _ -> ()
  in
  S.on_mount (fun () ->
      let c = controller () in
      add_key_down window handle_key_down (listening ~signal:(signal c) ());
      S.on_cleanup (fun () -> abort c));
  <div class_="flex flex-col gap-4">
    <div ref=(fun d -> around := Some d)>
      <Search_field
        name="search" value=(S.get value) on_change=(S.set set_value)>
        <Label>"Search"</Label>
        <Search_field.Group>
          <Search_field.Search_icon />
          <Search_field.Input class_="w-[280px]" placeholder="Search..." />
          <Search_field.Clear_button />
        </Search_field.Group>
        <Description>
          "Use keyboard shortcut to quickly focus this field"
        </Description>
      </Search_field>
    </div>
    <div class_="text-default-500 flex items-center gap-2 text-sm">
      <span>"Press"</span>
      <Kbd><Kbd.Abbr key_value=`shift /> <Kbd.Content>"S"</Kbd.Content></Kbd>
      <span>"to focus the search field"</span>
    </div>
  </div>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="search_field_tailwind.mlx"
module Label = Solidtype_heroui.Label
module Search_field = Solidtype_heroui.Search_field

let make () =
  <Search_field class_="w-full max-w-64" name="docs" variant=`secondary>
    <Label class_="font-medium text-foreground">"Search docs"</Label>
    <Search_field.Group class_="rounded-xl bg-default">
      <Search_field.Search_icon class_="text-muted" />
      <Search_field.Input
        class_="placeholder:text-muted" placeholder="Components, guides..."
      />
      <Search_field.Clear_button class_="text-muted" />
    </Search_field.Group>
  </Search_field>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base Classes

- `.search-field` - Root container with minimal styling (`flex flex-col
  gap-1`)
- `.search-field__group` - Container for search icon, input, and clear button
  with border and background styling
- `.search-field__input` - The search input field
- `.search-field__search-icon` - The search icon displayed on the left
- `.search-field__clear-button` - Button to clear the search field

#### Variant Classes

- `.search-field--primary` - Primary variant with shadow (default)
- `.search-field--secondary` - Secondary variant without shadow, suitable for
  use in surfaces
- `.search-field--full-width` - Full width modifier

Child components ([Label](label.md),
[Description](description.md),
[FieldError](field-error.md)) have their own CSS classes and
styling. See their respective documentation for customization options.

### Interactive States

SearchField automatically manages these data attributes based on its state:

- **Invalid**: `[data-invalid="true"]` - Automatically hides the description
  slot when invalid
- **Disabled**: `[data-disabled="true"]` - Applied when `is_disabled` is true
- **Focus Within**: `[data-focus-within="true"]` - Applied when the input is
  focused
- **Focus Visible**: `[data-focus-visible="true"]` - Applied when focus is
  visible (keyboard navigation)
- **Hovered**: `[data-hovered="true"]` - Applied when hovering over the group
- **Empty**: `[data-empty="true"]` - Applied when the field is empty (hides
  clear button)

## API Reference

Each prop beside the name HeroUI's React component gives it.

### SearchField

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | `` `primary `` | Visual variant of the component. `` `primary `` is the default style with shadow. `` `secondary `` is a lower emphasis variant without shadow, suitable for use in surfaces |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the search field should take full width of its container |
| `value` | `value` | `string` | | Current value (controlled) |
| `defaultValue` | `default_value` | `string` | `""` | Default value (uncontrolled) |
| `onChange` | `on_change` | `string -> unit` | | Handler called when the value changes |
| `onSubmit` | `on_submit` | `string -> unit` | | Handler called when the user submits the search (Enter key) |
| `onClear` | `on_clear` | `unit -> unit` | | Handler called when the clear button is pressed, or Escape clears it |
| `isDisabled` | `is_disabled` | `bool` | | Whether the input is disabled; else as its fieldset is |
| `isInvalid` | `is_invalid` | `bool` | `false` | Whether the value is invalid |
| `isReadOnly` | `is_read_only` | `bool` | `false` | Whether the input can be selected but not changed |
| `isRequired` | `is_required` | `bool` | `false` | Whether user input is required before form submission |
| `name` | `name` | `string` | | Name of the input element, for HTML form submission |
| `aria-label` | `aria_label` | `string` | | Accessibility label when no visible label is present |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `onBlur` | `on_blur` | `Dom.focusEvent -> unit` | | Called once focus leaves it for an element outside it |

### SearchField.Group, SearchIcon, Input, ClearButton

- **Search_field.Group** - Container for search icon, input, and clear button
- **Search_field.Input** - The search input field; takes a `placeholder`,
  displayed when the input is empty
- **Search_field.Search_icon** - The search icon displayed on the left; its
  `children`, a custom icon element, replace the default search icon
- **Search_field.Clear_button** - Button to clear the search field; its
  `children`, an icon or content, replace the default close icon

Each takes `class_`, added after HeroUI's class.
