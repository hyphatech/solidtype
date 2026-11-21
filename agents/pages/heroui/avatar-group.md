# AvatarGroup

Display a stacked or grid group of avatars with overflow counting.

Original HeroUI documentation: [AvatarGroup](https://heroui.com/en/docs/react/components/avatar-group).

## Usage

```ocaml title="avatar_group_usage.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Avatar = Solidtype_heroui.Avatar
module Avatar_group = Solidtype_heroui.Avatar_group

let users =
  [|
    ( "John Doe",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg"
    );
    ( "Kate Wilson",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"
    );
    ( "Emily Chen",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg"
    );
    ( "Michael Brown",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/orange.jpg"
    );
    ( "Olivia Davis",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/red.jpg" );
  |]

(* "John Doe" is "JD". *)
let initials name =
  String.split_on_char ' ' name
  |> List.filter_map (fun word ->
      if String.length word > 0 then Some (String.make 1 word.[0]) else None)
  |> String.concat ""

let make () =
  <Avatar_group>
    <For each=(Array.sub users 0 4)>
      (fun (name, image) _ ->
        <Avatar>
          <Avatar.Image alt=name src=image />
          <Avatar.Fallback>(Jsx.string (initials name))</Avatar.Fallback>
        </Avatar>)
    </For>
  </Avatar_group>
```

## Parity

The same HeroUI AvatarGroup twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two groups: a
marked row is one they disagree on.

## Anatomy

```ocaml
<Avatar_group>
  <Avatar>
    <Avatar.Image alt="Ada Lovelace" src="/ada.png" />
    <Avatar.Fallback>"AL"</Avatar.Fallback>
  </Avatar>
  <Avatar_group.Count>"+3"</Avatar_group.Count>
</Avatar_group>
```

`Avatar_group.Count` is an optional explicit child.

## Examples

### Max

`max` shows the first avatars and counts the rest.

```ocaml title="avatar_group_max.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Avatar = Solidtype_heroui.Avatar
module Avatar_group = Solidtype_heroui.Avatar_group

let users =
  [|
    ( "John Doe",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg"
    );
    ( "Kate Wilson",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"
    );
    ( "Emily Chen",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg"
    );
    ( "Michael Brown",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/orange.jpg"
    );
    ( "Olivia Davis",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/red.jpg" );
  |]

(* "John Doe" is "JD". *)
let initials name =
  String.split_on_char ' ' name
  |> List.filter_map (fun word ->
      if String.length word > 0 then Some (String.make 1 word.[0]) else None)
  |> String.concat ""

let make () =
  <Avatar_group max=3>
    <For each=users>
      (fun (name, image) _ ->
        <Avatar>
          <Avatar.Image alt=name src=image />
          <Avatar.Fallback>(Jsx.string (initials name))</Avatar.Fallback>
        </Avatar>)
    </For>
  </Avatar_group>
```

### With Count

For a total the page knows, an `Avatar_group.Count` of its own: the group
counts none itself, and shows it whatever its `max`.

```ocaml title="avatar_group_count.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Avatar = Solidtype_heroui.Avatar
module Avatar_group = Solidtype_heroui.Avatar_group

let users =
  [|
    ( "John Doe",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg"
    );
    ( "Kate Wilson",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"
    );
    ( "Emily Chen",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg"
    );
    ( "Michael Brown",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/orange.jpg"
    );
    ( "Olivia Davis",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/red.jpg" );
  |]

(* "John Doe" is "JD". *)
let initials name =
  String.split_on_char ' ' name
  |> List.filter_map (fun word ->
      if String.length word > 0 then Some (String.make 1 word.[0]) else None)
  |> String.concat ""

let make () =
  let total = 12 in
  <Avatar_group size=`sm>
    <For each=(Array.sub users 0 3)>
      (fun (name, image) _ ->
        <Avatar>
          <Avatar.Image alt=name src=image />
          <Avatar.Fallback>(Jsx.string (initials name))</Avatar.Fallback>
        </Avatar>)
    </For>
    <Avatar_group.Count>
      (Jsx.string ("+" ^ string_of_int (total - 3)))
    </Avatar_group.Count>
  </Avatar_group>
```

### Sizes

```ocaml title="avatar_group_sizes.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Avatar = Solidtype_heroui.Avatar
module Avatar_group = Solidtype_heroui.Avatar_group

let users =
  [|
    ( "John Doe",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg"
    );
    ( "Kate Wilson",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"
    );
    ( "Emily Chen",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg"
    );
    ( "Michael Brown",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/orange.jpg"
    );
    ( "Olivia Davis",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/red.jpg" );
  |]

(* "John Doe" is "JD". *)
let initials name =
  String.split_on_char ' ' name
  |> List.filter_map (fun word ->
      if String.length word > 0 then Some (String.make 1 word.[0]) else None)
  |> String.concat ""

let make () =
  <div class_="flex flex-col items-center gap-6">
    <div class_="flex flex-col items-center gap-2">
      <p class_="text-sm text-muted">"Small"</p>
      <Avatar_group size=`sm>
        <For each=(Array.sub users 0 4)>
          (fun (name, image) _ ->
            <Avatar>
              <Avatar.Image alt=name src=image />
              <Avatar.Fallback>(Jsx.string (initials name))</Avatar.Fallback>
            </Avatar>)
        </For>
      </Avatar_group>
    </div>
    <div class_="flex flex-col items-center gap-2">
      <p class_="text-sm text-muted">"Medium (default)"</p>
      <Avatar_group size=`md>
        <For each=(Array.sub users 0 4)>
          (fun (name, image) _ ->
            <Avatar>
              <Avatar.Image alt=name src=image />
              <Avatar.Fallback>(Jsx.string (initials name))</Avatar.Fallback>
            </Avatar>)
        </For>
      </Avatar_group>
    </div>
    <div class_="flex flex-col items-center gap-2">
      <p class_="text-sm text-muted">"Large"</p>
      <Avatar_group size=`lg>
        <For each=(Array.sub users 0 4)>
          (fun (name, image) _ ->
            <Avatar>
              <Avatar.Image alt=name src=image />
              <Avatar.Fallback>(Jsx.string (initials name))</Avatar.Fallback>
            </Avatar>)
        </For>
      </Avatar_group>
    </div>
  </div>
```

### Grid

```ocaml title="avatar_group_grid.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Avatar = Solidtype_heroui.Avatar
module Avatar_group = Solidtype_heroui.Avatar_group

let users =
  [|
    ( "John Doe",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg"
    );
    ( "Kate Wilson",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"
    );
    ( "Emily Chen",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg"
    );
    ( "Michael Brown",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/orange.jpg"
    );
    ( "Olivia Davis",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/red.jpg" );
  |]

(* "John Doe" is "JD". *)
let initials name =
  String.split_on_char ' ' name
  |> List.filter_map (fun word ->
      if String.length word > 0 then Some (String.make 1 word.[0]) else None)
  |> String.concat ""

let make () =
  <Avatar_group is_grid=true max=5>
    <For each=users>
      (fun (name, image) _ ->
        <Avatar>
          <Avatar.Image alt=name src=image />
          <Avatar.Fallback>(Jsx.string (initials name))</Avatar.Fallback>
        </Avatar>)
    </For>
  </Avatar_group>
```

### Overlap

`` `clip ``, the default, leaves a crescent seam between avatars, and
`` `ring `` a solid outline; neither applies to a grid.

```ocaml title="avatar_group_overlap.mlx"
module Avatar = Solidtype_heroui.Avatar
module Avatar_group = Solidtype_heroui.Avatar_group

let group overlap =
  <Avatar_group overlap size=`lg>
    <Avatar>
      <Avatar.Image
        alt="John"
        src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg"
      />
      <Avatar.Fallback>"JD"</Avatar.Fallback>
    </Avatar>
    <Avatar><Avatar.Fallback>"AB"</Avatar.Fallback></Avatar>
    <Avatar>
      <Avatar.Image
        alt="Emily"
        src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg"
      />
      <Avatar.Fallback>"EC"</Avatar.Fallback>
    </Avatar>
    <Avatar><Avatar.Fallback>"SM"</Avatar.Fallback></Avatar>
    <Avatar_group.Count>"+2"</Avatar_group.Count>
  </Avatar_group>

(* A striped backdrop, which shows the seam each overlap leaves. *)
let backdrop child =
  <div class_="relative inline-flex rounded-xl p-6">
    <div
      aria_hidden=true
      class_="pointer-events-none absolute inset-0 rounded-xl \
              bg-[repeating-linear-gradient(-45deg,transparent_0_10px,color-mix(in_oklab,var(--danger)_20%,transparent)_10px_11px)]"
    />
    <div class_="relative z-10">child</div>
  </div>

let make () =
  <div class_="flex flex-col items-start gap-6">
    <div class_="flex flex-col gap-2">
      <p class_="text-sm text-muted">"clip"</p> (backdrop (group `clip))
    </div>
    <div class_="flex flex-col gap-2">
      <p class_="text-sm text-muted">"ring"</p> (backdrop (group `ring))
    </div>
  </div>
```

## Counting

Avatars are counted in the order they were made: an avatar a `For` adds later
is counted after the others, wherever it is shown.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes; a group that means something, as
assignees do, takes a role and a name.

```ocaml title="avatar_group_tailwind.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Avatar = Solidtype_heroui.Avatar
module Avatar_group = Solidtype_heroui.Avatar_group

let users =
  [|
    ( "John Doe",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg"
    );
    ( "Kate Wilson",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"
    );
    ( "Emily Chen",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg"
    );
    ( "Michael Brown",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/orange.jpg"
    );
    ( "Olivia Davis",
      "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/red.jpg" );
  |]

(* "John Doe" is "JD". *)
let initials name =
  String.split_on_char ' ' name
  |> List.filter_map (fun word ->
      if String.length word > 0 then Some (String.make 1 word.[0]) else None)
  |> String.concat ""

let make () =
  <div
    class_="inline-flex items-center gap-2.5 rounded-full border \
            border-border/70 bg-surface/95 py-1 pr-3 pl-1 shadow-sm ring-1 \
            ring-black/[0.04] dark:border-border/80 dark:bg-surface/90 \
            dark:ring-white/10">
    <Avatar_group
      aria_label="Assignees"
      class_="[--avatar-group-overlap:0.7rem] [--avatar-group-seam:2px]"
      overlap=`clip
      role=`group
      size=`sm>
      <For each=(Array.sub users 0 3)>
        (fun (name, image) _ ->
          <Avatar>
            <Avatar.Image alt=name src=image />
            <Avatar.Fallback>(Jsx.string (initials name))</Avatar.Fallback>
          </Avatar>)
      </For>
    </Avatar_group>
    <span class_="text-xs font-medium text-muted">"3 assignees"</span>
  </div>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every group, as with
HeroUI in React. The overlap is `--avatar-group-overlap`, `0.5rem` by
default, and the seam `--avatar-group-seam`.

## Styling Reference

### CSS Classes

- `.avatar-group` - Base avatar group container
- `.avatar-group--grid` - Grid layout modifier (no overlap)
- `.avatar-group--clip` - Transparent seam tracing the next avatar's outline
  (default stacked overlap)
- `.avatar-group--ring` - Solid box-shadow outline via `--background`
- `.avatar-group__count` - Overflow count avatar

Stacked layout uses negative margin between siblings
(`--avatar-group-overlap`, default `0.5rem`). Clip mode masks overlapped
avatars (not the last child or the count); the seam follows the avatar's own
`--avatar-radius`, so a themed `--radius` reshapes avatars and seams together.
Ring mode uses a thin box-shadow outline via `--background`.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### AvatarGroup

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | `` `md `` | Size applied to child avatars (and the overflow count) when they omit `size` |
| `color` | `color` | `` [ `default \| `accent \| `success \| `warning \| `danger ] `` | | Color applied to child avatars (and the overflow count) when they omit `color` |
| `variant` | `variant` | `` [ `default \| `soft ] `` | | Variant applied to child avatars (and the overflow count) when they omit `variant` |
| `max` | `max` | `int` | | Maximum number of avatar children to render; omit to show all |
| `isGrid` | `is_grid` | `bool` | `false` | Whether to use a wrapping grid layout without overlap |
| `overlap` | `overlap` | `` [ `clip \| `ring ] `` | `` `clip `` | Stacked overlap style: transparent seam (default) or box-shadow ring; ignored when `is_grid` |
| `role` | `role` | `Solidtype.Html.Div.role` | | Its role, `` `group `` where it means something |
| `aria-label` | `aria_label` | `string` | | Its name |
| `aria-labelledby` | `aria_labelledby` | `string` | | The id of what names it |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Avatar components (and optional `Avatar_group.Count`) to group together |

### AvatarGroup.Count

The overflow indicator, an avatar with a fallback. Not truncated by `max`.

| React | solidtype | Type | Description |
|---|---|---|---|
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | Override size from the group |
| `color` | `color` | `` [ `default \| `accent \| `success \| `warning \| `danger ] `` | Override color from the group |
| `variant` | `variant` | `` [ `default \| `soft ] `` | Override variant from the group |
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | Count content (e.g. `"+3"`) |

## Note

- `Avatar_group` passes `size`, `color` and `variant` to every `Avatar` inside
  it that sets none itself
- `max` truncates visible avatars when set and auto-counts the rest; omit it
  to show all
- For a known total (e.g. from the server), add an explicit
  `Avatar_group.Count`: it is not truncated by `max` and suppresses the auto
  count
- `is_grid` disables overlap and uses a wrapping grid layout instead
- `overlap` defaults to `` `clip `` (transparent seam); use `` `ring `` for the
  solid outline; no effect with `is_grid`
- No role by default: when the stack is meaningful (assignees, viewers), pass
  `` role=`group `` with `aria_label` or `aria_labelledby`
