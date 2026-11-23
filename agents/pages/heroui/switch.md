# Switch

A toggle switch component for boolean states.

Space toggles a focused switch; Enter does not.

Original HeroUI documentation: [Switch](https://heroui.com/en/docs/react/components/switch).

## Usage

```ocaml title="switch_usage.mlx"
module Switch = Solidtype_heroui.Switch
module Label = Solidtype_heroui.Label

let make () =
  <Switch>
    <Switch.Content>
      <Switch.Control><Switch.Thumb /></Switch.Control>
      <Label>"Enable notifications"</Label>
    </Switch.Content>
  </Switch>
```

## Parity

The same HeroUI Switch twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of the two contents: a
marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

## Anatomy

```ocaml
<Switch>
  <Switch.Content>
    <Switch.Control>
      <Switch.Thumb />
    </Switch.Control>
    <Label />
  </Switch.Content>
</Switch>
```

`Switch.Content` is the clickable area: the control and its label. For
grouping multiple switches, use the `Switch_group` component:

```ocaml
<Switch_group>
  <Switch>
    <Switch.Content>
      <Switch.Control><Switch.Thumb /></Switch.Control>
      <Label>"Option 1"</Label>
    </Switch.Content>
  </Switch>
  <Switch>
    <Switch.Content>
      <Switch.Control><Switch.Thumb /></Switch.Control>
      <Label>"Option 2"</Label>
    </Switch.Content>
  </Switch>
</Switch_group>
```

## Examples

### Sizes

```ocaml title="switch_sizes.mlx"
module Switch = Solidtype_heroui.Switch
module Label = Solidtype_heroui.Label

let make () =
  <div class_="flex gap-6">
    <Switch size=`sm>
      <Switch.Content>
        <Switch.Control><Switch.Thumb /></Switch.Control> <Label>"Small"</Label>
      </Switch.Content>
    </Switch>
    <Switch size=`md>
      <Switch.Content>
        <Switch.Control><Switch.Thumb /></Switch.Control>
        <Label>"Medium"</Label>
      </Switch.Content>
    </Switch>
    <Switch size=`lg>
      <Switch.Content>
        <Switch.Control><Switch.Thumb /></Switch.Control> <Label>"Large"</Label>
      </Switch.Content>
    </Switch>
  </div>
```

### With Icons

A `Switch.Icon` in the thumb, drawn of the switch's state.

```ocaml title="switch_with_icons.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Switch = Solidtype_heroui.Switch
module Gravity = Solidtype_gravity_icons

type icon = Jsx.element

let switches : (string * (unit -> icon) * (unit -> icon) * string) array =
  [|
    ( "check",
      (fun () -> <Gravity.Check class_="size-3 text-inherit opacity-100" />),
      (fun () -> <Gravity.Power class_="size-3 text-inherit opacity-70" />),
      "bg-green-500/80" );
    ( "darkMode",
      (fun () -> <Gravity.Sun class_="size-3 text-inherit opacity-100" />),
      (fun () -> <Gravity.Moon class_="size-3 text-inherit opacity-70" />),
      "" );
    ( "microphone",
      (fun () ->
        <Gravity.Microphone_slash class_="size-3 text-inherit opacity-100" />),
      (fun () -> <Gravity.Microphone class_="size-3 text-inherit opacity-70" />),
      "bg-red-500/80" );
    ( "notification",
      (fun () -> <Gravity.Bell_fill class_="size-3 text-inherit opacity-100" />),
      (fun () -> <Gravity.Bell_slash class_="size-3 text-inherit opacity-70" />),
      "bg-purple-500/80" );
    ( "volume",
      (fun () ->
        <Gravity.Volume_slash_fill class_="size-3 text-inherit opacity-100" />),
      (fun () ->
        <Gravity.Volume_fill class_="size-3 text-inherit opacity-70" />),
      "bg-blue-500/80" );
  |]

let make () =
  <div class_="flex gap-3">
    <For each=switches>
      (fun (name, on, off, selected_class) _ ->
        <Switch default_selected=true aria_label=name size=`lg>
          (fun s ->
            <Switch.Content>
              <Switch.Control
                class_=(if S.get s.is_selected then selected_class else "")>
                <Switch.Thumb>
                  <Switch.Icon>
                    (if S.get s.is_selected then on () else off ())
                  </Switch.Icon>
                </Switch.Thumb>
              </Switch.Control>
            </Switch.Content>)
        </Switch>)
    </For>
  </div>
```

### Disabled

```ocaml title="switch_disabled.mlx"
module Switch = Solidtype_heroui.Switch
module Label = Solidtype_heroui.Label

let make () =
  <Switch is_disabled=true>
    <Switch.Content>
      <Switch.Control><Switch.Thumb /></Switch.Control>
      <Label>"Enable notifications"</Label>
    </Switch.Content>
  </Switch>
```

### Default Selected

```ocaml title="switch_default_selected.mlx"
module Switch = Solidtype_heroui.Switch
module Label = Solidtype_heroui.Label

let make () =
  <Switch default_selected=true>
    <Switch.Content>
      <Switch.Control><Switch.Thumb /></Switch.Control>
      <Label>"Enable notifications"</Label>
    </Switch.Content>
  </Switch>
```

### Controlled

```ocaml title="switch_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Switch = Solidtype_heroui.Switch
module Label = Solidtype_heroui.Label

let make () =
  let on, set_on = S.create_signal false in
  <div class_="flex flex-col gap-3">
    <Switch is_selected=(S.get on) on_change=(S.set set_on)>
      <Switch.Content>
        <Switch.Control><Switch.Thumb /></Switch.Control>
        <Label>"Enable notifications"</Label>
      </Switch.Content>
    </Switch>
    <p class_="text-sm text-muted">
      "Switch is " (Jsx.string (if S.get on then "on" else "off"))
    </p>
  </div>
```

### Without Label

```ocaml title="switch_without_label.mlx"
module Switch = Solidtype_heroui.Switch

let make () =
  <Switch aria_label="Enable notifications">
    <Switch.Content>
      <Switch.Control><Switch.Thumb /></Switch.Control>
    </Switch.Content>
  </Switch>
```

### With Description

```ocaml title="switch_with_description.mlx"
module Description = Solidtype_heroui.Description
module Switch = Solidtype_heroui.Switch

let make () =
  <div class_="max-w-sm">
    <Switch>
      <Switch.Content>
        <Switch.Control><Switch.Thumb /></Switch.Control> "Public profile"
      </Switch.Content>
      <Description>"Allow others to see your profile information"</Description>
    </Switch>
  </div>
```

### Label Position

```ocaml title="switch_label_position.mlx"
module Switch = Solidtype_heroui.Switch
module Label = Solidtype_heroui.Label

let make () =
  <div class_="flex flex-col gap-4">
    <Switch>
      <Switch.Content>
        <Switch.Control><Switch.Thumb /></Switch.Control>
        <Label>"Label after"</Label>
      </Switch.Content>
    </Switch>
    <Switch>
      <Switch.Content>
        <Label>"Label before"</Label>
        <Switch.Control><Switch.Thumb /></Switch.Control>
      </Switch.Content>
    </Switch>
  </div>
```

### Group

`Switch_group` lays switches out together; each switch keeps its own state.

```ocaml title="switch_group.mlx"
module Switch = Solidtype_heroui.Switch
module Switch_group = Solidtype_heroui.Switch_group

let make () =
  <Switch_group>
    <Switch name="notifications">
      <Switch.Content>
        <Switch.Control><Switch.Thumb /></Switch.Control> "Allow Notifications"
      </Switch.Content>
    </Switch>
    <Switch name="marketing">
      <Switch.Content>
        <Switch.Control><Switch.Thumb /></Switch.Control> "Marketing emails"
      </Switch.Content>
    </Switch>
    <Switch name="social">
      <Switch.Content>
        <Switch.Control><Switch.Thumb /></Switch.Control> "Social media updates"
      </Switch.Content>
    </Switch>
  </Switch_group>
```

### Group Horizontal

```ocaml title="switch_group_horizontal.mlx"
module Switch = Solidtype_heroui.Switch
module Switch_group = Solidtype_heroui.Switch_group

let make () =
  <Switch_group orientation=`horizontal>
    <Switch name="notifications">
      <Switch.Content>
        <Switch.Control><Switch.Thumb /></Switch.Control> "Allow Notifications"
      </Switch.Content>
    </Switch>
    <Switch name="marketing">
      <Switch.Content>
        <Switch.Control><Switch.Thumb /></Switch.Control> "Marketing emails"
      </Switch.Content>
    </Switch>
    <Switch name="social">
      <Switch.Content>
        <Switch.Control><Switch.Thumb /></Switch.Control> "Social media updates"
      </Switch.Content>
    </Switch>
  </Switch_group>
```

### Form Integration

A switch's `name` and `value` are its form's while it is on.

```ocaml title="switch_form_integration.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Show = Solidtype.Show
module Button = Solidtype_heroui.Button
module Form = Solidtype_heroui.Form
module Switch = Solidtype_heroui.Switch
module Switch_group = Solidtype_heroui.Switch_group

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

external current_target : Dom.event -> Dom.htmlFormElement = "currentTarget"
[@@mel.get]

type form_data

external form_data : Dom.htmlFormElement -> form_data = "FormData" [@@mel.new]

type entries

external entries : form_data -> entries = "entries" [@@mel.send]

(* Each entry a pair, its name and its value, as JavaScript gives it. *)
external listed : entries -> (string * string) array = "from"
[@@mel.scope "Array"]

let make () =
  let sent, set_sent = S.create_signal None in
  <Form
    class_="flex flex-col gap-4"
    on_submit=(fun e ->
                prevent_default e;
                let fields =
                  listed (entries (form_data (current_target e)))
                  |> Array.map (fun (key, value) -> key ^ ": " ^ value)
                in
                S.set set_sent
                  (Some
                     ("Form submitted with: "
                     ^ String.concat ", " (Array.to_list fields))))>
    <Switch_group>
      <Switch name="notifications" value="on">
        <Switch.Content>
          <Switch.Control><Switch.Thumb /></Switch.Control>
          "Enable notifications"
        </Switch.Content>
      </Switch>
      <Switch default_selected=true name="newsletter" value="on">
        <Switch.Content>
          <Switch.Control><Switch.Thumb /></Switch.Control>
          "Subscribe to newsletter"
        </Switch.Content>
      </Switch>
      <Switch name="marketing" value="on">
        <Switch.Content>
          <Switch.Control><Switch.Thumb /></Switch.Control>
          "Receive marketing updates"
        </Switch.Content>
      </Switch>
    </Switch_group>
    <Button class_="mt-4" size=`sm type_=`submit variant=`primary>
      "Submit"
    </Button>
    <Show.Some some=(S.get sent)>
      (fun m -> <p class_="text-sm text-muted">(Jsx.string (S.get m))</p>)
    </Show.Some>
  </Form>
```

### Render Props

A function child is given the switch's state.

```ocaml title="switch_render_props.mlx"
module Switch = Solidtype_heroui.Switch
module Label = Solidtype_heroui.Label
module S = Solidtype.Solid

let make () =
  <Switch>
    (fun s ->
      <Switch.Content>
        <Switch.Control><Switch.Thumb /></Switch.Control>
        <Label>
          (Solidtype.Jsx.string (if S.get s.is_selected then "On" else "Off"))
        </Label>
      </Switch.Content>)
  </Switch>
```

### Render Function

`as_` draws another element in a part's place, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every one, as with
HeroUI in React:

```css
@layer components {
  .switch__control {
    @apply bg-default;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Switch Classes

- `.switch` - Base switch container
- `.switch__content` - Content container
- `.switch__control` - Switch control track
- `.switch__thumb` - Switch thumb that moves
- `.switch__icon` - An icon in the thumb
- `.switch--sm` - Small size variant
- `.switch--md` - Medium size variant (default)
- `.switch--lg` - Large size variant

#### SwitchGroup Classes

- `.switch-group` - Switch group container
- `.switch-group__items` - Container for switch items
- `.switch-group--horizontal` - Horizontal layout
- `.switch-group--vertical` - Vertical layout (default)

### Interactive States

The switch supports both CSS pseudo-classes and data attributes for
flexibility:

- **Selected**: `[data-selected="true"]`, on the switch and its content (thumb
  position and background color change)
- **Hover**: `:hover` or `[data-hovered="true"]`
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]` (shows focus
  ring)
- **Disabled**: `[data-disabled="true"]` (reduced opacity, no pointer events)
- **Pressed**: `:active` or `[data-pressed="true"]`

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Switch

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | `` `md `` | The size of the switch |
| `isSelected` | `is_selected` | `bool` | | Whether the switch is on (controlled) |
| `defaultSelected` | `default_selected` | `bool` | `false` | Whether the switch is on by default (uncontrolled) |
| `onChange` | `on_change` | `bool -> unit` | | Handler called when the switch value changes |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the switch is disabled |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `onBlur` | `on_blur` | `Dom.focusEvent -> unit` | | Called once focus leaves it for an element outside it |
| `children` | `children` | elements | | Switch content or render function |
| `isReadOnly` | `is_read_only` | `bool` | `false` | Whether the switch is read only |
| `isRequired` | `is_required` | `bool` | `false` | Whether the switch must be selected |
| `name` | `name` | `string` | | The name of the input element, used when submitting an HTML form |
| `value` | `value` | `string` | | The value of the input element, used when submitting an HTML form, while it is on |
| `aria-label` | `aria_label` | `string` | | Its name where no label names it |
| `isInvalid` | `is_invalid` | `bool` | `false` | Whether the switch is invalid |

### Switch.Content, Switch.Control, Switch.Thumb and Switch.Icon

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's class |
| `children` | `children` | elements | What it holds: the thumb an icon, the icon what it draws |

### SwitchGroup

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `orientation` | `orientation` | `` [ `horizontal \| `vertical ] `` | `` `vertical `` | The orientation of the switch group |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | The switch items to render |
