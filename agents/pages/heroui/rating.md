# Rating

A star rating, chosen by a press or the arrow keys, or shown read only as a fraction.

Kobalte's rating, a radio group of stars, in HeroUI's look: chosen by a press
or the arrow keys, the stars under the pointer previewed as it moves. Read
only, its value may be a fraction. Its look is a stylesheet the library ships,
imported as [Theming](theming.md#setup) shows.

## Usage

```ocaml title="rating_usage.mlx"
module Rating = Solidtype_heroui.Rating

let make () =
  <Rating aria_label="Rating" default_value=3.>
    <Rating.Item value=1. />
    <Rating.Item value=2. />
    <Rating.Item value=3. />
    <Rating.Item value=4. />
    <Rating.Item value=5. />
  </Rating>
```

## Anatomy

```ocaml
<Rating aria_label="Rating">
  <Rating.Item value=1. /> <Rating.Item value=2. /> <Rating.Item value=3. />
</Rating>
```

## Controlled

```ocaml title="rating_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Rating = Solidtype_heroui.Rating

let make () =
  let value, set_value = S.create_signal 3. in
  <div class_="flex flex-col items-center gap-3">
    <Rating
      aria_label="Rating"
      value=(S.get value)
      on_value_change=(fun v -> S.set set_value v)>
      <Rating.Item value=1. />
      <Rating.Item value=2. />
      <Rating.Item value=3. />
      <Rating.Item value=4. />
      <Rating.Item value=5. />
    </Rating>
    <span class_="text-sm text-muted">
      (Jsx.string (Js.Float.toString (S.get value) ^ " stars"))
    </span>
  </div>
```

## Custom Color

`--rating-active-color` colours the active stars.

```ocaml title="rating_custom_color.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Rating = Solidtype_heroui.Rating

let colors =
  [| ("accent", "Accent"); ("danger", "Danger"); ("success", "Success") |]

let make () =
  <div class_="flex flex-col gap-4">
    <For each=colors>
      (fun (color, name) _ ->
        <div class_="flex items-center gap-3">
          <Rating
            aria_label=("Rating " ^ color)
            default_value=4.
            style=("--rating-active-color: var(--" ^ color ^ ")")>
            <Rating.Item value=1. />
            <Rating.Item value=2. />
            <Rating.Item value=3. />
            <Rating.Item value=4. />
            <Rating.Item value=5. />
          </Rating>
          <span class_="text-xs text-muted">(Jsx.string name)</span>
        </div>)
    </For>
  </div>
```

## Custom Icon Heart

`icon` is every item's icon.

```ocaml title="rating_custom_icon_heart.mlx"
module Rating = Solidtype_heroui.Rating
module Gravity = Solidtype_gravity_icons

let make () =
  <Rating aria_label="Favorites" default_value=3. icon=(<Gravity.Heart_fill />)>
    <Rating.Item value=1. />
    <Rating.Item value=2. />
    <Rating.Item value=3. />
    <Rating.Item value=4. />
    <Rating.Item value=5. />
  </Rating>
```

## Custom Icon Per Item

An item's children are its own icon.

```ocaml title="rating_custom_icon_per_item.mlx"
module For = Solidtype.For
module Rating = Solidtype_heroui.Rating
module Gravity = Solidtype_gravity_icons

let make () =
  <Rating
    aria_label="Favorites"
    default_value=3.
    style="--rating-active-color: var(--danger)">
    <For each=[| 1.; 2.; 3.; 4.; 5. |]>
      (fun value _ -> <Rating.Item value><Gravity.Heart_fill /></Rating.Item>)
    </For>
  </Rating>
```

## Disabled

```ocaml title="rating_disabled.mlx"
module Rating = Solidtype_heroui.Rating

let make () =
  <Rating aria_label="Rating" default_value=3. is_disabled=true>
    <Rating.Item value=1. />
    <Rating.Item value=2. />
    <Rating.Item value=3. />
    <Rating.Item value=4. />
    <Rating.Item value=5. />
  </Rating>
```

## Product Review

```ocaml title="rating_product_review.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Rating = Solidtype_heroui.Rating

let scores =
  [|
    ("Quality", 4.5);
    ("Value for money", 3.7);
    ("Design", 5.);
    ("Durability", 2.3);
  |]

let make () =
  <div class_="flex w-72 flex-col gap-3">
    <For each=scores>
      (fun (name, score) _ ->
        <div class_="flex items-center justify-between gap-4">
          <span class_="text-sm text-foreground">(Jsx.string name)</span>
          <div class_="flex items-center gap-2">
            <Rating
              aria_label=(name ^ ": " ^ Js.Float.toString score ^ " stars")
              size=`sm
              value=score
              is_read_only=true>
              <Rating.Item value=1. />
              <Rating.Item value=2. />
              <Rating.Item value=3. />
              <Rating.Item value=4. />
              <Rating.Item value=5. />
            </Rating>
            <span class_="w-7 text-right text-xs text-muted">
              (Jsx.string (Js.Float.toString score))
            </span>
          </div>
        </div>)
    </For>
  </div>
```

## Read Only

```ocaml title="rating_read_only.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Rating = Solidtype_heroui.Rating

let values = [| 1.5; 2.3; 3.7; 4.2; 4.8 |]

let make () =
  <div class_="flex flex-col gap-3">
    <For each=values>
      (fun value _ ->
        <div class_="flex items-center gap-3">
          <Rating
            aria_label=(Js.Float.toString value ^ " out of 5 stars")
            value
            is_read_only=true>
            <Rating.Item value=1. />
            <Rating.Item value=2. />
            <Rating.Item value=3. />
            <Rating.Item value=4. />
            <Rating.Item value=5. />
          </Rating>
          <span class_="text-sm text-muted">
            (Jsx.string (Js.Float.toString value))
          </span>
        </div>)
    </For>
  </div>
```

## Read Only Fractional

A value read only may be a fraction: the stars up to its whole part are active, and the next filled as far as the fraction goes.

```ocaml title="rating_read_only_fractional.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Rating = Solidtype_heroui.Rating

let values = [| 1.5; 2.3; 3.7; 4.2; 4.8 |]

let make () =
  <div class_="flex flex-col gap-3">
    <For each=values>
      (fun value _ ->
        <div class_="flex items-center gap-3">
          <Rating
            aria_label=(Js.Float.toString value ^ " out of 5 stars")
            value
            is_read_only=true>
            <Rating.Item value=1. />
            <Rating.Item value=2. />
            <Rating.Item value=3. />
            <Rating.Item value=4. />
            <Rating.Item value=5. />
          </Rating>
          <span class_="text-sm text-muted">
            (Jsx.string (Js.Float.toString value))
          </span>
        </div>)
    </For>
  </div>
```

## Render Function

A function child draws the whole item of its state: `is_active`, `is_partial` and `partial_percent`.

```ocaml title="rating_render_function.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Rating = Solidtype_heroui.Rating
module Gravity = Solidtype_gravity_icons

let make () =
  let value, set_value = S.create_signal 0. in
  <div class_="flex flex-col items-center gap-3">
    <Rating
      aria_label="Rating"
      value=(S.get value)
      on_value_change=(fun v -> S.set set_value v)>
      <For each=[| 1.; 2.; 3.; 4.; 5. |]>
        (fun value _ ->
          <Rating.Item value>
            (fun state ->
              <span
                class_="flex size-5"
                style=(if S.get state.is_active then "color: var(--warning)"
                       else "color: var(--muted)")>
                <Gravity.Star_fill />
              </span>)
          </Rating.Item>)
      </For>
    </Rating>
    <span class_="text-sm text-muted">
      (Jsx.string
         (match S.get value with
         | 0. -> "No rating"
         | 1. -> "1 star"
         | v -> Js.Float.toString v ^ " stars"))
    </span>
  </div>
```

## Sizes

```ocaml title="rating_sizes.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Rating = Solidtype_heroui.Rating

let sizes = [| (`sm, "sm"); (`md, "md"); (`lg, "lg") |]

let make () =
  <div class_="flex flex-col gap-4">
    <For each=sizes>
      (fun (size, name) _ ->
        <div class_="flex items-center gap-3">
          <Rating aria_label=("Rating " ^ name) size default_value=3.>
            <Rating.Item value=1. />
            <Rating.Item value=2. />
            <Rating.Item value=3. />
            <Rating.Item value=4. />
            <Rating.Item value=5. />
          </Rating>
          <span class_="text-xs text-muted">(Jsx.string name)</span>
        </div>)
    </For>
  </div>
```

## With Label

```ocaml title="rating_with_label.mlx"
module Rating = Solidtype_heroui.Rating
module Label = Solidtype_heroui.Label

let make () =
  <div class_="flex flex-col gap-1.5">
    <Label>"How would you rate this product?"</Label>
    <Rating aria_label="Product rating">
      <Rating.Item value=1. />
      <Rating.Item value=2. />
      <Rating.Item value=3. />
      <Rating.Item value=4. />
      <Rating.Item value=5. />
    </Rating>
  </div>
```

## Styling Reference

### CSS Classes

- `.rating`, and its sizes `.rating--sm`, `.rating--md`, `.rating--lg`
- `.rating__item`, and `.rating__item--sm`, `--md`, `--lg`
- `.rating__icon` - An item's icon
- `.rating__icon-partial` - The part of an icon a fraction fills

### Interactive States

- **Active**: `[data-active="true"]` on `.rating__icon`
- **Read only**: `[data-readonly="true"]` on `.rating` and `.rating__item`
- **Focus visible**: `[data-focus-visible="true"]` on `.rating__item`
- **Pressed**: `[data-pressed="true"]` on `.rating__item`
- **Disabled**: `[data-disabled="true"]` on `.rating`

### CSS Variables

| Variable | Default | Description |
|---|---|---|
| `--rating-active-color` | `var(--color-warning)` | The active stars' colour |
| `--rating-inactive-color` | `var(--color-surface-tertiary)` | The other stars' colour |
| `--rating-partial` | | How far a fraction fills its star, written by the rating |

## API Reference

Each prop beside its name in React's convention.

### Rating

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | `` `md `` | Its size |
| `value` | `value` | `float` | | The value (controlled) |
| `defaultValue` | `default_value` | `float` | `0.` | The value at first (uncontrolled) |
| `onValueChange` | `on_value_change` | `float -> unit` | | Called with each value chosen |
| `icon` | `icon` | element | a star | Every item's icon |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether it is disabled |
| `isReadOnly` | `is_read_only` | `bool` | `false` | Whether it only shows its value |
| `isRequired` | `is_required` | `bool` | `false` | Whether a form requires a value |
| `name` | `name` | `string` | | Its name in a form |
| `aria-label` | `aria_label` | `string` | | Its name |
| `className` | `class_` | `string` | | Added after its own classes |

### Rating.Item

| React | solidtype | Type | Description |
|---|---|---|---|
| `value` | `value` | `float` | Its place, from 1 |
| `children` | `children` | elements, or a function of its state | Its icon, or the whole item |
| `className` | `class_` | `string` | Added after its own classes |
