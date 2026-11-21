# InputGroup

Group related input controls with prefix and suffix elements for enhanced form fields.

Original HeroUI documentation: [InputGroup](https://heroui.com/en/docs/react/components/input-group).

## Usage

HeroUI's examples, with HeroUI's icons from [`solidtype-gravity-icons`](../heroui.md#icons).

```ocaml title="input_group_usage.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Text_field class_="w-full max-w-[280px]" name="email">
    <Label>"Email address"</Label>
    <Input_group>
      <Input_group.Prefix>
        <Gravity.Envelope class_="size-4 text-muted" />
      </Input_group.Prefix>
      <Input_group.Input
        class_="w-full max-w-[280px]" placeholder="name@email.com"
      />
    </Input_group>
  </Text_field>
```

## Parity

The same HeroUI InputGroup twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two groups: a
marked row is one they disagree on.

## Anatomy

```ocaml
<Text_field>
  <Label>"Website"</Label>
  <Input_group>
    <Input_group.Prefix>"https://"</Input_group.Prefix>
    <Input_group.Input /> (* or Input_group.Text_area for multiline input *)
    <Input_group.Suffix>".com"</Input_group.Suffix>
  </Input_group>
</Text_field>
```

`Input_group` wraps an input field with optional prefix and suffix elements,
creating a visually cohesive group. It's typically used within
[TextField](text-field.md) to add icons, text, buttons, or
other elements before or after the input. Use `Input_group.Input` for
single-line inputs or `Input_group.Text_area` for multiline text inputs. A
click on the group outside its input focuses the input.

## Examples

### Variants

The InputGroup component supports two visual variants:

- **`` `primary ``** (default) - Standard styling with shadow, suitable for
  most use cases
- **`` `secondary ``** - Lower emphasis variant without shadow, suitable for
  use in Surface components

```ocaml title="input_group_variants.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-col gap-4">
    <Text_field class_="w-[280px]" name="primary">
      <Label>"Primary variant"</Label>
      <Input_group variant=`primary>
        <Input_group.Prefix>
          <Gravity.Envelope class_="size-4 text-muted" />
        </Input_group.Prefix>
        <Input_group.Input placeholder="name@email.com" />
      </Input_group>
    </Text_field>
    <Text_field class_="w-[280px]" name="secondary">
      <Label>"Secondary variant"</Label>
      <Input_group variant=`secondary>
        <Input_group.Prefix>
          <Gravity.Envelope class_="size-4 text-muted" />
        </Input_group.Prefix>
        <Input_group.Input placeholder="name@email.com" />
      </Input_group>
    </Text_field>
  </div>
```

### In Surface

When used inside a [Surface](surface.md) component, use
`` variant=`secondary `` to apply the lower emphasis variant suitable for
surface backgrounds.

```ocaml title="input_group_surface.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Surface = Solidtype_heroui.Surface
module Gravity = Solidtype_gravity_icons

let make () =
  <Surface class_="rounded-2xl p-6">
    <Text_field class_="w-full max-w-[280px]" name="email">
      <Label>"Email address"</Label>
      <Input_group variant=`secondary>
        <Input_group.Prefix>
          <Gravity.Envelope class_="size-4 text-muted" />
        </Input_group.Prefix>
        <Input_group.Input
          class_="w-full max-w-[280px]" placeholder="name@email.com"
        />
      </Input_group>
      <Description>"We'll never share this with anyone else"</Description>
    </Text_field>
  </Surface>
```

### Loading State

Show a loading spinner in the suffix to indicate processing.

```ocaml title="input_group_loading.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Spinner = Solidtype_heroui.Spinner

let make () =
  <Text_field
    class_="w-full max-w-[280px]" default_value="Sending..." name="status">
    <Input_group>
      <Input_group.Input class_="w-full max-w-[280px]" />
      <Input_group.Suffix><Spinner class_="size-4" /></Input_group.Suffix>
    </Input_group>
  </Text_field>
```

### Required Field

InputGroup respects the required state from its parent TextField.

```ocaml title="input_group_required.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-col gap-4">
    <Text_field is_required=true class_="w-full max-w-[280px]" name="email">
      <Label>"Email address"</Label>
      <Input_group>
        <Input_group.Prefix>
          <Gravity.Envelope class_="size-4 text-muted" />
        </Input_group.Prefix>
        <Input_group.Input
          class_="w-full max-w-[280px]" placeholder="name@email.com"
        />
      </Input_group>
    </Text_field>
    <Text_field is_required=true class_="w-full max-w-[280px]" name="price">
      <Label>"Set a price"</Label>
      <Input_group>
        <Input_group.Prefix>"$"</Input_group.Prefix>
        <Input_group.Input
          class_="w-full max-w-[200px]" placeholder="0" type_="number"
        />
        <Input_group.Suffix>"USD"</Input_group.Suffix>
      </Input_group>
      <Description>"What customers would pay"</Description>
    </Text_field>
  </div>
```

### Disabled State

InputGroup respects the disabled state from its parent TextField.

```ocaml title="input_group_disabled.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-col gap-4">
    <Text_field
      is_disabled=true
      class_="w-full max-w-[280px]"
      default_value="name@email.com"
      name="email">
      <Label>"Email address"</Label>
      <Input_group>
        <Input_group.Prefix>
          <Gravity.Envelope class_="size-4 text-muted" />
        </Input_group.Prefix>
        <Input_group.Input class_="w-full max-w-[280px]" />
      </Input_group>
    </Text_field>
    <Text_field
      is_disabled=true
      class_="w-full max-w-[280px]"
      default_value="10"
      name="price">
      <Label>"Set a price"</Label>
      <Input_group>
        <Input_group.Prefix>"$"</Input_group.Prefix>
        <Input_group.Input class_="w-full max-w-[200px]" type_="number" />
        <Input_group.Suffix>"USD"</Input_group.Suffix>
      </Input_group>
    </Text_field>
  </div>
```

### Full Width

```ocaml title="input_group_full_width.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="w-[400px] space-y-4">
    <Text_field full_width=true name="email">
      <Label>"Email address"</Label>
      <Input_group full_width=true>
        <Input_group.Prefix>
          <Gravity.Envelope class_="size-4 text-muted" />
        </Input_group.Prefix>
        <Input_group.Input placeholder="name@email.com" />
      </Input_group>
    </Text_field>
    <Text_field full_width=true name="password">
      <Label>"Password"</Label>
      <Input_group full_width=true>
        <Input_group.Input placeholder="Enter password" type_="password" />
        <Input_group.Suffix>
          <Gravity.Eye class_="size-4 text-muted" />
        </Input_group.Suffix>
      </Input_group>
    </Text_field>
  </div>
```

### Text Prefix

Use text as a prefix, such as currency symbols or protocol prefixes.

```ocaml title="input_group_text_prefix.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field

let make () =
  <Text_field
    class_="w-full max-w-[280px]" default_value="heroui.com" name="website">
    <Label>"Website"</Label>
    <Input_group>
      <Input_group.Prefix>"https://"</Input_group.Prefix>
      <Input_group.Input class_="w-full max-w-[280px]" />
    </Input_group>
  </Text_field>
```

### Text Suffix

Use text as a suffix, such as domain extensions or units.

```ocaml title="input_group_text_suffix.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field

let make () =
  <Text_field
    class_="w-full max-w-[280px]" default_value="heroui" name="website">
    <Label>"Website"</Label>
    <Input_group>
      <Input_group.Input class_="w-full max-w-[280px]" />
      <Input_group.Suffix>".com"</Input_group.Suffix>
    </Input_group>
  </Text_field>
```

### Icon Prefix and Text Suffix

Combine an icon prefix with a text suffix.

```ocaml title="input_group_icon_prefix_text_suffix.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Text_field
    class_="w-full max-w-[280px]" default_value="heroui" name="website">
    <Label>"Website"</Label>
    <Input_group>
      <Input_group.Prefix>
        <Gravity.Globe class_="size-4 text-muted" />
      </Input_group.Prefix>
      <Input_group.Input class_="w-full max-w-[280px]" />
      <Input_group.Suffix>".com"</Input_group.Suffix>
    </Input_group>
  </Text_field>
```

### Copy Button Suffix

Add an interactive button in the suffix, such as a copy button.

```ocaml title="input_group_copy_suffix.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Button = Solidtype_heroui.Button
module Gravity = Solidtype_gravity_icons

let make () =
  <Text_field
    class_="w-full max-w-[280px]" default_value="heroui.com" name="website">
    <Label>"Website"</Label>
    <Input_group>
      <Input_group.Input class_="w-full max-w-[280px]" />
      <Input_group.Suffix class_="pe-0">
        <Button is_icon_only=true aria_label="Copy" size=`sm variant=`ghost>
          <Gravity.Copy class_="size-4" />
        </Button>
      </Input_group.Suffix>
    </Input_group>
  </Text_field>
```

### Icon Prefix and Copy Button

Combine an icon prefix with an interactive button suffix.

```ocaml title="input_group_icon_prefix_copy_suffix.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Button = Solidtype_heroui.Button
module Gravity = Solidtype_gravity_icons

let make () =
  <Text_field
    class_="w-full max-w-[280px]" default_value="heroui.com" name="website">
    <Label>"Website"</Label>
    <Input_group>
      <Input_group.Prefix>
        <Gravity.Globe class_="size-4 text-muted" />
      </Input_group.Prefix>
      <Input_group.Input class_="w-full max-w-[280px]" />
      <Input_group.Suffix class_="pe-0">
        <Button is_icon_only=true aria_label="Copy" size=`sm variant=`ghost>
          <Gravity.Copy class_="size-4" />
        </Button>
      </Input_group.Suffix>
    </Input_group>
  </Text_field>
```

### Password Toggle

Use a button in the suffix to toggle password visibility.

```ocaml title="input_group_password.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Gravity = Solidtype_gravity_icons

let make () =
  let visible, set_visible = S.create_signal false in
  <Text_field class_="w-full max-w-[280px]" name="password">
    <Label>"Password"</Label>
    <Input_group>
      <Input_group.Input
        class_="w-full max-w-[280px]"
        type_=(if S.get visible then "text" else "password")
        value=(if S.get visible then "87$2h.3diua" else {js|••••••••|js})
      />
      <Input_group.Suffix class_="pe-0">
        <Button
          is_icon_only=true
          aria_label=(if S.get visible then "Hide password" else "Show password")
          size=`sm
          variant=`ghost
          on_click=(fun _ -> S.set set_visible (not (S.get visible)))>
          (if S.get visible then <Gravity.Eye class_="size-4" />
           else <Gravity.Eye_slash class_="size-4" />)
        </Button>
      </Input_group.Suffix>
    </Input_group>
  </Text_field>
```

### Keyboard Shortcut

Display keyboard shortcuts using the [Kbd](kbd.md) component.

```ocaml title="input_group_shortcut.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Kbd = Solidtype_heroui.Kbd

let make () =
  <Text_field class_="w-full max-w-[280px]" name="command">
    <Input_group>
      <Input_group.Input
        aria_label="Command" class_="w-full max-w-[280px]" placeholder="Command"
      />
      <Input_group.Suffix class_="pe-2">
        <Kbd>
          <Kbd.Abbr key_value=`command /> <Kbd.Content>"K"</Kbd.Content>
        </Kbd>
      </Input_group.Suffix>
    </Input_group>
  </Text_field>
```

### Badge Suffix

Add a badge or chip in the suffix to show status or labels.

```ocaml title="input_group_badge_suffix.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Chip = Solidtype_heroui.Chip

let make () =
  <Text_field class_="w-full max-w-[280px]" name="email">
    <Input_group>
      <Input_group.Input
        aria_label="Email address"
        class_="w-full max-w-[280px]"
        placeholder="Email address"
      />
      <Input_group.Suffix class_="pe-2">
        <Chip color=`accent size=`md variant=`soft>"Pro"</Chip>
      </Input_group.Suffix>
    </Input_group>
  </Text_field>
```

### Validation

InputGroup automatically reflects invalid state from its parent TextField.

```ocaml title="input_group_invalid.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Field_error = Solidtype_heroui.Field_error
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-col gap-4">
    <Text_field
      is_invalid=true
      is_required=true
      class_="w-full max-w-[280px]"
      name="email">
      <Label>"Email address"</Label>
      <Input_group>
        <Input_group.Prefix>
          <Gravity.Envelope class_="size-4 text-muted" />
        </Input_group.Prefix>
        <Input_group.Input
          class_="w-full max-w-[280px]" placeholder="name@email.com"
        />
      </Input_group>
      <Field_error>"Please enter a valid email address"</Field_error>
    </Text_field>
    <Text_field
      is_invalid=true
      is_required=true
      class_="w-full max-w-[280px]"
      name="price">
      <Label>"Set a price"</Label>
      <Input_group>
        <Input_group.Prefix>"$"</Input_group.Prefix>
        <Input_group.Input
          class_="w-full max-w-[200px]" placeholder="0" type_="number"
        />
        <Input_group.Suffix>"USD"</Input_group.Suffix>
      </Input_group>
      <Field_error>"Price must be greater than 0"</Field_error>
    </Text_field>
  </div>
```

### With Prefix Icon

Add an icon before the input field.

```ocaml title="input_group_prefix_icon.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Text_field class_="w-full max-w-[280px]" name="email">
    <Label>"Email address"</Label>
    <Input_group>
      <Input_group.Prefix>
        <Gravity.Envelope class_="size-4 text-muted" />
      </Input_group.Prefix>
      <Input_group.Input
        class_="w-full max-w-[280px]" placeholder="name@email.com"
      />
    </Input_group>
    <Description>"We'll never share this with anyone else"</Description>
  </Text_field>
```

### With Suffix Icon

Add an icon after the input field.

```ocaml title="input_group_suffix_icon.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Text_field class_="w-full max-w-[280px]" name="email">
    <Label>"Email address"</Label>
    <Input_group>
      <Input_group.Input
        class_="w-full max-w-[280px]" placeholder="name@email.com"
      />
      <Input_group.Suffix>
        <Gravity.Envelope class_="size-4 text-muted" />
      </Input_group.Suffix>
    </Input_group>
    <Description>"We don't send spam"</Description>
  </Text_field>
```

### With Prefix and Suffix

Combine both prefix and suffix elements.

```ocaml title="input_group_prefix_suffix.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field

let make () =
  <Text_field class_="w-full max-w-[280px]" default_value="10" name="price">
    <Label>"Set a price"</Label>
    <Input_group>
      <Input_group.Prefix>"$"</Input_group.Prefix>
      <Input_group.Input class_="w-full max-w-[200px]" type_="number" />
      <Input_group.Suffix>"USD"</Input_group.Suffix>
    </Input_group>
    <Description>"What customers would pay"</Description>
  </Text_field>
```

### With TextArea

Use `Input_group.Text_area` for multiline text inputs with prefix and suffix
elements. When a textarea is present, the container automatically adjusts its
height to accommodate the content and aligns prefix/suffix elements to the
top.

```ocaml title="input_group_text_area.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Spinner = Solidtype_heroui.Spinner
module Gravity = Solidtype_gravity_icons

let make () =
  let value, set_value = S.create_signal "" in
  let submitting, set_submitting = S.create_signal false in
  let empty () = String.equal (String.trim (S.get value)) "" in
  let submit _ =
    if not (empty ()) then begin
      S.set set_submitting true;
      ignore
        (Js.Global.setTimeout
           ~f:(fun () ->
             S.set set_submitting false;
             S.set set_value "")
           1000
          : Js.Global.timeoutId)
    end
  in
  <Text_field
    full_width=true
    class_="flex w-sm flex-col sm:w-lg"
    name="prompt"
    value=(S.get value)
    on_change=(S.set set_value)>
    <Input_group full_width=true class_="flex flex-col gap-2 rounded-3xl py-2">
      <Input_group.Prefix class_="px-3 py-0">
        <Button aria_label="Add context" size=`sm variant=`outline>
          <Gravity.At /> "Add Context"
        </Button>
      </Input_group.Prefix>
      <Input_group.Text_area
        aria_label="Prompt input"
        class_="w-full resize-none px-3.5 py-0"
        placeholder="Assign tasks or ask anything..."
        rows="5"
      />
      <Input_group.Suffix class_="flex w-full items-center gap-1.5 px-3 py-0">
        <Button
          is_icon_only=true aria_label="Attach file" size=`sm variant=`tertiary>
          <Gravity.Plus />
        </Button>
        <Button
          is_icon_only=true aria_label="Connect Apps" size=`sm variant=`tertiary>
          <Gravity.Plug_connection />
        </Button>
        <div class_="ms-auto flex items-center gap-1.5">
          <Button
            is_icon_only=true aria_label="Voice input" size=`sm variant=`ghost>
            <Gravity.Microphone />
          </Button>
          <Button
            is_icon_only=true
            aria_label="Send prompt"
            is_disabled=(empty ())
            on_click=submit>
            (if S.get submitting then <Spinner color=`current size=`sm />
             else <Gravity.Arrow_up />)
          </Button>
        </div>
      </Input_group.Suffix>
    </Input_group>
  </Text_field>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="input_group_tailwind.mlx"
module Description = Solidtype_heroui.Description
module Input_group = Solidtype_heroui.Input_group
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Text_field class_="w-full max-w-xs" name="email">
    <Label>"Work email"</Label>
    <Input_group
      class_="rounded-xl border border-border/80 bg-default shadow-sm">
      <Input_group.Prefix>
        <Gravity.Envelope class_="size-4 text-muted" />
      </Input_group.Prefix>
      <Input_group.Input placeholder="you@company.com" />
    </Input_group>
  </Text_field>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.input-group` - Root container with border, background, and flex layout,
  switching to top alignment when a textarea is present
- `.input-group__input` - Input element with transparent background and no
  border, also the base class for textarea elements
- `.input-group__prefix` - Prefix container with left border radius
- `.input-group__suffix` - Suffix container with right border radius
- `.input-group--primary` - Primary variant with shadow (default)
- `.input-group--secondary` - Secondary variant without shadow, suitable for
  use in surfaces
- `.input-group--full-width` - Full width modifier

With `Input_group.Text_area`, the container grows with its content and the
prefix and suffix align to the top. The textarea's own styles, a minimum
height and vertical resize, apply through
`[data-slot="input-group-textarea"]`.

### Interactive States

InputGroup automatically manages these data attributes based on its state:

- **Hover**: `[data-hovered="true"]` - Applied when hovering over the group
- **Focus within**: `[data-focus-within="true"]` - Applied when the input is
  focused
- **Focus visible**: `[data-focus-visible="true"]`
- **Disabled**: `[data-disabled="true"]` - Applied when it or its parent
  TextField is disabled
- **Invalid**: `[data-invalid="true"]` - Applied when it or its parent
  TextField is invalid

## API Reference

Each prop beside the name HeroUI's React component gives it.

### InputGroup

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | its field's, else `` `primary `` | Visual variant of the component. `` `primary `` is the default style with shadow. `` `secondary `` is a lower emphasis variant without shadow, suitable for use in surfaces |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the input group should take full width of its container |
| `isDisabled` | `is_disabled` | `bool` | its field's | Whether it is shown disabled |
| `isInvalid` | `is_invalid` | `bool` | its field's | Whether it is shown invalid |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### InputGroup.Input, InputGroup.TextArea

Each takes every attribute its element takes, as [Input](input.md) and
[TextArea](text-area.md) do.

### InputGroup.Prefix, InputGroup.Suffix

Each takes `class_`, added after HeroUI's class, and its children: the
content to display in the prefix or suffix (icons, text, buttons, badges,
etc.).
