# Accordion

A collapsible content panel for organizing information in a compact space.

Original HeroUI documentation: [Accordion](https://heroui.com/en/docs/react/components/accordion).

## Usage

HeroUI's examples, with HeroUI's icons from [`solidtype-gravity-icons`](../heroui.md#icons).

```ocaml title="accordion_usage.mlx"
module Accordion = Solidtype_heroui.Accordion
module Gravity = Solidtype_gravity_icons

let items =
  [|
    ( (fun () -> <Gravity.Shopping_bag />),
      "How do I place an order?",
      "Browse our products, add items to your cart, and proceed to checkout. \
       You'll need to provide shipping and payment information to complete \
       your purchase." );
    ( (fun () -> <Gravity.Receipt />),
      "Can I modify or cancel my order?",
      "Yes, you can modify or cancel your order before it's shipped. Once your \
       order is processed, you can't make changes." );
    ( (fun () -> <Gravity.Credit_card />),
      "What payment methods do you accept?",
      "We accept all major credit cards, including Visa, Mastercard, and \
       American Express." );
    ( (fun () -> <Gravity.Box />),
      "How much does shipping cost?",
      "Shipping costs vary based on your location and the size of your order. \
       We offer free shipping for orders over $50." );
    ( (fun () -> <Gravity.Planet_earth />),
      "Do you ship internationally?",
      "Yes, we ship to most countries. Please check our shipping rates and \
       policies for more information." );
    ( (fun () -> <Gravity.Arrows_rotate_left />),
      "How do I request a refund?",
      "If you're not satisfied with your purchase, you can request a refund \
       within 30 days of purchase. Please contact our customer support team \
       for assistance." );
  |]

let make () =
  <Accordion class_="w-full max-w-md">
    <Solidtype.For each=items>
      (fun (icon, title, content) _ ->
        <Accordion.Item>
          <Accordion.Heading>
            <Accordion.Trigger>
              <span class_="me-3 size-4 shrink-0 text-muted">(icon ())</span>
              (Solidtype.Jsx.string title)
              <Accordion.Indicator>
                <Gravity.Chevron_down />
              </Accordion.Indicator>
            </Accordion.Trigger>
          </Accordion.Heading>
          <Accordion.Panel>
            <Accordion.Body>(Solidtype.Jsx.string content)</Accordion.Body>
          </Accordion.Panel>
        </Accordion.Item>)
    </Solidtype.For>
  </Accordion>
```

## Parity

The same HeroUI Accordion twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two
accordions: a marked row is one they disagree on, and a dimmed row is a
framework's own, which no style reads. Each trigger's `aria-controls` names
its own panel by the id its framework made. Kobalte's panel is a region of the
page its trigger controls, where React Aria's is a group its trigger names;
both are accessible, and the port keeps Kobalte's.

## Anatomy

```ocaml
<Accordion>
  <Accordion.Item>
    <Accordion.Heading>
      <Accordion.Trigger><Accordion.Indicator /></Accordion.Trigger>
    </Accordion.Heading>
    <Accordion.Panel>
      <Accordion.Body />
    </Accordion.Panel>
  </Accordion.Item>
</Accordion>
```

A [`Button`](button.md) given `` slot=`trigger `` inside a
heading is its item's trigger, in HeroUI's look.

## Examples

### Surface

`` variant=`surface `` lays the accordion on a surface, which the components
inside it read as a [`Surface`](surface.md)'s.

```ocaml title="accordion_surface.mlx"
module Accordion = Solidtype_heroui.Accordion
module Gravity = Solidtype_gravity_icons

let items =
  [|
    ( (fun () -> <Gravity.Shopping_bag />),
      "How do I place an order?",
      "Browse our products, add items to your cart, and proceed to checkout. \
       You'll need to provide shipping and payment information to complete \
       your purchase." );
    ( (fun () -> <Gravity.Receipt />),
      "Can I modify or cancel my order?",
      "Yes, you can modify or cancel your order before it's shipped. Once your \
       order is processed, you can't make changes." );
    ( (fun () -> <Gravity.Credit_card />),
      "What payment methods do you accept?",
      "We accept all major credit cards, including Visa, Mastercard, and \
       American Express." );
    ( (fun () -> <Gravity.Box />),
      "How much does shipping cost?",
      "Shipping costs vary based on your location and the size of your order. \
       We offer free shipping for orders over $50." );
    ( (fun () -> <Gravity.Planet_earth />),
      "Do you ship internationally?",
      "Yes, we ship to most countries. Please check our shipping rates and \
       policies for more information." );
    ( (fun () -> <Gravity.Arrows_rotate_left />),
      "How do I request a refund?",
      "If you're not satisfied with your purchase, you can request a refund \
       within 30 days of purchase. Please contact our customer support team \
       for assistance." );
  |]

let make () =
  <Accordion class_="w-full max-w-md" variant=`surface>
    <Solidtype.For each=items>
      (fun (icon, title, content) _ ->
        <Accordion.Item>
          <Accordion.Heading>
            <Accordion.Trigger>
              <span class_="me-3 size-4 shrink-0 text-muted">(icon ())</span>
              (Solidtype.Jsx.string title)
              <Accordion.Indicator>
                <Gravity.Chevron_down />
              </Accordion.Indicator>
            </Accordion.Trigger>
          </Accordion.Heading>
          <Accordion.Panel>
            <Accordion.Body>(Solidtype.Jsx.string content)</Accordion.Body>
          </Accordion.Panel>
        </Accordion.Item>)
    </Solidtype.For>
  </Accordion>
```

### Without Separator

```ocaml title="accordion_without_separator.mlx"
module Accordion = Solidtype_heroui.Accordion
module Gravity = Solidtype_gravity_icons

let items =
  [|
    ( (fun () -> <Gravity.Shopping_bag />),
      "How do I place an order?",
      "Browse our products, add items to your cart, and proceed to checkout. \
       You'll need to provide shipping and payment information to complete \
       your purchase." );
    ( (fun () -> <Gravity.Receipt />),
      "Can I modify or cancel my order?",
      "Yes, you can modify or cancel your order before it's shipped. Once your \
       order is processed, you can't make changes." );
    ( (fun () -> <Gravity.Credit_card />),
      "What payment methods do you accept?",
      "We accept all major credit cards, including Visa, Mastercard, and \
       American Express." );
  |]

let make () =
  <Accordion hide_separator=true class_="w-full max-w-md">
    <Solidtype.For each=items>
      (fun (icon, title, content) _ ->
        <Accordion.Item>
          <Accordion.Heading>
            <Accordion.Trigger>
              <span class_="me-3 size-4 shrink-0 text-muted">(icon ())</span>
              (Solidtype.Jsx.string title)
              <Accordion.Indicator>
                <Gravity.Chevron_down />
              </Accordion.Indicator>
            </Accordion.Trigger>
          </Accordion.Heading>
          <Accordion.Panel>
            <Accordion.Body>(Solidtype.Jsx.string content)</Accordion.Body>
          </Accordion.Panel>
        </Accordion.Item>)
    </Solidtype.For>
  </Accordion>
```

### Multiple Expanded

```ocaml title="accordion_multiple.mlx"
module Accordion = Solidtype_heroui.Accordion

let items =
  [|
    ( "Getting Started",
      "Learn the basics of HeroUI and how to integrate it into your React \
       project. This section covers installation, setup, and your first \
       component." );
    ( "Core Concepts",
      "Understand the fundamental concepts behind HeroUI, including the \
       compound component pattern, styling with Tailwind CSS, and \
       accessibility features." );
    ( "Advanced Usage",
      "Explore advanced features like custom variants, theme customization, \
       and integration with other libraries in your React ecosystem." );
    ( "Best Practices",
      "Follow our recommended best practices for building performant, \
       accessible, and maintainable applications with HeroUI components." );
  |]

let make () =
  <Accordion allows_multiple_expanded=true class_="w-full max-w-md">
    <Solidtype.For each=items>
      (fun (title, content) _ ->
        <Accordion.Item>
          <Accordion.Heading>
            <Accordion.Trigger>
              (Solidtype.Jsx.string title) <Accordion.Indicator />
            </Accordion.Trigger>
          </Accordion.Heading>
          <Accordion.Panel>
            <Accordion.Body>(Solidtype.Jsx.string content)</Accordion.Body>
          </Accordion.Panel>
        </Accordion.Item>)
    </Solidtype.For>
  </Accordion>
```

### Disabled State

An item is disabled while it or the accordion is.

```ocaml title="accordion_disabled.mlx"
module Accordion = Solidtype_heroui.Accordion

let item ?is_disabled ~title ~content () =
  <Accordion.Item ?is_disabled>
    <Accordion.Heading>
      <Accordion.Trigger>
        (Solidtype.Jsx.string title) <Accordion.Indicator />
      </Accordion.Trigger>
    </Accordion.Heading>
    <Accordion.Panel>
      <Accordion.Body>(Solidtype.Jsx.string content)</Accordion.Body>
    </Accordion.Panel>
  </Accordion.Item>

let make () =
  <div class_="flex w-full flex-col items-center gap-8">
    <div class_="w-full max-w-md space-y-2">
      <h3 class_="text-sm font-medium text-muted">
        "Entire accordion disabled"
      </h3>
      <Accordion is_disabled=true class_="w-full max-w-md">
        (item ~title:"Disabled Item 1"
           ~content:
             "This content cannot be accessed when the accordion is disabled."
           ())
        (item ~title:"Disabled Item 2"
           ~content:
             "This content cannot be accessed when the accordion is disabled."
           ())
      </Accordion>
    </div>
    <div class_="w-full max-w-md space-y-2">
      <h3 class_="text-sm font-medium text-muted">
        "Individual items disabled"
      </h3>
      <Accordion class_="w-full max-w-md">
        (item ~title:"Active Item"
           ~content:"This item is active and can be toggled normally." ())
        (item ~is_disabled:true ~title:"Disabled Item"
           ~content:"This content cannot be accessed when the item is disabled."
           ())
        (item ~title:"Another Active Item"
           ~content:"This item is also active and can be toggled." ())
      </Accordion>
    </div>
  </div>
```

### Controlled

`expanded_keys` gives the expanded items' ids, and `on_expanded_change` is
called with them all, then the pressed item's with its own state. [`Disclosure_group.navigation`](disclosure-group.md#navigation),
HeroUI's `useDisclosureGroupNavigation`, gives previous and next buttons over
the items.

```ocaml title="accordion_controlled.mlx"
module S = Solidtype.Solid
module Accordion = Solidtype_heroui.Accordion
module Button = Solidtype_heroui.Button
module Disclosure_group = Solidtype_heroui.Disclosure_group
module Gravity = Solidtype_gravity_icons

let items =
  [|
    ( "getting-started",
      "Getting Started",
      "Learn the basics of HeroUI and how to integrate it into your React \
       project. This section covers installation, setup, and your first \
       component." );
    ( "core-concepts",
      "Core Concepts",
      "Understand the fundamental concepts behind HeroUI, including the \
       compound component pattern, styling with Tailwind CSS, and \
       accessibility features." );
    ( "advanced-usage",
      "Advanced Usage",
      "Explore advanced features like custom variants, theme customization, \
       and integration with other libraries in your React ecosystem." );
  |]

let make () =
  let expanded, set_expanded = S.create_signal [| "getting-started" |] in
  let n =
    Disclosure_group.navigation
      ~expanded_keys:(fun () -> S.get expanded)
      ~item_ids:(Array.map (fun (id, _, _) -> id) items)
      ~on_expanded_change:(S.set set_expanded) ()
  in
  <div class_="w-full max-w-md">
    <div class_="mb-4 flex items-center justify-between">
      <p class_="text-sm text-muted">
        "Expanded: "
        <strong>
          (match S.get expanded with
          | [||] -> Solidtype.Jsx.string "none"
          | keys -> Solidtype.Jsx.string (Js.Array.join ~sep:", " keys))
        </strong>
      </p>
      <div class_="flex gap-2">
        <Button
          aria_label="Previous item"
          is_disabled=(S.get n.is_prev_disabled)
          size=`sm
          variant=`secondary
          on_click=(fun _ -> n.on_previous ())>
          <Gravity.Chevron_up class_="size-4" />
        </Button>
        <Button
          aria_label="Next item"
          is_disabled=(S.get n.is_next_disabled)
          size=`sm
          variant=`secondary
          on_click=(fun _ -> n.on_next ())>
          <Gravity.Chevron_down class_="size-4" />
        </Button>
      </div>
    </div>
    <Accordion
      expanded_keys=(S.get expanded) on_expanded_change=(S.set set_expanded)>
      <Solidtype.For each=items>
        (fun (id, title, content) _ ->
          <Accordion.Item id>
            <Accordion.Heading>
              <Accordion.Trigger>
                (Solidtype.Jsx.string title) <Accordion.Indicator />
              </Accordion.Trigger>
            </Accordion.Heading>
            <Accordion.Panel>
              <Accordion.Body>(Solidtype.Jsx.string content)</Accordion.Body>
            </Accordion.Panel>
          </Accordion.Item>)
      </Solidtype.For>
    </Accordion>
  </div>
```

### Custom Indicator

An icon given to `Accordion.Indicator` takes the chevron's place and turns
over as its item expands.

```ocaml title="accordion_custom_indicator.mlx"
module S = Solidtype.Solid
module Accordion = Solidtype_heroui.Accordion
module Gravity = Solidtype_gravity_icons

let make () =
  let expanded, set_expanded = S.create_signal [| "" |] in
  <Accordion
    class_="w-full max-w-md"
    expanded_keys=(S.get expanded)
    variant=`surface
    on_expanded_change=(S.set set_expanded)>
    <Accordion.Item id="1">
      <Accordion.Heading>
        <Accordion.Trigger>
          "Using Plus/Minus Icon"
          <Accordion.Indicator>
            (if Array.exists (String.equal "1") (S.get expanded) then
               <Gravity.Minus />
             else <Gravity.Plus />)
          </Accordion.Indicator>
        </Accordion.Trigger>
      </Accordion.Heading>
      <Accordion.Panel>
        <Accordion.Body>
          "This accordion uses a plus icon that transforms when expanded. The \
           icon automatically rotates 45 degrees to form an X."
        </Accordion.Body>
      </Accordion.Panel>
    </Accordion.Item>
    <Accordion.Item id="2">
      <Accordion.Heading>
        <Accordion.Trigger>
          "Using Caret Icon"
          <Accordion.Indicator>
            <Gravity.Circle_chevron_down />
          </Accordion.Indicator>
        </Accordion.Trigger>
      </Accordion.Heading>
      <Accordion.Panel>
        <Accordion.Body>
          "This item uses a caret icon for the indicator. The rotation \
           animation is applied automatically."
        </Accordion.Body>
      </Accordion.Panel>
    </Accordion.Item>
    <Accordion.Item id="3">
      <Accordion.Heading>
        <Accordion.Trigger>
          "Using Arrow Icon"
          <Accordion.Indicator><Gravity.Chevrons_down /></Accordion.Indicator>
        </Accordion.Trigger>
      </Accordion.Heading>
      <Accordion.Panel>
        <Accordion.Body>
          "This item uses an arrow icon. Any icon you pass will receive the \
           rotation animation when the item expands."
        </Accordion.Body>
      </Accordion.Panel>
    </Accordion.Item>
  </Accordion>
```

### FAQ Layout

```ocaml title="accordion_faq.mlx"
module Accordion = Solidtype_heroui.Accordion
module Gravity = Solidtype_gravity_icons

let categories =
  [|
    ( "General",
      [|
        ( "How do I place an order?",
          "Browse our products, add items to your cart, and proceed to \
           checkout. You'll need to provide shipping and payment information \
           to complete your purchase." );
        ( "Can I modify or cancel my order?",
          "Yes, you can modify or cancel your order before it's shipped. Once \
           your order is processed, you can't make changes." );
      |] );
    ( "Licensing",
      [|
        ( "How do I purchase a license?",
          "You can purchase a license directly from our website. Select the \
           license type that fits your needs and proceed to checkout." );
        ( "What is the difference between a standard and a pro license?",
          "A standard license is for personal use or small projects, while a \
           pro license includes commercial use rights and priority support." );
      |] );
    ( "Support",
      [|
        ( "How do I get support?",
          "You can reach our support team through the contact form on our \
           website, or email us directly at support@example.com." );
      |] );
  |]

let make () =
  <div class_="flex w-full flex-col gap-6">
    <div class_="flex flex-col gap-1">
      <h2 class_="text-2xl font-bold">"Frequently Asked Questions"</h2>
      <p class_="mb-4 text-lg font-medium text-muted">
        "Everything you need to know about licensing and usage."
      </p>
    </div>
    <Solidtype.For each=categories>
      (fun (category, items) _ ->
        <div>
          <p class_="text-md mb-2 font-medium text-muted">
            (Solidtype.Jsx.string category)
          </p>
          <Accordion class_="w-full" variant=`surface>
            <Solidtype.For each=items>
              (fun (title, content) _ ->
                <Accordion.Item>
                  <Accordion.Heading>
                    <Accordion.Trigger>
                      (Solidtype.Jsx.string title)
                      <Accordion.Indicator>
                        <Gravity.Chevron_down />
                      </Accordion.Indicator>
                    </Accordion.Trigger>
                  </Accordion.Heading>
                  <Accordion.Panel>
                    <Accordion.Body>
                      (Solidtype.Jsx.string content)
                    </Accordion.Body>
                  </Accordion.Panel>
                </Accordion.Item>)
            </Solidtype.For>
          </Accordion>
        </div>)
    </Solidtype.For>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, on every part.

```ocaml title="accordion_tailwind.mlx"
module Accordion = Solidtype_heroui.Accordion
module Gravity = Solidtype_gravity_icons

let assets =
  "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/docs/3dicons/"

let items =
  [|
    ( "Set Up Notifications",
      "Receive account activity updates",
      assets ^ "bell-small.png",
      "Stay informed about your account activity with real-time notifications."
    );
    ( "Set up Browser Extension",
      "Connect your browser to your account",
      assets ^ "compass-small.png",
      "Enhance your browsing experience by installing our official browser \
       extension" );
    ( "Mint Collectible",
      "Create your first collectible",
      assets ^ "mint-collective-small.png",
      "Begin your journey into the world of digital collectibles by creating \
       your first NFT. " );
  |]

let make () =
  <Accordion
    class_="bg-surface-1/10 w-full max-w-md rounded-2xl" variant=`surface>
    <Solidtype.For each=items>
      (fun (title, subtitle, icon, content) _ ->
        <Accordion.Item
          class_="group/item \
                  first:**:data-[slot=accordion-trigger]:rounded-t-2xl \
                  last:[&:not(:has([data-slot=accordion-trigger][aria-expanded='true']))_[data-slot=accordion-trigger]]:rounded-b-2xl">
          <Accordion.Heading>
            <Accordion.Trigger
              class_="group flex items-center gap-2 transition-none \
                      hover:bg-surface">
              <img
                alt=title
                class_="h-11 w-11 transition-[scale,rotate] duration-300 \
                        ease-out group-hover/item:scale-120 \
                        group-hover/item:-rotate-10 \
                        group-hover/item:drop-shadow-lg"
                src=icon
              />
              <div class_="flex flex-col gap-0">
                <span class_="leading-5 font-medium">
                  (Solidtype.Jsx.string title)
                </span>
                <span class_="leading-6 font-normal text-muted/80">
                  (Solidtype.Jsx.string subtitle)
                </span>
              </div>
              <Accordion.Indicator class_="text-muted/50 [&>svg]:size-4">
                <Gravity.Chevron_down />
              </Accordion.Indicator>
            </Accordion.Trigger>
          </Accordion.Heading>
          <Accordion.Panel>
            <Accordion.Body class_="text-muted/80">
              (Solidtype.Jsx.string content)
            </Accordion.Body>
          </Accordion.Panel>
        </Accordion.Item>)
    </Solidtype.For>
  </Accordion>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every accordion, as with
HeroUI in React:

```css
@layer components {
  .accordion {
    @apply rounded-xl bg-gray-50;
  }

  .accordion__trigger {
    @apply text-lg font-semibold;
  }
}
```

## Styling Reference

### CSS Classes

- `.accordion` - Base accordion container
- `.accordion--surface` - Surface variant
- `.accordion__item` - Individual accordion item
- `.accordion__heading` - Heading wrapper
- `.accordion__trigger` - Clickable trigger button
- `.accordion__indicator` - Expand/collapse indicator icon
- `.accordion__panel` - Collapsible panel container
- `.accordion__body`, `.accordion__body-inner` - Content body container

### Interactive States

- **Expanded**: `[aria-expanded="true"]` on the trigger, and
  `[data-expanded="true"]` on the item, the indicator and the panel
- **Hover**: `:hover` or `[data-hovered="true"]` on the trigger
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]` on the trigger
- **Disabled**: `:disabled` or `[data-disabled="true"]` on the trigger, the
  item and the root
- **No separator**: `[data-hide-separator="true"]` on each item
- **Hidden**: `[aria-hidden="true"]` and `hidden="until-found"` on the panel
  while collapsed

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Accordion

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `expandedKeys` | `expanded_keys` | `string array` | | The controlled expanded keys |
| `defaultExpandedKeys` | `default_expanded_keys` | `string array` | `[\|\|]` | The initial expanded keys |
| `onExpandedChange` | `on_expanded_change` | `string array -> unit` | | Handler called when expanded keys change |
| `allowsMultipleExpanded` | `allows_multiple_expanded` | `bool` | `false` | Whether multiple items can be expanded at once |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the entire accordion is disabled |
| `variant` | `variant` | `` [ `default \| `surface ] `` | `` `default `` | The visual variant of the accordion |
| `hideSeparator` | `hide_separator` | `bool` | `false` | Hide separator lines between accordion items |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | The accordion items |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |

### Accordion.Item

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `id` | `id` | `string` | a unique id | Unique identifier for the item |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether this item is disabled |
| `onExpandedChange` | `on_expanded_change` | `bool -> unit` | | Called with its new state as its trigger is pressed, after the accordion's |
| `isExpanded`, `defaultExpanded` | — | | | An item is expanded as the accordion's keys say: HeroUI's reads neither inside an accordion, and here they are refused |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | The item content |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |

### Accordion.Trigger

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `onPress` | `on_press` | `unit -> unit` | | Called as it is pressed, by a pointer, Enter or Space, after its item's state has changed |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether it is disabled, as it is while its item is; the arrows pass it by |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Trigger content |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |

### Accordion.Heading, Accordion.Panel, Accordion.Body

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | Its content |
| `render` | `as_` | a function of its props and state | Draws another element in its place |

### Accordion.Indicator

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | Custom indicator icon |

## Accessibility

- The up and down arrows move focus between triggers, round from the last to
  the first, and Home and End to the first and the last, skipping a disabled
  item
- A collapsed panel stays on the page: the browser's find in page searches
  it, and expands its item on a match
