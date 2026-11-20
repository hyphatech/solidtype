# Badge

Displays a small indicator positioned relative to another element, commonly used for notification counts, status dots, and labels.

Original HeroUI documentation: [Badge](https://heroui.com/en/docs/react/components/badge).

## Usage

```ocaml title="badge_usage.mlx"
module Avatar = Solidtype_heroui.Avatar
module Badge = Solidtype_heroui.Badge

let avatars = "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/"

let make () =
  <div class_="flex items-center gap-6">
    <Badge.Anchor>
      <Avatar>
        <Avatar.Image src=(avatars ^ "green.jpg") />
        <Avatar.Fallback>"JD"</Avatar.Fallback>
      </Avatar>
      <Badge color=`danger size=`sm>"5"</Badge>
    </Badge.Anchor>
    <Badge.Anchor>
      <Avatar>
        <Avatar.Image src=(avatars ^ "orange.jpg") />
        <Avatar.Fallback>"AB"</Avatar.Fallback>
      </Avatar>
      <Badge color=`accent size=`sm>"New"</Badge>
    </Badge.Anchor>
    <Badge.Anchor>
      <Avatar>
        <Avatar.Image src=(avatars ^ "blue.jpg") />
        <Avatar.Fallback>"CD"</Avatar.Fallback>
      </Avatar>
      <Badge color=`success placement=`bottom_right size=`sm />
    </Badge.Anchor>
  </div>
```

## Parity

The same HeroUI Badge twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of the two badges: a
marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

## Anatomy

```ocaml
<Badge.Anchor>
  <Avatar />
  <Badge color=`danger>"5"</Badge>
</Badge.Anchor>
```

Badge is designed to be positioned relative to another element using
`Badge.Anchor`. Plain-text children are automatically wrapped in
`Badge.Label`.

For standalone label usage, use the [Chip](chip.md) component
instead.

## Examples

### Variants

```ocaml title="badge_variants.mlx"
module Avatar = Solidtype_heroui.Avatar
module Badge = Solidtype_heroui.Badge
module Separator = Solidtype_heroui.Separator

let avatar =
  "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"

let colors = [| `accent; `default; `success; `warning; `danger |]

let row ~name ~variant =
  <div class_="flex flex-col gap-4">
    <h3 class_="text-sm font-semibold text-muted capitalize">
      (Solidtype.Jsx.string name)
    </h3>
    <div class_="flex items-center gap-6">
      <Solidtype.For each=colors>
        (fun color _ ->
          <Badge.Anchor>
            <Avatar>
              <Avatar.Image src=avatar />
              <Avatar.Fallback>"JD"</Avatar.Fallback>
            </Avatar>
            <Badge color size=`sm variant>"5"</Badge>
          </Badge.Anchor>)
      </Solidtype.For>
    </div>
  </div>

let make () =
  <div class_="flex flex-col gap-8">
    (row ~name:"primary" ~variant:`primary)
    <Separator />
    (row ~name:"secondary" ~variant:`secondary)
    <Separator />
    (row ~name:"soft" ~variant:`soft)
  </div>
```

### Sizes

```ocaml title="badge_sizes.mlx"
module Avatar = Solidtype_heroui.Avatar
module Badge = Solidtype_heroui.Badge

let avatar =
  "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"

let make () =
  <div class_="flex items-center gap-6">
    <Solidtype.For each=[| `sm; `md; `lg |]>
      (fun size _ ->
        <Badge.Anchor>
          <Avatar size>
            <Avatar.Image src=avatar /> <Avatar.Fallback>"JD"</Avatar.Fallback>
          </Avatar>
          <Badge color=`danger size>"5"</Badge>
        </Badge.Anchor>)
    </Solidtype.For>
  </div>
```

### Colors

```ocaml title="badge_colors.mlx"
module Avatar = Solidtype_heroui.Avatar
module Badge = Solidtype_heroui.Badge

let avatar =
  "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"

let make () =
  <div class_="flex items-center gap-6">
    <Solidtype.For each=[| `default; `accent; `success; `warning; `danger |]>
      (fun color _ ->
        <Badge.Anchor>
          <Avatar>
            <Avatar.Image src=avatar /> <Avatar.Fallback>"JD"</Avatar.Fallback>
          </Avatar>
          <Badge color size=`sm />
        </Badge.Anchor>)
    </Solidtype.For>
  </div>
```

### Placements

```ocaml title="badge_placements.mlx"
module Avatar = Solidtype_heroui.Avatar
module Badge = Solidtype_heroui.Badge

let avatar =
  "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"

let placements =
  [|
    (`top_right, "top-right");
    (`top_left, "top-left");
    (`bottom_right, "bottom-right");
    (`bottom_left, "bottom-left");
  |]

let make () =
  <div class_="flex items-center gap-8">
    <Solidtype.For each=placements>
      (fun (placement, name) _ ->
        <div class_="flex flex-col items-center gap-2">
          <Badge.Anchor>
            <Avatar>
              <Avatar.Image src=avatar />
              <Avatar.Fallback>"JD"</Avatar.Fallback>
            </Avatar>
            <Badge color=`accent placement size=`sm />
          </Badge.Anchor>
          <span class_="text-xs text-muted">(Solidtype.Jsx.string name)</span>
        </div>)
    </Solidtype.For>
  </div>
```

### Dot Badge

Empty badges act as status indicators, useful for online/offline states or
activity signals.

```ocaml title="badge_dot.mlx"
module Avatar = Solidtype_heroui.Avatar
module Badge = Solidtype_heroui.Badge

let avatar =
  "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"

let make () =
  <div class_="flex items-center gap-6">
    <Solidtype.For each=[| `accent; `success; `warning; `danger |]>
      (fun color _ ->
        <Badge.Anchor>
          <Avatar>
            <Avatar.Image src=avatar /> <Avatar.Fallback>"JD"</Avatar.Fallback>
          </Avatar>
          <Badge color placement=`bottom_right size=`sm />
        </Badge.Anchor>)
    </Solidtype.For>
  </div>
```

### With Content

Badge supports text, numbers, and icons as content. When no children are
provided, it renders as a dot indicator.

```ocaml title="badge_with_content.mlx"
module Avatar = Solidtype_heroui.Avatar
module Badge = Solidtype_heroui.Badge
module Gravity = Solidtype_gravity_icons

let avatar =
  "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"

let anchored badge =
  <Badge.Anchor>
    <Avatar>
      <Avatar.Image src=avatar /> <Avatar.Fallback>"JD"</Avatar.Fallback>
    </Avatar>
    (badge ())
  </Badge.Anchor>

let make () =
  <div class_="flex items-center gap-6">
    (anchored (fun () -> <Badge color=`danger size=`sm>"5"</Badge>))
    (anchored (fun () -> <Badge color=`danger size=`sm>"New"</Badge>))
    (anchored (fun () -> <Badge color=`danger size=`sm>"99+"</Badge>))
    (anchored (fun () ->
         <Badge color=`accent size=`sm>
           <Gravity.Bell class_="size-2.5" />
         </Badge>))
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="badge_tailwind.mlx"
module Avatar = Solidtype_heroui.Avatar
module Badge = Solidtype_heroui.Badge

let make () =
  <Badge.Anchor>
    <Avatar>
      <Avatar.Image
        alt="Kate Wilson"
        src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg"
      />
      <Avatar.Fallback>"KW"</Avatar.Fallback>
    </Avatar>
    <Badge
      class_="min-w-5 font-semibold tabular-nums"
      color=`accent
      size=`sm
      variant=`soft>
      "5"
    </Badge>
  </Badge.Anchor>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every one, as with
HeroUI in React:

```css
@layer components {
  .badge {
    @apply font-bold;
  }
}
```

## Styling Reference

### CSS Classes

- `.badge` - Base badge container styles
- `.badge__label` - Label text slot styles
- `.badge-anchor` - Positioning wrapper for the anchored element
- `.badge--accent` - Accent color variant
- `.badge--danger` - Danger color variant
- `.badge--default` - Default color variant
- `.badge--success` - Success color variant
- `.badge--warning` - Warning color variant
- `.badge--primary` - Primary variant with filled background
- `.badge--secondary` - Secondary variant with default background
- `.badge--soft` - Soft variant with lighter background
- `.badge--sm` - Small size
- `.badge--md` - Medium size (default)
- `.badge--lg` - Large size
- `.badge--top-right` - Position at top-right corner (default)
- `.badge--top-left` - Position at top-left corner
- `.badge--bottom-right` - Position at bottom-right corner
- `.badge--bottom-left` - Position at bottom-left corner

Badges combine variant and color classes (e.g. `.badge--primary.badge--accent`
or `.badge--soft.badge--danger`): each `primary` and `soft` combination has
default styles defined.

## API Reference

Each prop beside the name HeroUI's React component gives it. A tag is the
string React takes, a hyphen written as an underscore: `` `top_right `` is
`"top-right"`.

### Badge

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `color` | `color` | `` [ `accent \| `default \| `success \| `warning \| `danger ] `` | `` `default `` | Color variant of the badge |
| `variant` | `variant` | `` [ `primary \| `secondary \| `soft ] `` | `` `primary `` | Visual style variant |
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | `` `md `` | Size of the badge |
| `placement` | `placement` | `` [ `top_right \| `top_left \| `bottom_right \| `bottom_left ] `` | `` `top_right `` | Position of the badge relative to its anchor |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Content to display inside the badge (text, number, or icon); text becomes a `Badge.Label`. When omitted, renders as a dot. |

### Badge.Anchor and Badge.Label

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's class |
| `children` | `children` | elements | The anchor's: the element to anchor the badge to, plus the badge itself. The label's: label text content |
