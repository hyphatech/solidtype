# Tabs

Tabs organize content into multiple sections and allow users to navigate between them.

A panel is shown while the tab of the same `id` is selected; each requires
its `id`. The arrows of its orientation move between the tabs, round from the
last to the first, and Home and End to either end, skipping a disabled tab;
focus selects the tab it reaches, or Enter and Space do with
`` keyboard_activation=`manual ``.

Original HeroUI documentation: [Tabs](https://heroui.com/en/docs/react/components/tabs).

## Usage

HeroUI's examples.

```ocaml title="tabs_usage.mlx"
module Tabs = Solidtype_heroui.Tabs

let make () =
  <Tabs class_="w-full max-w-md">
    <Tabs.List_container>
      <Tabs.List aria_label="Options">
        <Tabs.Tab id="overview">"Overview" <Tabs.Indicator /></Tabs.Tab>
        <Tabs.Tab id="analytics">"Analytics" <Tabs.Indicator /></Tabs.Tab>
        <Tabs.Tab id="reports">"Reports" <Tabs.Indicator /></Tabs.Tab>
      </Tabs.List>
    </Tabs.List_container>
    <Tabs.Panel class_="pt-4" id="overview">
      <p>"View your project overview and recent activity."</p>
    </Tabs.Panel>
    <Tabs.Panel class_="pt-4" id="analytics">
      <p>"Track your metrics and analyze performance data."</p>
    </Tabs.Panel>
    <Tabs.Panel class_="pt-4" id="reports">
      <p>"Generate and download detailed reports."</p>
    </Tabs.Panel>
  </Tabs>
```

## Parity

The same HeroUI Tabs twice, under the same props: in solidtype on the left, in
React on the right. Below them, every attribute of the two roots: a marked
row is one they disagree on, and a dimmed row is a framework's own, which no
style reads.

A tab is Kobalte's button where React Aria's is a div, each of role `tab`.
A panel names no orientation, as React Aria's names none, so the spacing
HeroUI's styles would give it by its orientation reaches neither, and a panel
sits as close to its list as on heroui.com. React Aria marks its root focused while a tab is,
which no style reads and the port does not.

## Anatomy

```ocaml
<Tabs>
  <Tabs.List_container>
    <Tabs.List aria_label="Options">
      <Tabs.Tab id="one">
        <Tabs.Separator />
        <Tabs.Indicator />
      </Tabs.Tab>
    </Tabs.List>
  </Tabs.List_container>
  <Tabs.Panel id="one" />
</Tabs>
```

`Tabs.Separator` is optional.

## Examples

### Vertical

```ocaml title="tabs_vertical.mlx"
module Tabs = Solidtype_heroui.Tabs

let make () =
  <Tabs class_="w-full max-w-lg" orientation=`vertical>
    <Tabs.List_container>
      <Tabs.List aria_label="Vertical tabs">
        <Tabs.Tab id="account">"Account" <Tabs.Indicator /></Tabs.Tab>
        <Tabs.Tab id="security">"Security" <Tabs.Indicator /></Tabs.Tab>
        <Tabs.Tab id="notifications">
          "Notifications" <Tabs.Indicator />
        </Tabs.Tab>
        <Tabs.Tab id="billing">"Billing" <Tabs.Indicator /></Tabs.Tab>
      </Tabs.List>
    </Tabs.List_container>
    <Tabs.Panel class_="px-4" id="account">
      <h3 class_="mb-2 font-semibold">"Account Settings"</h3>
      <p class_="text-sm text-muted">
        "Manage your account information and preferences."
      </p>
    </Tabs.Panel>
    <Tabs.Panel class_="px-4" id="security">
      <h3 class_="mb-2 font-semibold">"Security Settings"</h3>
      <p class_="text-sm text-muted">
        "Configure two-factor authentication and password settings."
      </p>
    </Tabs.Panel>
    <Tabs.Panel class_="px-4" id="notifications">
      <h3 class_="mb-2 font-semibold">"Notification Preferences"</h3>
      <p class_="text-sm text-muted">
        "Choose how and when you want to receive notifications."
      </p>
    </Tabs.Panel>
    <Tabs.Panel class_="px-4" id="billing">
      <h3 class_="mb-2 font-semibold">"Billing Information"</h3>
      <p class_="text-sm text-muted">
        "View and manage your subscription and payment methods."
      </p>
    </Tabs.Panel>
  </Tabs>
```

### Overflow

When the tab list exceeds the available space, `Tabs.List_container`
automatically renders scroll chevrons and fading edges so users can navigate
the hidden tabs. This works the same way for both horizontal and vertical
orientations.

```ocaml title="tabs_overflow.mlx"
module Tabs = Solidtype_heroui.Tabs

let items =
  [|
    ("overview", "Overview");
    ("analytics", "Analytics");
    ("reports", "Reports");
    ("performance", "Performance");
    ("engagement", "Engagement");
    ("audience", "Audience");
    ("acquisition", "Acquisition");
    ("retention", "Retention");
    ("settings", "Settings");
  |]

let make () =
  <div class_="w-[400px]">
    <Tabs>
      <Tabs.List_container>
        <Tabs.List aria_label="Overflow options">
          <Solidtype.For each=items>
            (fun (id, label) _ ->
              <Tabs.Tab id>
                (Solidtype.Jsx.string label) <Tabs.Indicator />
              </Tabs.Tab>)
          </Solidtype.For>
        </Tabs.List>
      </Tabs.List_container>
      <Solidtype.For each=items>
        (fun (id, label) _ ->
          <Tabs.Panel class_="pt-4" id>
            <p>(Solidtype.Jsx.string (label ^ " panel content."))</p>
          </Tabs.Panel>)
      </Solidtype.For>
    </Tabs>
  </div>
```

### Disabled Tab

A tab is disabled while it or the tabs are; the arrows pass over it.

```ocaml title="tabs_disabled.mlx"
module Tabs = Solidtype_heroui.Tabs

let make () =
  <Tabs class_="w-full max-w-md">
    <Tabs.List_container>
      <Tabs.List aria_label="Tabs with disabled">
        <Tabs.Tab id="active">"Active" <Tabs.Indicator /></Tabs.Tab>
        <Tabs.Tab is_disabled=true id="disabled">
          "Disabled" <Tabs.Indicator />
        </Tabs.Tab>
        <Tabs.Tab id="available">"Available" <Tabs.Indicator /></Tabs.Tab>
      </Tabs.List>
    </Tabs.List_container>
    <Tabs.Panel class_="pt-4" id="active">
      <p>"This tab is active and can be selected."</p>
    </Tabs.Panel>
    <Tabs.Panel class_="pt-4" id="disabled">
      <p>"This content cannot be accessed."</p>
    </Tabs.Panel>
    <Tabs.Panel class_="pt-4" id="available">
      <p>"This tab is also available for selection."</p>
    </Tabs.Panel>
  </Tabs>
```

### With Separator

Add `<Tabs.Separator />` inside each `<Tabs.Tab>` (except the first) to
display separator lines between tabs, hidden beside the selected one.

```ocaml title="tabs_separator.mlx"
module Tabs = Solidtype_heroui.Tabs

let make () =
  <Tabs class_="w-full max-w-md">
    <Tabs.List_container>
      <Tabs.List aria_label="Options">
        <Tabs.Tab id="overview">"Overview" <Tabs.Indicator /></Tabs.Tab>
        <Tabs.Tab id="analytics">
          <Tabs.Separator /> "Analytics" <Tabs.Indicator />
        </Tabs.Tab>
        <Tabs.Tab id="reports">
          <Tabs.Separator /> "Reports" <Tabs.Indicator />
        </Tabs.Tab>
      </Tabs.List>
    </Tabs.List_container>
    <Tabs.Panel class_="pt-4" id="overview">
      <p>"View your project overview and recent activity."</p>
    </Tabs.Panel>
    <Tabs.Panel class_="pt-4" id="analytics">
      <p>"Track your metrics and analyze performance data."</p>
    </Tabs.Panel>
    <Tabs.Panel class_="pt-4" id="reports">
      <p>"Generate and download detailed reports."</p>
    </Tabs.Panel>
  </Tabs>
```

### Secondary Variant

```ocaml title="tabs_secondary.mlx"
module Tabs = Solidtype_heroui.Tabs

let make () =
  <Tabs class_="w-full max-w-md" variant=`secondary>
    <Tabs.List_container>
      <Tabs.List aria_label="Options">
        <Tabs.Tab id="overview">"Overview" <Tabs.Indicator /></Tabs.Tab>
        <Tabs.Tab id="analytics">"Analytics" <Tabs.Indicator /></Tabs.Tab>
        <Tabs.Tab id="reports">"Reports" <Tabs.Indicator /></Tabs.Tab>
      </Tabs.List>
    </Tabs.List_container>
    <Tabs.Panel class_="pt-4" id="overview">
      <p>"View your project overview and recent activity."</p>
    </Tabs.Panel>
    <Tabs.Panel class_="pt-4" id="analytics">
      <p>"Track your metrics and analyze performance data."</p>
    </Tabs.Panel>
    <Tabs.Panel class_="pt-4" id="reports">
      <p>"Generate and download detailed reports."</p>
    </Tabs.Panel>
  </Tabs>
```

### Secondary Variant Vertical

```ocaml title="tabs_secondary_vertical.mlx"
module Tabs = Solidtype_heroui.Tabs

let make () =
  <Tabs class_="w-full max-w-lg" orientation=`vertical variant=`secondary>
    <Tabs.List_container>
      <Tabs.List aria_label="Vertical tabs">
        <Tabs.Tab id="account">"Account" <Tabs.Indicator /></Tabs.Tab>
        <Tabs.Tab id="security">"Security" <Tabs.Indicator /></Tabs.Tab>
        <Tabs.Tab id="notifications">
          "Notifications" <Tabs.Indicator />
        </Tabs.Tab>
        <Tabs.Tab id="billing">"Billing" <Tabs.Indicator /></Tabs.Tab>
      </Tabs.List>
    </Tabs.List_container>
    <Tabs.Panel class_="px-4" id="account">
      <h3 class_="mb-2 font-semibold">"Account Settings"</h3>
      <p class_="text-sm text-muted">
        "Manage your account information and preferences."
      </p>
    </Tabs.Panel>
    <Tabs.Panel class_="px-4" id="security">
      <h3 class_="mb-2 font-semibold">"Security Settings"</h3>
      <p class_="text-sm text-muted">
        "Configure two-factor authentication and password settings."
      </p>
    </Tabs.Panel>
    <Tabs.Panel class_="px-4" id="notifications">
      <h3 class_="mb-2 font-semibold">"Notification Preferences"</h3>
      <p class_="text-sm text-muted">
        "Choose how and when you want to receive notifications."
      </p>
    </Tabs.Panel>
    <Tabs.Panel class_="px-4" id="billing">
      <h3 class_="mb-2 font-semibold">"Billing Information"</h3>
      <p class_="text-sm text-muted">
        "View and manage your subscription and payment methods."
      </p>
    </Tabs.Panel>
  </Tabs>
```

### Alignment

Tab content is centered by default. Use `align` to align it to the
`` `start `` or `` `end_ `` instead, which is especially useful for vertical,
sidebar-style navigation. Individual tabs can still be overridden with
`class_` on `Tabs.Tab`.

```ocaml title="tabs_alignment.mlx"
module Tabs = Solidtype_heroui.Tabs

let make () =
  <Tabs
    align=`start
    class_="w-full max-w-lg"
    orientation=`vertical
    variant=`secondary>
    <Tabs.List_container>
      <Tabs.List aria_label="Settings">
        <Tabs.Tab id="general">"General" <Tabs.Indicator /></Tabs.Tab>
        <Tabs.Tab id="billing">
          "Subscription & Billing" <Tabs.Indicator />
        </Tabs.Tab>
        <Tabs.Tab id="appearance">"Appearance" <Tabs.Indicator /></Tabs.Tab>
        <Tabs.Tab id="notifications">
          "Notifications" <Tabs.Indicator />
        </Tabs.Tab>
        <Tabs.Tab id="privacy">"Privacy" <Tabs.Indicator /></Tabs.Tab>
      </Tabs.List>
    </Tabs.List_container>
    <Tabs.Panel class_="px-4" id="general">
      <h3 class_="mb-2 font-semibold">"General"</h3>
      <p class_="text-sm text-muted">
        "Manage your account information and preferences."
      </p>
    </Tabs.Panel>
    <Tabs.Panel class_="px-4" id="billing">
      <h3 class_="mb-2 font-semibold">"Subscription & Billing"</h3>
      <p class_="text-sm text-muted">
        "View and manage your plan and payment methods."
      </p>
    </Tabs.Panel>
    <Tabs.Panel class_="px-4" id="appearance">
      <h3 class_="mb-2 font-semibold">"Appearance"</h3>
      <p class_="text-sm text-muted">
        "Choose a theme and adjust the interface density."
      </p>
    </Tabs.Panel>
    <Tabs.Panel class_="px-4" id="notifications">
      <h3 class_="mb-2 font-semibold">"Notifications"</h3>
      <p class_="text-sm text-muted">
        "Choose how and when you want to receive notifications."
      </p>
    </Tabs.Panel>
    <Tabs.Panel class_="px-4" id="privacy">
      <h3 class_="mb-2 font-semibold">"Privacy"</h3>
      <p class_="text-sm text-muted">
        "Control what you share and who can see your activity."
      </p>
    </Tabs.Panel>
  </Tabs>
```

### Links

A tab given an `href` is a link: a press or Enter follows it, and never
selects it, so the tab selected is the one `selected_key` names, the route an
application's router says is open. The arrows still move focus along the
tabs. A disabled tab is never followed. Here each tab links to a hash, which
the example's selection follows.

```ocaml title="tabs_links.mlx"
module S = Solidtype.Solid
module Tabs = Solidtype_heroui.Tabs

external hash : string = "hash" [@@mel.scope "window", "location"]

external add_listener : string -> (Dom.event -> unit) -> unit
  = "addEventListener"
[@@mel.scope "window"]

external remove_listener : string -> (Dom.event -> unit) -> unit
  = "removeEventListener"
[@@mel.scope "window"]

let pages = [ "getting-started"; "components"; "releases" ]

(* The page a link went to, as a router would say which route is open: here,
   the location's hash, read once the page has a location. *)
let page () = List.find_opt (fun page -> String.equal hash ("#" ^ page)) pages

let make () =
  let current, set_current = S.create_signal "getting-started" in
  let follow () = Option.iter (S.set set_current) (page ()) in
  let on_hash_change (_ : Dom.event) = follow () in
  S.on_mount (fun () ->
      follow ();
      add_listener "hashchange" on_hash_change;
      S.on_cleanup (fun () -> remove_listener "hashchange" on_hash_change));
  <Tabs class_="w-full max-w-md" selected_key=(S.get current)>
    <Tabs.List_container>
      <Tabs.List aria_label="Options">
        <Tabs.Tab href="#getting-started" id="getting-started">
          "Getting Started" <Tabs.Indicator />
        </Tabs.Tab>
        <Tabs.Tab href="#components" id="components">
          "Components" <Tabs.Indicator />
        </Tabs.Tab>
        <Tabs.Tab href="#releases" id="releases">
          "Releases" <Tabs.Indicator />
        </Tabs.Tab>
      </Tabs.List>
    </Tabs.List_container>
    <Tabs.Panel class_="pt-4" id="getting-started">
      <p>"Install the library and render a first component."</p>
    </Tabs.Panel>
    <Tabs.Panel class_="pt-4" id="components">
      <p>"Every component, with its examples and props."</p>
    </Tabs.Panel>
    <Tabs.Panel class_="pt-4" id="releases">
      <p>"What changed in each version."</p>
    </Tabs.Panel>
  </Tabs>
```

No key or press that reaches a link tab selects it or calls
`on_selection_change`.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, on every part.

```ocaml title="tabs_tailwind.mlx"
module Tabs = Solidtype_heroui.Tabs

let list_class =
  String.concat " "
    [
      "rounded-xl border border-accent/10 bg-accent-soft/30 p-1";
      "**:data-[slot=tabs-tab]:rounded-lg";
      "**:data-[slot=tabs-tab]:bg-transparent";
      "**:data-[slot=tabs-tab]:text-muted";
      "**:data-[slot=tabs-tab]:opacity-100";
      "**:data-[slot=tabs-tab]:transition-colors";
      "**:data-[slot=tabs-tab]:data-[hovered=true]:not-data-[selected=true]:bg-accent-soft";
      "**:data-[slot=tabs-tab]:data-[hovered=true]:not-data-[selected=true]:text-accent-soft-foreground";
      "**:data-[slot=tabs-tab]:data-[pressed=true]:not-data-[selected=true]:bg-accent-soft-hover";
      "**:data-[slot=tabs-tab]:data-[focus-visible=true]:ring-2";
      "**:data-[slot=tabs-tab]:data-[focus-visible=true]:ring-accent/15";
      "**:data-[slot=tabs-tab]:data-[selected=true]:font-medium";
      "**:data-[slot=tabs-tab]:data-[selected=true]:text-accent-foreground";
      "**:data-[slot=tabs-tab]:shadow-none";
      "**:data-[slot=tabs-indicator]:rounded-lg";
      "**:data-[slot=tabs-indicator]:bg-accent";
      "**:data-[slot=tabs-indicator]:shadow-none";
    ]

let make () =
  <Tabs class_="w-full max-w-sm">
    <Tabs.List_container class_="rounded-none bg-transparent">
      <Tabs.List aria_label="Billing cycle" class_=list_class>
        <Tabs.Tab id="monthly">"Monthly" <Tabs.Indicator /></Tabs.Tab>
        <Tabs.Tab id="yearly">"Yearly" <Tabs.Indicator /></Tabs.Tab>
      </Tabs.List>
    </Tabs.List_container>
    <Tabs.Panel class_="pt-3 text-sm text-muted" id="monthly">
      "Billed monthly, cancel anytime."
    </Tabs.Panel>
    <Tabs.Panel class_="pt-3 text-sm text-muted" id="yearly">
      "Save 20% with annual billing."
    </Tabs.Panel>
  </Tabs>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every tabs, as with
HeroUI in React:

```css
@layer components {
  .tabs__list {
    @apply rounded-xl border border-border bg-surface p-1;
  }

  .tabs__indicator {
    @apply rounded-lg bg-foreground shadow-sm;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base Classes

- `.tabs` - Base tabs container
- `.tabs__list-container` - Tab list container wrapper
- `.tabs__list-container__scroller` - Scrollable wrapper around the tab list
  (handles overflow and fading edges)
- `.tabs__list-container__scroll-prev` - Scroll chevron button for the
  previous (left / up) direction
- `.tabs__list-container__scroll-next` - Scroll chevron button for the next
  (right / down) direction
- `.tabs__list` - Tab list container
- `.tabs__tab` - Individual tab button
- `.tabs__separator` - Separator between tabs
- `.tabs__panel` - Tab panel content
- `.tabs__indicator` - Tab indicator

#### Orientation Attributes

- `.tabs[data-orientation="horizontal"]` - Horizontal tab layout (default)
- `.tabs[data-orientation="vertical"]` - Vertical tab layout

The list and the panel carry `[data-orientation]` too.

#### Variant Classes

- `.tabs--secondary` - Secondary variant with underline indicator

#### Alignment Classes

- `.tabs--align-start` - Aligns tab content to the start
- `.tabs--align-end` - Aligns tab content to the end

### Interactive States

The component supports both CSS pseudo-classes and data attributes, on the
tab:

- **Selected**: `[aria-selected="true"]` or `[data-selected="true"]`
- **Hover**: `:hover` or `[data-hovered="true"]`
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]`
- **Disabled**: `[aria-disabled="true"]` or `[data-disabled="true"]`

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Tabs

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `selectedKey` | `selected_key` | `string` | | Controlled selected tab key |
| `defaultSelectedKey` | `default_selected_key` | `string` | the first not disabled | Default selected tab key |
| `onSelectionChange` | `on_selection_change` | `string -> unit` | | Selection change handler |
| `orientation` | `orientation` | `` [ `horizontal \| `vertical ] `` | `` `horizontal `` | Tab layout orientation |
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | `` `primary `` | Visual style variant. Primary uses a filled indicator, secondary uses an underline indicator |
| `align` | `align` | `` [ `start \| `center \| `end_ ] `` | `` `center `` | Alignment of the content inside each tab |
| `keyboardActivation` | `keyboard_activation` | `` [ `automatic \| `manual ] `` | `` `automatic `` | Whether focus selects, or Enter and Space do |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether every tab is disabled |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |

### Tabs.List

| React | solidtype | Type | Description |
|---|---|---|---|
| `aria-label` | `aria_label` | `string` | Accessibility label for tab list |
| `className` | `class_` | `string` | Added after HeroUI's classes |

### Tabs.Tab

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `id` | `id` | `string` | | Unique tab identifier, its panel's too; required |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether tab is disabled |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `href` | `href` | `string` | | Where it links: it is an `<a>`, followed and never selected by a press or a key |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |

### Tabs.Panel

| React | solidtype | Type | Description |
|---|---|---|---|
| `id` | `id` | `string` | Panel identifier matching tab id; required |
| `className` | `class_` | `string` | Added after HeroUI's classes |

### Tabs.List_container, Tabs.Indicator, Tabs.Separator

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
