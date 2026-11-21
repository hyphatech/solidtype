# Pagination

Page navigation with composable page links, previous/next buttons, and ellipsis indicators.

It keeps no page of its own: which pages show, which is active and what a
press does are the application's, in a signal.

Original HeroUI documentation: [Pagination](https://heroui.com/en/docs/react/components/pagination).

## Usage

```ocaml title="pagination_usage.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Pagination = Solidtype_heroui.Pagination

let total_pages = 3

let make () =
  let page, set_page = S.create_signal 1 in
  <Pagination class_="justify-center">
    <Pagination.Content>
      <Pagination.Item>
        <Pagination.Previous
          is_disabled=(S.get page = 1)
          on_press=(fun () -> S.update set_page pred)>
          <Pagination.Previous_icon /> <span>"Previous"</span>
        </Pagination.Previous>
      </Pagination.Item>
      <For each=(Array.init total_pages succ)>
        (fun p _ ->
          <Pagination.Item>
            <Pagination.Link
              is_active=(p = S.get page) on_press=(fun () -> S.set set_page p)>
              (Jsx.int p)
            </Pagination.Link>
          </Pagination.Item>)
      </For>
      <Pagination.Item>
        <Pagination.Next
          is_disabled=(S.get page = total_pages)
          on_press=(fun () -> S.update set_page succ)>
          <span>"Next"</span> <Pagination.Next_icon />
        </Pagination.Next>
      </Pagination.Item>
    </Pagination.Content>
  </Pagination>
```

## Parity

The same HeroUI Pagination twice, under the same props, each keeping its own
page: in solidtype on the left, in React on the right. Below them, every attribute of each Next button: a
marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

## Anatomy

```ocaml
<Pagination>
  <Pagination.Summary>"Showing 1-10 of 100 results"</Pagination.Summary>
  <Pagination.Content>
    <Pagination.Item>
      <Pagination.Previous>
        <Pagination.Previous_icon />
        <span>"Previous"</span>
      </Pagination.Previous>
    </Pagination.Item>
    <Pagination.Item>
      <Pagination.Link is_active=true>"1"</Pagination.Link>
    </Pagination.Item>
    <Pagination.Item><Pagination.Ellipsis /></Pagination.Item>
    <Pagination.Item><Pagination.Link>"10"</Pagination.Link></Pagination.Item>
    <Pagination.Item>
      <Pagination.Next>
        <span>"Next"</span>
        <Pagination.Next_icon />
      </Pagination.Next>
    </Pagination.Item>
  </Pagination.Content>
</Pagination>
```

## Examples

### Sizes

```ocaml title="pagination_sizes.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Pagination = Solidtype_heroui.Pagination

let total_pages = 3

let size_pagination (size, name) =
  let page, set_page = S.create_signal 1 in
  <div class_="flex flex-col gap-2">
    <span class_="text-xs font-medium text-muted capitalize">
      (Jsx.string name)
    </span>
    <Pagination class_="justify-center" size>
      <Pagination.Content>
        <Pagination.Item>
          <Pagination.Previous
            is_disabled=(S.get page = 1)
            on_press=(fun () -> S.update set_page pred)>
            <Pagination.Previous_icon /> <span>"Previous"</span>
          </Pagination.Previous>
        </Pagination.Item>
        <For each=(Array.init total_pages succ)>
          (fun p _ ->
            <Pagination.Item>
              <Pagination.Link
                is_active=(p = S.get page) on_press=(fun () -> S.set set_page p)>
                (Jsx.int p)
              </Pagination.Link>
            </Pagination.Item>)
        </For>
        <Pagination.Item>
          <Pagination.Next
            is_disabled=(S.get page = total_pages)
            on_press=(fun () -> S.update set_page succ)>
            <span>"Next"</span> <Pagination.Next_icon />
          </Pagination.Next>
        </Pagination.Item>
      </Pagination.Content>
    </Pagination>
  </div>

let make () =
  <div class_="flex flex-col gap-6">
    <For each=[| (`sm, "sm"); (`md, "md"); (`lg, "lg") |]>
      (fun size _ -> size_pagination size)
    </For>
  </div>
```

### Disabled

```ocaml title="pagination_disabled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Pagination = Solidtype_heroui.Pagination

let total_pages = 3

let make () =
  let page, set_page = S.create_signal 1 in
  <Pagination class_="justify-center">
    <Pagination.Content>
      <Pagination.Item>
        <Pagination.Previous
          is_disabled=true on_press=(fun () -> S.update set_page pred)>
          <Pagination.Previous_icon /> <span>"Previous"</span>
        </Pagination.Previous>
      </Pagination.Item>
      <For each=(Array.init total_pages succ)>
        (fun p _ ->
          <Pagination.Item>
            <Pagination.Link
              is_active=(p = S.get page) on_press=(fun () -> S.set set_page p)>
              (Jsx.int p)
            </Pagination.Link>
          </Pagination.Item>)
      </For>
      <Pagination.Item>
        <Pagination.Next
          is_disabled=true on_press=(fun () -> S.update set_page succ)>
          <span>"Next"</span> <Pagination.Next_icon />
        </Pagination.Next>
      </Pagination.Item>
    </Pagination.Content>
  </Pagination>
```

### Simple (Previous / Next)

```ocaml title="pagination_simple.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Pagination = Solidtype_heroui.Pagination

let total_pages = 10
let items_per_page = 5
let total_items = 50

let make () =
  let page, set_page = S.create_signal 1 in
  let start_item () = ((S.get page - 1) * items_per_page) + 1 in
  let end_item () = Int.min (S.get page * items_per_page) total_items in
  <Pagination class_="w-full">
    <Pagination.Summary>
      (Jsx.int (start_item ()))
      " to "
      (Jsx.int (end_item ()))
      " of "
      (Jsx.int total_items)
      " invoices"
    </Pagination.Summary>
    <Pagination.Content>
      <Pagination.Item>
        <Pagination.Previous
          is_disabled=(S.get page = 1)
          on_press=(fun () -> S.update set_page pred)>
          <Pagination.Previous_icon /> <span>"Prev"</span>
        </Pagination.Previous>
      </Pagination.Item>
      <Pagination.Item>
        <Pagination.Next
          is_disabled=(S.get page = total_pages)
          on_press=(fun () -> S.update set_page succ)>
          <span>"Next"</span> <Pagination.Next_icon />
        </Pagination.Next>
      </Pagination.Item>
    </Pagination.Content>
  </Pagination>
```

### Controlled

```ocaml title="pagination_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Index = Solidtype.Index
module Pagination = Solidtype_heroui.Pagination

type shown = Page of int | Ellipsis

let total_pages = 12
let items_per_page = 10
let total_items = 120

let page_numbers page =
  if total_pages <= 7 then List.init total_pages (fun i -> Page (i + 1))
  else
    let start = Int.max 2 (page - 1) in
    let stop = Int.min (total_pages - 1) (page + 1) in
    [ Page 1 ]
    @ (if page > 3 then [ Ellipsis ] else [])
    @ List.init (stop - start + 1) (fun i -> Page (start + i))
    @ (if page < total_pages - 2 then [ Ellipsis ] else [])
    @ [ Page total_pages ]

let make () =
  let page, set_page = S.create_signal 1 in
  let start_item () = ((S.get page - 1) * items_per_page) + 1 in
  let end_item () = Int.min (S.get page * items_per_page) total_items in
  <Pagination>
    <Pagination.Summary>
      "Showing "
      (Jsx.int (start_item ()))
      "-"
      (Jsx.int (end_item ()))
      " of "
      (Jsx.int total_items)
      " results"
    </Pagination.Summary>
    <Pagination.Content>
      <Pagination.Item>
        <Pagination.Previous
          is_disabled=(S.get page = 1)
          on_press=(fun () -> S.update set_page pred)>
          <Pagination.Previous_icon /> <span>"Previous"</span>
        </Pagination.Previous>
      </Pagination.Item>
      <Index each=(Array.of_list (page_numbers (S.get page)))>
        (fun shown _ ->
          <Pagination.Item>
            (match S.get shown with
            | Ellipsis -> <Pagination.Ellipsis />
            | Page p ->
                <Pagination.Link
                  is_active=(p = S.get page)
                  on_press=(fun () -> S.set set_page p)>
                  (Jsx.int p)
                </Pagination.Link>)
          </Pagination.Item>)
      </Index>
      <Pagination.Item>
        <Pagination.Next
          is_disabled=(S.get page = total_pages)
          on_press=(fun () -> S.update set_page succ)>
          <span>"Next"</span> <Pagination.Next_icon />
        </Pagination.Next>
      </Pagination.Item>
    </Pagination.Content>
  </Pagination>
```

### With Ellipsis

```ocaml title="pagination_with_ellipsis.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Index = Solidtype.Index
module Pagination = Solidtype_heroui.Pagination

type shown = Page of int | Ellipsis

let total_pages = 12

let page_numbers page =
  let start = Int.max 2 (page - 1) in
  let stop = Int.min (total_pages - 1) (page + 1) in
  [ Page 1 ]
  @ (if page > 3 then [ Ellipsis ] else [])
  @ List.init (stop - start + 1) (fun i -> Page (start + i))
  @ (if page < total_pages - 2 then [ Ellipsis ] else [])
  @ [ Page total_pages ]

let make () =
  let page, set_page = S.create_signal 1 in
  <div class_="w-full max-w-2xs overflow-x-auto sm:max-w-full">
    <Pagination class_="justify-center">
      <Pagination.Content>
        <Pagination.Item>
          <Pagination.Previous
            is_disabled=(S.get page = 1)
            on_press=(fun () -> S.update set_page pred)>
            <Pagination.Previous_icon /> <span>"Previous"</span>
          </Pagination.Previous>
        </Pagination.Item>
        <Index each=(Array.of_list (page_numbers (S.get page)))>
          (fun shown _ ->
            <Pagination.Item>
              (match S.get shown with
              | Ellipsis -> <Pagination.Ellipsis />
              | Page p ->
                  <Pagination.Link
                    is_active=(p = S.get page)
                    on_press=(fun () -> S.set set_page p)>
                    (Jsx.int p)
                  </Pagination.Link>)
            </Pagination.Item>)
        </Index>
        <Pagination.Item>
          <Pagination.Next
            is_disabled=(S.get page = total_pages)
            on_press=(fun () -> S.update set_page succ)>
            <span>"Next"</span> <Pagination.Next_icon />
          </Pagination.Next>
        </Pagination.Item>
      </Pagination.Content>
    </Pagination>
  </div>
```

### With Summary

```ocaml title="pagination_with_summary.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Index = Solidtype.Index
module Pagination = Solidtype_heroui.Pagination

type shown = Page of int | Ellipsis

let total_pages = 12
let items_per_page = 10
let total_items = 120

let page_numbers page =
  let start = Int.max 2 (page - 1) in
  let stop = Int.min (total_pages - 1) (page + 1) in
  [ Page 1 ]
  @ (if page > 3 then [ Ellipsis ] else [])
  @ List.init (stop - start + 1) (fun i -> Page (start + i))
  @ (if page < total_pages - 2 then [ Ellipsis ] else [])
  @ [ Page total_pages ]

let make () =
  let page, set_page = S.create_signal 1 in
  let start_item () = ((S.get page - 1) * items_per_page) + 1 in
  let end_item () = Int.min (S.get page * items_per_page) total_items in
  <Pagination class_="w-full">
    <Pagination.Summary>
      "Showing "
      (Jsx.int (start_item ()))
      "-"
      (Jsx.int (end_item ()))
      " of "
      (Jsx.int total_items)
      " results"
    </Pagination.Summary>
    <Pagination.Content>
      <Pagination.Item>
        <Pagination.Previous
          is_disabled=(S.get page = 1)
          on_press=(fun () -> S.update set_page pred)>
          <Pagination.Previous_icon /> <span>"Previous"</span>
        </Pagination.Previous>
      </Pagination.Item>
      <Index each=(Array.of_list (page_numbers (S.get page)))>
        (fun shown _ ->
          <Pagination.Item>
            (match S.get shown with
            | Ellipsis -> <Pagination.Ellipsis />
            | Page p ->
                <Pagination.Link
                  is_active=(p = S.get page)
                  on_press=(fun () -> S.set set_page p)>
                  (Jsx.int p)
                </Pagination.Link>)
          </Pagination.Item>)
      </Index>
      <Pagination.Item>
        <Pagination.Next
          is_disabled=(S.get page = total_pages)
          on_press=(fun () -> S.update set_page succ)>
          <span>"Next"</span> <Pagination.Next_icon />
        </Pagination.Next>
      </Pagination.Item>
    </Pagination.Content>
  </Pagination>
```

### Custom Icons

You can replace the default chevron icons by passing custom children to
`Previous_icon` and `Next_icon`.

```ocaml title="pagination_custom_icons.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Pagination = Solidtype_heroui.Pagination
module Gravity = Solidtype_gravity_icons

let total_pages = 3

let make () =
  let page, set_page = S.create_signal 1 in
  <Pagination class_="justify-center">
    <Pagination.Content>
      <Pagination.Item>
        <Pagination.Previous
          is_disabled=(S.get page = 1)
          on_press=(fun () -> S.update set_page pred)>
          <Pagination.Previous_icon>
            <Gravity.Arrow_left />
          </Pagination.Previous_icon>
          <span>"Back"</span>
        </Pagination.Previous>
      </Pagination.Item>
      <For each=(Array.init total_pages succ)>
        (fun p _ ->
          <Pagination.Item>
            <Pagination.Link
              is_active=(p = S.get page) on_press=(fun () -> S.set set_page p)>
              (Jsx.int p)
            </Pagination.Link>
          </Pagination.Item>)
      </For>
      <Pagination.Item>
        <Pagination.Next
          is_disabled=(S.get page = total_pages)
          on_press=(fun () -> S.update set_page succ)>
          <span>"Forward"</span>
          <Pagination.Next_icon><Gravity.Arrow_right /></Pagination.Next_icon>
        </Pagination.Next>
      </Pagination.Item>
    </Pagination.Content>
  </Pagination>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="pagination_tailwind.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Pagination = Solidtype_heroui.Pagination

let link_class = "text-muted hover:bg-surface hover:text-foreground"
let active_class = "bg-accent text-accent-foreground hover:bg-accent-hover"

let make () =
  let page, set_page = S.create_signal 2 in
  <Pagination class_="justify-center">
    <Pagination.Content class_="gap-1 rounded-xl bg-default p-1">
      <Pagination.Item>
        <Pagination.Previous
          class_=link_class
          is_disabled=(S.get page = 1)
          on_press=(fun () -> S.update set_page pred)>
          <Pagination.Previous_icon />
        </Pagination.Previous>
      </Pagination.Item>
      <For each=[| 1; 2; 3 |]>
        (fun p _ ->
          <Pagination.Item>
            <Pagination.Link
              class_=(if p = S.get page then active_class else link_class)
              is_active=(p = S.get page)
              on_press=(fun () -> S.set set_page p)>
              (Jsx.int p)
            </Pagination.Link>
          </Pagination.Item>)
      </For>
      <Pagination.Item>
        <Pagination.Next
          class_=link_class
          is_disabled=(S.get page = 3)
          on_press=(fun () -> S.update set_page succ)>
          <Pagination.Next_icon />
        </Pagination.Next>
      </Pagination.Item>
    </Pagination.Content>
  </Pagination>
```

### Global CSS

To customize the Pagination component classes, you can use the
`@layer components` directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .pagination {
    @apply gap-8;
  }

  .pagination__link {
    @apply rounded-md;
  }

  .pagination__summary {
    @apply text-xs font-semibold;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.pagination` - Root navigation container with flex layout
- `.pagination__summary` - Left-side info text container
- `.pagination__content` - Container for pagination items
- `.pagination__item` - Individual item wrapper
- `.pagination__link` - Page number button (ghost button style)
- `.pagination__link--nav` - Navigation button modifier (Previous/Next)
- `.pagination__ellipsis` - Ellipsis indicator
- `.pagination--sm` - Small size variant
- `.pagination--md` - Medium size variant (default)
- `.pagination--lg` - Large size variant

### Interactive States

The component supports both CSS pseudo-classes and data attributes for
flexibility:

- **Active page**: `[data-active="true"]` or `[aria-current="page"]`
- **Hover**: `:hover` or `[data-hovered="true"]`
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]`
- **Disabled**: `:disabled` or `[data-disabled="true"]`
- **Pressed**: `:active` or `[data-pressed="true"]`

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Pagination

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `size` | `size` | `` `sm `` \| `` `md `` \| `` `lg `` | `` `md `` | Size of the pagination items |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Pagination parts (Summary, Content) |

### Pagination.Summary, Pagination.Content, Pagination.Item

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | What it holds |

### Pagination.Link

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `isActive` | `is_active` | `bool` | `false` | Whether this is the current page |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the link is disabled |
| `onPress` | `on_press` | `unit -> unit` | | Press handler |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Page number content |

### Pagination.Previous, Pagination.Next

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the button is disabled |
| `onPress` | `on_press` | `unit -> unit` | | Press handler |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Button content (compose with `Previous_icon`/`Next_icon`) |

### Pagination.Previous_icon, Pagination.Next_icon

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Its class |
| `children` | `children` | elements | Custom icon to replace the default chevron |

### Pagination.Ellipsis

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's class |

## Note

Pagination buttons use `on_press` instead of `on_click`: it is called for a
press by mouse, touch or keyboard.

## Accessibility

- Semantic `<nav>` element with `aria-label="pagination"` and
  `role="navigation"`
- Active page indicated via `aria-current="page"` on the current link
- Keyboard navigation via Tab key through all interactive elements
- Focus ring on keyboard navigation via `:focus-visible`
- Ellipsis marked with `aria-hidden="true"` to avoid screen reader confusion
- Disabled states communicated to assistive technology via `is_disabled`
