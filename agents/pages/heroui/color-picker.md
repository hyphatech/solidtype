# ColorPicker

A composable color picker that synchronizes color value between multiple color components.

A `Color_area`, `Color_slider`, `Color_field`, `Color_swatch` or
`Color_swatch_picker` inside it, given no value, shows its colour and moves it.
A part's own value wins, and its own `on_change` is called too. Its value is a `Types.Color.t`, read from any CSS colour by
`Solidtype_kobalte.Colors.parse_color`.

Original HeroUI documentation: [ColorPicker](https://heroui.com/en/docs/react/components/color-picker).

## Usage

HeroUI's examples.

```ocaml title="color_picker_usage.mlx"
module Color_area = Solidtype_heroui.Color_area
module Color_picker = Solidtype_heroui.Color_picker
module Color_slider = Solidtype_heroui.Color_slider
module Color_swatch = Solidtype_heroui.Color_swatch
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors

let make () =
  <Color_picker default_value=(Colors.parse_color "#0485F7")>
    <Color_picker.Trigger>
      <Color_swatch size=`lg /> <Label>"Pick a color"</Label>
    </Color_picker.Trigger>
    <Color_picker.Popover>
      <Color_area
        aria_label="Color area"
        class_="max-w-full"
        color_space=`hsb
        x_channel=`saturation
        y_channel=`brightness>
        <Color_area.Thumb />
      </Color_area>
      <Color_slider channel=`hue class_="gap-1 px-1" color_space=`hsb>
        <Label>"Hue"</Label>
        <Color_slider.Output class_="text-muted" />
        <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
      </Color_slider>
    </Color_picker.Popover>
  </Color_picker>
```

## Parity

The same picker twice, each keeping its own colour: in solidtype on the left, in
React on the right. Below them, every attribute of the two triggers: a marked
row is one they disagree on: `aria-haspopup="dialog"` is Kobalte's, which says
what the trigger opens, where React Aria's trigger says nothing.

## Anatomy

`Color_picker` is a composable component that combines multiple color
components:

```ocaml
<Color_picker default_value=(Colors.parse_color "#0485F7")>
  <Color_picker.Trigger>
    <Color_swatch /> <Label>"Pick a color"</Label>
  </Color_picker.Trigger>
  <Color_picker.Popover>
    <Color_area color_space=`hsb x_channel=`saturation y_channel=`brightness>
      <Color_area.Thumb />
    </Color_area>
    <Color_slider channel=`hue color_space=`hsb>
      <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
    </Color_slider>
  </Color_picker.Popover>
</Color_picker>
```

## Examples

### Controlled

```ocaml title="color_picker_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Color_field = Solidtype_heroui.Color_field
module Color_swatch_picker = Solidtype_heroui.Color_swatch_picker
module Color = Solidtype_kobalte.Types.Color
module Color_area = Solidtype_heroui.Color_area
module Color_picker = Solidtype_heroui.Color_picker
module Color_slider = Solidtype_heroui.Color_slider
module Color_swatch = Solidtype_heroui.Color_swatch
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Gravity = Solidtype_gravity_icons

let presets =
  [|
    "#ef4444";
    "#f97316";
    "#eab308";
    "#22c55e";
    "#06b6d4";
    "#3b82f6";
    "#8b5cf6";
    "#ec4899";
    "#f43f5e";
  |]

let random_colour () =
  let hue = Js.Math.random_int 0 360
  and saturation = Js.Math.random_int 50 100
  and lightness = Js.Math.random_int 40 70 in
  Colors.parse_color
    ("hsl(" ^ string_of_int hue ^ ", " ^ string_of_int saturation ^ "%, "
   ^ string_of_int lightness ^ "%)")

let make () =
  let color, set_color = S.create_signal (Colors.parse_color "#325578") in
  <div class_="flex flex-col gap-4">
    <Color_picker value=(S.get color) on_change=(S.set set_color)>
      <Color_picker.Trigger>
        <Color_swatch size=`lg /> <Label>"Pick a color"</Label>
      </Color_picker.Trigger>
      <Color_picker.Popover class_="gap-2">
        <Color_swatch_picker class_="justify-center pt-2" size=`xs>
          <For each=presets>
            (fun preset _ ->
              <Color_swatch_picker.Item color=(Colors.parse_color preset)>
                <Color_swatch_picker.Swatch />
              </Color_swatch_picker.Item>)
          </For>
        </Color_swatch_picker>
        <Color_area
          aria_label="Color area"
          class_="max-w-full"
          color_space=`hsb
          x_channel=`saturation
          y_channel=`brightness>
          <Color_area.Thumb />
        </Color_area>
        <div class_="flex items-center gap-2 px-1">
          <Color_slider
            aria_label="Hue slider"
            channel=`hue
            class_="flex-1"
            color_space=`hsb>
            <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
          </Color_slider>
          <Button
            is_icon_only=true
            aria_label="Shuffle color"
            size=`sm
            variant=`tertiary
            on_click=(fun _ -> S.set set_color (random_colour ()))>
            <Gravity.Shuffle />
          </Button>
        </div>
        <Color_field aria_label="Color field">
          <Color_field.Group variant=`secondary>
            <Color_field.Prefix><Color_swatch size=`xs /></Color_field.Prefix>
            <Color_field.Input />
          </Color_field.Group>
        </Color_field>
      </Color_picker.Popover>
    </Color_picker>
    <p class_="w-60 text-sm text-muted">
      "Selected: "
      <span class_="font-medium">
        (Jsx.string (Color.to_string (S.get color) ~format:`hex ()))
      </span>
    </p>
  </div>
```

### With Swatches

```ocaml title="color_picker_with_swatches.mlx"
module For = Solidtype.For
module Color_swatch_picker = Solidtype_heroui.Color_swatch_picker
module Color_area = Solidtype_heroui.Color_area
module Color_picker = Solidtype_heroui.Color_picker
module Color_slider = Solidtype_heroui.Color_slider
module Color_swatch = Solidtype_heroui.Color_swatch
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors

let presets =
  [|
    "#ef4444";
    "#f97316";
    "#eab308";
    "#22c55e";
    "#06b6d4";
    "#3b82f6";
    "#8b5cf6";
    "#ec4899";
    "#f43f5e";
  |]

let make () =
  <Color_picker default_value=(Colors.parse_color "#F43F5E")>
    <Color_picker.Trigger>
      <Color_swatch size=`lg /> <Label>"Brand Color"</Label>
    </Color_picker.Trigger>
    <Color_picker.Popover>
      <Color_area
        aria_label="Color area"
        class_="max-w-full"
        color_space=`hsb
        x_channel=`saturation
        y_channel=`brightness>
        <Color_area.Thumb />
      </Color_area>
      <Color_slider
        aria_label="Hue slider"
        channel=`hue
        class_="gap-1 px-1"
        color_space=`hsb>
        <Label>"Hue"</Label>
        <Color_slider.Output class_="text-muted" />
        <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
      </Color_slider>
      <Color_swatch_picker class_="justify-center px-1" size=`xs>
        <For each=presets>
          (fun preset _ ->
            <Color_swatch_picker.Item color=(Colors.parse_color preset)>
              <Color_swatch_picker.Swatch />
            </Color_swatch_picker.Item>)
        </For>
      </Color_swatch_picker>
    </Color_picker.Popover>
  </Color_picker>
```

### With Fields

Use `Color_field` to allow users to edit individual color channel values with
a `Select` to switch between color spaces.

```ocaml title="color_picker_with_fields.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Color_field = Solidtype_heroui.Color_field
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select
module Color_area = Solidtype_heroui.Color_area
module Color_picker = Solidtype_heroui.Color_picker
module Color_slider = Solidtype_heroui.Color_slider
module Color_swatch = Solidtype_heroui.Color_swatch
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors

(* A colour space, by the name its option has. *)
let spaces = [| ("hsb", `hsb); ("hsl", `hsl); ("rgb", `rgb) |]

let picked_space id =
  Array.find_map
    (fun (name, space) -> if String.equal name id then Some space else None)
    spaces

let channels = function
  | `hsb -> [| `hue; `saturation; `brightness |]
  | `hsl -> [| `hue; `saturation; `lightness |]
  | `rgb -> [| `red; `green; `blue |]

let name_of = function
  | `hue -> "hue"
  | `saturation -> "saturation"
  | `brightness -> "brightness"
  | `lightness -> "lightness"
  | `red -> "red"
  | `green -> "green"
  | `blue -> "blue"
  | `alpha -> "alpha"

let make () =
  let space_name, set_space_name = S.create_signal "hsl" in
  let space () = Option.value (picked_space (S.get space_name)) ~default:`hsl in
  <Color_picker default_value=(Colors.parse_color "hsla(220, 90%, 50%, 0.8)")>
    <Color_picker.Trigger>
      <Color_swatch size=`lg /> <Label>"Pick a color"</Label>
    </Color_picker.Trigger>
    <Color_picker.Popover class_="max-w-62 gap-2">
      <Color_area
        class_="max-w-full"
        color_space=`hsb
        x_channel=`saturation
        y_channel=`brightness>
        <Color_area.Thumb />
      </Color_area>
      <Color_slider channel=`hue class_="gap-1 px-1" color_space=`hsb>
        <Label>"Hue"</Label>
        <Color_slider.Output class_="text-muted" />
        <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
      </Color_slider>
      <Select
        aria_label="Color space"
        value=[| S.get space_name |]
        variant=`secondary
        on_change=(fun ids -> Array.iter (S.set set_space_name) ids)>
        <Select.Trigger>
          <Select.Value class_="uppercase" /> <Select.Indicator />
        </Select.Trigger>
        <Select.Popover>
          <List_box>
            <For each=(Array.map fst spaces)>
              (fun name _ ->
                <List_box.Item class_="uppercase" id=name text_value=name>
                  (Jsx.string name) <List_box.Item_indicator />
                </List_box.Item>)
            </For>
          </List_box>
        </Select.Popover>
      </Select>
      <div class_="grid w-full grid-cols-3 items-center gap-2">
        <For each=(channels (space ()))>
          (fun channel _ ->
            <Color_field
              aria_label=(name_of channel) channel color_space=(space ())>
              <Color_field.Group variant=`secondary>
                <Color_field.Input />
              </Color_field.Group>
            </Color_field>)
        </For>
      </div>
    </Color_picker.Popover>
  </Color_picker>
```

### With Sliders

Use multiple `Color_slider` components to adjust each channel of a color
value.

```ocaml title="color_picker_with_sliders.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select
module Color_area = Solidtype_heroui.Color_area
module Color_picker = Solidtype_heroui.Color_picker
module Color_slider = Solidtype_heroui.Color_slider
module Color_swatch = Solidtype_heroui.Color_swatch
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors

(* A colour space, by the name its option has. *)
let spaces = [| ("hsb", `hsb); ("hsl", `hsl); ("rgb", `rgb) |]

let picked_space id =
  Array.find_map
    (fun (name, space) -> if String.equal name id then Some space else None)
    spaces

let channels = function
  | `hsb -> [| `hue; `saturation; `brightness; `alpha |]
  | `hsl -> [| `hue; `saturation; `lightness; `alpha |]
  | `rgb -> [| `red; `green; `blue; `alpha |]

let name_of = function
  | `hue -> "hue"
  | `saturation -> "saturation"
  | `brightness -> "brightness"
  | `lightness -> "lightness"
  | `red -> "red"
  | `green -> "green"
  | `blue -> "blue"
  | `alpha -> "alpha"

let make () =
  let space_name, set_space_name = S.create_signal "hsl" in
  let space () = Option.value (picked_space (S.get space_name)) ~default:`hsl in
  <Color_picker default_value=(Colors.parse_color "hsl(219, 58%, 93%)")>
    <Color_picker.Trigger>
      <Color_swatch size=`lg /> <Label>"Pick a color"</Label>
    </Color_picker.Trigger>
    <Color_picker.Popover class_="max-w-62 gap-2 px-2 py-3">
      <Select
        aria_label="Color space"
        value=[| S.get space_name |]
        variant=`secondary
        on_change=(fun ids -> Array.iter (S.set set_space_name) ids)>
        <Select.Trigger>
          <Select.Value class_="uppercase" /> <Select.Indicator />
        </Select.Trigger>
        <Select.Popover>
          <List_box>
            <For each=(Array.map fst spaces)>
              (fun name _ ->
                <List_box.Item class_="uppercase" id=name text_value=name>
                  (Jsx.string name) <List_box.Item_indicator />
                </List_box.Item>)
            </For>
          </List_box>
        </Select.Popover>
      </Select>
      <div class_="flex flex-col gap-2">
        <For each=(channels (space ()))>
          (fun channel _ ->
            <Color_slider
              aria_label=(name_of channel)
              channel
              class_="gap-1 px-1"
              color_space=(space ())>
              <Label class_="capitalize">(Jsx.string (name_of channel))</Label>
              <Color_slider.Output class_="text-muted" />
              <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
            </Color_slider>)
        </For>
      </div>
    </Color_picker.Popover>
  </Color_picker>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, on each part.

```ocaml title="color_picker_custom_styles.mlx"
module Color_area = Solidtype_heroui.Color_area
module Color_picker = Solidtype_heroui.Color_picker
module Color_slider = Solidtype_heroui.Color_slider
module Color_swatch = Solidtype_heroui.Color_swatch
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors

let make () =
  <Color_picker default_value=(Colors.parse_color "#0485F7")>
    <Color_picker.Trigger class_="rounded-xl bg-default-soft px-3 py-2">
      <Color_swatch size=`lg />
      <Label class_="font-medium text-foreground">"Theme color"</Label>
    </Color_picker.Trigger>
    <Color_picker.Popover class_="bg-surface">
      <Color_area
        aria_label="Color area"
        class_="max-w-full"
        color_space=`hsb
        x_channel=`saturation
        y_channel=`brightness>
        <Color_area.Thumb />
      </Color_area>
      <Color_slider channel=`hue class_="gap-1 px-1" color_space=`hsb>
        <Label>"Hue"</Label>
        <Color_slider.Output class_="text-muted" />
        <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
      </Color_slider>
    </Color_picker.Popover>
  </Color_picker>
```

## Styling Reference

### CSS Classes

- `.color-picker` - Base container
- `.color-picker__trigger` - Trigger button
- `.color-picker__popover` - Popover container

### Interactive States

The trigger:

- **Focus**: `:focus-visible` or `[data-focus-visible="true"]`, and
  `[data-focused="true"]`
- **Disabled**: `:disabled` or `[data-disabled="true"]`
- **Hover**: `[data-hovered="true"]`
- **Pressed**: `[data-pressed="true"]`

The popover: `[data-placement]`, `[data-entering="true"]`,
`[data-exiting="true"]`.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### ColorPicker

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `Types.Color.t` | | The current color value (controlled) |
| `defaultValue` | `default_value` | `Types.Color.t` | black | The default color value (uncontrolled) |
| `onChange` | `on_change` | `Types.Color.t -> unit` | | Handler called when the color changes |
| `className` | `class_` | `string` | | Added after HeroUI's class |
| `render` | `as_` | a function of its props | | Draws another element in its place |

### ColorPicker.Trigger

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether it can be pressed |
| `className` | `class_` | `string` | | Added after HeroUI's class |
| `children` | `children` | elements, or a function of its state | required | Trigger content or render prop |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |

### ColorPicker.Popover

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `isOpen` | `is_open` | `bool` | | Whether it is open, controlled |
| `defaultOpen` | `default_open` | `bool` | `false` | Whether it is open at first |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Called as it opens and closes |
| `placement` | `placement` | `` `bottom_left ``, and React Aria's others | `` `bottom_left `` | Placement of the popover |
| `offset` | `offset` | `float` | `8.` | Pixels from its trigger |
| `shouldFlip` | `should_flip` | `bool` | `true` | To the other side where there is no room |
| `className` | `class_` | `string` | | Added after HeroUI's class |
| `style` | `style` | `string` | | Added after its own |
| `render` | `as_` | a function of its props | | Draws another element in its place |
