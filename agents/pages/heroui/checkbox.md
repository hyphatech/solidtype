# Checkbox

Checkboxes allow users to select multiple items from a list of individual items, or to mark one individual item as selected.

Original HeroUI documentation: [Checkbox](https://heroui.com/en/docs/react/components/checkbox).

## Usage

HeroUI's examples.

```ocaml title="checkbox_usage.mlx"
module Checkbox = Solidtype_heroui.Checkbox

let make () =
  <Checkbox name="basic-terms">
    <Checkbox.Content>
      <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
      "Accept terms and conditions"
    </Checkbox.Content>
  </Checkbox>
```

## Parity

The same HeroUI Checkbox twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of the two contents: a
marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

## Anatomy

```ocaml
<Checkbox>
  <Checkbox.Content>
    <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
    "Label"
  </Checkbox.Content>
  <Description>"Optional field-level help text"</Description>
  <Field_error>"Optional validation message"</Field_error>
</Checkbox>
```

Plain text in `Checkbox.Content` is the clickable label and the checkbox's
accessible name. `Description` and `Field_error` are optional.

## Examples

### Variants

The Checkbox component supports two visual variants:

- **`` `primary ``** (default) - Standard styling with default background,
  suitable for most use cases
- **`` `secondary ``** - Lower emphasis variant, suitable for use in Surface
  components

```ocaml title="checkbox_variants.mlx"
module Checkbox = Solidtype_heroui.Checkbox
module Description = Solidtype_heroui.Description

let make () =
  <div class_="flex flex-col gap-4">
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">"Primary variant"</p>
      <Checkbox name="primary" variant=`primary>
        <Checkbox.Content>
          <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
          "Primary checkbox"
        </Checkbox.Content>
        <Description>"Standard styling with default background"</Description>
      </Checkbox>
    </div>
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">"Secondary variant"</p>
      <Checkbox name="secondary" variant=`secondary>
        <Checkbox.Content>
          <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
          "Secondary checkbox"
        </Checkbox.Content>
        <Description>"Lower emphasis variant for use in surfaces"</Description>
      </Checkbox>
    </div>
  </div>
```

### Full Rounded

```ocaml title="checkbox_rounded.mlx"
module Checkbox = Solidtype_heroui.Checkbox
module Label = Solidtype_heroui.Label

let make () =
  <div class_="flex flex-col gap-6">
    <div class_="flex flex-col gap-3">
      <Label class_="text-muted">"Rounded checkboxes"</Label>
      <Checkbox
        class_="[&_[data-slot='checkbox-default-indicator--checkmark']]:size-2"
        name="small-rounded">
        <Checkbox.Content>
          <Checkbox.Control class_="size-3 rounded-full before:rounded-full">
            <Checkbox.Indicator />
          </Checkbox.Control>
          "Small size"
        </Checkbox.Content>
      </Checkbox>
    </div>
    <div class_="flex flex-col gap-3">
      <Checkbox name="default-rounded">
        <Checkbox.Content>
          <Checkbox.Control class_="size-4 rounded-full before:rounded-full">
            <Checkbox.Indicator />
          </Checkbox.Control>
          "Default size"
        </Checkbox.Content>
      </Checkbox>
    </div>
    <div class_="flex flex-col gap-3">
      <Checkbox name="large-rounded">
        <Checkbox.Content>
          <Checkbox.Control class_="size-5 rounded-full before:rounded-full">
            <Checkbox.Indicator />
          </Checkbox.Control>
          "Large size"
        </Checkbox.Content>
      </Checkbox>
    </div>
    <div class_="flex flex-col gap-3">
      <Checkbox
        class_="[&_[data-slot='checkbox-default-indicator--checkmark']]:size-4"
        name="xl-rounded">
        <Checkbox.Content>
          <Checkbox.Control class_="size-6 rounded-full before:rounded-full">
            <Checkbox.Indicator />
          </Checkbox.Control>
          "Extra large size"
        </Checkbox.Content>
      </Checkbox>
    </div>
  </div>
```

### Disabled

```ocaml title="checkbox_disabled.mlx"
module Checkbox = Solidtype_heroui.Checkbox
module Description = Solidtype_heroui.Description

let make () =
  <Checkbox is_disabled=true>
    <Checkbox.Content>
      <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
      "Premium Feature"
    </Checkbox.Content>
    <Description>"This feature is coming soon"</Description>
  </Checkbox>
```

### External Label

The checkbox does not take an `id` yet, so a `Label` outside it cannot name
it: here its `aria_label` says what the label says.

```ocaml title="checkbox_external_label.mlx"
module Checkbox = Solidtype_heroui.Checkbox
module Label = Solidtype_heroui.Label

(* HeroUI's label names the checkbox by its id, which the port's checkbox
   does not take yet: it is named as the label is. *)
let make () =
  <div class_="flex items-center gap-3">
    <Checkbox aria_label="Send me marketing emails">
      <Checkbox.Content>
        <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
      </Checkbox.Content>
    </Checkbox>
    <Label>"Send me marketing emails"</Label>
  </div>
```

### With Description

```ocaml title="checkbox_description.mlx"
module Checkbox = Solidtype_heroui.Checkbox
module Description = Solidtype_heroui.Description

let make () =
  <Checkbox name="description-notifications">
    <Checkbox.Content>
      <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
      "Email notifications"
    </Checkbox.Content>
    <Description>
      "Get notified when someone mentions you in a comment"
    </Description>
  </Checkbox>
```

### Default Selected

```ocaml title="checkbox_default_selected.mlx"
module Checkbox = Solidtype_heroui.Checkbox

let make () =
  <Checkbox default_selected=true>
    <Checkbox.Content>
      <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
      "Enable email notifications"
    </Checkbox.Content>
  </Checkbox>
```

### Invalid

```ocaml title="checkbox_invalid.mlx"
module Checkbox = Solidtype_heroui.Checkbox
module Field_error = Solidtype_heroui.Field_error

let make () =
  <Checkbox is_invalid=true is_required=true name="agreement">
    <Checkbox.Content>
      <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
      "I agree to the terms"
    </Checkbox.Content>
    <Field_error>"You must accept the terms to continue"</Field_error>
  </Checkbox>
```

### Controlled

```ocaml title="checkbox_controlled.mlx"
module Checkbox = Solidtype_heroui.Checkbox
module S = Solidtype.Solid

let make () =
  let selected, set_selected = S.create_signal true in
  <div class_="flex flex-col gap-3">
    <Checkbox is_selected=(S.get selected) on_change=(S.set set_selected)>
      <Checkbox.Content>
        <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
        "Email notifications"
      </Checkbox.Content>
    </Checkbox>
    <p class_="text-sm text-muted">
      "Status: "
      <span class_="font-medium">
        (Solidtype.Jsx.string
           (if S.get selected then "Enabled" else "Disabled"))
      </span>
    </p>
  </div>
```

### Indeterminate

```ocaml title="checkbox_indeterminate.mlx"
module Checkbox = Solidtype_heroui.Checkbox
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description

let make () =
  let indeterminate, set_indeterminate = S.create_signal true in
  let selected, set_selected = S.create_signal false in
  <Checkbox
    is_indeterminate=(S.get indeterminate)
    is_selected=(S.get selected)
    on_change=(fun v ->
                S.set set_selected v;
                S.set set_indeterminate false)>
    <Checkbox.Content>
      <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control> "Select all"
    </Checkbox.Content>
    <Description>"Shows indeterminate state (dash icon)"</Description>
  </Checkbox>
```

### Form Integration

```ocaml title="checkbox_form.mlx"
module Button = Solidtype_heroui.Button
module Checkbox = Solidtype_heroui.Checkbox

type form_data

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]
external target : Dom.event -> Dom.element = "target" [@@mel.get]
external form_data : Dom.element -> form_data = "FormData" [@@mel.new]

external entries : form_data -> (string * string) array = "from"
[@@mel.scope "Array"]

external alert : string -> unit = "alert"

let submit e =
  prevent_default e;
  let lines =
    form_data (target e)
    |> entries
    |> Array.map (fun (key, value) -> key ^ ": " ^ value)
    |> Array.to_list |> String.concat "\n"
  in
  alert ("Form submitted with:\n" ^ lines)

let item ?(selected = false) ~name ~text () =
  <Checkbox default_selected=selected name value="on">
    <Checkbox.Content>
      <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
      (Solidtype.Jsx.string text)
    </Checkbox.Content>
  </Checkbox>

let make () =
  <form class_="flex flex-col gap-4" on_submit=submit>
    <div class_="flex flex-col gap-3">
      (item ~name:"notifications" ~text:"Enable notifications" ())
      (item ~selected:true ~name:"newsletter" ~text:"Subscribe to newsletter" ())
      (item ~name:"marketing" ~text:"Receive marketing updates" ())
    </div>
    <Button class_="mt-4" size=`sm type_=`submit variant=`primary>
      "Submit"
    </Button>
  </form>
```

### Render Props

A function child is given the checkbox's state.

```ocaml title="checkbox_render_props.mlx"
module Checkbox = Solidtype_heroui.Checkbox
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description

let make () =
  <Checkbox>
    (fun s ->
      Solidtype.Jsx.fragment
        [|
          <Checkbox.Content>
            <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
            (Solidtype.Jsx.string
               (if S.get s.is_selected then "Terms accepted" else "Accept terms"))
          </Checkbox.Content>;
          <Description>
            (Solidtype.Jsx.string
               (if S.get s.is_selected then "Thank you for accepting"
                else "Please read and accept the terms"))
          </Description>;
        |])
  </Checkbox>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

### Custom Indicator

An icon given to `Checkbox.Indicator` shows only while the box is checked.

```ocaml title="checkbox_custom_indicator.mlx"
module Checkbox = Solidtype_heroui.Checkbox

(* HeroUI draws each icon only while the box is checked, by a render prop;
   HeroUI's styles show an indicator's content only then, so it is given as it
   is. *)
let make () =
  <div class_="flex gap-4">
    <Checkbox default_selected=true name="heart">
      <Checkbox.Content>
        <Checkbox.Control>
          <Checkbox.Indicator>
            <svg fill="currentColor" view_box="0 0 24 24">
              <path
                d="M12.62 20.81c-.34.12-.9.12-1.24 0C8.48 19.82 2 15.69 2 8.69 \
                   2 5.6 4.49 3.1 7.56 3.1c1.82 0 3.43.88 4.44 2.24a5.53 5.53 \
                   0 0 1 4.44-2.24C19.51 3.1 22 5.6 22 8.69c0 7-6.48 \
                   11.13-9.38 12.12Z"
                fill="currentColor"
              />
            </svg>
          </Checkbox.Indicator>
        </Checkbox.Control>
        "Heart"
      </Checkbox.Content>
    </Checkbox>
    <Checkbox default_selected=true name="plus">
      <Checkbox.Content>
        <Checkbox.Control>
          <Checkbox.Indicator>
            <svg fill="none" view_box="0 0 24 24">
              <path
                d="M6 12H18"
                stroke="currentColor"
                stroke_linecap="round"
                stroke_linejoin="round"
                stroke_width="3"
              />
              <path
                d="M12 18V6"
                stroke="currentColor"
                stroke_linecap="round"
                stroke_linejoin="round"
                stroke_width="3"
              />
            </svg>
          </Checkbox.Indicator>
        </Checkbox.Control>
        "Plus"
      </Checkbox.Content>
    </Checkbox>
    <Checkbox is_indeterminate=true name="indeterminate">
      <Checkbox.Content>
        <Checkbox.Control>
          <Checkbox.Indicator>
            <svg stroke="currentColor" stroke_width="3" view_box="0 0 24 24">
              <line x1="21" x2="3" y1="12" y2="12" />
            </svg>
          </Checkbox.Indicator>
        </Checkbox.Control>
        "Indeterminate"
      </Checkbox.Content>
    </Checkbox>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="checkbox_tailwind.mlx"
module Checkbox = Solidtype_heroui.Checkbox

let make () =
  <Checkbox>
    <Checkbox.Content>
      <Checkbox.Control class_="bg-success-soft before:bg-success">
        <Checkbox.Indicator
          class_="**:data-[slot=checkbox-default-indicator--checkmark]:text-success-foreground"
        />
      </Checkbox.Control>
      "Custom styled checkbox"
    </Checkbox.Content>
  </Checkbox>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every one, as with
HeroUI in React:

```css
@layer components {
  .checkbox__control {
    @apply rounded-full;
  }
}
```

## Styling Reference

### CSS Classes

- `.checkbox` - Base checkbox container (the field)
- `.checkbox__content` - Clickable label wrapping the control and label text
- `.checkbox__control` - Checkbox control box
- `.checkbox__indicator` - Checkbox checkmark indicator
- `.checkbox--primary`, `.checkbox--secondary` - Variants

### Interactive States

The checkbox supports both CSS pseudo-classes and data attributes for
flexibility:

- **Selected**: `[data-selected="true"]` or `[aria-checked="true"]` (shows
  checkmark and background color change)
- **Indeterminate**: `[data-indeterminate="true"]` (shows indeterminate state
  with dash)
- **Invalid**: `[data-invalid="true"]` or `[aria-invalid="true"]` (shows error
  state with danger colors)
- **Hover**: `:hover` or `[data-hovered="true"]`
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]` (shows focus
  ring on control)
- **Disabled**: `[data-disabled="true"]` (reduced opacity, including help
  text)
- **Pressed**: `:active` or `[data-pressed="true"]`

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Checkbox

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | `` `primary `` | Visual variant of the component. `` `secondary `` is a lower emphasis variant, suitable for use in surfaces. |
| `isSelected` | `is_selected` | `bool` | | Whether the checkbox is checked (controlled) |
| `defaultSelected` | `default_selected` | `bool` | `false` | Whether the checkbox is checked by default (uncontrolled) |
| `isIndeterminate` | `is_indeterminate` | `bool` | `false` | Whether the checkbox is in an indeterminate state |
| `onChange` | `on_change` | `bool -> unit` | | Handler called when the checkbox value changes |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the checkbox is disabled |
| `isInvalid` | `is_invalid` | `bool` | `false` | Whether the checkbox is invalid |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `onBlur` | `on_blur` | `Dom.focusEvent -> unit` | | Called once focus leaves it for an element outside it |
| `children` | `children` | elements | | Checkbox content, or a function of its state |
| `isReadOnly` | `is_read_only` | `bool` | `false` | Whether the checkbox is read only |
| `isRequired` | `is_required` | `bool` | `false` | Whether the checkbox must be selected |
| `name` | `name` | `string` | | The name of the input element, used when submitting an HTML form |
| `value` | `value` | `string` | | The value of the input element, used when submitting an HTML form |
| `aria-label` | `aria_label` | `string` | | Its name where no label names it |
| `slot` | `slot` | `` [ `selection ] `` | | The checkbox of the part above it: a table row's, or all of a table's rows in its header |

### Checkbox.Content, Checkbox.Control and Checkbox.Indicator

`Checkbox.Content` is the clickable label that wraps the control and label
text. Keep `Description` and `Field_error` as siblings of `Checkbox.Content`.
For a checkbox with no label, pass an `aria_label` on `Checkbox`.

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's class |
| `children` | `children` | elements | What it holds; the indicator's own mark when given |
