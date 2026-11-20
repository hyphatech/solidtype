# Fieldset

Group related form controls with legends, descriptions, and actions.

Original HeroUI documentation: [Fieldset](https://heroui.com/en/docs/react/components/fieldset).

## Usage

```ocaml title="fieldset_usage.mlx"
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Fieldset = Solidtype_heroui.Fieldset
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_area = Solidtype_heroui.Text_area
module Text_field = Solidtype_heroui.Text_field

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

let make () =
  <form class_="w-full max-w-96" on_submit=(fun e -> prevent_default e)>
    <Fieldset>
      <Fieldset.Legend>"Profile Settings"</Fieldset.Legend>
      <Description>"Update your profile information."</Description>
      <Fieldset.Group>
        <Text_field is_required=true name="name">
          <Label>"Name"</Label> <Input placeholder="John Doe" />
        </Text_field>
        <Text_field is_required=true name="email">
          <Label>"Email"</Label>
          <Input type_="email" placeholder="john@example.com" />
        </Text_field>
        <Text_field is_required=true name="bio">
          <Label>"Bio"</Label>
          <Text_area placeholder="Tell us about yourself..." />
          <Description>"Minimum 10 characters"</Description>
        </Text_field>
      </Fieldset.Group>
      <Fieldset.Actions>
        <Button type_=`submit>"Save changes"</Button>
        <Button type_=`reset variant=`secondary>"Cancel"</Button>
      </Fieldset.Actions>
    </Fieldset>
  </form>
```

## Parity

The same HeroUI Fieldset twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two buttons
it holds: a marked row is one they disagree on.

## Anatomy

```ocaml
<Fieldset>
  <Fieldset.Legend>"Profile"</Fieldset.Legend>
  <Fieldset.Group>(* form fields go here *)</Fieldset.Group>
  <Fieldset.Actions>(* action buttons go here *)</Fieldset.Actions>
</Fieldset>
```

## Examples

### In Surface

When used inside a [Surface](surface.md) component, use
`` variant=`secondary `` on form controls (`Input`, `Text_area`, etc.) to
apply the lower emphasis variant suitable for surface backgrounds.

```ocaml title="fieldset_surface.mlx"
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Fieldset = Solidtype_heroui.Fieldset
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_area = Solidtype_heroui.Text_area
module Text_field = Solidtype_heroui.Text_field
module Surface = Solidtype_heroui.Surface

let make () =
  <div class_="flex items-center justify-center rounded-3xl bg-surface p-6">
    <Surface class_="w-full min-w-[380px]">
      <Fieldset class_="w-full">
        <Fieldset.Legend>"Profile Settings"</Fieldset.Legend>
        <Description>"Update your profile information."</Description>
        <Fieldset.Group>
          <Text_field is_required=true name="name">
            <Label>"Name"</Label>
            <Input placeholder="John Doe" variant=`secondary />
          </Text_field>
          <Text_field is_required=true name="email">
            <Label>"Email"</Label>
            <Input
              type_="email" placeholder="john@example.com" variant=`secondary
            />
          </Text_field>
          <Text_field is_required=true name="bio">
            <Label>"Bio"</Label>
            <Text_area
              placeholder="Tell us about yourself..." variant=`secondary
            />
            <Description>"Minimum 10 characters"</Description>
          </Text_field>
        </Fieldset.Group>
        <Fieldset.Actions>
          <Button type_=`submit>"Save changes"</Button>
          <Button type_=`reset variant=`tertiary>"Cancel"</Button>
        </Fieldset.Actions>
      </Fieldset>
    </Surface>
  </div>
```

### Disabled

A component's own `is_disabled` is its own: the fieldset's Help button stays
enabled.

```ocaml title="fieldset_disabled.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Fieldset = Solidtype_heroui.Fieldset
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_area = Solidtype_heroui.Text_area
module Text_field = Solidtype_heroui.Text_field
module Switch = Solidtype_heroui.Switch

let make () =
  let disabled, set_disabled = S.create_signal true in
  <div class_="flex w-full max-w-96 flex-col gap-4">
    <Switch is_selected=(S.get disabled) on_change=(S.set set_disabled)>
      <Switch.Content>
        <Switch.Control><Switch.Thumb /></Switch.Control>
        <Label>"Disable the fieldset"</Label>
      </Switch.Content>
    </Switch>
    <Fieldset disabled=(S.get disabled)>
      <Fieldset.Legend>"Notifications"</Fieldset.Legend>
      <Fieldset.Group>
        <Text_field name="address">
          <Label>"Email"</Label>
          <Input type_="email" placeholder="john@example.com" />
        </Text_field>
      </Fieldset.Group>
      <Fieldset.Actions>
        <Button>"Save"</Button>
        <Button is_disabled=false variant=`secondary>"Help"</Button>
      </Fieldset.Actions>
    </Fieldset>
  </div>
```

### Not yet

HeroUI's examples validate each field with a `validate` function, which the
port does not take yet; the port's examples use required fields.

## Customization

### Global CSS

Use the `@layer components` directive to target Fieldset
[BEM](https://bem.info/en/methodology/)-style classes.

```css
@layer components {
  .fieldset {
    @apply gap-6 rounded-lg border p-6;
  }

  .fieldset__legend {
    @apply text-2xl font-bold;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.fieldset` - Root container
- `.fieldset__legend` - Legend element
- `.fieldset__field-group` - Wrapper for grouped fields
- `.fieldset__actions` - Action bar below the fields

### Interactive States

- **Disabled**: `[data-disabled="true"]`, from which HeroUI's styles show
  the fields inside disabled

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Fieldset

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `disabled` | `disabled` | `bool` | `false` | Whether it and what is inside it are disabled |
| `name` | `name` | `string` | | Its name in a form |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Fieldset content (legend, groups, descriptions, actions) |

### Fieldset.Legend, Fieldset.Group, Fieldset.Actions

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's class |
| `children` | `children` | elements | Its content |

## Note

- A disabled fieldset disables the `Button`s, `Link`s and `Radio_group`s
  inside it, as well as native inputs
- A component's own `is_disabled` overrides the fieldset's
