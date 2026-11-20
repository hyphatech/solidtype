# ScrollShadow

Apply visual shadows to indicate scrollable content overflow with automatic detection of scroll position.

Original HeroUI documentation: [ScrollShadow](https://heroui.com/en/docs/react/components/scroll-shadow).

## Usage

```ocaml title="scroll_shadow_usage.mlx"
module For = Solidtype.For
module Scroll_shadow = Solidtype_heroui.Scroll_shadow

let lorem =
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pulvinar \
   risus non risus hendrerit venenatis. Pellentesque sit amet hendrerit risus, \
   sed porttitor quam. Morbi accumsan cursus enim, sed ultricies sapien."

let paragraphs () =
  <div class_="space-y-4">
    <For each=(Array.make 10 lorem)>
      (fun text _ -> <p>(Solidtype.Jsx.string text)</p>)
    </For>
  </div>

let make () =
  <div class_="w-full p-0 sm:max-w-sm">
    <Scroll_shadow class_="max-h-[240px] p-4">(paragraphs ())</Scroll_shadow>
  </div>
```

## Parity

The same HeroUI ScrollShadow twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two: a marked
row is one they disagree on. Scroll them to see the edges each marks.

## Examples

### Orientation

```ocaml title="scroll_shadow_orientation.mlx"
module For = Solidtype.For
module Card = Solidtype_heroui.Card
module Scroll_shadow = Solidtype_heroui.Scroll_shadow

let lorem =
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pulvinar \
   risus non risus hendrerit venenatis. Pellentesque sit amet hendrerit risus, \
   sed porttitor quam. Morbi accumsan cursus enim, sed ultricies sapien."

let paragraphs () =
  <div class_="space-y-4">
    <For each=(Array.make 10 lorem)>
      (fun text _ -> <p>(Solidtype.Jsx.string text)</p>)
    </For>
  </div>

let images =
  [|
    "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/docs/robot1.jpeg";
    "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/docs/avocado.jpeg";
    "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/docs/oranges.jpeg";
  |]

let cards () =
  <div class_="flex flex-row gap-4">
    <For each=(Array.init 10 (fun i -> images.(i mod 3)))>
      (fun image _ ->
        <Card
          class_="flex min-w-[200px] flex-row gap-3 p-1" variant=`transparent>
          <img
            alt="Lorem Card"
            class_="aspect-square h-16 w-16 shrink-0 rounded-xl object-cover \
                    select-none sm:h-20 sm:w-20"
            loading="lazy"
            src=image
          />
          <div class_="flex flex-1 flex-col justify-center gap-1">
            <Card.Title class_="text-sm">"Bridging the Future"</Card.Title>
            <Card.Description class_="text-xs">
              "Today, 6:30 PM"
            </Card.Description>
          </div>
        </Card>)
    </For>
  </div>

let make () =
  <div class_="w-full sm:max-w-sm">
    <div class_="mb-8 w-full">
      <h4 class_="mb-2 text-sm font-semibold">"Vertical"</h4>
      <Card class_="w-full p-0">
        <Scroll_shadow class_="max-h-[240px] p-4" orientation=`vertical>
          (paragraphs ())
        </Scroll_shadow>
      </Card>
    </div>
    <div class_="w-full">
      <h4 class_="mb-2 text-sm font-semibold">"Horizontal"</h4>
      <Card class_="w-full p-0">
        <Scroll_shadow class_="p-4" orientation=`horizontal>
          (cards ())
        </Scroll_shadow>
      </Card>
    </div>
  </div>
```

### Shadow Size

```ocaml title="scroll_shadow_size.mlx"
module For = Solidtype.For
module Scroll_shadow = Solidtype_heroui.Scroll_shadow

let lorem =
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pulvinar \
   risus non risus hendrerit venenatis. Pellentesque sit amet hendrerit risus, \
   sed porttitor quam. Morbi accumsan cursus enim, sed ultricies sapien."

let paragraphs () =
  <div class_="space-y-4">
    <For each=(Array.make 10 lorem)>
      (fun text _ -> <p>(Solidtype.Jsx.string text)</p>)
    </For>
  </div>

let make () =
  <div class_="w-full p-0 sm:max-w-sm">
    <Scroll_shadow class_="max-h-[240px] p-4" size=80>
      (paragraphs ())
    </Scroll_shadow>
  </div>
```

### With Card

```ocaml title="scroll_shadow_card.mlx"
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Card = Solidtype_heroui.Card
module Scroll_shadow = Solidtype_heroui.Scroll_shadow

let lorem =
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pulvinar \
   risus non risus hendrerit venenatis. Pellentesque sit amet hendrerit risus, \
   sed porttitor quam. Morbi accumsan cursus enim, sed ultricies sapien."

let paragraphs () =
  <div class_="space-y-4">
    <For each=(Array.make 10 lorem)>
      (fun text _ -> <p>(Solidtype.Jsx.string text)</p>)
    </For>
  </div>

let make () =
  <Card class_="max-w-[400px]">
    <Card.Header>
      <Card.Title>"Terms and Conditions"</Card.Title>
      <Card.Description>"Please review before proceeding"</Card.Description>
    </Card.Header>
    <Card.Content class_="p-0">
      <Scroll_shadow class_="h-[300px] px-4" size=80>
        (paragraphs ())
      </Scroll_shadow>
    </Card.Content>
    <Card.Footer class_="mt-4 flex flex-row gap-2">
      <Button class_="w-full" variant=`secondary>"Cancel"</Button>
      <Button class_="w-full">"Accept"</Button>
    </Card.Footer>
  </Card>
```

### Hide Scroll Bar

```ocaml title="scroll_shadow_hide_scroll_bar.mlx"
module For = Solidtype.For
module Scroll_shadow = Solidtype_heroui.Scroll_shadow

let lorem =
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pulvinar \
   risus non risus hendrerit venenatis. Pellentesque sit amet hendrerit risus, \
   sed porttitor quam. Morbi accumsan cursus enim, sed ultricies sapien."

let paragraphs () =
  <div class_="space-y-4">
    <For each=(Array.make 10 lorem)>
      (fun text _ -> <p>(Solidtype.Jsx.string text)</p>)
    </For>
  </div>

let make () =
  <div class_="w-full p-0 sm:max-w-sm">
    <Scroll_shadow hide_scroll_bar=true class_="max-h-[240px] p-4">
      (paragraphs ())
    </Scroll_shadow>
  </div>
```

### Visibility Change

`on_visibility_change` is told each change of the edges content is hidden
at.

```ocaml title="scroll_shadow_visibility_change.mlx"
module S = Solidtype.Solid
module For = Solidtype.For
module Card = Solidtype_heroui.Card
module Scroll_shadow = Solidtype_heroui.Scroll_shadow

let lorem =
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pulvinar \
   risus non risus hendrerit venenatis. Pellentesque sit amet hendrerit risus, \
   sed porttitor quam. Morbi accumsan cursus enim, sed ultricies sapien."

let paragraphs () =
  <div class_="space-y-4">
    <For each=(Array.make 10 lorem)>
      (fun text _ -> <p>(Solidtype.Jsx.string text)</p>)
    </For>
  </div>

let images =
  [|
    "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/docs/robot1.jpeg";
    "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/docs/avocado.jpeg";
    "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/docs/oranges.jpeg";
  |]

let cards () =
  <div class_="flex flex-row gap-4">
    <For each=(Array.init 10 (fun i -> images.(i mod 3)))>
      (fun image _ ->
        <Card
          class_="flex min-w-[200px] flex-row gap-3 p-1" variant=`transparent>
          <img
            alt="Lorem Card"
            class_="aspect-square h-16 w-16 shrink-0 rounded-xl object-cover \
                    select-none sm:h-20 sm:w-20"
            loading="lazy"
            src=image
          />
          <div class_="flex flex-1 flex-col justify-center gap-1">
            <Card.Title class_="text-sm">"Bridging the Future"</Card.Title>
            <Card.Description class_="text-xs">
              "Today, 6:30 PM"
            </Card.Description>
          </div>
        </Card>)
    </For>
  </div>

let said = function
  | `top -> "top"
  | `bottom -> "bottom"
  | `left -> "left"
  | `right -> "right"
  | `both -> "both"
  | `none -> "none"

let make () =
  let vertical, set_vertical = S.create_signal `none in
  let horizontal, set_horizontal = S.create_signal `none in
  <div class_="w-full sm:max-w-sm">
    <div class_="mb-8 flex flex-col gap-2">
      <div class_="rounded bg-default p-4">
        <p class_="text-sm font-semibold">
          (Solidtype.Jsx.string
             ("Vertical Shadow State: " ^ said (S.get vertical)))
        </p>
      </div>
      <Scroll_shadow
        class_="max-h-[240px] p-4"
        orientation=`vertical
        on_visibility_change=(S.set set_vertical)>
        (paragraphs ())
      </Scroll_shadow>
    </div>
    <div class_="flex flex-col gap-2">
      <div class_="rounded bg-default p-4">
        <p class_="text-sm font-semibold">
          (Solidtype.Jsx.string
             ("Horizontal Shadow State: " ^ said (S.get horizontal)))
        </p>
      </div>
      <Scroll_shadow
        class_="p-4"
        orientation=`horizontal
        on_visibility_change=(S.set set_horizontal)>
        (cards ())
      </Scroll_shadow>
    </div>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="scroll_shadow_tailwind.mlx"
module For = Solidtype.For
module Scroll_shadow = Solidtype_heroui.Scroll_shadow

let entries =
  [|
    "Reviewed quarterly goals with the design team.";
    "Shipped dark mode tokens to production.";
    "Merged accessibility fixes for form fields.";
    "Published updated component documentation.";
    "Scheduled performance audit for next sprint.";
    "Added scroll shadow demos to the docs site.";
  |]

let make () =
  <div class_="w-full sm:max-w-sm">
    <Scroll_shadow
      hide_scroll_bar=true
      class_="max-h-48 rounded-xl border border-border/80 bg-linear-to-b \
              from-neutral-50/90 to-white p-4 ring-1 ring-black/5 \
              dark:from-neutral-900/80 dark:to-neutral-900 dark:ring-white/10"
      size=48
      variant=`fade>
      <div class_="space-y-3">
        <For each=entries>
          (fun entry _ ->
            <p
              class_="text-sm leading-relaxed text-neutral-600 \
                      dark:text-neutral-400">
              (Solidtype.Jsx.string entry)
            </p>)
        </For>
      </div>
    </Scroll_shadow>
  </div>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every scroll shadow, as
with HeroUI in React:

```css
@layer components {
  .scroll-shadow {
    @apply rounded-xl border border-default-200;
  }

  .scroll-shadow--vertical {
    @apply pr-2;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base Classes

- `.scroll-shadow` - Root container element

#### Orientation Variants

- `.scroll-shadow--vertical` - Vertical scrolling (default)
- `.scroll-shadow--horizontal` - Horizontal scrolling

#### State Modifiers

- `.scroll-shadow--hide-scrollbar` - Hides native scrollbar

### CSS Variables

The ScrollShadow component uses CSS variables to size the fade mask and
reserve space for visible native scrollbars:

| Variable | Default | Description |
|---|---|---|
| `--scroll-shadow-size` | `40px` | Controls the fade gradient size. This is set from the `size` prop |
| `--scroll-shadow-offset` | `0px` | How far the container must be scrolled before the fade starts. This is set from the `offset` prop |
| `--scroll-shadow-scrollbar-size` | `10px` (`0px` when `hide_scroll_bar`) | Reserves a solid mask gutter for the native scrollbar so the fade does not cover it. Override for wider scrollbars |

### Data Attributes

The component uses data attributes to control shadow visibility:

- **Scroll States**: `[data-top-scroll]`, `[data-bottom-scroll]`,
  `[data-left-scroll]`, `[data-right-scroll]` - `"true"` when content can be
  scrolled in that direction, `"false"` when it cannot
- **Combined States**: `[data-top-bottom-scroll]`, `[data-left-right-scroll]`
  - Applied when content can be scrolled in both directions
- **Orientation**: `[data-orientation="vertical"]` or
  `[data-orientation="horizontal"]` - Indicates scroll direction
- **Size**: `[data-scroll-shadow-size]` - Contains the shadow gradient size
  value
- **Shadow Mode**: `[data-scroll-shadow-mode]` - `"auto"` when the fade is
  derived from the scroll position, `"manual"` when `visibility` is given or
  `is_enabled` is `false`

### Scroll-Driven Fade

In `` `auto `` mode, browsers that support
[scroll-driven animations](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-timeline)
derive the fade from the scroll position in CSS. The mask is therefore correct
on the very first paint of a prerendered page, before it hydrates. Browsers
without support fall back to the `[data-*-scroll]` attributes above, which are
written once the shadow is measured in the browser. Two things to keep in mind
when customizing:

- In `` `auto `` mode the root always resolves a `mask-image`, even when there
  is nothing to scroll. That makes it a stacking context and a containing
  block for `position: fixed` descendants. Set `visibility` explicitly if you
  need to opt out.
- The scroll-driven fade uses the `animation` property on the root. Applying
  an `animate-*` utility to the same element replaces it and leaves no fade.
  Animate a wrapper instead.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### ScrollShadow

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `orientation` | `orientation` | `` [ `vertical \| `horizontal ] `` | `` `vertical `` | The scroll direction |
| `variant` | `variant` | `` [ `fade ] `` | `` `fade `` | The visual shadow effect style |
| `size` | `size` | `int` | `40` | The shadow gradient size in pixels |
| `offset` | `offset` | `int` | `0` | The scroll offset before showing shadows (in pixels) |
| `hideScrollBar` | `hide_scroll_bar` | `bool` | `false` | Whether to hide the native scrollbar |
| `isEnabled` | `is_enabled` | `bool` | `true` | Whether scroll shadow detection is enabled |
| `visibility` | `visibility` | `` [ `auto \| `top \| `bottom \| `left \| `right \| `both \| `none ] `` | `` `auto `` | Controlled shadow visibility state |
| `onVisibilityChange` | `on_visibility_change` | `Scroll_shadow.edge -> unit` | | Callback invoked when shadow visibility changes |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | The scrollable content |
