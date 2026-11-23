# Inline Select

A select drawn as text, for a choice made in a sentence, a toolbar or a cell.

A [Select](select.md) drawn as text, with no field around it.
Its choice, keys and list are the select's. Its look is a stylesheet the
library ships, imported as [Theming](theming.md#setup) shows.

## Usage

```ocaml title="inline_select_usage.mlx"
module Inline_select = Solidtype_heroui.Inline_select
module List_box = Solidtype_heroui.List_box

let make () =
  <Inline_select default_value=[| "en" |]>
    <Inline_select.Trigger aria_label="Language">
      <Inline_select.Value /> <Inline_select.Indicator />
    </Inline_select.Trigger>
    <Inline_select.Popover class_="w-[140px]">
      <List_box>
        <List_box.Item id="en" text_value="English">
          "English" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="es" text_value="Spanish">
          "Spanish" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="fr" text_value="French">
          "French" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="ja" text_value="Japanese">
          "Japanese" <List_box.Item_indicator />
        </List_box.Item>
      </List_box>
    </Inline_select.Popover>
  </Inline_select>
```

## Anatomy

```ocaml
<Inline_select>
  <Inline_select.Trigger aria_label="Language">
    <Inline_select.Value /> <Inline_select.Indicator />
  </Inline_select.Trigger>
  <Inline_select.Popover>
    <List_box>
      <List_box.Item id="en" text_value="English">"English"</List_box.Item>
    </List_box>
  </Inline_select.Popover>
</Inline_select>
```

## Team Switcher

The trigger draws whatever it is given, here the team chosen.

```ocaml title="inline_select_team_switcher.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Inline_select = Solidtype_heroui.Inline_select
module List_box = Solidtype_heroui.List_box
module Gravity = Solidtype_gravity_icons

type team = { id : string; name : string; color : string }

let teams =
  [|
    { id = "northwind"; name = "Northwind Labs"; color = "bg-violet-700" };
    { id = "acme"; name = "Acme Corp"; color = "bg-blue-600" };
    { id = "maple"; name = "Maple Studio"; color = "bg-amber-600" };
  |]

let mark team =
  <div
    class_=("flex size-5 shrink-0 items-center justify-center rounded "
          ^ team.color)>
    <span class_="text-[10px] font-bold text-white">
      (Jsx.string (String.sub team.name 0 1))
    </span>
  </div>

let make () =
  let chosen, set_chosen = S.create_signal teams.(0) in
  <div class_="flex items-center gap-2.5">
    <Gravity.Cubes3 class_="size-6" />
    <span class_="text-lg font-light text-border">"/"</span>
    <Inline_select
      value=[| (S.get chosen).id |]
      on_change=(fun keys ->
                  match Array.find_opt (fun t -> Array.mem t.id keys) teams with
                  | Some t -> S.set set_chosen t
                  | None -> ())>
      <Inline_select.Trigger aria_label="Team" class_="gap-2">
        (mark (S.get chosen))
        <span class_="text-sm font-medium">
          (Jsx.string (S.get chosen).name)
        </span>
        <Inline_select.Indicator />
      </Inline_select.Trigger>
      <Inline_select.Popover class_="w-[200px]">
        <List_box>
          <For each=teams>
            (fun team _ ->
              <List_box.Item id=team.id text_value=team.name>
                (mark team) (Jsx.string team.name) <List_box.Item_indicator />
              </List_box.Item>)
          </For>
        </List_box>
      </Inline_select.Popover>
    </Inline_select>
  </div>
```

## Custom Indicator

`Inline_select.Indicator` draws the icon it is given in place of its chevrons.

```ocaml title="inline_select_custom_indicator.mlx"
module Inline_select = Solidtype_heroui.Inline_select
module List_box = Solidtype_heroui.List_box
module Gravity = Solidtype_gravity_icons

let make () =
  <Inline_select default_value=[| "editor" |]>
    <Inline_select.Trigger aria_label="Role">
      <Inline_select.Value />
      <Inline_select.Indicator>
        <Gravity.Chevron_right />
      </Inline_select.Indicator>
    </Inline_select.Trigger>
    <Inline_select.Popover class_="w-[124px]">
      <List_box>
        <List_box.Item id="viewer" text_value="Viewer">
          "Viewer" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="editor" text_value="Editor">
          "Editor" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="admin" text_value="Admin">
          "Admin" <List_box.Item_indicator />
        </List_box.Item>
      </List_box>
    </Inline_select.Popover>
  </Inline_select>
```

## Multi Select

With `selection_mode=` `` `multiple ``, the value lists every option chosen.

```ocaml title="inline_select_multi_select.mlx"
module Inline_select = Solidtype_heroui.Inline_select
module List_box = Solidtype_heroui.List_box

let make () =
  <Inline_select selection_mode=`multiple default_value=[| "email"; "push" |]>
    <Inline_select.Trigger aria_label="Notification channels">
      <Inline_select.Value /> <Inline_select.Indicator />
    </Inline_select.Trigger>
    <Inline_select.Popover class_="w-48 max-w-48">
      <List_box>
        <List_box.Item id="email" text_value="Email">
          "Email" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="whatsapp" text_value="WhatsApp">
          "WhatsApp" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="push" text_value="Push Notification">
          "Push Notification" <List_box.Item_indicator />
        </List_box.Item>
      </List_box>
    </Inline_select.Popover>
  </Inline_select>
```

## Placements

`Inline_select.Popover` takes a `placement`, `` `bottom_end `` by default.

```ocaml title="inline_select_placements.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Inline_select = Solidtype_heroui.Inline_select
module List_box = Solidtype_heroui.List_box

let placements =
  [|
    ("bottom", `bottom, "bottom");
    ("bottom-start", `bottom_start, "bottom start");
    ("bottom-end", `bottom_end, "bottom end (default)");
    ("top", `top, "top");
    ("top-start", `top_start, "top start");
    ("top-end", `top_end, "top end");
    ("left", `left, "left");
    ("left-top", `left_top, "left top");
    ("left-bottom", `left_bottom, "left bottom");
    ("right", `right, "right");
    ("right-top", `right_top, "right top");
    ("right-bottom", `right_bottom, "right bottom");
  |]

let make () =
  let chosen, set_chosen = S.create_signal "bottom-end" in
  let placement () =
    match
      Array.find_opt
        (fun (id, _, _) -> String.equal id (S.get chosen))
        placements
    with
    | Some (_, p, _) -> p
    | None -> `bottom_end
  in
  <div class_="flex items-center justify-center px-10">
    <Inline_select
      value=[| S.get chosen |]
      on_change=(fun keys ->
                  match keys with [| k |] -> S.set set_chosen k | _ -> ())>
      <Inline_select.Trigger aria_label="Placement">
        <Inline_select.Value /> <Inline_select.Indicator />
      </Inline_select.Trigger>
      <Inline_select.Popover placement=(placement ())>
        <List_box>
          <For each=placements>
            (fun (id, _, name) _ ->
              <List_box.Item id text_value=name>
                (Jsx.string name) <List_box.Item_indicator />
              </List_box.Item>)
          </For>
        </List_box>
      </Inline_select.Popover>
    </Inline_select>
  </div>
```

## Styling Reference

### CSS Classes

- `.inline-select`, beside the select's `.select`
- `.inline-select__trigger`, beside `.select__trigger`
- `.inline-select__value`, beside `.select__value`
- `.inline-select__indicator`, beside `.select__indicator`
- `.inline-select__popover`, beside `.select__popover`

### Interactive States

On `.inline-select__trigger`:

- **Hovered**: `[data-hovered="true"]`
- **Focus visible**: `[data-focus-visible="true"]`
- **Disabled**: `[data-disabled="true"]`

And on `.inline-select__indicator`, `[data-open="true"]` while the list is open.

### CSS Variables

| Variable | Default | Description |
|---|---|---|
| `--inline-select-value-max-width` | `12rem` | The widest the value is drawn before it is cut short |
| `--inline-select-indicator-size` | `0.75rem` | The indicator's width and height |

## API Reference

Each prop beside its name in React's convention.

### Inline_select

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `selectionMode` | `selection_mode` | `` [ `single \| `multiple ] `` | `` `single `` | One option or many |
| `value` | `value` | `string array` | | The options chosen (controlled) |
| `defaultValue` | `default_value` | `string array` | | The options chosen at first (uncontrolled) |
| `onChange` | `on_change` | `string array -> unit` | | Called with the options chosen |
| `placeholder` | `placeholder` | `string` | `"Select an item"` | Shown while nothing is chosen |
| `disabledKeys` | `disabled_keys` | `string array` | | Options that cannot be chosen |
| `isOpen` | `is_open` | `bool` | | Whether the list is open (controlled) |
| `defaultOpen` | `default_open` | `bool` | | Whether the list is open at first |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Called as the list opens and closes |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether it is disabled |
| `isRequired` | `is_required` | `bool` | `false` | Whether a form requires a choice |
| `isInvalid` | `is_invalid` | `bool` | `false` | Whether its choice is invalid |
| `name` | `name` | `string` | | Its name in a form |
| `className` | `class_` | `string` | | Added after its own classes |
| `children` | `children` | elements | | Its trigger and popover |

### Inline_select.Trigger

| React | solidtype | Type | Description |
|---|---|---|---|
| `aria-label` | `aria_label` | `string` | Its name |
| `className` | `class_` | `string` | Added after its own classes |
| `children` | `children` | elements, or a function of its state | Its value and indicator, or anything else |

### Inline_select.Value

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after its own classes |
| `children` | `children` | elements, or a function of its state | Drawn while an option is chosen, in place of the option |

### Inline_select.Indicator

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after its own classes |
| `children` | `children` | elements | An icon in place of its chevrons |

### Inline_select.Popover

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `placement` | `placement` | `Select.placement` | `` `bottom_end `` | Where the list sits beside the trigger |
| `className` | `class_` | `string` | | Added after its own classes |
| `children` | `children` | elements | | Its `List_box` |
