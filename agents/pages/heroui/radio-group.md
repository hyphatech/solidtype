# Radio Group

Radio group for selecting a single option from a list.

Original HeroUI documentation: [Radio Group](https://heroui.com/en/docs/react/components/radio-group).

## Usage

```ocaml title="radio_group_usage.mlx"
module Radio_group = Solidtype_heroui.Radio_group
module Radio = Solidtype_heroui.Radio
module Label = Solidtype_heroui.Label
module Description = Solidtype_heroui.Description

let make () =
  <Radio_group default_value="premium">
    <Label>"Plan selection"</Label>
    <Description>"Choose the plan that suits you best"</Description>
    <Radio value="basic">
      <Radio.Content>
        <Radio.Control><Radio.Indicator /></Radio.Control> "Basic Plan"
      </Radio.Content>
      <Description>"Includes 100 messages per month"</Description>
    </Radio>
    <Radio value="premium">
      <Radio.Content>
        <Radio.Control><Radio.Indicator /></Radio.Control> "Premium Plan"
      </Radio.Content>
      <Description>"Includes 200 messages per month"</Description>
    </Radio>
    <Radio value="business">
      <Radio.Content>
        <Radio.Control><Radio.Indicator /></Radio.Control> "Business Plan"
      </Radio.Content>
      <Description>"Unlimited messages"</Description>
    </Radio>
  </Radio_group>
```

## Parity

The same HeroUI RadioGroup twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two first
contents: a marked row is one they disagree on, and a dimmed row is a
framework's own, which no style reads. A description is Kobalte's `<div>`
where React Aria's is a `<span>`; each is the one its input is described by.

The marked row is Kobalte's: its label names its radio's input by `for`, where React Aria's label holds the input.

## Anatomy

```ocaml
<Radio_group>
  <Label />
  <Description />
  <Radio value="option1">
    <Radio.Content>
      <Radio.Control>
        <Radio.Indicator>
          <span>"✓"</span>
        </Radio.Indicator>
      </Radio.Control>
      "Label"
    </Radio.Content>
    <Description />
  </Radio>
</Radio_group>
```

`Radio.Content` is the clickable area: the control and its label. The
indicator's children are optional, a custom indicator. A `Description` inside
a `Radio`, beside its content, describes that radio, and is announced with
it.

## Examples

### Horizontal Orientation

```ocaml title="radio_group_horizontal.mlx"
module Radio_group = Solidtype_heroui.Radio_group
module Radio = Solidtype_heroui.Radio
module Label = Solidtype_heroui.Label
module Description = Solidtype_heroui.Description

let make () =
  <div class_="flex flex-col gap-4">
    <Label>"Subscription plan"</Label>
    <Radio_group default_value="pro" orientation=`horizontal>
      <Radio value="starter">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Starter"
        </Radio.Content>
        <Description>"For side projects"</Description>
      </Radio>
      <Radio value="pro">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Pro"
        </Radio.Content>
        <Description>"Advanced reporting"</Description>
      </Radio>
      <Radio value="teams">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Teams"
        </Radio.Content>
        <Description>"Up to 10 teammates"</Description>
      </Radio>
    </Radio_group>
  </div>
```

### Variants

The RadioGroup component supports two visual variants:

- **`` `primary ``** (default) - Standard styling with default background,
  suitable for most use cases
- **`` `secondary ``** - Lower emphasis variant, suitable for use in Surface
  components

```ocaml title="radio_group_variants.mlx"
module Radio_group = Solidtype_heroui.Radio_group
module Radio = Solidtype_heroui.Radio
module Label = Solidtype_heroui.Label
module Description = Solidtype_heroui.Description

let make () =
  <div class_="flex flex-col gap-8">
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">"Primary variant"</p>
      <Radio_group default_value="option1" variant=`primary>
        <Radio value="option1">
          <Radio.Content>
            <Radio.Control><Radio.Indicator /></Radio.Control> "Option 1"
          </Radio.Content>
          <Description>"Standard styling with default background"</Description>
        </Radio>
        <Radio value="option2">
          <Radio.Content>
            <Radio.Control><Radio.Indicator /></Radio.Control> "Option 2"
          </Radio.Content>
          <Description>"Another option with primary styling"</Description>
        </Radio>
      </Radio_group>
    </div>
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">"Secondary variant"</p>
      <Radio_group default_value="option1" variant=`secondary>
        <Radio value="option1">
          <Radio.Content>
            <Radio.Control><Radio.Indicator /></Radio.Control> "Option 1"
          </Radio.Content>
          <Description>
            "Lower emphasis variant for use in surfaces"
          </Description>
        </Radio>
        <Radio value="option2">
          <Radio.Content>
            <Radio.Control><Radio.Indicator /></Radio.Control> "Option 2"
          </Radio.Content>
          <Description>"Another option with secondary styling"</Description>
        </Radio>
      </Radio_group>
    </div>
  </div>
```

### In Surface

On a [Surface](surface.md), `variant=` `` `secondary `` is
the quieter look meant for its background.

```ocaml title="radio_group_in_surface.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Radio = Solidtype_heroui.Radio
module Radio_group = Solidtype_heroui.Radio_group
module Surface = Solidtype_heroui.Surface

let make () =
  <Surface class_="w-full rounded-3xl p-6">
    <Radio_group
      default_value="premium" name="plan-on-surface" variant=`secondary>
      <Label>"Plan selection"</Label>
      <Description>"Choose the plan that suits you best"</Description>
      <Radio value="basic">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Basic Plan"
        </Radio.Content>
        <Description>"Includes 100 messages per month"</Description>
      </Radio>
      <Radio value="premium">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Premium Plan"
        </Radio.Content>
        <Description>"Includes 200 messages per month"</Description>
      </Radio>
      <Radio value="business">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Business Plan"
        </Radio.Content>
        <Description>"Unlimited messages"</Description>
      </Radio>
    </Radio_group>
  </Surface>
```

### Disabled

```ocaml title="radio_group_disabled.mlx"
module Radio_group = Solidtype_heroui.Radio_group
module Radio = Solidtype_heroui.Radio
module Label = Solidtype_heroui.Label
module Description = Solidtype_heroui.Description

let make () =
  <Radio_group is_disabled=true default_value="pro">
    <Label>"Subscription plan"</Label>
    <Description>
      "Plan changes are temporarily paused while we roll out updates."
    </Description>
    <Radio value="starter">
      <Radio.Content>
        <Radio.Control><Radio.Indicator /></Radio.Control> "Starter"
      </Radio.Content>
      <Description>"For side projects and small teams"</Description>
    </Radio>
    <Radio value="pro">
      <Radio.Content>
        <Radio.Control><Radio.Indicator /></Radio.Control> "Pro"
      </Radio.Content>
      <Description>"Advanced reporting and analytics"</Description>
    </Radio>
    <Radio value="teams">
      <Radio.Content>
        <Radio.Control><Radio.Indicator /></Radio.Control> "Teams"
      </Radio.Content>
      <Description>"Share access with up to 10 teammates"</Description>
    </Radio>
  </Radio_group>
```

### Controlled

```ocaml title="radio_group_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Radio_group = Solidtype_heroui.Radio_group
module Radio = Solidtype_heroui.Radio
module Label = Solidtype_heroui.Label
module Description = Solidtype_heroui.Description

let make () =
  let value, set_value = S.create_signal "pro" in
  <div class_="flex flex-col gap-4">
    <Radio_group
      value=(Js.Null.return (S.get value)) on_change=(S.set set_value)>
      <Label>"Subscription plan"</Label>
      <Radio value="starter">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Starter"
        </Radio.Content>
        <Description>"For side projects and small teams"</Description>
      </Radio>
      <Radio value="pro">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Pro"
        </Radio.Content>
        <Description>"Advanced reporting and analytics"</Description>
      </Radio>
      <Radio value="teams">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Teams"
        </Radio.Content>
        <Description>"Share access with up to 10 teammates"</Description>
      </Radio>
    </Radio_group>
    <p class_="text-sm text-muted">
      "Selected plan: "
      <span class_="font-medium">(Jsx.string (S.get value))</span>
    </p>
  </div>
```

### Uncontrolled

Combine `default_value` with `on_change` when you only need to react to
updates.

```ocaml title="radio_group_uncontrolled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Radio_group = Solidtype_heroui.Radio_group
module Radio = Solidtype_heroui.Radio
module Label = Solidtype_heroui.Label
module Description = Solidtype_heroui.Description

let make () =
  let selection, set_selection = S.create_signal "pro" in
  <div class_="flex flex-col gap-4">
    <Radio_group default_value="pro" on_change=(S.set set_selection)>
      <Label>"Subscription plan"</Label>
      <Radio value="starter">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Starter"
        </Radio.Content>
        <Description>"For side projects and small teams"</Description>
      </Radio>
      <Radio value="pro">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Pro"
        </Radio.Content>
        <Description>"Advanced reporting and analytics"</Description>
      </Radio>
      <Radio value="teams">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Teams"
        </Radio.Content>
        <Description>"Share access with up to 10 teammates"</Description>
      </Radio>
    </Radio_group>
    <p class_="text-sm text-muted">
      "Last chosen plan: "
      <span class_="font-medium">(Jsx.string (S.get selection))</span>
    </p>
  </div>
```

### Validation

The group is invalid as `is_invalid` says, here once a submit finds no plan
chosen, and its `Field_error` shows while it is.

```ocaml title="radio_group_validation.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Show = Solidtype.Show
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Label = Solidtype_heroui.Label
module Radio = Solidtype_heroui.Radio
module Radio_group = Solidtype_heroui.Radio_group

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

let make () =
  let plan, set_plan = S.create_signal None in
  let tried, set_tried = S.create_signal false in
  let message, set_message = S.create_signal None in
  <Form
    class_="flex flex-col gap-4"
    on_submit=(fun e ->
                prevent_default e;
                S.set set_tried true;
                S.set set_message
                  (Option.map
                     (fun p -> "Your chosen plan is: " ^ p)
                     (S.get plan)))>
    <Radio_group
      is_required=true
      is_invalid=(S.get tried && Option.is_none (S.get plan))
      name="plan-validation"
      on_change=(fun p -> S.set set_plan (Some p))>
      <Label>"Subscription plan"</Label>
      <Radio value="starter">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Starter"
        </Radio.Content>
        <Description>"For side projects and small teams"</Description>
      </Radio>
      <Radio value="pro">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Pro"
        </Radio.Content>
        <Description>"Advanced reporting and analytics"</Description>
      </Radio>
      <Radio value="teams">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control> "Teams"
        </Radio.Content>
        <Description>"Share access with up to 10 teammates"</Description>
      </Radio>
      <Field_error>"Choose a subscription before continuing."</Field_error>
    </Radio_group>
    <Button class_="mt-2 w-fit" type_=`submit>"Submit"</Button>
    <Show.Some some=(S.get message)>
      (fun m -> <p class_="text-sm text-muted">(Jsx.string (S.get m))</p>)
    </Show.Some>
  </Form>
```

### Delivery & Payment

Each `Radio.Content` drawn as a card, its state read by `data-selected`.

```ocaml title="radio_group_delivery_and_payment.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Radio = Solidtype_heroui.Radio
module Radio_group = Solidtype_heroui.Radio_group
module Gravity = Solidtype_gravity_icons

let deliveries =
  [|
    ("standard", "Standard", "4-10 business days", "$5.00");
    ("express", "Express", "2-5 business days", "$16.00");
    ("super-fast", "Super Fast", "1 business day", "$25.00");
  |]

let payments =
  [|
    ("mastercard", "**** 8304", "Exp. on 01/2026");
    ("visa", "**** 0123", "Exp. on 01/2026");
    ("paypal", "PayPal", "Pay with PayPal");
  |]

let accent =
  "--accent: #006FEE; --accent-foreground: #fff; --accent-hover: #006FEE; \
   --border-width: 2px; --border-width-field: 2px; --focus: #006FEE;"

let make () =
  <div class_="flex w-full flex-col items-center gap-10" style=accent>
    <section class_="flex w-full max-w-lg flex-col gap-4">
      <Radio_group default_value="express" name="delivery" variant=`secondary>
        <Label>"Delivery method"</Label>
        <div class_="grid gap-x-4 md:grid-cols-3">
          <For each=deliveries>
            (fun (value, title, description, price) _ ->
              <Radio value>
                <Radio.Content
                  class_="group relative flex w-full flex-col gap-6 rounded-xl \
                          border border-transparent bg-surface px-5 py-4 \
                          transition-all data-[selected=true]:border-accent \
                          data-[selected=true]:bg-accent/10 \
                          data-[focus-visible=true]:border-accent \
                          data-[focus-visible=true]:bg-accent/10">
                  <Radio.Control class_="absolute end-4 top-3 size-5">
                    <Radio.Indicator />
                  </Radio.Control>
                  <div class_="flex flex-col gap-1">
                    <span>(Jsx.string title)</span>
                    <Description>(Jsx.string description)</Description>
                  </div>
                  <span class_="text-sm font-semibold">(Jsx.string price)</span>
                </Radio.Content>
              </Radio>)
          </For>
        </div>
      </Radio_group>
    </section>
    <section class_="flex w-full max-w-lg flex-col gap-4">
      <Radio_group default_value="visa" name="payment" variant=`secondary>
        <div class_="flex flex-wrap items-center justify-between gap-4">
          <Label>"Payment method"</Label>
        </div>
        <div class_="grid gap-x-4 md:grid-cols-2">
          <For each=payments>
            (fun (value, title, description) _ ->
              <Radio value>
                <Radio.Content
                  class_="group relative flex w-full flex-row items-start \
                          justify-start gap-4 rounded-xl border \
                          border-transparent bg-surface px-5 py-4 \
                          transition-all data-[selected=true]:border-accent \
                          data-[selected=true]:bg-accent/10">
                  <Radio.Control class_="absolute end-4 top-3 size-5">
                    <Radio.Indicator />
                  </Radio.Control>
                  (if String.equal value "paypal" then
                     <Gravity.Wallet class_="size-6" />
                   else <Gravity.Credit_card class_="size-6" />)
                  <div class_="flex flex-col gap-1">
                    <span>(Jsx.string title)</span>
                    <Description>(Jsx.string description)</Description>
                  </div>
                </Radio.Content>
              </Radio>)
          </For>
        </div>
      </Radio_group>
    </section>
  </div>
```

### Custom Indicator

```ocaml title="radio_group_custom_indicator.mlx"
module S = Solidtype.Solid
module Radio_group = Solidtype_heroui.Radio_group
module Radio = Solidtype_heroui.Radio
module Label = Solidtype_heroui.Label
module Description = Solidtype_heroui.Description

let tick (s : Radio.Content.state) =
  <Solidtype.Show when_=(S.get s.is_selected)>
    <span class_="text-xs leading-none text-background">{js|✓|js}</span>
  </Solidtype.Show>

let plan ~value ~name ~messages =
  <Radio value>
    <Radio.Content>
      <Radio.Control>
        <Radio.Indicator>(fun s -> tick s)</Radio.Indicator>
      </Radio.Control>
      (Solidtype.Jsx.string name)
    </Radio.Content>
    <Description>(Solidtype.Jsx.string messages)</Description>
  </Radio>

let make () =
  <Radio_group default_value="premium" name="plan-custom-indicator">
    <Label>"Plan selection"</Label>
    <Description>"Choose the plan that suits you best"</Description>
    (plan ~value:"basic" ~name:"Basic Plan"
       ~messages:"Includes 100 messages per month")
    (plan ~value:"premium" ~name:"Premium Plan"
       ~messages:"Includes 200 messages per month")
    (plan ~value:"business" ~name:"Business Plan" ~messages:"Unlimited messages")
  </Radio_group>
```

### Render Function

`as_` draws another element in a part's place, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

Each part's `class_` is added after HeroUI's classes, and HeroUI's state
attributes are Tailwind's `data-[...]` variants, as in React.

```ocaml title="radio_group_tailwind.mlx"
module Radio_group = Solidtype_heroui.Radio_group
module Radio = Solidtype_heroui.Radio
module Label = Solidtype_heroui.Label
module Description = Solidtype_heroui.Description
module For = Solidtype.For

let options =
  [|
    ("monthly", "Monthly", "$12 billed every month");
    ("yearly", "Yearly", "$120 billed once a year");
  |]

let content =
  "group flex w-full items-start gap-3 rounded-xl border border-success/10 \
   bg-success-soft/30 px-4 py-3 transition-colors \
   data-[focus-visible=true]:ring-2 data-[focus-visible=true]:ring-success/15 \
   data-[hovered=true]:bg-success-soft-hover \
   data-[selected=true]:border-success/30 data-[selected=true]:bg-success-soft \
   data-[selected=true]:data-[hovered=true]:bg-success-soft-hover"

let control =
  "mt-0.5 size-5 shrink-0 rounded-full border border-border bg-default \
   shadow-none group-data-[pressed=true]:scale-95 \
   group-data-[selected=true]:border-transparent \
   group-data-[selected=true]:bg-success \
   group-data-[selected=true]:group-data-[pressed=true]:bg-success-hover"

let indicator =
  "before:rounded-full before:bg-default \
   group-data-[selected=true]:before:scale-50 \
   group-data-[selected=true]:before:bg-success-foreground \
   group-data-[selected=true]:group-data-[pressed=true]:before:scale-[0.57]"

let make () =
  <Radio_group
    class_="w-full max-w-sm gap-3 **:data-[slot=radio]:mt-0"
    default_value="yearly"
    variant=`secondary>
    <Label class_="font-medium text-foreground">"Billing cycle"</Label>
    <Description>"Choose how often you are charged."</Description>
    <For each=options>
      (fun (value, label, about) _ ->
        <Radio value>
          <Radio.Content class_=content>
            <Radio.Control class_=control>
              <Radio.Indicator class_=indicator />
            </Radio.Control>
            <div class_="flex flex-col gap-0.5">
              <span
                class_="font-medium text-foreground \
                        group-data-[selected=true]:text-success-soft-foreground">
                (Solidtype.Jsx.string label)
              </span>
              <Description
                class_="group-data-[selected=true]:text-success-soft-foreground/80">
                (Solidtype.Jsx.string about)
              </Description>
            </div>
          </Radio.Content>
        </Radio>)
    </For>
  </Radio_group>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every one, as with
HeroUI in React:

```css
@layer components {
  .radio-group {
    @apply gap-2;
  }

  .radio__control {
    @apply border-2 border-accent;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base Classes

- `.radio-group` - Base radio group container
- `.radio-group--primary`, `.radio-group--secondary` - Variants
- `.radio` - Individual radio item
- `.radio__content` - Radio button (label wrapper for control + label text)
- `.radio__control` - Radio control (circular button)
- `.radio__indicator` - Radio indicator (inner dot)

#### Modifier Classes

Disabled state is applied via `[data-disabled="true"]` (and `:disabled`) on
`.radio`: there is no `.radio--disabled` modifier class.

### Interactive States

The radio supports both CSS pseudo-classes and data attributes for
flexibility:

- **Selected**: `[aria-checked="true"]` or `[data-selected="true"]`
  (indicator appears)
- **Hover**: `:hover` or `[data-hovered="true"]` (border color changes)
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]` (shows focus
  ring)
- **Pressed**: `:active` or `[data-pressed="true"]` (scale transform)
- **Disabled**: `:disabled` or `[data-disabled="true"]` (reduced opacity, no
  pointer events)
- **Invalid**: `[data-invalid="true"]` or `[aria-invalid="true"]` (error
  border color)

## API Reference

Each prop beside the name HeroUI's React component gives it. A tag is the
string React takes.

### Radio_group

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `string Js.Null.t` | | The current value (controlled); null controls it empty |
| `defaultValue` | `default_value` | `string` | none | The default value (uncontrolled) |
| `onChange` | `on_change` | `string -> unit` | | Handler called when the value changes |
| `orientation` | `orientation` | `` [ `horizontal \| `vertical ] `` | `` `vertical `` | The orientation of the radio group |
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | `` `primary `` | Visual variant of the component. `` `primary `` is the default style with shadow. `` `secondary `` is a lower emphasis variant without shadow, suitable for use in surfaces |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the radio group is disabled |
| `isInvalid` | `is_invalid` | `bool` | `false` | Whether the radio group is in an invalid state |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `onBlur` | `on_blur` | `Dom.focusEvent -> unit` | | Called once focus leaves it for an element outside it |
| `children` | `children` | elements, or a function of `state` | | Radio group content or render function |
| `isReadOnly` | `is_read_only` | `bool` | `false` | Whether the radio group is read only |
| `isRequired` | `is_required` | `bool` | `false` | Whether the radio group is required |
| `name` | `name` | `string` | | The name of the radio group, used when submitting an HTML form |

### Radio

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `string` | required | The value of the radio button |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the radio button is disabled |
| `aria-label` | `aria_label` | `string` | | Its name where no text names it |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements, or a function of `Radio.state` | | Radio content or render function |

### Radio.Content, Radio.Control and Radio.Indicator

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's class |
| `children` | `children` | elements | What it holds; optional on the indicator |
