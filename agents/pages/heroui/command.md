# Command

A command palette, a search that filters a menu of commands in a dialog.

A command palette: a search that filters a menu of commands, in a dialog. The
focus stays in the search while the arrow keys move through the commands
shown; Enter or a press runs one. Its look is a stylesheet the library ships,
imported as [Theming](theming.md#setup) shows.

## Usage

```ocaml title="command_usage.mlx"
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Chip = Solidtype_heroui.Chip
module Command = Solidtype_heroui.Command
module Kbd = Solidtype_heroui.Kbd
module Gravity = Solidtype_gravity_icons

let make () =
  <Command>
    <Button variant=`outline>
      "Open Command Palette "
      <Kbd><Kbd.Abbr key_value=`command /> <Kbd.Content>"K"</Kbd.Content></Kbd>
    </Button>
    <Command.Backdrop>
      <Command.Container>
        <Command.Dialog>
          <Command.Header>
            <Chip size=`sm variant=`secondary>"Home"</Chip>
          </Command.Header>
          <Command.Input_group>
            <Command.Input_group.Prefix>
              <Gravity.Magnifier class_="size-4" />
            </Command.Input_group.Prefix>
            <Command.Input_group.Input placeholder="Type a command or search..."
            />
            <Command.Input_group.Clear_button />
            <Command.Input_group.Suffix>
              <Kbd class_="text-xs"><Kbd.Content>"Esc"</Kbd.Content></Kbd>
            </Command.Input_group.Suffix>
          </Command.Input_group>
          <Command.List>
            <Command.Group heading=(Jsx.string "Actions")>
              <Command.Item>
                <Gravity.File_plus /> <span>"Create new file..."</span>
              </Command.Item>
              <Command.Item>
                <Gravity.Folder_plus /> <span>"Create new folder..."</span>
              </Command.Item>
              <Command.Item>
                <Gravity.Person /> <span>"Assign to me"</span>
              </Command.Item>
            </Command.Group>
            <Command.Group heading=(Jsx.string "Settings")>
              <Command.Item>
                <Gravity.Gear /> <span>"Preferences"</span>
              </Command.Item>
              <Command.Item>
                <Gravity.Palette /> <span>"Change theme"</span>
              </Command.Item>
              <Command.Item>
                <Gravity.Keyboard /> <span>"Keyboard shortcuts"</span>
              </Command.Item>
            </Command.Group>
          </Command.List>
          <Command.Footer class_="justify-between [&_kbd]:h-5 [&_kbd]:text-xs">
            <div class_="flex items-center gap-3">
              <div class_="flex items-center gap-2">
                <div class_="flex items-center gap-0.5">
                  <Kbd><Kbd.Abbr key_value=`up /></Kbd>
                  <Kbd><Kbd.Abbr key_value=`down /></Kbd>
                </div>
                <span>"Navigate"</span>
              </div>
              <div class_="flex items-center gap-2">
                <Kbd><Kbd.Abbr key_value=`enter /></Kbd> <span>"Select"</span>
              </div>
            </div>
          </Command.Footer>
        </Command.Dialog>
      </Command.Container>
    </Command.Backdrop>
  </Command>
```

## Anatomy

```ocaml
<Command>
  <Button>"Open"</Button>
  <Command.Backdrop>
    <Command.Container>
      <Command.Dialog>
        <Command.Header />
        <Command.Input_group>
          <Command.Input_group.Prefix />
          <Command.Input_group.Input />
          <Command.Input_group.Clear_button />
          <Command.Input_group.Suffix />
        </Command.Input_group>
        <Command.List>
          <Command.Group heading=(Jsx.string "Actions")>
            <Command.Item />
          </Command.Group>
          <Command.Separator />
        </Command.List>
        <Command.Footer />
      </Command.Dialog>
    </Command.Container>
  </Command.Backdrop>
</Command>
```

A `Button` inside `Command` opens it. Typing shows the commands whose text
holds what is typed, and focuses the first. Escape empties the search, then
closes the palette. The palette stays open as a command runs: close it in
`on_action` where it should.

## Examples

### Clean

```ocaml title="command_clean.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Command = Solidtype_heroui.Command
module Kbd = Solidtype_heroui.Kbd
module Gravity = Solidtype_gravity_icons

let keys shortcut =
  <div class_="ml-auto flex gap-1">
    <For each=shortcut>
      (fun key _ ->
        <kbd
          class_="flex size-5 items-center justify-center rounded bg-default \
                  text-[11px] text-muted uppercase">
          (Jsx.string key)
        </kbd>)
    </For>
  </div>

let make () =
  <Command>
    <Button variant=`outline>
      "Clean "
      <Kbd><Kbd.Abbr key_value=`command /> <Kbd.Content>"K"</Kbd.Content></Kbd>
    </Button>
    <Command.Backdrop>
      <Command.Container size=`lg>
        <Command.Dialog>
          <Command.Header class_="flex-wrap gap-1 px-3 pt-2 pb-0">
            <span
              class_="inline-flex h-5 items-center rounded bg-default px-2 \
                      text-xs font-medium text-muted capitalize">
              "home"
            </span>
          </Command.Header>
          <Command.Input_group>
            <Command.Input_group.Input placeholder="What do you need?" />
            <Command.Input_group.Clear_button />
          </Command.Input_group>
          <Command.List>
            <Command.Group heading=(Jsx.string "Projects")>
              <Command.Item id="search-projects">
                <Gravity.Layout_cells_large />
                <span>"Search Projects..."</span>
                (keys [| "S"; "P" |])
              </Command.Item>
              <Command.Item>
                <Gravity.Plus /> <span>"Create New Project..."</span>
              </Command.Item>
            </Command.Group>
            <Command.Group heading=(Jsx.string "Teams")>
              <Command.Item>
                <Gravity.Persons />
                <span>"Search Teams..."</span>
                (keys [| {js|⇧|js}; "P" |])
              </Command.Item>
              <Command.Item>
                <Gravity.Plus /> <span>"Create New Team..."</span>
              </Command.Item>
            </Command.Group>
            <Command.Group heading=(Jsx.string "Help")>
              <Command.Item>
                <Gravity.File_text />
                <span>"Search Docs..."</span>
                (keys [| {js|⇧|js}; "D" |])
              </Command.Item>
              <Command.Item>
                <Gravity.Comment /> <span>"Send Feedback..."</span>
              </Command.Item>
              <Command.Item>
                <Gravity.Envelope /> <span>"Contact Support"</span>
              </Command.Item>
            </Command.Group>
          </Command.List>
        </Command.Dialog>
      </Command.Container>
    </Command.Backdrop>
  </Command>
```

### Dev Toolbar

```ocaml title="command_dev_toolbar.mlx"
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Command = Solidtype_heroui.Command
module Kbd = Solidtype_heroui.Kbd
module Gravity = Solidtype_gravity_icons

let shortcut key =
  <Kbd class_="ms-auto text-xs">
    <Kbd.Content>(Jsx.string key)</Kbd.Content>
  </Kbd>

let make () =
  <Command>
    <Button variant=`outline>
      "Dev Toolbar "
      <Kbd><Kbd.Abbr key_value=`command /> <Kbd.Content>"K"</Kbd.Content></Kbd>
    </Button>
    <Command.Backdrop>
      <Command.Container>
        <Command.Dialog>
          <Command.Input_group>
            <Command.Input_group.Prefix>
              <Gravity.Magnifier class_="size-4" />
            </Command.Input_group.Prefix>
            <Command.Input_group.Input placeholder="What do you need?" />
            <Command.Input_group.Clear_button />
            <Command.Input_group.Suffix>
              <Kbd class_="text-xs"><Kbd.Content>"Esc"</Kbd.Content></Kbd>
            </Command.Input_group.Suffix>
          </Command.Input_group>
          <Command.List>
            <Command.Group>
              <Command.Item
                class_="bg-default"
                text_value="View Environment staging/feat-dashboard-redesign">
                <span class_="size-2 shrink-0 rounded-full bg-success" />
                <div class_="flex flex-col">
                  <span class_="font-medium">"View Environment"</span>
                  <span class_="text-xs text-muted">
                    "staging/feat-dashboard-redesign"
                  </span>
                </div>
              </Command.Item>
            </Command.Group>
            <Command.Group heading=(Jsx.string "Collaboration")>
              <Command.Item>
                <Gravity.Comment /> <span>"Feedback"</span> (shortcut "C")
              </Command.Item>
              <Command.Item>
                <Gravity.Bell /> <span>"Notifications"</span> (shortcut "N")
              </Command.Item>
              <Command.Item>
                <Gravity.Flag /> <span>"Feature Flags..."</span> (shortcut "F")
              </Command.Item>
              <Command.Item>
                <Gravity.Eye /> <span>"Share Preview"</span> (shortcut "S")
              </Command.Item>
              <Command.Item>
                <Gravity.Branches_right />
                <span>"Switch Branch..."</span>
                (shortcut "B")
              </Command.Item>
            </Command.Group>
            <Command.Group heading=(Jsx.string "Development")>
              <Command.Item>
                <Gravity.Terminal /> <span>"View Logs"</span> (shortcut "L")
              </Command.Item>
              <Command.Item>
                <Gravity.Pulse /> <span>"Tracing..."</span> (shortcut "T")
              </Command.Item>
            </Command.Group>
          </Command.List>
        </Command.Dialog>
      </Command.Container>
    </Command.Backdrop>
  </Command>
```

### Launcher

```ocaml title="command_launcher.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Command = Solidtype_heroui.Command
module Kbd = Solidtype_heroui.Kbd
module Gravity = Solidtype_gravity_icons

(* An icon on a square of its colour, and what kind of entry it is. *)
let entry ~colour ~icon ~kind name =
  <Command.Item class_="h-10">
    <div
      class_=("flex size-5 shrink-0 items-center justify-center rounded \
               [&_svg]:size-3 [&_svg]:text-white " ^ colour)>
      icon
    </div>
    <span>(Jsx.string name)</span>
    <span class_="ml-auto text-[13px] text-muted">(Jsx.string kind)</span>
  </Command.Item>

let hint key =
  <kbd
    class_="flex h-5 items-center rounded bg-default px-1.5 text-[11px] \
            text-muted">
    (Jsx.string key)
  </kbd>

let make () =
  <Command>
    <Button variant=`outline>
      "Launcher "
      <Kbd><Kbd.Abbr key_value=`command /> <Kbd.Content>"K"</Kbd.Content></Kbd>
    </Button>
    <Command.Backdrop>
      <Command.Container size=`lg>
        <Command.Dialog>
          <Command.Input_group>
            <Command.Input_group.Input
              placeholder="Search for apps and commands..."
            />
            <Command.Input_group.Clear_button />
          </Command.Input_group>
          <Command.List>
            <Command.Group heading=(Jsx.string "Suggestions")>
              (entry ~colour:"bg-violet-500" ~icon:<Gravity.Palette />
                 ~kind:"Application" "Design Tool")
              (entry ~colour:"bg-indigo-500" ~icon:<Gravity.Chart_line />
                 ~kind:"Application" "Project Tracker")
              (entry ~colour:"bg-sky-500" ~icon:<Gravity.Comment />
                 ~kind:"Application" "Team Chat")
              (entry ~colour:"bg-red-500" ~icon:<Gravity.Video />
                 ~kind:"Application" "Video Platform")
              (entry ~colour:"bg-amber-500" ~icon:<Gravity.Pencil />
                 ~kind:"Application" "Notes")
            </Command.Group>
            <Command.Group heading=(Jsx.string "Commands")>
              (entry
                 ~colour:"rounded-md bg-gradient-to-b from-red-400 to-red-600"
                 ~icon:<Gravity.Copy /> ~kind:"Command" "Clipboard History")
              (entry
                 ~colour:
                   "rounded-md bg-gradient-to-b from-emerald-400 to-emerald-600"
                 ~icon:<Gravity.Wrench /> ~kind:"Command" "Import Extension")
              (entry
                 ~colour:
                   "rounded-md bg-gradient-to-b from-emerald-400 to-emerald-600"
                 ~icon:<Gravity.Gear /> ~kind:"Command" "Manage Extensions")
            </Command.Group>
          </Command.List>
          <Command.Footer class_="justify-between">
            <div class_="flex items-center gap-2">
              <span class_="text-xs font-medium">"Open Application"</span>
              (hint {js|↵|js})
            </div>
            <div class_="flex items-center gap-2">
              <div class_="h-3 w-px bg-border" />
              <span class_="text-xs">"Actions"</span>
              <div class_="flex gap-0.5">(hint {js|⌘|js}) (hint "K")</div>
            </div>
          </Command.Footer>
        </Command.Dialog>
      </Command.Container>
    </Command.Backdrop>
  </Command>
```

### Minimal

```ocaml title="command_minimal.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Command = Solidtype_heroui.Command
module Kbd = Solidtype_heroui.Kbd
module Gravity = Solidtype_gravity_icons

(* A command marked by a bar at its start while it is focused, its keys
   beside it. *)
let command ~icon ~keys name =
  <Command.Item
    class_="gap-3 rounded-none before:absolute before:inset-y-0 before:left-0 \
            before:w-[3px] before:bg-[#5f6ad2] before:opacity-0 \
            data-[focused=true]:before:opacity-100">
    icon
    <span>(Jsx.string name)</span>
    <div class_="ml-auto flex gap-2">
      <For each=keys>
        (fun key _ ->
          <kbd class_="font-mono text-[13px] text-muted">(Jsx.string key)</kbd>)
      </For>
    </div>
  </Command.Item>

let make () =
  <Command>
    <Button variant=`outline>
      "Minimal "
      <Kbd><Kbd.Abbr key_value=`command /> <Kbd.Content>"K"</Kbd.Content></Kbd>
    </Button>
    <Command.Backdrop>
      <Command.Container size=`lg>
        <Command.Dialog>
          <Command.Header class_="px-4 pt-4 pb-0">
            <div
              class_="flex h-6 items-center rounded bg-default px-2 text-xs \
                      text-muted">
              "Issue - FUN-343"
            </div>
          </Command.Header>
          <Command.Input_group>
            <Command.Input_group.Input
              class_="text-lg caret-[#6e5ed2]"
              placeholder="Type a command or search..."
            />
            <Command.Input_group.Clear_button />
          </Command.Input_group>
          <Command.List>
            (command ~icon:<Gravity.Person /> ~keys:[| "A" |] "Assign to...")
            (command ~icon:<Gravity.Person /> ~keys:[| "I" |] "Assign to me")
            (command ~icon:<Gravity.Circle_dashed /> ~keys:[| "S" |]
               "Change status...")
            (command ~icon:<Gravity.Chart_bar /> ~keys:[| "P" |]
               "Change priority...")
            (command ~icon:<Gravity.Tag /> ~keys:[| "L" |] "Change labels...")
            (command ~icon:<Gravity.Trash_bin /> ~keys:[| {js|⇧|js}; "L" |]
               "Remove label...")
            (command ~icon:<Gravity.Clock /> ~keys:[| {js|⇧|js}; "D" |]
               "Set due date...")
          </Command.List>
        </Command.Dialog>
      </Command.Container>
    </Command.Backdrop>
  </Command>
```

### Split View

`Command.Context.use ()`, called in a component inside the dialog, gives the
focused command's key, read with `S.get`: here it picks the preview.

```ocaml title="command_split_view.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Avatar = Solidtype_heroui.Avatar
module Button = Solidtype_heroui.Button
module Chip = Solidtype_heroui.Chip
module Command = Solidtype_heroui.Command
module Input = Solidtype_heroui.Input
module Kbd = Solidtype_heroui.Kbd
module Label = Solidtype_heroui.Label
module Radio = Solidtype_heroui.Radio
module Radio_group = Solidtype_heroui.Radio_group
module Slider = Solidtype_heroui.Slider
module Switch = Solidtype_heroui.Switch
module Gravity = Solidtype_gravity_icons

let components =
  [|
    ("Button", "Trigger actions", fun () -> <Gravity.Square />);
    ("Input", "Retrieve user input", fun () -> <Gravity.Text />);
    ("Radio", "Single choice input", fun () -> <Gravity.Circle_fill />);
    ("Chip", "Annotate context", fun () -> <Gravity.Tag />);
    ("Slider", "Free range picker", fun () -> <Gravity.Sliders />);
    ("Avatar", "Illustrate the user", fun () -> <Gravity.Person_fill />);
    ("Switch", "Toggle a setting", fun () -> <Gravity.Toggle_on />);
  |]

(* The component the focused item names, drawn beside the list. *)
module Preview = struct
  let%component make () =
    let palette = Command.Context.use () in
    <div class_="flex flex-1 items-center justify-center rounded-lg p-4">
      (match S.get palette.focused_key with
      | Some "Input" ->
          <Input class_="w-48" placeholder="Your name" aria_label="Name" />
      | Some "Radio" ->
          <Radio_group default_value="a" aria_label="Plan">
            <Radio value="a">
              <Radio.Content>
                <Radio.Control><Radio.Indicator /></Radio.Control> "Basic"
              </Radio.Content>
            </Radio>
            <Radio value="b">
              <Radio.Content>
                <Radio.Control><Radio.Indicator /></Radio.Control> "Premium"
              </Radio.Content>
            </Radio>
          </Radio_group>
      | Some "Chip" -> <Chip color=`accent>"Chip"</Chip>
      | Some "Slider" ->
          <Slider class_="w-48" default_value=[| 40. |]>
            <Label>"Volume"</Label>
            <Slider.Track><Slider.Fill /> <Slider.Thumb /></Slider.Track>
          </Slider>
      | Some "Avatar" ->
          <Avatar><Avatar.Fallback>"JD"</Avatar.Fallback></Avatar>
      | Some "Switch" ->
          <Switch>
            <Switch.Content>
              <Switch.Control><Switch.Thumb /></Switch.Control>
              <Label>"Notifications"</Label>
            </Switch.Content>
          </Switch>
      | Some _ | None -> <Button>"Primary"</Button>)
    </div>
end

let make () =
  <Command>
    <Button variant=`outline>
      "Split View "
      <Kbd><Kbd.Abbr key_value=`command /> <Kbd.Content>"K"</Kbd.Content></Kbd>
    </Button>
    <Command.Backdrop>
      <Command.Container size=`lg>
        <Command.Dialog>
          <Command.Input_group>
            <Command.Input_group.Prefix>
              <Gravity.Magnifier class_="size-4" />
            </Command.Input_group.Prefix>
            <Command.Input_group.Input
              placeholder="Find components, packages, and interactions..."
            />
            <Command.Input_group.Clear_button />
          </Command.Input_group>
          <div class_="flex min-h-[308px]">
            <Command.List class_="w-2/5 flex-none">
              <Command.Group heading=(Jsx.string "Components")>
                <For each=components>
                  (fun (name, purpose, icon) _ ->
                    <Command.Item
                      id=name
                      text_value=name
                      class_="group rounded-xl data-[focused=true]:bg-blue-600 \
                              data-[focused=true]:text-white">
                      <div
                        class_="flex size-8 shrink-0 items-center \
                                justify-center rounded-lg bg-orange-500 \
                                [&_svg]:text-white">
                        (icon ())
                      </div>
                      <div class_="flex flex-col gap-0.5">
                        <span class_="text-sm font-medium">
                          (Jsx.string name)
                        </span>
                        <span
                          class_="text-xs text-muted \
                                  group-data-[focused=true]:text-white/70">
                          (Jsx.string purpose)
                        </span>
                      </div>
                    </Command.Item>)
                </For>
              </Command.Group>
            </Command.List>
            <div class_="w-px self-stretch bg-separator" />
            <Preview />
          </div>
        </Command.Dialog>
      </Command.Container>
    </Command.Backdrop>
  </Command>
```

### Multiple Search Terms

`filter` decides which commands are shown, given a command's text and the
search's: here every word typed must be in it.

```ocaml title="command_multiple_search_terms.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Chip = Solidtype_heroui.Chip
module Close_button = Solidtype_heroui.Close_button
module Command = Solidtype_heroui.Command
module Kbd = Solidtype_heroui.Kbd
module Gravity = Solidtype_gravity_icons

(* An item is shown while every word typed is in its text, in any order. *)
let every_term text typed =
  let text = String.lowercase_ascii text in
  String.split_on_char ' ' (String.lowercase_ascii typed)
  |> List.filter (fun term -> not (String.equal term ""))
  |> List.for_all (fun term ->
      let n = String.length term and m = String.length text in
      let rec from i =
        i + n <= m && (String.equal (String.sub text i n) term || from (i + 1))
      in
      from 0)

let make () =
  let scopes, set_scopes =
    S.create_signal [| "Projects"; "Tasks"; "People"; "Documents"; "Channels" |]
  in
  <Command>
    <Button variant=`outline>
      "Multiple Search Terms "
      <Kbd><Kbd.Abbr key_value=`command /> <Kbd.Content>"K"</Kbd.Content></Kbd>
    </Button>
    <Command.Backdrop>
      <Command.Container size=`lg>
        <Command.Dialog filter=every_term>
          <Command.Input_group>
            <Command.Input_group.Prefix>
              <Gravity.Magnifier class_="size-4" />
            </Command.Input_group.Prefix>
            <Command.Input_group.Input placeholder="Search or jump to" />
            <Command.Input_group.Clear_button />
            <Command.Input_group.Suffix>
              <Kbd class_="text-xs">
                <Kbd.Abbr key_value=`command /> <Kbd.Content>"K"</Kbd.Content>
              </Kbd>
            </Command.Input_group.Suffix>
          </Command.Input_group>
          <Command.Header class_="flex-col items-start gap-2 px-4">
            <div class_="flex flex-wrap gap-1.5">
              <For each=(S.get scopes)>
                (fun scope _ ->
                  <Chip size=`sm variant=`soft>
                    <Chip.Label>(Jsx.string scope)</Chip.Label>
                    <Close_button
                      aria_label=("Remove " ^ scope)
                      class_="-mr-px size-4 [&_svg]:size-3"
                      on_click=(fun _ ->
                                   S.update set_scopes
                                     (Js.Array.filter ~f:(fun s ->
                                          not (String.equal s scope))))
                    />
                  </Chip>)
              </For>
            </div>
          </Command.Header>
          <Command.List>
            <Command.Group heading=(Jsx.string "Smart Prompt Examples")>
              <Command.Item>
                <Gravity.Sparkles />
                <span>"Summarize this week's progress"</span>
              </Command.Item>
              <Command.Item>
                <Gravity.Sparkles /> <span>"Create a task for the team"</span>
              </Command.Item>
              <Command.Item>
                <Gravity.Sparkles /> <span>"Draft a project brief"</span>
              </Command.Item>
              <Command.Item>
                <Gravity.Sparkles /> <span>"Schedule a standup meeting"</span>
              </Command.Item>
            </Command.Group>
            <Command.Group
              heading=(<span class_="flex w-full items-center justify-between">
                         <span>"Results (4)"</span>
                         <button
                           type_=`button
                           class_="text-xs font-medium text-accent">
                           "See All"
                         </button>
                       </span>)>
              <Command.Item>
                <Gravity.Clock /> <span>"View recent activity"</span>
              </Command.Item>
              <Command.Item>
                <Gravity.File_text /> <span>"Open project roadmap"</span>
              </Command.Item>
              <Command.Item>
                <Gravity.Persons /> <span>"Browse team directory"</span>
              </Command.Item>
              <Command.Item>
                <Gravity.Gear /> <span>"Manage workspace settings"</span>
              </Command.Item>
            </Command.Group>
          </Command.List>
          <Command.Footer
            class_="h-10 justify-between [&_kbd]:h-5 [&_kbd]:text-xs">
            <div class_="flex items-center gap-3">
              <div class_="flex items-center gap-2">
                <div class_="flex items-center gap-0.5">
                  <Kbd><Kbd.Abbr key_value=`up /></Kbd>
                  <Kbd><Kbd.Abbr key_value=`down /></Kbd>
                </div>
                <span>"Navigate"</span>
              </div>
              <div class_="flex items-center gap-2">
                <Kbd><Kbd.Abbr key_value=`enter /></Kbd> <span>"Select"</span>
              </div>
            </div>
            <span class_="text-xs text-muted">
              "Not what you're looking for? Try the "
              <button type_=`button class_="font-medium text-accent">
                "Help Center"
              </button>
            </span>
          </Command.Footer>
        </Command.Dialog>
      </Command.Container>
    </Command.Backdrop>
  </Command>
```

### Sizes

```ocaml title="command_sizes.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Chip = Solidtype_heroui.Chip
module Command = Solidtype_heroui.Command
module Kbd = Solidtype_heroui.Kbd
module Gravity = Solidtype_gravity_icons

let sizes = [| (`sm, "sm"); (`md, "md"); (`lg, "lg") |]

let make () =
  <div class_="flex flex-wrap gap-2">
    <For each=sizes>
      (fun (size, name) _ ->
        <Command>
          <Button variant=`tertiary>"Size: " (Jsx.string name)</Button>
          <Command.Backdrop>
            <Command.Container size>
              <Command.Dialog>
                <Command.Header>
                  <Chip size=`sm variant=`secondary>"Home"</Chip>
                </Command.Header>
                <Command.Input_group>
                  <Command.Input_group.Prefix>
                    <Gravity.Magnifier class_="size-4" />
                  </Command.Input_group.Prefix>
                  <Command.Input_group.Input
                    placeholder="Type a command or search..."
                  />
                  <Command.Input_group.Clear_button />
                  <Command.Input_group.Suffix>
                    <Kbd class_="text-xs"><Kbd.Content>"Esc"</Kbd.Content></Kbd>
                  </Command.Input_group.Suffix>
                </Command.Input_group>
                <Command.List>
                  <Command.Group heading=(Jsx.string "Actions")>
                    <Command.Item>
                      <Gravity.File_plus /> <span>"Create new file..."</span>
                    </Command.Item>
                    <Command.Item>
                      <Gravity.Folder_plus />
                      <span>"Create new folder..."</span>
                    </Command.Item>
                    <Command.Item>
                      <Gravity.Person /> <span>"Assign to me"</span>
                    </Command.Item>
                  </Command.Group>
                  <Command.Group heading=(Jsx.string "Settings")>
                    <Command.Item>
                      <Gravity.Gear /> <span>"Preferences"</span>
                    </Command.Item>
                    <Command.Item>
                      <Gravity.Palette /> <span>"Change theme"</span>
                    </Command.Item>
                    <Command.Item>
                      <Gravity.Keyboard /> <span>"Keyboard shortcuts"</span>
                    </Command.Item>
                  </Command.Group>
                </Command.List>
                <Command.Footer
                  class_="justify-between [&_kbd]:h-5 [&_kbd]:text-xs">
                  <div class_="flex items-center gap-3">
                    <div class_="flex items-center gap-2">
                      <div class_="flex items-center gap-0.5">
                        <Kbd><Kbd.Abbr key_value=`up /></Kbd>
                        <Kbd><Kbd.Abbr key_value=`down /></Kbd>
                      </div>
                      <span>"Navigate"</span>
                    </div>
                    <div class_="flex items-center gap-2">
                      <Kbd><Kbd.Abbr key_value=`enter /></Kbd>
                      <span>"Select"</span>
                    </div>
                  </div>
                </Command.Footer>
              </Command.Dialog>
            </Command.Container>
          </Command.Backdrop>
        </Command>)
    </For>
  </div>
```

### Backdrop Variants

```ocaml title="command_backdrop_variants.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Chip = Solidtype_heroui.Chip
module Command = Solidtype_heroui.Command
module Kbd = Solidtype_heroui.Kbd
module Gravity = Solidtype_gravity_icons

let variants =
  [| (`transparent, "transparent"); (`opaque, "opaque"); (`blur, "blur") |]

let make () =
  <div class_="flex flex-wrap gap-2">
    <For each=variants>
      (fun (variant, name) _ ->
        <Command>
          <Button variant=`tertiary>(Jsx.string name)</Button>
          <Command.Backdrop variant>
            <Command.Container>
              <Command.Dialog>
                <Command.Header>
                  <Chip size=`sm variant=`secondary>"Home"</Chip>
                </Command.Header>
                <Command.Input_group>
                  <Command.Input_group.Prefix>
                    <Gravity.Magnifier class_="size-4" />
                  </Command.Input_group.Prefix>
                  <Command.Input_group.Input
                    placeholder="Type a command or search..."
                  />
                  <Command.Input_group.Clear_button />
                  <Command.Input_group.Suffix>
                    <Kbd class_="text-xs"><Kbd.Content>"Esc"</Kbd.Content></Kbd>
                  </Command.Input_group.Suffix>
                </Command.Input_group>
                <Command.List>
                  <Command.Group heading=(Jsx.string "Actions")>
                    <Command.Item>
                      <Gravity.File_plus /> <span>"Create new file..."</span>
                    </Command.Item>
                    <Command.Item>
                      <Gravity.Folder_plus />
                      <span>"Create new folder..."</span>
                    </Command.Item>
                    <Command.Item>
                      <Gravity.Person /> <span>"Assign to me"</span>
                    </Command.Item>
                  </Command.Group>
                  <Command.Group heading=(Jsx.string "Settings")>
                    <Command.Item>
                      <Gravity.Gear /> <span>"Preferences"</span>
                    </Command.Item>
                    <Command.Item>
                      <Gravity.Palette /> <span>"Change theme"</span>
                    </Command.Item>
                    <Command.Item>
                      <Gravity.Keyboard /> <span>"Keyboard shortcuts"</span>
                    </Command.Item>
                  </Command.Group>
                </Command.List>
                <Command.Footer
                  class_="justify-between [&_kbd]:h-5 [&_kbd]:text-xs">
                  <div class_="flex items-center gap-3">
                    <div class_="flex items-center gap-2">
                      <div class_="flex items-center gap-0.5">
                        <Kbd><Kbd.Abbr key_value=`up /></Kbd>
                        <Kbd><Kbd.Abbr key_value=`down /></Kbd>
                      </div>
                      <span>"Navigate"</span>
                    </div>
                    <div class_="flex items-center gap-2">
                      <Kbd><Kbd.Abbr key_value=`enter /></Kbd>
                      <span>"Select"</span>
                    </div>
                  </div>
                </Command.Footer>
              </Command.Dialog>
            </Command.Container>
          </Command.Backdrop>
        </Command>)
    </For>
  </div>
```

## Styling Reference

### CSS Classes

- `.command__backdrop`, and its variants `.command__backdrop--transparent`,
  `.command__backdrop--opaque`, `.command__backdrop--blur`
- `.command__container`
- `.command__dialog`, and its sizes `.command__dialog--sm`,
  `.command__dialog--md`, `.command__dialog--lg`
- `.command__header`
- `.command__input-group`, `.command__input-group-prefix`,
  `.command__input-group-input`, `.command__input-group-clear-button`,
  `.command__input-group-suffix`
- `.command__list`, `.command__empty`
- `.command__group`, `.command__group-heading`
- `.command__item`
- `.command__separator`
- `.command__footer`

### Interactive States

- **Entering**, **Exiting**: `[data-entering="true"]`, `[data-exiting="true"]`
  on `.command__backdrop` and `.command__container`
- **Focused**: `[data-focused="true"]` on `.command__item`, the command the keys
  or the pointer reached
- **Hovered**: `[data-hovered="true"]` on `.command__item`
- **Pressed**: `[data-pressed="true"]` on `.command__item`
- **Disabled**: `[data-disabled="true"]` on `.command__item`
- **Empty**: `[data-empty="true"]` on `.command__input-group` while the search
  is, which hides its clear button

## API Reference

Each prop beside its name in React's convention.

### Command

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `isOpen` | `is_open` | `bool` | | Whether it is open (controlled) |
| `defaultOpen` | `default_open` | `bool` | | Whether it is open at first (uncontrolled) |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Called as it opens and closes |
| `children` | `children` | elements | | Its trigger and its backdrop |

### Command.Backdrop

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `opaque \| `blur \| `transparent ] `` | `` `opaque `` | How it covers the page |
| `isDismissable` | `is_dismissable` | `bool` | `true` | Whether a press on it closes the palette |
| `isKeyboardDismissDisabled` | `is_keyboard_dismiss_disabled` | `bool` | `false` | Whether Escape in an empty search leaves it open |
| `isOpen` | `is_open` | `bool` | | Whether it is open, with no `Command` around it |
| `defaultOpen` | `default_open` | `bool` | | Whether it is open at first, with no `Command` around it |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Called as it opens and closes, with no `Command` around it |
| `UNSTABLE_portalContainer` | `portal_container` | element | | Where it is drawn, else the page's body |
| `className` | `class_` | `string` | | Added after its own classes |

### Command.Container

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | `` `md `` | The palette's width and greatest height |
| `className` | `class_` | `string` | | Added after its own classes |

### Command.Dialog

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `aria-label` | `aria_label` | `string` | `"Command palette"` | Its name |
| `inputValue` | `input_value` | `string` | | The search's text (controlled) |
| `defaultInputValue` | `default_input_value` | `string` | | The search's text at first (uncontrolled) |
| `onInputChange` | `on_input_change` | `string -> unit` | | Called with the search's text as it changes |
| `filter` | `filter` | `string -> string -> bool` | its text holds the search's, whatever the case or accents | Whether a command is shown, given its text and the search's |
| `className` | `class_` | `string` | | Added after its own classes |

### Command.Input_group

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `autoFocus` | `auto_focus` | `bool` | `true` | Whether its input takes the focus as the palette opens |
| `className` | `class_` | `string` | | Added after its own classes |

### Command.Input_group.Input

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `placeholder` | `placeholder` | `string` | `"Search commands..."` | Shown while the search is empty |
| `aria-label` | `aria_label` | `string` | `"Search commands"` | Its name |
| `className` | `class_` | `string` | | Added after its own classes |

### Command.Input_group.Clear_button

| React | solidtype | Type | Description |
|---|---|---|---|
| `onPress` | `on_click` | `Dom.mouseEvent -> unit` | Called as it is pressed, before it empties the search |
| `className` | `class_` | `string` | Added after its own classes |

### Command.List

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `onAction` | `on_action` | `string -> unit` | | Called with a command's key as it runs |
| `disabledKeys` | `disabled_keys` | `string array` | | The keys of the commands disabled |
| `renderEmptyState` | `render_empty_state` | `unit -> element` | | Drawn while no command is shown |
| `className` | `class_` | `string` | | Added after its own classes |

### Command.Group

| React | solidtype | Type | Description |
|---|---|---|---|
| `heading` | `heading` | element | Its name |
| `className` | `class_` | `string` | Added after its own classes |

### Command.Item

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `id` | `id` | `string` | | Its key |
| `textValue` | `text_value` | `string` | its text | What the search is matched against |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether it is disabled |
| `onAction` | `on_action` | `unit -> unit` | | Called as it runs |
| `className` | `class_` | `string` | | Added after its own classes |

### Other parts

`Command.Header`, `Command.Input_group.Prefix`, `Command.Input_group.Suffix`,
`Command.Separator` and `Command.Footer`.

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after its own classes |
