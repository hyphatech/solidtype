# ColorArea

A 2D color picker that allows users to select colors from a gradient area.

Its value is a `Types.Color.t`, read from any CSS colour by
`Solidtype_kobalte.Colors.parse_color`.

Original HeroUI documentation: [ColorArea](https://heroui.com/en/docs/react/components/color-area).

## Usage

HeroUI's examples.

```ocaml title="color_area_usage.mlx"
module Color_area = Solidtype_heroui.Color_area
module Colors = Solidtype_kobalte.Colors

let make () =
  <Color_area default_value=(Colors.parse_color "rgb(116, 52, 255)")>
    <Color_area.Thumb />
  </Color_area>
```

## Parity

The same HeroUI ColorArea twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two areas: a
marked row is one they disagree on.

The marked row is where each draws the gradient: Kobalte on a part of its own inside the area, React Aria in the area's own `style`, with its place. The gradient is the same.

## Anatomy

```ocaml
<Color_area>
  <Color_area.Thumb />
</Color_area>
```

## Examples

### With Dots

```ocaml title="color_area_with_dots.mlx"
module Color_area = Solidtype_heroui.Color_area
module Colors = Solidtype_kobalte.Colors

let make () =
  <Color_area
    show_dots=true default_value=(Colors.parse_color "hsl(200, 100%, 50%)")>
    <Color_area.Thumb />
  </Color_area>
```

### Color Space & Channels

Use `color_space` to set the color space (RGB, HSL, HSB) and
`x_channel`/`y_channel` to customize which color channels are displayed on
each axis.

```ocaml title="color_area_space_and_channels.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Color_area = Solidtype_heroui.Color_area
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

type 'a option_ = { id : string; name : string; value : 'a }

let color_spaces =
  [|
    { id = "rgb"; name = "RGB"; value = `rgb };
    { id = "hsl"; name = "HSL"; value = `hsl };
    { id = "hsb"; name = "HSB"; value = `hsb };
  |]

let channels_by_space = function
  | `hsb ->
      [|
        { id = "hue"; name = "Hue"; value = `hue };
        { id = "saturation"; name = "Saturation"; value = `saturation };
        { id = "brightness"; name = "Brightness"; value = `brightness };
      |]
  | `hsl ->
      [|
        { id = "hue"; name = "Hue"; value = `hue };
        { id = "saturation"; name = "Saturation"; value = `saturation };
        { id = "lightness"; name = "Lightness"; value = `lightness };
      |]
  | `rgb ->
      [|
        { id = "red"; name = "Red"; value = `red };
        { id = "green"; name = "Green"; value = `green };
        { id = "blue"; name = "Blue"; value = `blue };
      |]

(* The channels across and up a space starts with. *)
let defaults = function
  | `rgb -> ("blue", "green")
  | `hsl -> ("saturation", "lightness")
  | `hsb -> ("saturation", "brightness")

let space_id = function `rgb -> "rgb" | `hsl -> "hsl" | `hsb -> "hsb"

(* The colour as its space writes it. *)
let written color = function
  | `rgb -> Color.to_string color ~format:`rgb ()
  | `hsl -> Color.to_string color ~format:`hsl ()
  | `hsb -> Color.to_string color ~format:`hsb ()

let find id options = Array.find_opt (fun o -> String.equal o.id id) options

(* A Select of [options], [picked] its one value. *)
module Picker = struct
  let%component make ~(class_ : string) ~(label : string)
      ~(options : 'a option_ array) ~(picked : string)
      ~(on_pick : string -> unit) () =
    <Select
      class_=(S.get class_)
      value=[| S.get picked |]
      on_change=(fun ids -> Array.iter on_pick ids)>
      <Label>(Jsx.string (S.get label))</Label>
      <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
      <Select.Popover>
        <List_box>
          <For each=(S.get options)>
            (fun o _ ->
              <List_box.Item id=o.id text_value=o.name>
                (Jsx.string o.name) <List_box.Item_indicator />
              </List_box.Item>)
          </For>
        </List_box>
      </Select.Popover>
    </Select>
end

let make () =
  let space, set_space = S.create_signal `hsb in
  let color, set_color =
    S.create_signal (Colors.parse_color "hsb(219, 58%, 93%)")
  in
  let x, set_x = S.create_signal "saturation" in
  let y, set_y = S.create_signal "brightness" in
  let channels () = channels_by_space (S.get space) in
  let channel id = Option.map (fun o -> o.value) (find id (channels ())) in
  let pick_space id =
    Option.iter
      (fun o ->
        S.set set_space o.value;
        (* Each channel goes back to the new space's own. *)
        let x', y' = defaults o.value in
        S.set set_x x';
        S.set set_y y')
      (find id color_spaces)
  in
  (* No channel is on both axes. *)
  let other than =
    Array.of_list
      (List.filter
         (fun o -> not (String.equal o.id than))
         (Array.to_list (channels ())))
  in
  <div class_="flex flex-col items-center gap-6">
    <div class_="flex gap-4">
      <Picker
        class_="w-32"
        label="Color Space"
        options=color_spaces
        picked=(space_id (S.get space))
        on_pick=pick_space
      />
      <Picker
        class_="w-36"
        label="X Axis"
        options=(other (S.get y))
        picked=(S.get x)
        on_pick=(S.set set_x)
      />
      <Picker
        class_="w-36"
        label="Y Axis"
        options=(other (S.get x))
        picked=(S.get y)
        on_pick=(S.set set_y)
      />
    </div>
    <Color_area
      color_space=(S.get space)
      value=(S.get color)
      ?x_channel=(channel (S.get x))
      ?y_channel=(channel (S.get y))
      on_change=(S.set set_color)>
      <Color_area.Thumb />
    </Color_area>
    <div class_="flex items-center gap-3">
      <div
        class_="size-8 rounded-md border border-default"
        style=("background-color: "
              ^ Color.to_string (S.get color) ~format:`rgba ())
      />
      <code class_="rounded bg-default/50 px-2 py-1 text-sm">
        (Jsx.string (written (S.get color) (S.get space)))
      </code>
    </div>
  </div>
```

### Disabled

```ocaml title="color_area_disabled.mlx"
module Color_area = Solidtype_heroui.Color_area
module Colors = Solidtype_kobalte.Colors

let make () =
  <Color_area
    is_disabled=true default_value=(Colors.parse_color "hsl(200, 100%, 50%)")>
    <Color_area.Thumb />
  </Color_area>
```

### Controlled

```ocaml title="color_area_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_area = Solidtype_heroui.Color_area
module Color_swatch = Solidtype_heroui.Color_swatch
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  let color, set_color = S.create_signal (Colors.parse_color "#9B80FF") in
  <div class_="flex flex-col gap-4">
    <Color_area
      color_space=`rgb
      value=(S.get color)
      x_channel=`red
      y_channel=`green
      on_change=(S.set set_color)>
      <Color_area.Thumb />
    </Color_area>
    <div class_="flex w-[300px] items-center gap-3">
      <Color_swatch color=(S.get color) size=`md />
      <p class_="text-sm text-muted">
        "Current color: "
        <span class_="font-medium">
          (Jsx.string (Color.to_string (S.get color) ~format:`hex ()))
        </span>
      </p>
    </div>
  </div>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, on the area and on its thumb.

```ocaml title="color_area_custom_styles.mlx"
module Color_area = Solidtype_heroui.Color_area
module Colors = Solidtype_kobalte.Colors

let make () =
  <Color_area
    class_="size-44 rounded-3xl"
    default_value=(Colors.parse_color "rgb(116, 52, 255)")>
    <Color_area.Thumb class_="size-5 rounded-full border-4 border-white" />
  </Color_area>
```

## Styling Reference

### CSS Classes

- `.color-area` - Base styles with gradient background and inner shadow
- `.color-area--show-dots` - Adds dot grid overlay for precision picking
- `.color-area__thumb` - Draggable thumb indicator, its colour
  `--color-area-thumb-color`

### Interactive States

- **Disabled**: `[data-disabled="true"]`, on the area and its thumb
- **Focus**: `[data-focus-visible="true"]` (thumb only)
- **Dragging**: `[data-dragging="true"]` (thumb only)

## API Reference

Each prop beside the name HeroUI's React component gives it.

### ColorArea

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `Types.Color.t` | | The current color value (controlled) |
| `defaultValue` | `default_value` | `Types.Color.t` | Kobalte's red | The default color value (uncontrolled) |
| `onChange` | `on_change` | `Types.Color.t -> unit` | | Handler called when the color changes while dragging |
| `onChangeEnd` | `on_change_end` | `Types.Color.t -> unit` | | Handler called when the user stops dragging |
| `xChannel` | `x_channel` | `Color_area.channel` | its space's | Color channel for the horizontal axis |
| `yChannel` | `y_channel` | `Color_area.channel` | its space's | Color channel for the vertical axis |
| `colorSpace` | `color_space` | `` [ `rgb \| `hsl \| `hsb ] `` | its value's | The color space for the channels |
| `xName`, `yName` | `x_name`, `y_name` | `string` | | Each channel's name in a form |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the color area is disabled |
| `showDots` | `show_dots` | `bool` | `false` | Whether to show the dot grid overlay |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |

### ColorArea.Thumb

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `className` | `class_` | `string` | | Added after HeroUI's class |
| `style` | `style` | `string` | | Inline styles, added after its colour; a function of its state in React |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |
