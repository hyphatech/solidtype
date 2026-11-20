# TagGroup

A focusable list of tags with support for keyboard navigation, selection, and removal.

A tag's key is its `id`. Keys are `string`s, and a selection is a
`string array`.

Original HeroUI documentation: [TagGroup](https://heroui.com/en/docs/react/components/tag-group).

## Usage

```ocaml title="tag_group_usage.mlx"
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group
module Gravity = Solidtype_gravity_icons

let make () =
  <Tag_group aria_label="Tags" selection_mode=`single>
    <Tag_group.List>
      <Tag id="default-news"><Gravity.Square_article /> "News"</Tag>
      <Tag id="default-travel"><Gravity.Planet_earth /> "Travel"</Tag>
      <Tag id="default-gaming"><Gravity.Rocket /> "Gaming"</Tag>
      <Tag id="default-shopping"><Gravity.Shopping_bag /> "Shopping"</Tag>
    </Tag_group.List>
  </Tag_group>
```

## Parity

The same HeroUI TagGroup twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two groups: a
marked row is one they disagree on.

## Anatomy

```ocaml
<Tag_group>
  <Label />
  <Tag_group.List>
    <Tag> <Tag.Remove_button /> </Tag>
  </Tag_group.List>
  <Description />
  <Error_message />
</Tag_group>
```

## Examples

### Sizes

```ocaml title="tag_group_sizes.mlx"
module Label = Solidtype_heroui.Label
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group

let make () =
  <div class_="flex flex-col gap-6">
    <Tag_group selection_mode=`single size=`sm>
      <Label>"Small"</Label>
      <Tag_group.List>
        <Tag>"News"</Tag> <Tag>"Travel"</Tag> <Tag>"Gaming"</Tag>
      </Tag_group.List>
    </Tag_group>
    <Tag_group selection_mode=`single size=`md>
      <Label>"Medium"</Label>
      <Tag_group.List>
        <Tag>"News"</Tag> <Tag>"Travel"</Tag> <Tag>"Gaming"</Tag>
      </Tag_group.List>
    </Tag_group>
    <Tag_group selection_mode=`single size=`lg>
      <Label>"Large"</Label>
      <Tag_group.List>
        <Tag>"News"</Tag> <Tag>"Travel"</Tag> <Tag>"Gaming"</Tag>
      </Tag_group.List>
    </Tag_group>
  </div>
```

### Variants

```ocaml title="tag_group_variants.mlx"
module Label = Solidtype_heroui.Label
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group

let make () =
  <div class_="flex flex-col gap-8">
    <Tag_group selection_mode=`single variant=`default>
      <Label>"Default"</Label>
      <Tag_group.List>
        <Tag>"News"</Tag> <Tag>"Travel"</Tag> <Tag>"Gaming"</Tag>
      </Tag_group.List>
    </Tag_group>
    <Tag_group selection_mode=`single variant=`surface>
      <Label>"Surface"</Label>
      <Tag_group.List>
        <Tag>"News"</Tag> <Tag>"Travel"</Tag> <Tag>"Gaming"</Tag>
      </Tag_group.List>
    </Tag_group>
  </div>
```

### Disabled

A tag is disabled by its own `is_disabled`, or by the group's `disabled_keys`.
The group's `is_disabled` disables every tag.

```ocaml title="tag_group_disabled.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group

let make () =
  <div class_="flex flex-col gap-4">
    <Tag_group selection_mode=`single>
      <Label>"Disabled Tags"</Label>
      <Tag_group.List>
        <Tag is_disabled=true>"News"</Tag>
        <Tag>"Travel"</Tag>
        <Tag is_disabled=true>"Gaming"</Tag>
      </Tag_group.List>
      <Description>"Some tags are disabled"</Description>
    </Tag_group>
    <Tag_group disabled_keys=[| "travel" |] selection_mode=`single>
      <Label>"Disabled Keys"</Label>
      <Tag_group.List>
        <Tag id="news">"News"</Tag>
        <Tag id="travel">"Travel"</Tag>
        <Tag id="gaming">"Gaming"</Tag>
      </Tag_group.List>
      <Description>"Tags disabled via disabled_keys prop"</Description>
    </Tag_group>
  </div>
```

### Selection Modes

```ocaml title="tag_group_selection_modes.mlx"
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group

let make () =
  let single, set_single = S.create_signal [| "news" |] in
  let multiple, set_multiple = S.create_signal [| "news"; "travel" |] in
  <div class_="flex flex-col gap-8">
    <Tag_group
      selected_keys=(S.get single)
      selection_mode=`single
      on_selection_change=(S.set set_single)>
      <Label>"Single Selection"</Label>
      <Tag_group.List>
        <Tag id="news">"News"</Tag>
        <Tag id="travel">"Travel"</Tag>
        <Tag id="gaming">"Gaming"</Tag>
        <Tag id="shopping">"Shopping"</Tag>
      </Tag_group.List>
      <Description>"Choose one category"</Description>
    </Tag_group>
    <Tag_group
      selected_keys=(S.get multiple)
      selection_mode=`multiple
      on_selection_change=(S.set set_multiple)>
      <Label>"Multiple Selection"</Label>
      <Tag_group.List>
        <Tag id="news">"News"</Tag>
        <Tag id="travel">"Travel"</Tag>
        <Tag id="gaming">"Gaming"</Tag>
        <Tag id="shopping">"Shopping"</Tag>
      </Tag_group.List>
      <Description>"Choose multiple categories"</Description>
    </Tag_group>
  </div>
```

### Controlled

```ocaml title="tag_group_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group

let make () =
  let selected, set_selected = S.create_signal [| "news"; "travel" |] in
  <div class_="flex flex-col gap-3">
    <Tag_group
      selected_keys=(S.get selected)
      selection_mode=`multiple
      on_selection_change=(S.set set_selected)>
      <Label>"Categories (controlled)"</Label>
      <Tag_group.List>
        <Tag id="news">"News"</Tag>
        <Tag id="travel">"Travel"</Tag>
        <Tag id="gaming">"Gaming"</Tag>
        <Tag id="shopping">"Shopping"</Tag>
      </Tag_group.List>
      <Description>
        "Selected: "
        (Jsx.string
           (match S.get selected with
           | [||] -> "None"
           | keys -> String.concat ", " (Array.to_list keys)))
      </Description>
    </Tag_group>
  </div>
```

### With Error Message

```ocaml title="tag_group_with_error_message.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Description = Solidtype_heroui.Description
module Error_message = Solidtype_heroui.Error_message
module Label = Solidtype_heroui.Label
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group

let make () =
  let selected, set_selected = S.create_signal [||] in
  let invalid () = Array.length (S.get selected) = 0 in
  <Tag_group
    selected_keys=(S.get selected)
    selection_mode=`multiple
    on_selection_change=(S.set set_selected)>
    <Label>"Amenities"</Label>
    <Tag_group.List>
      <Tag id="laundry">"Laundry"</Tag>
      <Tag id="fitness">"Fitness center"</Tag>
      <Tag id="parking">"Parking"</Tag>
      <Tag id="pool">"Swimming pool"</Tag>
      <Tag id="breakfast">"Breakfast"</Tag>
    </Tag_group.List>
    <Description>
      (Jsx.string
         (if invalid () then "Select at least one category"
          else
            "Selected: " ^ String.concat ", " (Array.to_list (S.get selected))))
    </Description>
    <Error_message>
      (Jsx.string
         (if invalid () then "Please select at least one category" else ""))
    </Error_message>
  </Tag_group>
```

### With List Data

Tags drawn from a signal by `For`, removed from it by `on_remove`.

```ocaml title="tag_group_with_list_data.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Show = Solidtype.Show
module Avatar = Solidtype_heroui.Avatar
module Description = Solidtype_heroui.Description
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group

type user = { id : string; name : string; avatar : string; fallback : string }

let avatar color =
  "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/" ^ color
  ^ ".jpg"

let users =
  [|
    { id = "fred"; name = "Fred"; avatar = avatar "blue"; fallback = "F" };
    {
      id = "michael";
      name = "Michael";
      avatar = avatar "green";
      fallback = "M";
    };
    { id = "jane"; name = "Jane"; avatar = avatar "purple"; fallback = "J" };
    { id = "alice"; name = "Alice"; avatar = avatar "red"; fallback = "A" };
    { id = "bob"; name = "Bob"; avatar = avatar "orange"; fallback = "B" };
    {
      id = "charlie";
      name = "Charlie";
      avatar = avatar "black";
      fallback = "C";
    };
  |]

let make () =
  let items, set_items = S.create_signal users in
  let selected, set_selected = S.create_signal [| "fred"; "michael" |] in
  let kept keys k = not (Array.exists (String.equal k) keys) in
  let remove keys =
    S.update set_items (Js.Array.filter ~f:(fun u -> kept keys u.id));
    S.update set_selected (Js.Array.filter ~f:(kept keys))
  in
  let chosen () =
    Js.Array.filter
      ~f:(fun u -> Array.exists (String.equal u.id) (S.get selected))
      (S.get items)
  in
  <div class_="w-sm">
    <Tag_group
      selected_keys=(S.get selected)
      selection_mode=`multiple
      on_remove=remove
      on_selection_change=(S.set set_selected)>
      <Label>"Team Members"</Label>
      <Tag_group.List
        render_empty_state=(fun _ ->
                             <Empty_state class_="p-1">
                               "No team members"
                             </Empty_state>)>
        <For each=(S.get items)>
          (fun user _ ->
            <Tag id=user.id text_value=user.name>
              <Avatar class_="size-4" size=`sm>
                <Avatar.Image src=user.avatar />
                <Avatar.Fallback>(Jsx.string user.fallback)</Avatar.Fallback>
              </Avatar>
              (Jsx.string user.name)
            </Tag>)
        </For>
      </Tag_group.List>
      <Description>"Select team members for your project"</Description>
    </Tag_group>
    <Show when_=(Array.length (chosen ()) > 0)>
      <div class_="mt-4 flex flex-col gap-2">
        <p class_="text-sm font-medium text-muted">"Selected:"</p>
        <div class_="flex flex-wrap gap-2">
          <For each=(chosen ())>
            (fun user _ ->
              <div
                class_="flex items-center gap-2 rounded-lg bg-surface-tertiary \
                        px-2 py-1">
                <Avatar class_="size-4" size=`sm>
                  <Avatar.Image src=user.avatar />
                  <Avatar.Fallback>(Jsx.string user.fallback)</Avatar.Fallback>
                </Avatar>
                <span class_="text-sm">(Jsx.string user.name)</span>
              </div>)
          </For>
        </div>
      </div>
    </Show>
  </div>
```

### With Prefix

```ocaml title="tag_group_with_prefix.mlx"
module Avatar = Solidtype_heroui.Avatar
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-col gap-8">
    <Tag_group selection_mode=`single>
      <Label>"With Icons"</Label>
      <Tag_group.List>
        <Tag><Gravity.Square_article /> "News"</Tag>
        <Tag><Gravity.Planet_earth /> "Travel"</Tag>
        <Tag><Gravity.Rocket /> "Gaming"</Tag>
        <Tag><Gravity.Shopping_bag /> "Shopping"</Tag>
      </Tag_group.List>
      <Description>"Tags with icons"</Description>
    </Tag_group>
    <Tag_group selection_mode=`single>
      <Label>"With Avatars"</Label>
      <Tag_group.List>
        <Tag>
          <Avatar class_="size-4">
            <Avatar.Image
              src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg"
            />
            <Avatar.Fallback>"F"</Avatar.Fallback>
          </Avatar>
          "Fred"
        </Tag>
        <Tag>
          <Avatar class_="size-4">
            <Avatar.Image
              src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"
            />
            <Avatar.Fallback>"M"</Avatar.Fallback>
          </Avatar>
          "Michael"
        </Tag>
        <Tag>
          <Avatar class_="size-4">
            <Avatar.Image
              src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg"
            />
            <Avatar.Fallback>"J"</Avatar.Fallback>
          </Avatar>
          "Jane"
        </Tag>
      </Tag_group.List>
      <Description>"Tags with avatars"</Description>
    </Tag_group>
  </div>
```

### With Remove Button

Given `on_remove`, each tag draws a remove button. A `Tag.Remove_button`
among a tag's children takes its place; a tag whose children are a function
draws its own, where `allows_removing` holds.

```ocaml title="tag_group_with_remove_button.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Description = Solidtype_heroui.Description
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group
module Gravity = Solidtype_gravity_icons

let without keys =
  Js.Array.filter ~f:(fun (id, _) -> not (Array.exists (String.equal id) keys))

let make () =
  let tags, set_tags =
    S.create_signal
      [|
        ("news", "News");
        ("travel", "Travel");
        ("gaming", "Gaming");
        ("shopping", "Shopping");
      |]
  in
  let frameworks, set_frameworks =
    S.create_signal
      [|
        ("react", "React");
        ("vue", "Vue");
        ("angular", "Angular");
        ("svelte", "Svelte");
      |]
  in
  <div class_="flex flex-col gap-8">
    <div class_="w-sm">
      <Tag_group
        selection_mode=`single
        on_remove=(fun keys -> S.update set_tags (without keys))>
        <Label>"Default Remove Button"</Label>
        <Tag_group.List
          render_empty_state=(fun _ ->
                               <Empty_state class_="p-1">
                                 "No categories found"
                               </Empty_state>)>
          <For each=(S.get tags)>
            (fun (id, name) _ ->
              <Tag id text_value=name>(Jsx.string name)</Tag>)
          </For>
        </Tag_group.List>
        <Description>"Click the X to remove tags"</Description>
      </Tag_group>
    </div>
    <div class_="w-md">
      <Tag_group
        selection_mode=`single
        on_remove=(fun keys -> S.update set_frameworks (without keys))>
        <Label>"Custom Remove Button"</Label>
        <Tag_group.List
          render_empty_state=(fun _ ->
                               <Empty_state class_="p-1">
                                 "No frameworks found"
                               </Empty_state>)>
          <For each=(S.get frameworks)>
            (fun (id, name) _ ->
              <Tag id text_value=name>
                (fun (s : Tag.state) ->
                  Jsx.fragment
                    [|
                      Jsx.string name;
                      (if S.get s.allows_removing then
                         <Tag.Remove_button>
                           <Gravity.Circle_xmark_fill />
                         </Tag.Remove_button>
                       else Jsx.nothing);
                    |])
              </Tag>)
          </For>
        </Tag_group.List>
        <Description>"Custom remove button with icon"</Description>
      </Tag_group>
    </div>
  </div>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, on each part.

```ocaml title="tag_group_custom_styles.mlx"
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group
module Gravity = Solidtype_gravity_icons

let tag_class =
  "group/tag gap-1.5 rounded-full border border-neutral-300/80 bg-white/80 \
   px-2.5 py-1 text-sm font-medium text-neutral-700 shadow-sm ring-1 \
   ring-black/5 backdrop-blur-sm transition-colors \
   data-[selected=true]:border-neutral-500 data-[selected=true]:bg-neutral-900 \
   data-[selected=true]:text-neutral-50 dark:border-neutral-600/80 \
   dark:bg-neutral-900/60 dark:text-neutral-200 dark:ring-white/10 \
   dark:data-[selected=true]:border-neutral-400 \
   dark:data-[selected=true]:bg-neutral-100 \
   dark:data-[selected=true]:text-neutral-900"

let icon_class =
  "size-4 shrink-0 text-neutral-500 \
   group-data-[selected=true]/tag:text-current dark:text-neutral-400"

let make () =
  <Tag_group aria_label="Topics" selection_mode=`single>
    <Tag_group.List class_="gap-2">
      <Tag class_=tag_class id="news">
        <Gravity.Square_article class_=icon_class /> "News"
      </Tag>
      <Tag class_=tag_class id="travel">
        <Gravity.Planet_earth class_=icon_class /> "Travel"
      </Tag>
      <Tag class_=tag_class id="gaming">
        <Gravity.Rocket class_=icon_class /> "Gaming"
      </Tag>
      <Tag class_=tag_class id="shopping">
        <Gravity.Shopping_bag class_=icon_class /> "Shopping"
      </Tag>
    </Tag_group.List>
  </Tag_group>
```

## Styling Reference

### CSS Classes

- `.tag-group` - Base tag group container
- `.tag-group__list` - Container for the list of tags
- `.tag` - Base tag styles
- `.tag__remove-button` - Remove button trigger
- `.tag--sm`, `.tag--md`, `.tag--lg` - Sizes
- `.tag--default`, `.tag--surface` - Variants

### Interactive States

Each tag:

- **Selected**: `[data-selected="true"]`
- **Disabled**: `[data-disabled="true"]`
- **Hovered**: `[data-hovered="true"]`, while it can be chosen
- **Pressed**: `[data-pressed="true"]`, while it can be chosen
- **Focus**: `[data-focus-visible="true"]`, and `[data-focused="true"]`

The list declares `[data-empty="true"]` while it holds no tag.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### TagGroup

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `selectionMode` | `selection_mode` | `` [ `none \| `single \| `multiple ] `` | `` `none `` | The type of selection that is allowed |
| `selectedKeys` | `selected_keys` | `string array` | | The currently selected keys (controlled) |
| `defaultSelectedKeys` | `default_selected_keys` | `string array` | | The initial selected keys (uncontrolled) |
| `onSelectionChange` | `on_selection_change` | `string array -> unit` | | Handler called when the selection changes |
| `disabledKeys` | `disabled_keys` | `string array` | | Keys of disabled tags |
| `isDisabled` | `is_disabled` | `bool` | | Whether every tag is disabled |
| `onRemove` | `on_remove` | `string array -> unit` | | Handler called with the keys of tags removed |
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | `` `md `` | Size of the tags |
| `variant` | `variant` | `` [ `default \| `surface ] `` | `` `default `` | Look of the tags |
| `aria-label` | `aria_label` | `string` | | Its name, where it has no `Label` |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `render` | `as_` | a function of its props | | Draws another element in its place |

### TagGroup.List

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `renderEmptyState` | `render_empty_state` | `unit -> Jsx.element` | | What it shows while it holds no tag |
| `className` | `class_` | `string` | | Added after HeroUI's class |
| `render` | `as_` | a function of its props | | Draws another element in its place |

### Tag

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `id` | `id` | `string` | unique | The tag's key |
| `textValue` | `text_value` | `string` | its first text | What a reader is told it is |
| `isDisabled` | `is_disabled` | `bool` | | Whether the tag is disabled |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements, or a function of `Tag.state` | required | Its content |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |

`Tag.state` holds `is_selected`, `is_disabled`, `is_hovered`, `is_pressed`,
`is_focused`, `is_focus_visible` and `allows_removing`.

### Tag.RemoveButton

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | nodes | a cross | What it shows |

## Accessibility

- Tab reaches the tag last focused, or the first chosen, or the first, then
  its remove button.
- The arrows move from tag to tag, a disabled one passed over, wrapping at
  either end; Home and End reach the first and the last, and typing the start
  of a tag's name reaches it.
- A press, Space or Enter chooses a tag, and Escape clears what is chosen.
- Delete and Backspace remove the focused tag, or every chosen tag where it is
  chosen; the focus moves to the next tag, or to the list once none is left.
- A removable tag tells a reader how to remove it.
