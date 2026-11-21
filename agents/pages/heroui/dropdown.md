# Dropdown

A dropdown displays a list of actions or options that a user can choose.

A `Button` inside it is its trigger; anything else is wrapped in
`Dropdown.Trigger`.

Original HeroUI documentation: [Dropdown](https://heroui.com/en/docs/react/components/dropdown).

## Usage

```ocaml title="dropdown_usage.mlx"
module Button = Solidtype_heroui.Button
module Dropdown = Solidtype_heroui.Dropdown
module Label = Solidtype_heroui.Label

let make () =
  <Dropdown>
    <Button aria_label="Menu" variant=`secondary>"Actions"</Button>
    <Dropdown.Popover>
      <Dropdown.Menu on_action=(fun (_ : string) -> ())>
        <Dropdown.Item id="new-file" text_value="New file">
          <Label>"New file"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="copy-link" text_value="Copy link">
          <Label>"Copy link"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="edit-file" text_value="Edit file">
          <Label>"Edit file"</Label>
        </Dropdown.Item>
        <Dropdown.Item
          id="delete-file" text_value="Delete file" variant=`danger>
          <Label>"Delete file"</Label>
        </Dropdown.Item>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

## Parity

The same HeroUI Dropdown twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of each trigger: a
marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

## Anatomy

```ocaml
<Dropdown>
  <Dropdown.Trigger>...</Dropdown.Trigger>
  <Dropdown.Popover>
    <Dropdown.Menu>
      <Dropdown.Item id="...">
        <Label>...</Label>
        <Description>...</Description>
        <Kbd>...</Kbd>
        <Dropdown.Item_indicator />
      </Dropdown.Item>
      <Separator />
      <Dropdown.Section>
        <Header>...</Header>
        <Dropdown.Item id="..." />
      </Dropdown.Section>
      <Dropdown.Submenu_trigger>
        <Dropdown.Item id="...">
          <Label>...</Label>
          <Dropdown.Submenu_indicator />
        </Dropdown.Item>
        <Dropdown.Popover>
          <Dropdown.Menu>
            <Dropdown.Item id="..." />
          </Dropdown.Menu>
        </Dropdown.Popover>
      </Dropdown.Submenu_trigger>
    </Dropdown.Menu>
  </Dropdown.Popover>
</Dropdown>
```

## Examples

### With Icons

```ocaml title="dropdown_with_icons.mlx"
module Button = Solidtype_heroui.Button
module Dropdown = Solidtype_heroui.Dropdown
module Kbd = Solidtype_heroui.Kbd
module Label = Solidtype_heroui.Label
module Gravity = Solidtype_gravity_icons

let make () =
  <Dropdown>
    <Button aria_label="Menu" variant=`secondary>"Actions"</Button>
    <Dropdown.Popover>
      <Dropdown.Menu on_action=(fun (_ : string) -> ())>
        <Dropdown.Item id="new-file" text_value="New file">
          <Gravity.Square_plus class_="size-4 shrink-0 text-muted" />
          <Label>"New file"</Label>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command /> <Kbd.Content>"N"</Kbd.Content>
          </Kbd>
        </Dropdown.Item>
        <Dropdown.Item id="open-file" text_value="Open file">
          <Gravity.Folder_open class_="size-4 shrink-0 text-muted" />
          <Label>"Open file"</Label>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command /> <Kbd.Content>"O"</Kbd.Content>
          </Kbd>
        </Dropdown.Item>
        <Dropdown.Item id="save-file" text_value="Save file">
          <Gravity.Floppy_disk class_="size-4 shrink-0 text-muted" />
          <Label>"Save file"</Label>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command /> <Kbd.Content>"S"</Kbd.Content>
          </Kbd>
        </Dropdown.Item>
        <Dropdown.Item
          id="delete-file" text_value="Delete file" variant=`danger>
          <Gravity.Trash_bin class_="size-4 shrink-0 text-danger" />
          <Label>"Delete file"</Label>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command />
            <Kbd.Abbr key_value=`shift />
            <Kbd.Content>"D"</Kbd.Content>
          </Kbd>
        </Dropdown.Item>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

### With Descriptions

```ocaml title="dropdown_with_descriptions.mlx"
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Dropdown = Solidtype_heroui.Dropdown
module Kbd = Solidtype_heroui.Kbd
module Label = Solidtype_heroui.Label
module Gravity = Solidtype_gravity_icons

let make () =
  <Dropdown>
    <Button aria_label="Menu" variant=`secondary>"Actions"</Button>
    <Dropdown.Popover>
      <Dropdown.Menu on_action=(fun (_ : string) -> ())>
        <Dropdown.Item id="new-file" text_value="New file">
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
        </Dropdown.Item>
        <Dropdown.Item id="open-file" text_value="Open file">
          <div class_="flex h-8 items-start justify-center pt-px">
            <Gravity.Folder_open class_="size-4 shrink-0 text-muted" />
          </div>
          <div class_="flex flex-col">
            <Label>"Open file"</Label>
            <Description>"Open an existing file"</Description>
          </div>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command /> <Kbd.Content>"O"</Kbd.Content>
          </Kbd>
        </Dropdown.Item>
        <Dropdown.Item id="save-file" text_value="Save file">
          <div class_="flex h-8 items-start justify-center pt-px">
            <Gravity.Floppy_disk class_="size-4 shrink-0 text-muted" />
          </div>
          <div class_="flex flex-col">
            <Label>"Save file"</Label>
            <Description>"Save the current file"</Description>
          </div>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command /> <Kbd.Content>"S"</Kbd.Content>
          </Kbd>
        </Dropdown.Item>
        <Dropdown.Item
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
        </Dropdown.Item>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

### With Disabled Items

```ocaml title="dropdown_with_disabled_items.mlx"
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Dropdown = Solidtype_heroui.Dropdown
module Header = Solidtype_heroui.Header
module Kbd = Solidtype_heroui.Kbd
module Label = Solidtype_heroui.Label
module Separator = Solidtype_heroui.Separator
module Gravity = Solidtype_gravity_icons

let make () =
  <Dropdown>
    <Button is_icon_only=true aria_label="Menu" variant=`secondary>
      <Gravity.Bars class_="outline-none" />
    </Button>
    <Dropdown.Popover class_="min-w-[220px]">
      <Dropdown.Menu
        disabled_keys=[| "delete-file" |] on_action=(fun (_ : string) -> ())>
        <Dropdown.Section>
          <Header>"Actions"</Header>
          <Dropdown.Item id="new-file" text_value="New file">
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
          </Dropdown.Item>
          <Dropdown.Item id="edit-file" text_value="Edit file">
            <div class_="flex h-8 items-start justify-center pt-px">
              <Gravity.Pencil class_="size-4 shrink-0 text-muted" />
            </div>
            <div class_="flex flex-col">
              <Label>"Edit file"</Label>
              <Description>"Make changes"</Description>
            </div>
            <Kbd class_="ms-auto" variant=`light>
              <Kbd.Abbr key_value=`command /> <Kbd.Content>"E"</Kbd.Content>
            </Kbd>
          </Dropdown.Item>
        </Dropdown.Section>
        <Separator />
        <Dropdown.Section>
          <Header>"Danger zone"</Header>
          <Dropdown.Item
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
          </Dropdown.Item>
        </Dropdown.Section>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

### With Sections

```ocaml title="dropdown_with_sections.mlx"
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Dropdown = Solidtype_heroui.Dropdown
module Header = Solidtype_heroui.Header
module Kbd = Solidtype_heroui.Kbd
module Label = Solidtype_heroui.Label
module Separator = Solidtype_heroui.Separator
module Gravity = Solidtype_gravity_icons

let make () =
  <Dropdown>
    <Button is_icon_only=true aria_label="Menu" variant=`secondary>
      <Gravity.Ellipsis_vertical class_="outline-none" />
    </Button>
    <Dropdown.Popover>
      <Dropdown.Menu on_action=(fun (_ : string) -> ())>
        <Dropdown.Section>
          <Header>"Actions"</Header>
          <Dropdown.Item id="new-file" text_value="New file">
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
          </Dropdown.Item>
          <Dropdown.Item id="edit-file" text_value="Edit file">
            <div class_="flex h-8 items-start justify-center pt-px">
              <Gravity.Pencil class_="size-4 shrink-0 text-muted" />
            </div>
            <div class_="flex flex-col">
              <Label>"Edit file"</Label>
              <Description>"Make changes"</Description>
            </div>
            <Kbd class_="ms-auto" variant=`light>
              <Kbd.Abbr key_value=`command /> <Kbd.Content>"E"</Kbd.Content>
            </Kbd>
          </Dropdown.Item>
        </Dropdown.Section>
        <Separator />
        <Dropdown.Section>
          <Header>"Danger zone"</Header>
          <Dropdown.Item
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
          </Dropdown.Item>
        </Dropdown.Section>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

### With Multiple Selection

```ocaml title="dropdown_with_multiple_selection.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Dropdown = Solidtype_heroui.Dropdown
module Header = Solidtype_heroui.Header
module Label = Solidtype_heroui.Label

let make () =
  let selected, set_selected = S.create_signal [| "apple" |] in
  <Dropdown>
    <Button aria_label="Menu" variant=`secondary>"Preferred Fruits"</Button>
    <Dropdown.Popover class_="min-w-[256px]">
      <Dropdown.Menu
        selected_keys=(S.get selected)
        selection_mode=`multiple
        on_selection_change=(S.set set_selected)>
        <Dropdown.Section>
          <Header>"Select a fruit"</Header>
          <Dropdown.Item id="apple" text_value="Apple">
            <Dropdown.Item_indicator /> <Label>"Apple"</Label>
          </Dropdown.Item>
          <Dropdown.Item id="banana" text_value="Banana">
            <Dropdown.Item_indicator /> <Label>"Banana"</Label>
          </Dropdown.Item>
          <Dropdown.Item id="cherry" text_value="Cherry">
            <Dropdown.Item_indicator /> <Label>"Cherry"</Label>
          </Dropdown.Item>
        </Dropdown.Section>
        <Dropdown.Item id="orange" text_value="Orange">
          <Dropdown.Item_indicator /> <Label>"Orange"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="pear" text_value="Pear">
          <Dropdown.Item_indicator /> <Label>"Pear"</Label>
        </Dropdown.Item>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

### Controlled

```ocaml title="dropdown_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Dropdown = Solidtype_heroui.Dropdown
module Label = Solidtype_heroui.Label

let make () =
  let selected, set_selected = S.create_signal [| "bold" |] in
  <div class_="flex min-w-sm flex-col items-center justify-center gap-4">
    <p class_="text-sm text-muted">
      "Selected: "
      (match S.get selected with
      | [||] -> Jsx.string "None"
      | keys -> Jsx.string (Js.Array.join ~sep:", " keys))
    </p>
    <Dropdown>
      <Button aria_label="Menu" variant=`secondary>"Actions"</Button>
      <Dropdown.Popover>
        <Dropdown.Menu
          selected_keys=(S.get selected)
          selection_mode=`multiple
          on_selection_change=(S.set set_selected)>
          <Dropdown.Item id="bold" text_value="Bold">
            <Label>"Bold"</Label> <Dropdown.Item_indicator />
          </Dropdown.Item>
          <Dropdown.Item id="italic" text_value="Italic">
            <Label>"Italic"</Label> <Dropdown.Item_indicator />
          </Dropdown.Item>
          <Dropdown.Item id="underline" text_value="Underline">
            <Label>"Underline"</Label> <Dropdown.Item_indicator />
          </Dropdown.Item>
        </Dropdown.Menu>
      </Dropdown.Popover>
    </Dropdown>
  </div>
```

### Controlled Open State

```ocaml title="dropdown_controlled_open_state.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Dropdown = Solidtype_heroui.Dropdown
module Label = Solidtype_heroui.Label

let make () =
  let is_open, set_open = S.create_signal false in
  <div class_="flex min-w-sm flex-col items-center justify-center gap-4">
    <p class_="text-sm text-muted">
      "Dropdown is: "
      <strong>(Jsx.string (if S.get is_open then "open" else "closed"))</strong>
    </p>
    <Dropdown is_open=(S.get is_open) on_open_change=(S.set set_open)>
      <Button aria_label="Menu" variant=`secondary>"Actions"</Button>
      <Dropdown.Popover>
        <Dropdown.Menu>
          <Dropdown.Item id="new-file" text_value="New file">
            <Label>"New file"</Label>
          </Dropdown.Item>
          <Dropdown.Item id="open-file" text_value="Open file">
            <Label>"Open file"</Label>
          </Dropdown.Item>
          <Dropdown.Item id="save-file" text_value="Save file">
            <Label>"Save file"</Label>
          </Dropdown.Item>
          <Dropdown.Item
            id="delete-file" text_value="Delete file" variant=`danger>
            <Label>"Delete file"</Label>
          </Dropdown.Item>
        </Dropdown.Menu>
      </Dropdown.Popover>
    </Dropdown>
  </div>
```

### With Single Selection

```ocaml title="dropdown_with_single_selection.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Dropdown = Solidtype_heroui.Dropdown
module Header = Solidtype_heroui.Header
module Label = Solidtype_heroui.Label

let make () =
  let selected, set_selected = S.create_signal [| "apple" |] in
  <Dropdown>
    <Button aria_label="Menu" variant=`secondary>"Fruit"</Button>
    <Dropdown.Popover class_="min-w-[256px]">
      <Dropdown.Menu
        selected_keys=(S.get selected)
        selection_mode=`single
        on_selection_change=(S.set set_selected)>
        <Dropdown.Section>
          <Header>"Select a fruit"</Header>
          <Dropdown.Item id="apple" text_value="Apple">
            <Dropdown.Item_indicator /> <Label>"Apple"</Label>
          </Dropdown.Item>
          <Dropdown.Item id="banana" text_value="Banana">
            <Dropdown.Item_indicator /> <Label>"Banana"</Label>
          </Dropdown.Item>
          <Dropdown.Item id="cherry" text_value="Cherry">
            <Dropdown.Item_indicator /> <Label>"Cherry"</Label>
          </Dropdown.Item>
        </Dropdown.Section>
        <Dropdown.Item id="orange" text_value="Orange">
          <Dropdown.Item_indicator /> <Label>"Orange"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="pear" text_value="Pear">
          <Dropdown.Item_indicator /> <Label>"Pear"</Label>
        </Dropdown.Item>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

### Single With Custom Indicator

```ocaml title="dropdown_single_with_custom_indicator.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Dropdown = Solidtype_heroui.Dropdown
module Header = Solidtype_heroui.Header
module Label = Solidtype_heroui.Label
module Gravity = Solidtype_gravity_icons

let make () =
  let selected, set_selected = S.create_signal [| "apple" |] in
  <Dropdown>
    <Button aria_label="Menu" variant=`secondary>"Fruits"</Button>
    <Dropdown.Popover class_="min-w-[256px]">
      <Dropdown.Menu
        selected_keys=(S.get selected)
        selection_mode=`single
        on_selection_change=(S.set set_selected)>
        <Dropdown.Section>
          <Header>"Select a fruit"</Header>
          <Dropdown.Item id="apple" text_value="Apple">
            <Dropdown.Item_indicator>
              (fun selected ->
                if S.get selected then
                  <Gravity.Circle_check_fill
                    class_="text-accent-soft-foreground" />
                else Solidtype.Jsx.nothing)
            </Dropdown.Item_indicator>
            <Label>"Apple"</Label>
          </Dropdown.Item>
          <Dropdown.Item id="banana" text_value="Banana">
            <Dropdown.Item_indicator>
              (fun selected ->
                if S.get selected then
                  <Gravity.Circle_check_fill
                    class_="text-accent-soft-foreground" />
                else Solidtype.Jsx.nothing)
            </Dropdown.Item_indicator>
            <Label>"Banana"</Label>
          </Dropdown.Item>
          <Dropdown.Item id="cherry" text_value="Cherry">
            <Dropdown.Item_indicator>
              (fun selected ->
                if S.get selected then
                  <Gravity.Circle_check_fill
                    class_="text-accent-soft-foreground" />
                else Solidtype.Jsx.nothing)
            </Dropdown.Item_indicator>
            <Label>"Cherry"</Label>
          </Dropdown.Item>
        </Dropdown.Section>
        <Dropdown.Item id="orange" text_value="Orange">
          <Dropdown.Item_indicator>
            (fun selected ->
              if S.get selected then
                <Gravity.Circle_check_fill class_="text-accent-soft-foreground"
                />
              else Solidtype.Jsx.nothing)
          </Dropdown.Item_indicator>
          <Label>"Orange"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="pear" text_value="Pear">
          <Dropdown.Item_indicator>
            (fun selected ->
              if S.get selected then
                <Gravity.Circle_check_fill class_="text-accent-soft-foreground"
                />
              else Solidtype.Jsx.nothing)
          </Dropdown.Item_indicator>
          <Label>"Pear"</Label>
        </Dropdown.Item>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

### With Section Level Selection

```ocaml title="dropdown_with_section_level_selection.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Dropdown = Solidtype_heroui.Dropdown
module Header = Solidtype_heroui.Header
module Kbd = Solidtype_heroui.Kbd
module Label = Solidtype_heroui.Label
module Separator = Solidtype_heroui.Separator

let make () =
  let text_styles, set_text_styles = S.create_signal [| "bold"; "italic" |] in
  let text_alignment, set_text_alignment = S.create_signal [| "left" |] in
  <Dropdown>
    <Button aria_label="Menu" variant=`secondary>"Styles"</Button>
    <Dropdown.Popover class_="min-w-[256px]">
      <Dropdown.Menu>
        <Dropdown.Section>
          <Header>"Actions"</Header>
          <Dropdown.Item id="cut" text_value="Cut">
            <Label>"Cut"</Label>
            <Kbd class_="ms-auto" variant=`light>
              <Kbd.Abbr key_value=`command /> <Kbd.Content>"X"</Kbd.Content>
            </Kbd>
          </Dropdown.Item>
          <Dropdown.Item id="copy" text_value="Copy">
            <Label>"Copy"</Label>
            <Kbd class_="ms-auto" variant=`light>
              <Kbd.Abbr key_value=`command /> <Kbd.Content>"C"</Kbd.Content>
            </Kbd>
          </Dropdown.Item>
          <Dropdown.Item id="paste" text_value="Paste">
            <Label>"Paste"</Label>
            <Kbd class_="ms-auto" variant=`light>
              <Kbd.Abbr key_value=`command /> <Kbd.Content>"U"</Kbd.Content>
            </Kbd>
          </Dropdown.Item>
        </Dropdown.Section>
        <Separator />
        <Dropdown.Section
          selected_keys=(S.get text_styles)
          selection_mode=`multiple
          on_selection_change=(S.set set_text_styles)>
          <Header>"Text Style"</Header>
          <Dropdown.Item id="bold" text_value="Bold">
            <Dropdown.Item_indicator />
            <Label>"Bold"</Label>
            <Kbd class_="ms-auto" variant=`light>
              <Kbd.Abbr key_value=`command /> <Kbd.Content>"B"</Kbd.Content>
            </Kbd>
          </Dropdown.Item>
          <Dropdown.Item id="italic" text_value="Italic">
            <Dropdown.Item_indicator />
            <Label>"Italic"</Label>
            <Kbd class_="ms-auto" variant=`light>
              <Kbd.Abbr key_value=`command /> <Kbd.Content>"I"</Kbd.Content>
            </Kbd>
          </Dropdown.Item>
          <Dropdown.Item id="underline" text_value="Underline">
            <Dropdown.Item_indicator />
            <Label>"Underline"</Label>
            <Kbd class_="ms-auto" variant=`light>
              <Kbd.Abbr key_value=`command /> <Kbd.Content>"U"</Kbd.Content>
            </Kbd>
          </Dropdown.Item>
        </Dropdown.Section>
        <Separator />
        <Dropdown.Section
          selected_keys=(S.get text_alignment)
          selection_mode=`single
          on_selection_change=(S.set set_text_alignment)>
          <Header>"Text Alignment"</Header>
          <Dropdown.Item id="left" text_value="Left">
            <Dropdown.Item_indicator type_=`dot />
            <Label>"Left"</Label>
            <Kbd class_="ms-auto" variant=`light>
              <Kbd.Abbr key_value=`alt /> <Kbd.Content>"A"</Kbd.Content>
            </Kbd>
          </Dropdown.Item>
          <Dropdown.Item id="center" text_value="Center">
            <Dropdown.Item_indicator type_=`dot />
            <Label>"Center"</Label>
            <Kbd class_="ms-auto" variant=`light>
              <Kbd.Abbr key_value=`alt /> <Kbd.Content>"H"</Kbd.Content>
            </Kbd>
          </Dropdown.Item>
          <Dropdown.Item id="right" text_value="Right">
            <Dropdown.Item_indicator type_=`dot />
            <Label>"Right"</Label>
            <Kbd class_="ms-auto" variant=`light>
              <Kbd.Abbr key_value=`alt /> <Kbd.Content>"D"</Kbd.Content>
            </Kbd>
          </Dropdown.Item>
        </Dropdown.Section>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

### With Keyboard Shortcuts

```ocaml title="dropdown_with_keyboard_shortcuts.mlx"
module Button = Solidtype_heroui.Button
module Dropdown = Solidtype_heroui.Dropdown
module Kbd = Solidtype_heroui.Kbd
module Label = Solidtype_heroui.Label

let make () =
  <Dropdown>
    <Button aria_label="Menu" variant=`secondary>"Actions"</Button>
    <Dropdown.Popover>
      <Dropdown.Menu on_action=(fun (_ : string) -> ())>
        <Dropdown.Item id="new" text_value="New">
          <Label>"New"</Label>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command /> <Kbd.Content>"N"</Kbd.Content>
          </Kbd>
        </Dropdown.Item>
        <Dropdown.Item id="open" text_value="Open">
          <Label>"Open"</Label>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command /> <Kbd.Content>"O"</Kbd.Content>
          </Kbd>
        </Dropdown.Item>
        <Dropdown.Item id="save" text_value="Save">
          <Label>"Save"</Label>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command /> <Kbd.Content>"S"</Kbd.Content>
          </Kbd>
        </Dropdown.Item>
        <Dropdown.Item id="delete" text_value="Delete" variant=`danger>
          <Label>"Delete"</Label>
          <Kbd class_="ms-auto" variant=`light>
            <Kbd.Abbr key_value=`command />
            <Kbd.Abbr key_value=`shift />
            <Kbd.Content>"D"</Kbd.Content>
          </Kbd>
        </Dropdown.Item>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

### With Submenus

```ocaml title="dropdown_with_submenus.mlx"
module Button = Solidtype_heroui.Button
module Dropdown = Solidtype_heroui.Dropdown
module Label = Solidtype_heroui.Label

let make () =
  <Dropdown>
    <Button aria_label="Menu" variant=`secondary>"Share"</Button>
    <Dropdown.Popover>
      <Dropdown.Menu on_action=(fun (_ : string) -> ())>
        <Dropdown.Item id="copy-link" text_value="Copy Link">
          <Label>"Copy Link"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="facebook" text_value="Facebook">
          <Label>"Facebook"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="twitter" text_value="Twitter">
          <Label>"X / Twitter"</Label>
        </Dropdown.Item>
        <Dropdown.Submenu_trigger>
          <Dropdown.Item id="share" text_value="Share">
            <Label>"Other"</Label> <Dropdown.Submenu_indicator />
          </Dropdown.Item>
          <Dropdown.Popover>
            <Dropdown.Menu>
              <Dropdown.Item id="whatsapp" text_value="WhatsApp">
                <Label>"WhatsApp"</Label>
              </Dropdown.Item>
              <Dropdown.Item id="telegram" text_value="Telegram">
                <Label>"Telegram"</Label>
              </Dropdown.Item>
              <Dropdown.Item id="discord" text_value="Discord">
                <Label>"Discord"</Label>
              </Dropdown.Item>
              <Dropdown.Submenu_trigger>
                <Dropdown.Item id="email" text_value="Email">
                  <Label>"Email"</Label> <Dropdown.Submenu_indicator />
                </Dropdown.Item>
                <Dropdown.Popover>
                  <Dropdown.Menu>
                    <Dropdown.Item id="work" text_value="Work email">
                      <Label>"Work email"</Label>
                    </Dropdown.Item>
                    <Dropdown.Item id="personal" text_value="Personal email">
                      <Label>"Personal email"</Label>
                    </Dropdown.Item>
                  </Dropdown.Menu>
                </Dropdown.Popover>
              </Dropdown.Submenu_trigger>
            </Dropdown.Menu>
          </Dropdown.Popover>
        </Dropdown.Submenu_trigger>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

### With Custom Submenu Indicator

```ocaml title="dropdown_with_custom_submenu_indicator.mlx"
module Button = Solidtype_heroui.Button
module Dropdown = Solidtype_heroui.Dropdown
module Label = Solidtype_heroui.Label
module Gravity = Solidtype_gravity_icons

let make () =
  <Dropdown>
    <Button aria_label="Menu" variant=`secondary>"Share"</Button>
    <Dropdown.Popover>
      <Dropdown.Menu on_action=(fun (_ : string) -> ())>
        <Dropdown.Item id="copy-link" text_value="Copy Link">
          <Label>"Copy Link"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="facebook" text_value="Facebook">
          <Label>"Facebook"</Label>
        </Dropdown.Item>
        <Dropdown.Submenu_trigger>
          <Dropdown.Item id="share" text_value="Share">
            <Label>"More options"</Label>
            <Dropdown.Submenu_indicator>
              <Gravity.Arrow_right class_="size-3.5 text-muted" />
            </Dropdown.Submenu_indicator>
          </Dropdown.Item>
          <Dropdown.Popover>
            <Dropdown.Menu>
              <Dropdown.Item id="whatsapp" text_value="WhatsApp">
                <Label>"WhatsApp"</Label>
              </Dropdown.Item>
              <Dropdown.Item id="telegram" text_value="Telegram">
                <Label>"Telegram"</Label>
              </Dropdown.Item>
              <Dropdown.Submenu_trigger>
                <Dropdown.Item id="email" text_value="Email">
                  <Label>"Email"</Label>
                  <Dropdown.Submenu_indicator>
                    <svg
                      class_="size-3.5 text-muted"
                      fill="none"
                      stroke="currentColor"
                      stroke_linecap="round"
                      stroke_linejoin="round"
                      stroke_width="2"
                      view_box="0 0 24 24">
                      <path d="M9 18l6-6-6-6" />
                    </svg>
                  </Dropdown.Submenu_indicator>
                </Dropdown.Item>
                <Dropdown.Popover>
                  <Dropdown.Menu>
                    <Dropdown.Item id="work" text_value="Work email">
                      <Label>"Work email"</Label>
                    </Dropdown.Item>
                    <Dropdown.Item id="personal" text_value="Personal email">
                      <Label>"Personal email"</Label>
                    </Dropdown.Item>
                  </Dropdown.Menu>
                </Dropdown.Popover>
              </Dropdown.Submenu_trigger>
              <Dropdown.Item id="discord" text_value="Discord">
                <Label>"Discord"</Label>
              </Dropdown.Item>
            </Dropdown.Menu>
          </Dropdown.Popover>
        </Dropdown.Submenu_trigger>
        <Dropdown.Submenu_trigger>
          <Dropdown.Item id="other" text_value="Other">
            <Label>"Other (default indicator)"</Label>
            <Dropdown.Submenu_indicator />
          </Dropdown.Item>
          <Dropdown.Popover>
            <Dropdown.Menu>
              <Dropdown.Item id="sms" text_value="SMS">
                <Label>"SMS"</Label>
              </Dropdown.Item>
            </Dropdown.Menu>
          </Dropdown.Popover>
        </Dropdown.Submenu_trigger>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

### Custom Trigger

```ocaml title="dropdown_custom_trigger.mlx"
module Avatar = Solidtype_heroui.Avatar
module Dropdown = Solidtype_heroui.Dropdown
module Label = Solidtype_heroui.Label
module Gravity = Solidtype_gravity_icons

let make () =
  <Dropdown>
    <Dropdown.Trigger class_="rounded-full">
      <Avatar fallback_delay=600.>
        <Avatar.Image
          alt="Junior Garcia"
          src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/orange.jpg"
        />
        <Avatar.Fallback>"JD"</Avatar.Fallback>
      </Avatar>
    </Dropdown.Trigger>
    <Dropdown.Popover>
      <div class_="px-3 pt-3 pb-1">
        <div class_="flex items-center gap-2">
          <Avatar fallback_delay=600. size=`sm>
            <Avatar.Image
              alt="Jane"
              src="https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/orange.jpg"
            />
            <Avatar.Fallback>"JD"</Avatar.Fallback>
          </Avatar>
          <div class_="flex flex-col gap-0">
            <p class_="text-sm leading-5 font-medium">"Jane Doe"</p>
            <p class_="text-xs leading-none text-muted">"jane@example.com"</p>
          </div>
        </div>
      </div>
      <Dropdown.Menu>
        <Dropdown.Item id="dashboard" text_value="Dashboard">
          <Label>"Dashboard"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="profile" text_value="Profile">
          <Label>"Profile"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="settings" text_value="Settings">
          <div class_="flex w-full items-center justify-between gap-2">
            <Label>"Settings"</Label>
            <Gravity.Gear class_="size-3.5 text-muted" />
          </div>
        </Dropdown.Item>
        <Dropdown.Item id="new-project" text_value="New project">
          <div class_="flex w-full items-center justify-between gap-2">
            <Label>"Create Team"</Label>
            <Gravity.Persons class_="size-3.5 text-muted" />
          </div>
        </Dropdown.Item>
        <Dropdown.Item id="logout" text_value="Logout" variant=`danger>
          <div class_="flex w-full items-center justify-between gap-2">
            <Label>"Log Out"</Label>
            <Gravity.Arrow_right_from_square class_="size-3.5 text-danger" />
          </div>
        </Dropdown.Item>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

### Long Press Trigger

```ocaml title="dropdown_long_press_trigger.mlx"
module Button = Solidtype_heroui.Button
module Dropdown = Solidtype_heroui.Dropdown
module Label = Solidtype_heroui.Label

let make () =
  <Dropdown trigger=`long_press>
    <Button aria_label="Menu" variant=`secondary>"Long Press"</Button>
    <Dropdown.Popover>
      <Dropdown.Menu>
        <Dropdown.Item id="new-file" text_value="New file">
          <Label>"New file"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="open-file" text_value="Open file">
          <Label>"Open file"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="save-file" text_value="Save file">
          <Label>"Save file"</Label>
        </Dropdown.Item>
        <Dropdown.Item
          id="delete-file" text_value="Delete file" variant=`danger>
          <Label>"Delete file"</Label>
        </Dropdown.Item>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="dropdown_tailwind.mlx"
module Button = Solidtype_heroui.Button
module Dropdown = Solidtype_heroui.Dropdown
module Label = Solidtype_heroui.Label

let make () =
  <Dropdown>
    <Button variant=`secondary>"Actions"</Button>
    <Dropdown.Popover
      class_="rounded-xl border border-border/80 bg-surface p-1 shadow-sm">
      <Dropdown.Menu>
        <Dropdown.Item
          class_="rounded-lg data-[focused=true]:bg-default"
          id="rename"
          text_value="Rename">
          <Label>"Rename"</Label>
        </Dropdown.Item>
        <Dropdown.Item
          class_="rounded-lg data-[focused=true]:bg-default"
          id="duplicate"
          text_value="Duplicate">
          <Label>"Duplicate"</Label>
        </Dropdown.Item>
        <Dropdown.Item
          class_="rounded-lg data-[focused=true]:bg-danger-soft"
          id="delete"
          text_value="Delete"
          variant=`danger>
          <Label>"Delete"</Label>
        </Dropdown.Item>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>
```

### Global CSS

To customize the Dropdown component classes, you can use the
`@layer components` directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .dropdown__trigger {
    @apply outline-none;
  }

  .dropdown__popover {
    @apply rounded-lg border border-border bg-overlay p-2;
  }

  .dropdown__menu {
    @apply flex flex-col gap-1;
  }
}
```

## Styling Reference

### CSS Classes

- `.dropdown__trigger` - The button or element that triggers the dropdown
- `.dropdown__popover` - The popover container
- `.dropdown__menu` - The menu container inside the popover
- `[data-slot="separator"]` - Separator elements within the menu

The menu's items and sections take these classes:

- `.menu-item` - Base menu item container
- `.menu-item__indicator` - Selection indicator (checkmark or dot)
  - `[data-slot="menu-item-indicator--checkmark"]` - Checkmark indicator SVG
  - `[data-slot="menu-item-indicator--dot"]` - Dot indicator SVG
- `.menu-item__indicator--submenu` - Submenu indicator (chevron)
- `.menu-item--default` - Default variant styling
- `.menu-item--danger` - Danger variant styling
- `.menu-section` - Base menu section container, and `.header` for its title

### Interactive States

- **Hover**: `[data-hovered="true"]` on trigger and items
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]` on trigger and
  items, and `[data-focused="true"]` on the item with the focus
- **Pressed**: `[data-pressed="true"]` on trigger and items; on the trigger
  also while the menu is open
- **Disabled**: `[data-disabled="true"]` on items
- **Selected**: `[data-selected="true"]` or `[aria-checked="true"]` on items
- **Selection**: `[data-selection-mode="single"]` or `"multiple"` on the menu
  and its items
- **Submenu**: `[data-has-submenu="true"]` on an item that opens one, and
  `[data-open="true"]` while it is open
- **Entering** and **Exiting**: `[data-entering="true"]` and
  `[data-exiting="true"]` on the popover, while it appears and disappears
- **Placement**: `[data-placement="bottom"]`, and the other sides, on the
  popover

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Dropdown

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `isOpen` | `is_open` | `bool` | | Sets the open state of the menu (controlled) |
| `defaultOpen` | `default_open` | `bool` | `false` | Sets the default open state of the menu (uncontrolled) |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Handler called when the open state changes |
| `trigger` | `trigger` | `` `press `` \| `` `long_press `` | `` `press `` | The type of interaction that triggers the menu |
| `children` | `children` | elements | | Dropdown content: its trigger and its popover |

### Dropdown.Trigger

| React | solidtype | Type | Description |
|---|---|---|---|
| `aria-label` | `aria_label` | `string` | Its name, where its children give none |
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | What it wraps |

### Dropdown.Popover

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `placement` | `placement` | `` `bottom ``, and React Aria's others: `` `bottom_end ``, `` `top_start ``, `` `start ``... | `` `bottom `` | Placement of the popover relative to the trigger |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Its menu |

### Dropdown.Menu

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `selectionMode` | `selection_mode` | `` `none `` \| `` `single `` \| `` `multiple `` | `` `none `` | Whether single or multiple selection is enabled, read as it is made |
| `selectedKeys` | `selected_keys` | `string array` | | The currently selected keys (controlled) |
| `defaultSelectedKeys` | `default_selected_keys` | `string array` | | The initial selected keys (uncontrolled) |
| `onSelectionChange` | `on_selection_change` | `string array -> unit` | | Handler called when the selection changes |
| `disabledKeys` | `disabled_keys` | `string array` | | Keys of disabled items |
| `onAction` | `on_action` | `string -> unit` | | Handler called when an item is activated |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Its items, sections and separators |

### Dropdown.Section

| React | solidtype | Type | Description |
|---|---|---|---|
| `selectionMode` | `selection_mode` | `` `single `` \| `` `multiple `` | Selection mode for items within this section, read as it is made |
| `selectedKeys` | `selected_keys` | `string array` | The currently selected keys (controlled) |
| `defaultSelectedKeys` | `default_selected_keys` | `string array` | The initial selected keys (uncontrolled) |
| `onSelectionChange` | `on_selection_change` | `string array -> unit` | Handler called when the selection changes |
| `disabledKeys` | `disabled_keys` | `string array` | Keys of disabled items |
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | Its header and items |

### Dropdown.Item

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `id` | `id` | `string` | | Unique identifier for the item |
| `textValue` | `text_value` | `string` | | Text content of the item for typeahead |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether it is disabled |
| `variant` | `variant` | `` `default `` \| `` `danger `` | `` `default `` | Visual variant of the item |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | What it shows |

### Dropdown.Item_indicator

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `type` | `type_` | `` `checkmark `` \| `` `dot `` | `` `checkmark `` | Type of indicator to display |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | `bool accessor -> element` | | Custom indicator content, given whether its item is selected |

### Dropdown.Submenu_indicator

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | Custom indicator content, in place of HeroUI's chevron |

### Dropdown.Submenu_trigger

| React | solidtype | Type | Description |
|---|---|---|---|
| `children` | `children` | elements | The item that opens the submenu, and its popover |

## Accessibility

`Dropdown` implements the ARIA menu pattern and provides:

- Full keyboard navigation support (arrow keys, Home and End, typeahead)
- Proper focus management: the menu gives the focus to its selected item as
  it opens, and back to its trigger as it closes on Escape or a press outside
- Support for disabled states
- Long press interaction support: with `` trigger=`long_press `` the menu opens
  on a press held half a second, or on Alt and an arrow, and its trigger is
  described so to a screen reader
- Submenu navigation: a submenu opens by a hover or the arrow toward it
- In a selection of many, Enter on an item closes the menu, and a press or
  Space keeps it open
