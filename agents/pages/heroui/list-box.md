# ListBox

A listbox displays a list of options and allows a user to select one or more of them.

Original HeroUI documentation: [ListBox](https://heroui.com/en/docs/react/components/list-box).

## Usage

```ocaml title="list_box_usage.mlx"
module Avatar = Solidtype_heroui.Avatar
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

let make () =
  <List_box aria_label="Users" class_="w-[220px]" selection_mode=`single>
    <List_box.Item id="1" text_value="Bob">
      <Avatar size=`sm>
        <Avatar.Image
          alt="Bob"
          src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg"
        />
        <Avatar.Fallback>"B"</Avatar.Fallback>
      </Avatar>
      <div class_="flex flex-col">
        <Label>"Bob"</Label> <Description>"bob@heroui.com"</Description>
      </div>
      <List_box.Item_indicator />
    </List_box.Item>
    <List_box.Item id="2" text_value="Fred">
      <Avatar size=`sm>
        <Avatar.Image
          alt="Fred"
          src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"
        />
        <Avatar.Fallback>"F"</Avatar.Fallback>
      </Avatar>
      <div class_="flex flex-col">
        <Label>"Fred"</Label> <Description>"fred@heroui.com"</Description>
      </div>
      <List_box.Item_indicator />
    </List_box.Item>
    <List_box.Item id="3" text_value="Martha">
      <Avatar size=`sm>
        <Avatar.Image
          alt="Martha"
          src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg"
        />
        <Avatar.Fallback>"M"</Avatar.Fallback>
      </Avatar>
      <div class_="flex flex-col">
        <Label>"Martha"</Label> <Description>"martha@heroui.com"</Description>
      </div>
      <List_box.Item_indicator />
    </List_box.Item>
  </List_box>
```

## Parity

The same HeroUI ListBox twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of each list: a
marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

## Anatomy

```ocaml
<List_box aria_label="Users">
  <List_box.Item id="bob">
    <Label>"Bob"</Label>
    <Description>"bob@heroui.com"</Description>
    <List_box.Item_indicator />
  </List_box.Item>
  <Separator />
  <List_box.Section>
    <Header>"Team"</Header>
    <List_box.Item id="alice">
      <Label>"Alice"</Label>
    </List_box.Item>
  </List_box.Section>
</List_box>
```

`Label`, `Description`, `Header` and `Separator` are HeroUI's own components,
used inside a list's options and sections.

## Examples

### With Disabled Items

```ocaml title="list_box_with_disabled_items.mlx"
module Description = Solidtype_heroui.Description
module Header = Solidtype_heroui.Header
module Kbd = Solidtype_heroui.Kbd
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Separator = Solidtype_heroui.Separator
module Surface = Solidtype_heroui.Surface
module Gravity = Solidtype_gravity_icons

let make () =
  <Surface class_="w-[256px] rounded-3xl shadow-surface">
    <List_box
      aria_label="File actions"
      class_="w-full p-2"
      disabled_keys=[| "delete-file" |]
      selection_mode=`none
      on_action=(fun (_ : string) -> ())>
      <List_box.Section>
        <Header>"Actions"</Header>
        <List_box.Item id="new-file" text_value="New file">
          <div class_="flex h-8 items-start justify-center pt-px">
            <Gravity.Square_plus class_="size-4 shrink-0 text-muted" />
          </div>
          <div class_="flex flex-col">
            <Label>"New file"</Label>
            <Description>"Create a new file"</Description>
          </div>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command /> <Kbd.Content>"N"</Kbd.Content>
          </Kbd>
        </List_box.Item>
        <List_box.Item id="edit-file" text_value="Edit file">
          <div class_="flex h-8 items-start justify-center pt-px">
            <Gravity.Pencil class_="size-4 shrink-0 text-muted" />
          </div>
          <div class_="flex flex-col">
            <Label>"Edit file"</Label> <Description>"Make changes"</Description>
          </div>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command /> <Kbd.Content>"E"</Kbd.Content>
          </Kbd>
        </List_box.Item>
      </List_box.Section>
      <Separator />
      <List_box.Section>
        <Header>"Danger zone"</Header>
        <List_box.Item
          id="delete-file" text_value="Delete file" variant=`danger>
          <div class_="flex h-8 items-start justify-center pt-px">
            <Gravity.Trash_bin class_="size-4 shrink-0 text-danger" />
          </div>
          <div class_="flex flex-col">
            <Label>"Delete file"</Label>
            <Description>"Move to trash"</Description>
          </div>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command />
            <Kbd.Abbr key_value=`shift />
            <Kbd.Content>"D"</Kbd.Content>
          </Kbd>
        </List_box.Item>
      </List_box.Section>
    </List_box>
  </Surface>
```

### With Sections

```ocaml title="list_box_with_sections.mlx"
module Description = Solidtype_heroui.Description
module Header = Solidtype_heroui.Header
module Kbd = Solidtype_heroui.Kbd
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Separator = Solidtype_heroui.Separator
module Surface = Solidtype_heroui.Surface
module Gravity = Solidtype_gravity_icons

let make () =
  <Surface class_="w-[256px] rounded-3xl shadow-surface">
    <List_box
      aria_label="File actions"
      class_="w-full p-2"
      selection_mode=`none
      on_action=(fun (_ : string) -> ())>
      <List_box.Section>
        <Header>"Actions"</Header>
        <List_box.Item id="new-file" text_value="New file">
          <div class_="flex h-8 items-start justify-center pt-px">
            <Gravity.Square_plus class_="size-4 shrink-0 text-muted" />
          </div>
          <div class_="flex flex-col">
            <Label>"New file"</Label>
            <Description>"Create a new file"</Description>
          </div>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command /> <Kbd.Content>"N"</Kbd.Content>
          </Kbd>
        </List_box.Item>
        <List_box.Item id="edit-file" text_value="Edit file">
          <div class_="flex h-8 items-start justify-center pt-px">
            <Gravity.Pencil class_="size-4 shrink-0 text-muted" />
          </div>
          <div class_="flex flex-col">
            <Label>"Edit file"</Label> <Description>"Make changes"</Description>
          </div>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command /> <Kbd.Content>"E"</Kbd.Content>
          </Kbd>
        </List_box.Item>
      </List_box.Section>
      <Separator />
      <List_box.Section>
        <Header>"Danger zone"</Header>
        <List_box.Item
          id="delete-file" text_value="Delete file" variant=`danger>
          <div class_="flex h-8 items-start justify-center pt-px">
            <Gravity.Trash_bin class_="size-4 shrink-0 text-danger" />
          </div>
          <div class_="flex flex-col">
            <Label>"Delete file"</Label>
            <Description>"Move to trash"</Description>
          </div>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command />
            <Kbd.Abbr key_value=`shift />
            <Kbd.Content>"D"</Kbd.Content>
          </Kbd>
        </List_box.Item>
      </List_box.Section>
    </List_box>
  </Surface>
```

### Multi Select

```ocaml title="list_box_multi_select.mlx"
module Avatar = Solidtype_heroui.Avatar
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Surface = Solidtype_heroui.Surface

let make () =
  <Surface class_="w-[256px] rounded-3xl shadow-surface">
    <List_box aria_label="Users" selection_mode=`multiple>
      <List_box.Item id="1" text_value="Bob">
        <Avatar size=`sm>
          <Avatar.Image
            alt="Bob"
            src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg"
          />
          <Avatar.Fallback>"B"</Avatar.Fallback>
        </Avatar>
        <div class_="flex flex-col">
          <Label>"Bob"</Label> <Description>"bob@heroui.com"</Description>
        </div>
        <List_box.Item_indicator />
      </List_box.Item>
      <List_box.Item id="2" text_value="Fred">
        <Avatar size=`sm>
          <Avatar.Image
            alt="Fred"
            src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"
          />
          <Avatar.Fallback>"F"</Avatar.Fallback>
        </Avatar>
        <div class_="flex flex-col">
          <Label>"Fred"</Label> <Description>"fred@heroui.com"</Description>
        </div>
        <List_box.Item_indicator />
      </List_box.Item>
      <List_box.Item id="3" text_value="Martha">
        <Avatar size=`sm>
          <Avatar.Image
            alt="Martha"
            src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg"
          />
          <Avatar.Fallback>"M"</Avatar.Fallback>
        </Avatar>
        <div class_="flex flex-col">
          <Label>"Martha"</Label> <Description>"martha@heroui.com"</Description>
        </div>
        <List_box.Item_indicator />
      </List_box.Item>
    </List_box>
  </Surface>
```

### Controlled

```ocaml title="list_box_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Avatar = Solidtype_heroui.Avatar
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Surface = Solidtype_heroui.Surface
module Gravity = Solidtype_gravity_icons

let make () =
  let selected, set_selected = S.create_signal [| "1" |] in
  <div class_="space-y-4">
    <Surface class_="w-[256px] rounded-3xl shadow-surface">
      <List_box
        aria_label="Users"
        selected_keys=(S.get selected)
        selection_mode=`multiple
        on_selection_change=(S.set set_selected)>
        <List_box.Item id="1" text_value="Bob">
          <Avatar size=`sm>
            <Avatar.Image
              alt="Bob"
              src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg"
            />
            <Avatar.Fallback>"B"</Avatar.Fallback>
          </Avatar>
          <div class_="flex flex-col">
            <Label>"Bob"</Label> <Description>"bob@heroui.com"</Description>
          </div>
          <List_box.Item_indicator>
            (fun selected ->
              if S.get selected then
                <Gravity.Check class_="size-4 text-accent-soft-foreground" />
              else Jsx.nothing)
          </List_box.Item_indicator>
        </List_box.Item>
        <List_box.Item id="2" text_value="Fred">
          <Avatar size=`sm>
            <Avatar.Image
              alt="Fred"
              src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"
            />
            <Avatar.Fallback>"F"</Avatar.Fallback>
          </Avatar>
          <div class_="flex flex-col">
            <Label>"Fred"</Label> <Description>"fred@heroui.com"</Description>
          </div>
          <List_box.Item_indicator>
            (fun selected ->
              if S.get selected then
                <Gravity.Check class_="size-4 text-accent-soft-foreground" />
              else Jsx.nothing)
          </List_box.Item_indicator>
        </List_box.Item>
        <List_box.Item id="3" text_value="Martha">
          <Avatar size=`sm>
            <Avatar.Image
              alt="Martha"
              src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg"
            />
            <Avatar.Fallback>"M"</Avatar.Fallback>
          </Avatar>
          <div class_="flex flex-col">
            <Label>"Martha"</Label>
            <Description>"martha@heroui.com"</Description>
          </div>
          <List_box.Item_indicator>
            (fun selected ->
              if S.get selected then
                <Gravity.Check class_="size-4 text-accent-soft-foreground" />
              else Jsx.nothing)
          </List_box.Item_indicator>
        </List_box.Item>
      </List_box>
    </Surface>
    <p class_="text-sm text-muted">
      "Selected: "
      (Jsx.string
         (match S.get selected with
         | [||] -> "None"
         | keys -> String.concat ", " (Array.to_list keys)))
    </p>
  </div>
```

### Virtualization

ListBox supports virtualization through [`Virtualizer`](#virtualizer),
enabling efficient rendering of large datasets by displaying only the rows
visible within the viewport. The option with the focus stays drawn, one the
keys move to is scrolled into view, and a reader is told each one's place in
the list.

```ocaml title="list_box_virtualization.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Virtualizer = Solidtype_heroui.Virtualizer

type user = { id : string; name : string; email : string }

let first_names =
  [|
    "Emma";
    "Liam";
    "Olivia";
    "Noah";
    "Ava";
    "James";
    "Sophia";
    "Oliver";
    "Isabella";
    "Lucas";
    "Mia";
    "Ethan";
    "Charlotte";
    "Mason";
    "Amelia";
    "Logan";
    "Harper";
    "Alexander";
    "Ella";
    "Benjamin";
  |]

let last_names =
  [|
    "Smith";
    "Johnson";
    "Williams";
    "Brown";
    "Jones";
    "Garcia";
    "Miller";
    "Davis";
    "Rodriguez";
    "Martinez";
    "Anderson";
    "Taylor";
    "Thomas";
    "Jackson";
    "White";
    "Harris";
    "Clark";
    "Lewis";
    "Robinson";
    "Walker";
  |]

let generate_users n =
  Array.init n (fun i ->
      let first_name = first_names.(i mod Array.length first_names) in
      let last_name =
        last_names.(i / Array.length first_names mod Array.length last_names)
      in
      {
        id = string_of_int (i + 1);
        name = first_name ^ " " ^ last_name;
        email =
          String.lowercase_ascii first_name
          ^ "."
          ^ String.lowercase_ascii last_name
          ^ "@acme.com";
      })

let make () =
  let users = generate_users 1000 in
  <Virtualizer layout=(Virtualizer.list_layout ~row_size:50. ())>
    <List_box
      aria_label="Virtualized list with 1000 items"
      class_="h-[400px] w-[300px] overflow-y-auto">
      <Solidtype.For each=users>
        (fun (user : user) _ ->
          <List_box.Item id=user.id text_value=user.name>
            <div class_="flex flex-col">
              <Label>(Solidtype.Jsx.string user.name)</Label>
              <Description>(Solidtype.Jsx.string user.email)</Description>
            </div>
            <List_box.Item_indicator />
          </List_box.Item>)
      </Solidtype.For>
    </List_box>
  </Virtualizer>
```

### Custom Check Icon

```ocaml title="list_box_custom_check_icon.mlx"
module S = Solidtype.Solid
module Avatar = Solidtype_heroui.Avatar
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Surface = Solidtype_heroui.Surface
module Gravity = Solidtype_gravity_icons

let make () =
  <Surface class_="w-[256px] rounded-3xl shadow-surface">
    <List_box aria_label="Users" selection_mode=`multiple>
      <List_box.Item id="1" text_value="Bob">
        <Avatar size=`sm>
          <Avatar.Image
            alt="Bob"
            src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg"
          />
          <Avatar.Fallback>"B"</Avatar.Fallback>
        </Avatar>
        <div class_="flex flex-col">
          <Label>"Bob"</Label> <Description>"bob@heroui.com"</Description>
        </div>
        <List_box.Item_indicator>
          (fun selected ->
            if S.get selected then
              <Gravity.Check class_="size-4 text-accent-soft-foreground" />
            else Solidtype.Jsx.nothing)
        </List_box.Item_indicator>
      </List_box.Item>
      <List_box.Item id="2" text_value="Fred">
        <Avatar size=`sm>
          <Avatar.Image
            alt="Fred"
            src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"
          />
          <Avatar.Fallback>"F"</Avatar.Fallback>
        </Avatar>
        <div class_="flex flex-col">
          <Label>"Fred"</Label> <Description>"fred@heroui.com"</Description>
        </div>
        <List_box.Item_indicator>
          (fun selected ->
            if S.get selected then
              <Gravity.Check class_="size-4 text-accent-soft-foreground" />
            else Solidtype.Jsx.nothing)
        </List_box.Item_indicator>
      </List_box.Item>
      <List_box.Item id="3" text_value="Martha">
        <Avatar size=`sm>
          <Avatar.Image
            alt="Martha"
            src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg"
          />
          <Avatar.Fallback>"M"</Avatar.Fallback>
        </Avatar>
        <div class_="flex flex-col">
          <Label>"Martha"</Label> <Description>"martha@heroui.com"</Description>
        </div>
        <List_box.Item_indicator>
          (fun selected ->
            if S.get selected then
              <Gravity.Check class_="size-4 text-accent-soft-foreground" />
            else Solidtype.Jsx.nothing)
        </List_box.Item_indicator>
      </List_box.Item>
    </List_box>
  </Surface>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="list_box_tailwind.mlx"
module Avatar = Solidtype_heroui.Avatar
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

let make () =
  <List_box
    aria_label="Assignee"
    class_="w-56 rounded-xl border border-border/80 bg-surface p-1 shadow-sm"
    selection_mode=`single>
    <List_box.Item
      class_="rounded-lg data-[focused=true]:bg-accent/10 \
              data-[selected=true]:bg-accent/5"
      id="1"
      text_value="Bob">
      <Avatar size=`sm>
        <Avatar.Image
          alt="Bob"
          src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg"
        />
        <Avatar.Fallback>"B"</Avatar.Fallback>
      </Avatar>
      <div class_="flex flex-col">
        <Label>"Bob"</Label> <Description>"bob@heroui.com"</Description>
      </div>
      <List_box.Item_indicator />
    </List_box.Item>
    <List_box.Item
      class_="rounded-lg data-[focused=true]:bg-accent/10 \
              data-[selected=true]:bg-accent/5"
      id="2"
      text_value="Fred">
      <Avatar size=`sm>
        <Avatar.Image
          alt="Fred"
          src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg"
        />
        <Avatar.Fallback>"F"</Avatar.Fallback>
      </Avatar>
      <div class_="flex flex-col">
        <Label>"Fred"</Label> <Description>"fred@heroui.com"</Description>
      </div>
      <List_box.Item_indicator />
    </List_box.Item>
  </List_box>
```

### Global CSS

To customize the ListBox component classes, you can use the
`@layer components` directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .list-box {
    @apply rounded-lg border border-border bg-surface p-2;
  }

  .list-box-item {
    @apply rounded px-2 py-1 cursor-pointer;
  }

  .list-box-item--danger {
    @apply text-danger;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.list-box` - Base listbox container
- `.list-box-item` - Individual listbox item
- `.list-box-item__indicator` - Selection indicator icon, its checkmark
  `[data-slot="list-box-item-indicator--checkmark"]`
- `.list-box-section` - Section container for grouping items, and `.header`
  for its title
- `[data-slot="separator"]` - A separator within the list
- `.list-box--default` - Default variant styling
- `.list-box--danger` - Danger variant styling
- `.list-box-item--default` - Default item variant
- `.list-box-item--danger` - Danger item variant
- `.list-box-item__indicator[data-visible="true"]` - Visible indicator state

### Interactive States

The component supports both CSS pseudo-classes and data attributes for
flexibility:

- **Hover**: `[data-hovered="true"]` on an option
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]`, and
  `[data-focused="true"]` on the option with the focus
- **Pressed**: `[data-pressed="true"]` on an option
- **Selected**: `[data-selected="true"]` and `[aria-selected="true"]` on an
  option
- **Disabled**: `[data-disabled="true"]` on an option
- **Selection**: `[data-selection-mode="single"]` or `"multiple"` on the
  options

## API Reference

Each prop beside the name HeroUI's React component gives it.

### List_box

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `aria-label` | `aria_label` | `string` | | Accessibility label for the listbox |
| `selectionMode` | `selection_mode` | `` `none `` \| `` `single `` \| `` `multiple `` | `` `single `` | Selection behavior |
| `selectedKeys` | `selected_keys` | `string array` | | Controlled selected keys |
| `defaultSelectedKeys` | `default_selected_keys` | `string array` | | Initial selected keys |
| `onSelectionChange` | `on_selection_change` | `string array -> unit` | | Handler called when selection changes |
| `disabledKeys` | `disabled_keys` | `string array` | | Keys of disabled items |
| `onAction` | `on_action` | `string -> unit` | | Handler called when an item is activated, with `` selection_mode=`none `` |
| `variant` | `variant` | `` `default `` \| `` `danger `` | `` `default `` | Visual variant |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | ListBox items, sections and separators |

### List_box.Item

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `id` | `id` | `string` | | Unique identifier for the item |
| `textValue` | `text_value` | `string` | | Text value for accessibility and typeahead |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether this item is disabled |
| `variant` | `variant` | `` `default `` \| `` `danger `` | `` `default `` | Visual variant |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Item content |

### List_box.Item_indicator

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | `bool accessor -> element` | Custom indicator content, given whether its option is selected |

### List_box.Section

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | Section content including Header and Items |

### Virtualizer

`Virtualizer`, around a `List_box` alone or in a `Select`, a `Combo_box` or an
`Autocomplete`. What scrolls the list is its own element
where it scrolls, else the nearest above that does; until the list knows its
size -- on the server, and as the page hydrates -- it draws the options in its
first 400 pixels, so a prerendered page holds them. A section is drawn whole
while any of it is in view.

| React | solidtype | Type | Description |
|---|---|---|---|
| `layout`, `layoutOptions` | `layout` | `Virtualizer.layout` | Its layout and the layout's options, `Virtualizer.list_layout` |
| `children` | `children` | elements | The list |

`Virtualizer.list_layout`'s options, in pixels:

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `orientation` | `orientation` | `` `vertical `` \| `` `horizontal `` | `` `vertical `` | The direction its entries follow one another, and it scrolls |
| `rowSize` | `row_size` | `float` | `48.` | The fixed size of a row in px |
| `estimatedRowSize` | `estimated_row_size` | `float` | | The estimated size of a row, when row sizes are variable: given without `row_size`, a row is as long as it is drawn |
| `headingSize` | `heading_size` | `float` | `48.` | The fixed size of a section header in px |
| `estimatedHeadingSize` | `estimated_heading_size` | `float` | | The estimated size of a section header, when the size is variable |
| `loaderSize` | `loader_size` | `float` | `48.` | The fixed size of a loader element in px, for "load more" elements |
| `gap` | `gap` | `float` | `0.` | The gap between items |
| `padding` | `padding` | `float` | `0.` | The padding around the list |

## Accessibility

The ListBox component implements the ARIA listbox pattern and provides:

- Full keyboard navigation support: Tab focuses the selected option, else the
  first, and the arrows move between options
- Typeahead search functionality
- Space, Enter or a press selects an option
- Proper focus management
- Support for disabled states
