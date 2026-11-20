# NumberStepper

A number between two round buttons, which rolls to each new value.

A [NumberField](number-field.md) drawn as two round buttons
around its value, which rolls to each new number. Its value, range, step,
format and keys are the field's: Tab reaches it, the arrows step it, and text
typed in it takes the value's place until it is committed. Its look is a
stylesheet the library ships, imported as
[Theming](theming.md#setup) shows.

## Usage

```ocaml title="number_stepper_usage.mlx"
module Number_stepper = Solidtype_heroui.Number_stepper

let make () =
  <Number_stepper aria_label="Quantity" default_value=1. min_value=0.>
    <Number_stepper.Group>
      <Number_stepper.Decrement_button />
      <Number_stepper.Value />
      <Number_stepper.Increment_button />
    </Number_stepper.Group>
  </Number_stepper>
```

## Anatomy

```ocaml
<Number_stepper aria_label="Quantity">
  <Number_stepper.Group>
    <Number_stepper.Decrement_button />
    <Number_stepper.Value />
    <Number_stepper.Increment_button />
  </Number_stepper.Group>
</Number_stepper>
```

## Examples

### Guest Picker

```ocaml title="number_stepper_guest_picker.mlx"
module Number_stepper = Solidtype_heroui.Number_stepper
module Separator = Solidtype_heroui.Separator

let guests =
  [|
    ("Adults", "Ages 13 or above");
    ("Children", {js|Ages 2–12|js});
    ("Infants", "Under 2");
    ("Pets", "Bringing a service animal?");
  |]

let make () =
  <div class_="flex w-full max-w-sm flex-col">
    (Solidtype.Jsx.fragment
       (Array.mapi
          (fun i (name, ages) ->
            <div>
              (if i > 0 then <Separator /> else Solidtype.Jsx.string "")
              <div class_="flex items-center justify-between py-4">
                <div class_="flex flex-col">
                  <span class_="text-sm font-medium">
                    (Solidtype.Jsx.string name)
                  </span>
                  <span class_="text-xs text-muted">
                    (Solidtype.Jsx.string ages)
                  </span>
                </div>
                <Number_stepper
                  aria_label=name size=`sm default_value=0. min_value=0.>
                  <Number_stepper.Group>
                    <Number_stepper.Decrement_button />
                    <Number_stepper.Value />
                    <Number_stepper.Increment_button />
                  </Number_stepper.Group>
                </Number_stepper>
              </div>
            </div>)
          guests))
  </div>
```

### Controlled

`value` and `on_change` keep the value in the application.

```ocaml title="number_stepper_controlled.mlx"
module S = Solidtype.Solid
module Number_stepper = Solidtype_heroui.Number_stepper

let make () =
  let value, set_value = S.create_signal 5. in
  <div class_="flex flex-col items-center gap-3">
    <Number_stepper
      aria_label="Quantity"
      value=(S.get value)
      on_change=(S.set set_value)
      min_value=0.>
      <Number_stepper.Group>
        <Number_stepper.Decrement_button />
        <Number_stepper.Value />
        <Number_stepper.Increment_button />
      </Number_stepper.Group>
    </Number_stepper>
    <p class_="text-sm text-muted">
      (Solidtype.Jsx.string ("Value: " ^ Js.Float.toString (S.get value)))
    </p>
  </div>
```

### Custom Icons

A button's children take the place of its plus or minus.

```ocaml title="number_stepper_custom_icons.mlx"
module Number_stepper = Solidtype_heroui.Number_stepper
module Gravity = Solidtype_gravity_icons

let make () =
  <Number_stepper
    aria_label="Zoom level"
    default_value=100.
    min_value=10.
    max_value=400.
    step=10.>
    <Number_stepper.Group>
      <Number_stepper.Decrement_button>
        <Gravity.Magnifier_minus />
      </Number_stepper.Decrement_button>
      <Number_stepper.Value />
      <Number_stepper.Increment_button>
        <Gravity.Magnifier_plus />
      </Number_stepper.Increment_button>
    </Number_stepper.Group>
  </Number_stepper>
```

### Custom Value

`Number_stepper.Value` given a function draws the value itself, from what it
would show.

```ocaml title="number_stepper_custom_value.mlx"
module Number_stepper = Solidtype_heroui.Number_stepper

let make () =
  <Number_stepper aria_label="Quantity" default_value=3. min_value=0.>
    <Number_stepper.Group>
      <Number_stepper.Decrement_button />
      <Number_stepper.Value>
        (fun shown ->
          <span class_="mx-2">
            (Solidtype.Jsx.string
               (Js.Float.toString shown.value
               ^ if Float.equal shown.value 1. then " item" else " items"))
          </span>)
      </Number_stepper.Value>
      <Number_stepper.Increment_button />
    </Number_stepper.Group>
  </Number_stepper>
```

### Disabled

```ocaml title="number_stepper_disabled.mlx"
module Number_stepper = Solidtype_heroui.Number_stepper

let make () =
  <Number_stepper aria_label="Quantity" default_value=3. is_disabled=true>
    <Number_stepper.Group>
      <Number_stepper.Decrement_button />
      <Number_stepper.Value />
      <Number_stepper.Increment_button />
    </Number_stepper.Group>
  </Number_stepper>
```

### Min Max Values

A button is disabled at its bound.

```ocaml title="number_stepper_min_max.mlx"
module Number_stepper = Solidtype_heroui.Number_stepper

let bounded ~name ~caption ~min ~max ~value =
  <div class_="flex flex-col items-center gap-2">
    <span class_="text-xs text-muted">(Solidtype.Jsx.string caption)</span>
    <Number_stepper
      aria_label=name default_value=value min_value=min max_value=max>
      <Number_stepper.Group>
        <Number_stepper.Decrement_button />
        <Number_stepper.Value />
        <Number_stepper.Increment_button />
      </Number_stepper.Group>
    </Number_stepper>
  </div>

let make () =
  <div class_="flex flex-col items-center gap-4">
    (bounded ~name:"Rating" ~caption:"Min: 0, Max: 5" ~min:0. ~max:5. ~value:3.)
    (bounded ~name:"Temperature" ~caption:"Min: -10, Max: 10" ~min:(-10.)
       ~max:10. ~value:0.)
  </div>
```

### Reversed Layout

```ocaml title="number_stepper_reversed_layout.mlx"
module Number_stepper = Solidtype_heroui.Number_stepper

let make () =
  <Number_stepper aria_label="Quantity" default_value=1. min_value=0.>
    <Number_stepper.Group>
      <Number_stepper.Increment_button />
      <Number_stepper.Value />
      <Number_stepper.Decrement_button />
    </Number_stepper.Group>
  </Number_stepper>
```

### Sizes

```ocaml title="number_stepper_sizes.mlx"
module Number_stepper = Solidtype_heroui.Number_stepper

let sized size name =
  <div class_="flex flex-col items-center gap-2">
    <Number_stepper
      aria_label=("Quantity " ^ name) size default_value=1. min_value=0.>
      <Number_stepper.Group>
        <Number_stepper.Decrement_button />
        <Number_stepper.Value />
        <Number_stepper.Increment_button />
      </Number_stepper.Group>
    </Number_stepper>
    <span class_="text-xs text-muted">(Solidtype.Jsx.string name)</span>
  </div>

let make () =
  <div class_="flex items-end gap-6">
    (sized `sm "sm") (sized `md "md") (sized `lg "lg")
  </div>
```

### With Custom Buttons

A [Button](button.md) given `` slot=`decrement `` or
`` slot=`increment `` steps the value, as the stepper's own buttons do.

```ocaml title="number_stepper_with_custom_buttons.mlx"
module Button = Solidtype_heroui.Button
module Number_stepper = Solidtype_heroui.Number_stepper
module Gravity = Solidtype_gravity_icons

let variants =
  [|
    (`primary, "primary");
    (`secondary, "secondary");
    (`tertiary, "tertiary");
    (`outline, "outline");
  |]

let stepper ~track (variant, name) =
  <div class_="flex flex-col items-center gap-2">
    <span class_="text-xs text-muted">(Solidtype.Jsx.string name)</span>
    <Number_stepper
      aria_label=("Quantity " ^ name) default_value=1. min_value=0.>
      <Number_stepper.Group
        class_=(if track then "gap-3" else "gap-3 bg-transparent p-0")>
        <Button slot=`decrement variant is_icon_only=true size=`sm>
          <Gravity.Minus />
        </Button>
        <Number_stepper.Value />
        <Button slot=`increment variant is_icon_only=true size=`sm>
          <Gravity.Plus />
        </Button>
      </Number_stepper.Group>
    </Number_stepper>
  </div>

let make () =
  <div class_="grid grid-cols-2 gap-x-12 gap-y-4">
    (Solidtype.Jsx.fragment
       (Array.concat
          (Array.to_list
             (Array.map
                (fun v -> [| stepper ~track:true v; stepper ~track:false v |])
                variants))))
  </div>
```

### With Format Options

```ocaml title="number_stepper_with_format_options.mlx"
module Number_stepper = Solidtype_heroui.Number_stepper
module Format = Solidtype_kobalte.Types.NumberFormatOptions

let formatted ~name ~caption ~value ~step format =
  <div class_="flex flex-col items-center gap-2">
    <span class_="text-xs text-muted">(Solidtype.Jsx.string caption)</span>
    <Number_stepper
      aria_label=name
      default_value=value
      min_value=0.
      step
      format_options=format>
      <Number_stepper.Group>
        <Number_stepper.Decrement_button />
        <Number_stepper.Value />
        <Number_stepper.Increment_button />
      </Number_stepper.Group>
    </Number_stepper>
  </div>

let make () =
  <div class_="flex flex-col items-center gap-4">
    (formatted ~name:"Price" ~caption:"Currency (USD)" ~value:10. ~step:0.5
       (Format.make ~style:`currency ~currency:"USD" ()))
    (formatted ~name:"Opacity" ~caption:"Percentage" ~value:0.5 ~step:0.1
       (Format.make ~style:`percent ()))
  </div>
```

### With Label

A [Label](label.md) names it, and a
[Description](description.md) describes it.

```ocaml title="number_stepper_with_label.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Number_stepper = Solidtype_heroui.Number_stepper

let make () =
  <Number_stepper
    class_="flex-col items-start gap-1.5"
    default_value=1.
    min_value=1.
    max_value=10.>
    <Label>"Guests"</Label>
    <Number_stepper.Group>
      <Number_stepper.Decrement_button />
      <Number_stepper.Value />
      <Number_stepper.Increment_button />
    </Number_stepper.Group>
    <Description>"Maximum 10 guests per reservation"</Description>
  </Number_stepper>
```

### With Step

```ocaml title="number_stepper_with_step.mlx"
module Number_stepper = Solidtype_heroui.Number_stepper

let stepped step =
  let caption = "Step: " ^ Js.Float.toString step in
  <div class_="flex flex-col items-center gap-2">
    <span class_="text-xs text-muted">(Solidtype.Jsx.string caption)</span>
    <Number_stepper
      aria_label=("Quantity step " ^ Js.Float.toString step)
      default_value=0.
      min_value=0.
      step>
      <Number_stepper.Group>
        <Number_stepper.Decrement_button />
        <Number_stepper.Value />
        <Number_stepper.Increment_button />
      </Number_stepper.Group>
    </Number_stepper>
  </div>

let make () =
  <div class_="flex flex-col items-center gap-4">
    (stepped 5.) (stepped 10.)
  </div>
```

## Styling Reference

### CSS Classes

- `.number-stepper` - The root
- `.number-stepper__group`, and its sizes `.number-stepper__group--sm`,
  `--md`, `--lg` - The pill
- `.number-stepper__decrement-button`, `.number-stepper__increment-button`,
  and their sizes - The buttons
- `.number-stepper__value`, and its sizes - The value
- `.number-stepper__digit`, `.number-stepper__reel`, `.number-stepper__symbol`
  - A digit, the reel it rolls on, and a format's symbol
- `.number-stepper__input` - The field's input, out of sight until text is
  typed in it

### Interactive States

- **Hovered**: `[data-hovered="true"]` on a button
- **Pressed**: `[data-pressed="true"]` on a button, which shrinks it
- **Disabled**: `[data-disabled="true"]` on a button and on the root
- **Focus visible**: `[data-focus-visible="true"]` on the input, which rings
  the pill
- **Typing**: `[data-editing="true"]` on the input

## API Reference

### Number_stepper

| Prop | Type | Default | Description |
|---|---|---|---|
| `size` | `` [ `sm \| `md \| `lg ] `` | `` `md `` | Its size |
| `value`, `default_value` | `float` | | Its value, controlled or at first |
| `on_change` | `float -> unit` | | Told each change |
| `min_value`, `max_value` | `float` | | Its range |
| `step` | `float` | `1.` | What a button or arrow adds |
| `format_options` | `NumberFormatOptions.t` | | How its value is shown |
| `is_disabled`, `is_read_only`, `is_invalid`, `is_required` | `bool` | `false` | Its state |
| `is_wheel_disabled` | `bool` | `false` | The wheel leaves it alone |
| `name` | `string` | | Its value's name in a form |
| `aria_label` | `string` | | What names it, given no `Label` |

### Number_stepper.Value

| Prop | Type | Description |
|---|---|---|
| `value` | `float` | Another number than the field's |
| `format` | `NumberFormatOptions.t` | Another format than the field's |
| children | `Value.shown -> Jsx.element` | Draws the value itself |

### Number_stepper.Decrement_button, Number_stepper.Increment_button

The field's own buttons: children take the place of the icon.
