# CheckboxGroup

A checkbox group component for managing multiple checkbox selections.

Original HeroUI documentation: [CheckboxGroup](https://heroui.com/en/docs/react/components/checkbox-group).

## Usage

```ocaml title="checkbox_group_usage.mlx"
module Checkbox = Solidtype_heroui.Checkbox
module Checkbox_group = Solidtype_heroui.Checkbox_group
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label

let make () =
  <Checkbox_group name="interests">
    <Label>"Select your interests"</Label>
    <Description>"Choose all that apply"</Description>
    <Checkbox value="coding">
      <Checkbox.Content>
        <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control> "Coding"
      </Checkbox.Content>
      <Description>"Love building software"</Description>
    </Checkbox>
    <Checkbox value="design">
      <Checkbox.Content>
        <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control> "Design"
      </Checkbox.Content>
      <Description>"Enjoy creating beautiful interfaces"</Description>
    </Checkbox>
    <Checkbox value="writing">
      <Checkbox.Content>
        <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control> "Writing"
      </Checkbox.Content>
      <Description>"Passionate about content creation"</Description>
    </Checkbox>
  </Checkbox_group>
```

## Parity

The same HeroUI CheckboxGroup twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two groups: a
marked row is one they disagree on.

## Anatomy

```ocaml
<Checkbox_group name="interests">
  <Label>"Interests"</Label>
  <Description>"Optional"</Description>
  <Checkbox value="option1">
    <Checkbox.Content>
      <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control> "Label"
    </Checkbox.Content>
    <Description>"Optional per-checkbox help text"</Description>
  </Checkbox>
</Checkbox_group>
```

The group's `Label` names it, and its `Description` describes it and each
checkbox. A checkbox's own `Description` describes that checkbox alone. Plain
text in `Checkbox.Content` is the checkbox's clickable label.

## Examples

### In Surface

When used inside a [`Surface`](surface.md), use
`` variant=`secondary `` to apply the lower emphasis variant suitable for
surface backgrounds. Each checkbox takes it.

```ocaml title="checkbox_group_surface.mlx"
module Checkbox = Solidtype_heroui.Checkbox
module Checkbox_group = Solidtype_heroui.Checkbox_group
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Surface = Solidtype_heroui.Surface

let make () =
  <Surface class_="w-full max-w-sm rounded-3xl p-6">
    <Checkbox_group name="notifications" variant=`secondary>
      <Label>"Notifications"</Label>
      <Checkbox value="email">
        <Checkbox.Content>
          <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control> "Email"
        </Checkbox.Content>
      </Checkbox>
      <Checkbox value="sms">
        <Checkbox.Content>
          <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control> "SMS"
        </Checkbox.Content>
      </Checkbox>
      <Checkbox value="push">
        <Checkbox.Content>
          <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
          "Push notifications"
        </Checkbox.Content>
      </Checkbox>
    </Checkbox_group>
  </Surface>
```

### Disabled

```ocaml title="checkbox_group_disabled.mlx"
module Checkbox = Solidtype_heroui.Checkbox
module Checkbox_group = Solidtype_heroui.Checkbox_group
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label

let make () =
  <Checkbox_group is_disabled=true name="disabled-features">
    <Label>"Features"</Label>
    <Description>"Feature selection is temporarily disabled"</Description>
    <Checkbox value="feature1">
      <Checkbox.Content>
        <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control> "Feature 1"
      </Checkbox.Content>
      <Description>"This feature is coming soon"</Description>
    </Checkbox>
    <Checkbox value="feature2">
      <Checkbox.Content>
        <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control> "Feature 2"
      </Checkbox.Content>
      <Description>"This feature is coming soon"</Description>
    </Checkbox>
  </Checkbox_group>
```

### Controlled

```ocaml title="checkbox_group_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Checkbox = Solidtype_heroui.Checkbox
module Checkbox_group = Solidtype_heroui.Checkbox_group
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label

let make () =
  let selected, set_selected = S.create_signal [ "coding"; "design" ] in
  <Checkbox_group
    class_="min-w-[320px]"
    name="skills"
    value=(S.get selected)
    on_change=(S.set set_selected)>
    <Label>"Your skills"</Label>
    <Checkbox value="coding">
      <Checkbox.Content>
        <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control> "Coding"
      </Checkbox.Content>
    </Checkbox>
    <Checkbox value="design">
      <Checkbox.Content>
        <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control> "Design"
      </Checkbox.Content>
    </Checkbox>
    <Checkbox value="writing">
      <Checkbox.Content>
        <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control> "Writing"
      </Checkbox.Content>
    </Checkbox>
    <Label class_="my-4 text-sm text-muted">
      (Jsx.string
         ("Selected: "
         ^
         match S.get selected with
         | [] -> "None"
         | values -> String.concat ", " values))
    </Label>
  </Checkbox_group>
```

### Validation

A group validates nothing itself, as no field here does: it is invalid as
`is_invalid` says, here once a submit finds nothing chosen, and its
`Field_error` shows while it is.

```ocaml title="checkbox_group_validation.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Show = Solidtype.Show
module Button = Solidtype_heroui.Button
module Checkbox = Solidtype_heroui.Checkbox
module Checkbox_group = Solidtype_heroui.Checkbox_group
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Label = Solidtype_heroui.Label

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

let make () =
  let chosen, set_chosen = S.create_signal [] in
  let tried, set_tried = S.create_signal false in
  let sent, set_sent = S.create_signal None in
  <Form
    class_="flex flex-col gap-4 px-4"
    on_submit=(fun e ->
                prevent_default e;
                S.set set_tried true;
                S.set set_sent
                  (match S.get chosen with
                  | [] -> None
                  | values ->
                      Some ("Selected preferences: " ^ String.concat ", " values)))>
    <Checkbox_group
      is_required=true
      is_invalid=(S.get tried && List.is_empty (S.get chosen))
      name="preferences"
      value=(S.get chosen)
      on_change=(S.set set_chosen)>
      <Label>"Preferences"</Label>
      <Checkbox value="email">
        <Checkbox.Content>
          <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
          "Email notifications"
        </Checkbox.Content>
      </Checkbox>
      <Checkbox value="sms">
        <Checkbox.Content>
          <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
          "SMS notifications"
        </Checkbox.Content>
      </Checkbox>
      <Checkbox value="push">
        <Checkbox.Content>
          <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
          "Push notifications"
        </Checkbox.Content>
      </Checkbox>
      <Field_error>
        "Please select at least one notification method."
      </Field_error>
    </Checkbox_group>
    <Button type_=`submit>"Submit"</Button>
    <Show.Some some=(S.get sent)>
      (fun m -> <p class_="text-sm text-muted">(Jsx.string (S.get m))</p>)
    </Show.Some>
  </Form>
```

## Styling Reference

### CSS Classes

- `.checkbox-group` - Base checkbox group container
- `.checkbox-group--primary`, `.checkbox-group--secondary` - Variants

### Interactive States

- **Disabled**: `[data-disabled="true"]`
- **Invalid**: `[data-invalid="true"]`

## API Reference

Each prop beside the name HeroUI's React component gives it.

### CheckboxGroup

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | `` `primary `` | Its checkboxes' variant, where they set none |
| `value` | `value` | `string list` | | The current selected values (controlled) |
| `defaultValue` | `default_value` | `string list` | `[]` | The default selected values (uncontrolled) |
| `onChange` | `on_change` | `string list -> unit` | | Handler called when the selected values change |
| `isDisabled` | `is_disabled` | `bool` | | Whether the checkbox group is disabled, else as its fieldset is |
| `isInvalid` | `is_invalid` | `bool` | `false` | Whether the checkbox group is in an invalid state |
| `isReadOnly` | `is_read_only` | `bool` | `false` | Whether the checkbox group is read only |
| `isRequired` | `is_required` | `bool` | `false` | Whether the checkbox group is required |
| `name` | `name` | `string` | | The name of the checkbox group, used when submitting an HTML form |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `onBlur` | `on_blur` | `Dom.focusEvent -> unit` | | Called once focus leaves it for an element outside it |
| `children` | `children` | elements | | Checkbox group content |
