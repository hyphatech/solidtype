# Popover

Displays rich content in a portal triggered by a button or any custom element.

Original HeroUI documentation: [Popover](https://heroui.com/en/docs/react/components/popover).

## Usage

```ocaml title="popover_usage.mlx"
module Button = Solidtype_heroui.Button
module Popover = Solidtype_heroui.Popover

let make () =
  <div class_="flex items-center gap-4">
    <Popover>
      <Button>"Click me"</Button>
      <Popover.Content class_="max-w-64">
        <Popover.Dialog>
          <Popover.Heading>"Popover Title"</Popover.Heading>
          <p class_="mt-2 text-sm text-muted">
            "This is the popover content. You can put any content here."
          </p>
        </Popover.Dialog>
      </Popover.Content>
    </Popover>
  </div>
```

## Parity

The same HeroUI Popover twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of each trigger: a
marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

The marked row is Kobalte's: its trigger tells a reader it opens a dialog, `aria-haspopup="dialog"`, which React Aria's leaves out.

## Anatomy

```ocaml
<Popover>
  <Popover.Trigger>...</Popover.Trigger>
  <Popover.Content>
    <Popover.Arrow />
    <Popover.Dialog>
      <Popover.Heading>...</Popover.Heading>
      (* content goes here *)
    </Popover.Dialog>
  </Popover.Content>
</Popover>
```

A `Button` inside a popover is its trigger; wrap anything else in
`Popover.Trigger`.

## Examples

### With Arrow

```ocaml title="popover_with_arrow.mlx"
module Button = Solidtype_heroui.Button
module Popover = Solidtype_heroui.Popover
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex items-center gap-4">
    <Popover>
      <Button variant=`secondary>"With Arrow"</Button>
      <Popover.Content class_="max-w-64">
        <Popover.Dialog>
          <Popover.Arrow />
          <Popover.Heading>"Popover with Arrow"</Popover.Heading>
          <p class_="mt-2 text-sm text-muted">
            "The arrow shows which element triggered the popover."
          </p>
        </Popover.Dialog>
      </Popover.Content>
    </Popover>
    <Popover>
      <Button is_icon_only=true aria_label="More options" variant=`tertiary>
        <Gravity.Ellipsis />
      </Button>
      <Popover.Content class_="max-w-64" offset=10.>
        <Popover.Dialog>
          <Popover.Arrow />
          <Popover.Heading>"Popover with Arrow"</Popover.Heading>
          <p class_="mt-2 text-sm text-muted">
            "The arrow shows which element triggered the popover."
          </p>
        </Popover.Dialog>
      </Popover.Content>
    </Popover>
  </div>
```

### Interactive Content

```ocaml title="popover_interactive.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Avatar = Solidtype_heroui.Avatar
module Button = Solidtype_heroui.Button
module Popover = Solidtype_heroui.Popover

let make () =
  let following, set_following = S.create_signal false in
  <div class_="flex items-center gap-6">
    <Popover>
      <Popover.Trigger aria_label="User profile">
        <div class_="flex items-center gap-2">
          <Avatar size=`sm>
            <Avatar.Image
              alt="Sarah Johnson"
              src="https://img.heroui.chat/image/avatar?w=400&h=400&u=1"
            />
            <Avatar.Fallback>"SJ"</Avatar.Fallback>
          </Avatar>
          <div class_="flex flex-col">
            <p class_="text-sm font-medium">"Sarah Johnson"</p>
            <p class_="text-xs text-muted">"@sarahj"</p>
          </div>
        </div>
      </Popover.Trigger>
      <Popover.Content class_="w-[320px]">
        <Popover.Dialog>
          <Popover.Heading>
            <div class_="flex items-center justify-between">
              <div class_="flex items-center gap-3">
                <Avatar size=`md>
                  <Avatar.Image
                    alt="Sarah Johnson"
                    src="https://img.heroui.chat/image/avatar?w=400&h=400&u=1"
                  />
                  <Avatar.Fallback>"SJ"</Avatar.Fallback>
                </Avatar>
                <div>
                  <p class_="font-semibold">"Sarah Johnson"</p>
                  <p class_="text-sm text-muted">"@sarahj"</p>
                </div>
              </div>
              <Button
                class_="rounded-full"
                size=`sm
                variant=(if S.get following then `tertiary else `primary)
                on_click=(fun _ -> S.update set_following not)>
                (Jsx.string (if S.get following then "Following" else "Follow"))
              </Button>
            </div>
          </Popover.Heading>
          <p class_="mt-3 text-sm text-muted">
            "Product designer and creative director. Building beautiful \
             experiences that matter."
          </p>
          <div class_="mt-3 flex gap-4">
            <div>
              <span class_="font-semibold">"892"</span>
              <span class_="ms-1 text-sm text-muted">"Following"</span>
            </div>
            <div>
              <span class_="font-semibold">"12.5K"</span>
              <span class_="ms-1 text-sm text-muted">"Followers"</span>
            </div>
          </div>
        </Popover.Dialog>
      </Popover.Content>
    </Popover>
  </div>
```

### Placement

```ocaml title="popover_placement.mlx"
module Button = Solidtype_heroui.Button
module Popover = Solidtype_heroui.Popover

let make () =
  <div class_="grid grid-cols-3 gap-4">
    <div />
    <Popover>
      <Button class_="w-full" variant=`tertiary>"Top"</Button>
      <Popover.Content placement=`top>
        <Popover.Dialog>
          <Popover.Arrow /> <p class_="text-sm">"Top placement"</p>
        </Popover.Dialog>
      </Popover.Content>
    </Popover>
    <div />
    <Popover>
      <Button class_="w-full" variant=`tertiary>"Left"</Button>
      <Popover.Content placement=`left>
        <Popover.Dialog>
          <Popover.Arrow /> <p class_="text-sm">"Left placement"</p>
        </Popover.Dialog>
      </Popover.Content>
    </Popover>
    <div class_="flex items-center justify-center">
      <span class_="text-sm text-muted">"Click buttons"</span>
    </div>
    <Popover>
      <Button class_="w-full" variant=`tertiary>"Right"</Button>
      <Popover.Content placement=`right>
        <Popover.Dialog>
          <Popover.Arrow /> <p class_="text-sm">"Right placement"</p>
        </Popover.Dialog>
      </Popover.Content>
    </Popover>
    <div />
    <Popover>
      <Button class_="w-full" variant=`tertiary>"Bottom"</Button>
      <Popover.Content placement=`bottom>
        <Popover.Dialog>
          <Popover.Arrow /> <p class_="text-sm">"Bottom placement"</p>
        </Popover.Dialog>
      </Popover.Content>
    </Popover>
    <div />
  </div>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="popover_tailwind.mlx"
module Button = Solidtype_heroui.Button
module Popover = Solidtype_heroui.Popover

let make () =
  <Popover>
    <Button variant=`secondary>"Details"</Button>
    <Popover.Content
      class_="max-w-56 overflow-hidden rounded-xl border border-border/80 \
              bg-surface/90 p-0 shadow-xl ring-1 ring-black/5 backdrop-blur-xl \
              dark:border-border/90 dark:bg-surface/85 dark:ring-white/10">
      <Popover.Dialog class_="relative p-4">
        <div
          aria_hidden=true
          class_="pointer-events-none absolute inset-x-0 top-0 h-12 \
                  bg-linear-to-b from-neutral-500/6 to-transparent \
                  dark:from-neutral-400/8"
        />
        <Popover.Heading
          class_="relative font-medium text-neutral-800 dark:text-neutral-100">
          "Keyboard shortcuts"
        </Popover.Heading>
        <dl class_="relative mt-3 space-y-2 text-sm">
          <div class_="flex justify-between gap-4">
            <dt class_="text-muted">"Save"</dt>
            <dd class_="font-mono text-neutral-700 dark:text-neutral-300">
              {js|⌘ S|js}
            </dd>
          </div>
          <div class_="flex justify-between gap-4">
            <dt class_="text-muted">"Search"</dt>
            <dd class_="font-mono text-neutral-700 dark:text-neutral-300">
              {js|⌘ K|js}
            </dd>
          </div>
        </dl>
      </Popover.Dialog>
    </Popover.Content>
  </Popover>
```

### Global CSS

To customize the Popover component classes, you can use the
`@layer components` directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .popover {
    @apply rounded-xl shadow-2xl;
  }

  .popover__dialog {
    @apply p-4;
  }

  .popover__heading {
    @apply text-lg font-bold;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.popover` - Base popover container styles
- `.popover__dialog` - Dialog content wrapper
- `.popover__heading` - Heading text styles
- `.popover__trigger` - Trigger element styles

### Interactive States

The component supports animation states:

- **Entering**: `[data-entering="true"]` - Applied during popover appearance
- **Exiting**: `[data-exiting="true"]` - Applied during popover
  disappearance
- **Placement**: `[data-placement="bottom"]`, and the other sides - Applied
  based on popover position
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]` on a trigger

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Popover

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `isOpen` | `is_open` | `bool` | | Controls popover visibility (controlled) |
| `defaultOpen` | `default_open` | `bool` | `false` | Initial open state (uncontrolled) |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Called when open state changes |
| `children` | `children` | elements | | Trigger and content elements |

### Popover.Content

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `placement` | `placement` | `` `top `` \| `` `bottom `` \| `` `left `` \| `` `right `` | `` `bottom `` | Placement of the popover |
| `offset` | `offset` | `float` | 8 | Distance from the trigger element |
| `shouldFlip` | `should_flip` | `bool` | `true` | Whether popover can change orientation to fit |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Content to display in the popover |

### Popover.Dialog, Popover.Heading

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | What it holds |

### Popover.Trigger

| React | solidtype | Type | Description |
|---|---|---|---|
| `aria-label` | `aria_label` | `string` | Its name, where its children give none |
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | Element that triggers the popover |

### Popover.Arrow

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Its class |
| `children` | `children` | elements | Custom arrow element |

## Accessibility

- **Focus**: Given to the popover as it opens, and back to its trigger as it
  closes; it stays inside while the popover is open
- **Screen readers**: The page outside is hidden from a reader while it is
  open, and a dismiss button only a reader finds closes it
- **Trigger**: Shows pressed while the popover is open
