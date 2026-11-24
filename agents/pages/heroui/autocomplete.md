# Autocomplete

An autocomplete combines a select with filtering, allowing users to search and select from a list of options.

Original HeroUI documentation: [Autocomplete](https://heroui.com/en/docs/react/components/autocomplete).

## Usage

```ocaml title="autocomplete_usage.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group

let states =
  [|
    ("florida", "Florida");
    ("delaware", "Delaware");
    ("california", "California");
    ("texas", "Texas");
    ("new-york", "New York");
    ("washington", "Washington");
  |]

let name_of id =
  match Array.find_opt (fun (k, _) -> String.equal k id) states with
  | Some (_, name) -> name
  | None -> id

let make () =
  let chosen, set_chosen = S.create_signal [||] in
  let remove keys =
    S.set set_chosen
      (Js.Array.filter (S.get chosen) ~f:(fun k ->
           not (Array.exists (String.equal k) keys)))
  in
  <Autocomplete
    class_="w-[256px]"
    placeholder="Select states"
    selection_mode=`multiple
    value=(S.get chosen)
    on_change=(fun keys -> S.set set_chosen keys)>
    <Label>"States to Visit"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value>
        (fun value ->
          <Tag_group size=`sm on_remove=remove>
            <Tag_group.List>
              <For each=(S.get value.selected_keys)>
                (fun id _ ->
                  <Tag id text_value=(name_of id)>
                    (Jsx.string (name_of id))
                  </Tag>)
              </For>
            </Tag_group.List>
          </Tag_group>)
      </Autocomplete.Value>
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter>
        <Search_field
          aria_label="Search options" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                               <Empty_state>"No results found"</Empty_state>)
          selection_mode=`multiple>
          <For each=states>
            (fun (id, name) _ ->
              <List_box.Item id text_value=name>
                (Jsx.string name) <List_box.Item_indicator />
              </List_box.Item>)
          </For>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

## Parity

The same HeroUI Autocomplete twice, under the same props: in solidtype on
the left, in React on the right. Below them, every attribute of each button:
a marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

## Anatomy

```ocaml
<Autocomplete>
  <Label>...</Label>
  <Autocomplete.Trigger>
    <Autocomplete.Value />
    <Autocomplete.Clear_button />
    <Autocomplete.Indicator />
  </Autocomplete.Trigger>
  <Description>...</Description>
  <Autocomplete.Popover>
    <Autocomplete.Filter>
      <Search_field>
        <Search_field.Group>
          <Search_field.Search_icon />
          <Search_field.Input />
        </Search_field.Group>
      </Search_field>
      <List_box>
        <List_box.Item id="...">...</List_box.Item>
      </List_box>
    </Autocomplete.Filter>
  </Autocomplete.Popover>
</Autocomplete>
```

A `Label` inside it names its trigger, a `Description` describes it, and a
`Field_error` shows while it is invalid. The `Search_field` inside its
`Autocomplete.Filter` is its search, and the `List_box` beside it its list.

## Examples

### Variants

The Autocomplete component supports two visual variants:

- **`` `primary ``** (default) - Standard styling with shadow, suitable for
  most use cases
- **`` `secondary ``** - Lower emphasis variant without shadow, suitable for
  use in Surface components

```ocaml title="autocomplete_variants.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field

let items =
  [|
    ("option1", "Option 1");
    ("option2", "Option 2");
    ("option3", "Option 3");
    ("option4", "Option 4");
  |]

let variant ~label ~variant ~mode =
  let selected, set_selected = S.create_signal [||] in
  <Autocomplete
    class_="w-[256px]"
    placeholder=(match mode with
                | `single -> "Select one"
                | `multiple -> "Select options")
    selection_mode=mode
    value=(S.get selected)
    variant
    on_change=(S.set set_selected)>
    <Label>(Jsx.string label)</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value />
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter>
        <Search_field
          aria_label="Search options" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                               <Empty_state>"No results found"</Empty_state>)
          selection_mode=(mode :> List_box.selection_mode)>
          <Solidtype.For each=items>
            (fun (id, name) _ ->
              <List_box.Item id text_value=name>
                (Jsx.string name) <List_box.Item_indicator />
              </List_box.Item>)
          </Solidtype.For>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>

let make () =
  <div class_="flex flex-col gap-8">
    <div class_="flex flex-col gap-4">
      <h3 class_="text-lg font-semibold">"Single Select Variants"</h3>
      <div class_="flex flex-col gap-4">
        (variant ~label:"Primary variant" ~variant:`primary ~mode:`single)
        (variant ~label:"Secondary variant" ~variant:`secondary ~mode:`single)
      </div>
    </div>
    <div class_="flex flex-col gap-4">
      <h3 class_="text-lg font-semibold">"Multiple Select Variants"</h3>
      <div class_="flex flex-col gap-4">
        (variant ~label:"Primary variant" ~variant:`primary ~mode:`multiple)
        (variant ~label:"Secondary variant" ~variant:`secondary ~mode:`multiple)
      </div>
    </div>
  </div>
```

### Full Width

```ocaml title="autocomplete_full_width.mlx"
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field

let make () =
  <div class_="w-[400px] space-y-4">
    <Autocomplete full_width=true placeholder="Select one" variant=`secondary>
      <Label>"State"</Label>
      <Autocomplete.Trigger>
        <Autocomplete.Value />
        <Autocomplete.Clear_button />
        <Autocomplete.Indicator />
      </Autocomplete.Trigger>
      <Autocomplete.Popover>
        <Autocomplete.Filter>
          <Search_field
            aria_label="Search states" name="search" variant=`secondary>
            <Search_field.Group>
              <Search_field.Search_icon />
              <Search_field.Input placeholder="Search states..." />
              <Search_field.Clear_button />
            </Search_field.Group>
          </Search_field>
          <List_box
            render_empty_state=(fun _ ->
                                 <Empty_state>"No results found"</Empty_state>)>
            <List_box.Item id="florida" text_value="Florida">
              "Florida" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="delaware" text_value="Delaware">
              "Delaware" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="california" text_value="California">
              "California" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="texas" text_value="Texas">
              "Texas" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="new-york" text_value="New York">
              "New York" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="washington" text_value="Washington">
              "Washington" <List_box.Item_indicator />
            </List_box.Item>
          </List_box>
        </Autocomplete.Filter>
      </Autocomplete.Popover>
    </Autocomplete>
  </div>
```

### With Description

```ocaml title="autocomplete_with_description.mlx"
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field
module Description = Solidtype_heroui.Description

let make () =
  <Autocomplete class_="w-[256px]" placeholder="Select one">
    <Label>"State"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value />
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Description>"Select your state of residence"</Description>
    <Autocomplete.Popover>
      <Autocomplete.Filter>
        <Search_field
          aria_label="Search states" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search states..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                               <Empty_state>"No results found"</Empty_state>)>
          <List_box.Item id="florida" text_value="Florida">
            "Florida" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="delaware" text_value="Delaware">
            "Delaware" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="california" text_value="California">
            "California" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="texas" text_value="Texas">
            "Texas" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="new-york" text_value="New York">
            "New York" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="washington" text_value="Washington">
            "Washington" <List_box.Item_indicator />
          </List_box.Item>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

### Required

A `Form` does not check a required autocomplete itself: the example marks it
invalid once a submit finds it empty.

```ocaml title="autocomplete_required.mlx"
module S = Solidtype.Solid
module Autocomplete = Solidtype_heroui.Autocomplete
module Button = Solidtype_heroui.Button
module Empty_state = Solidtype_heroui.Empty_state
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]
external alert : string -> unit = "alert" [@@mel.scope "window"]

let make () =
  let state, set_state = S.create_signal [||] in
  (* A required autocomplete shows its error once a submit has been tried, as
     the browser's validation React Aria reads does. *)
  let tried, set_tried = S.create_signal false in
  let missing () = S.get tried && Array.length (S.get state) = 0 in
  <Form
    class_="flex w-[256px] flex-col gap-4"
    on_submit=(fun e ->
                prevent_default e;
                S.set set_tried true;
                if Array.length (S.get state) > 0 then
                  alert "Form submitted successfully!")>
    <Autocomplete
      is_required=true
      is_invalid=(missing ())
      class_="w-full"
      name="state"
      placeholder="Select one"
      on_change=(S.set set_state)>
      <Label>"State"</Label>
      <Autocomplete.Trigger>
        <Autocomplete.Value />
        <Autocomplete.Clear_button />
        <Autocomplete.Indicator />
      </Autocomplete.Trigger>
      <Autocomplete.Popover>
        <Autocomplete.Filter>
          <Search_field
            aria_label="Search states" name="search" variant=`secondary>
            <Search_field.Group>
              <Search_field.Search_icon />
              <Search_field.Input placeholder="Search states..." />
              <Search_field.Clear_button />
            </Search_field.Group>
          </Search_field>
          <List_box
            render_empty_state=(fun _ ->
                                 <Empty_state>"No results found"</Empty_state>)>
            <List_box.Item id="florida" text_value="Florida">
              "Florida" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="delaware" text_value="Delaware">
              "Delaware" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="california" text_value="California">
              "California" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="texas" text_value="Texas">
              "Texas" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="new-york" text_value="New York">
              "New York" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="washington" text_value="Washington">
              "Washington" <List_box.Item_indicator />
            </List_box.Item>
          </List_box>
        </Autocomplete.Filter>
      </Autocomplete.Popover>
      <Field_error>"Please select an item in the list."</Field_error>
    </Autocomplete>
    <Button type_=`submit>"Submit"</Button>
  </Form>
```

### Disabled

```ocaml title="autocomplete_disabled.mlx"
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field

let make () =
  <Autocomplete
    is_disabled=true
    class_="w-[256px]"
    default_value=[| "california" |]
    placeholder="Select one">
    <Label>"State"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value />
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter>
        <Search_field
          aria_label="Search states" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search states..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                               <Empty_state>"No results found"</Empty_state>)>
          <List_box.Item id="florida" text_value="Florida">
            "Florida" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="delaware" text_value="Delaware">
            "Delaware" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="california" text_value="California">
            "California" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="texas" text_value="Texas">
            "Texas" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="new-york" text_value="New York">
            "New York" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="washington" text_value="Washington">
            "Washington" <List_box.Item_indicator />
          </List_box.Item>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

### With Disabled Options

```ocaml title="autocomplete_with_disabled_options.mlx"
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field

let make () =
  <Autocomplete
    class_="w-[256px]"
    disabled_keys=[| "cat"; "kangaroo" |]
    placeholder="Select an animal">
    <Label>"Animal"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value />
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter>
        <Search_field
          aria_label="Search animals" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search animals..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                               <Empty_state>"No results found"</Empty_state>)>
          <List_box.Item id="dog" text_value="Dog">
            "Dog" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="cat" text_value="Cat">
            "Cat" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="bird" text_value="Bird">
            "Bird" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="kangaroo" text_value="Kangaroo">
            "Kangaroo" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="elephant" text_value="Elephant">
            "Elephant" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="tiger" text_value="Tiger">
            "Tiger" <List_box.Item_indicator />
          </List_box.Item>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

### Allows Empty Collection

`allows_empty_collection` lets the list open even when the search shows no
option, as when the list is empty at first or every option is filtered out.

```ocaml title="autocomplete_allows_empty_collection.mlx"
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field

let make () =
  <Autocomplete
    allows_empty_collection=true class_="w-[256px]" placeholder="Select one">
    <Label>"State"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value />
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter>
        <Search_field
          aria_label="Search states" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search states..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                                 <Empty_state>"No results found"</Empty_state>)
        />
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

### With Sections

```ocaml title="autocomplete_with_sections.mlx"
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field
module Header = Solidtype_heroui.Header
module Separator = Solidtype_heroui.Separator

let make () =
  <Autocomplete class_="w-[256px]" placeholder="Select a country">
    <Label>"Country"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value />
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter>
        <Search_field
          aria_label="Search countries" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search countries..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                               <Empty_state>"No results found"</Empty_state>)>
          <List_box.Section>
            <Header>"North America"</Header>
            <List_box.Item id="usa" text_value="United States">
              "United States" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="canada" text_value="Canada">
              "Canada" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="mexico" text_value="Mexico">
              "Mexico" <List_box.Item_indicator />
            </List_box.Item>
          </List_box.Section>
          <Separator />
          <List_box.Section>
            <Header>"Europe"</Header>
            <List_box.Item id="uk" text_value="United Kingdom">
              "United Kingdom" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="france" text_value="France">
              "France" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="germany" text_value="Germany">
              "Germany" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="spain" text_value="Spain">
              "Spain" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="italy" text_value="Italy">
              "Italy" <List_box.Item_indicator />
            </List_box.Item>
          </List_box.Section>
          <Separator />
          <List_box.Section>
            <Header>"Asia"</Header>
            <List_box.Item id="japan" text_value="Japan">
              "Japan" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="china" text_value="China">
              "China" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="india" text_value="India">
              "India" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="south-korea" text_value="South Korea">
              "South Korea" <List_box.Item_indicator />
            </List_box.Item>
          </List_box.Section>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

### Multiple Select

```ocaml title="autocomplete_multiple_select.mlx"
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field

let make () =
  <Autocomplete
    class_="w-[256px]" placeholder="Select states" selection_mode=`multiple>
    <Label>"States"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value />
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter>
        <Search_field
          aria_label="Search options" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                               <Empty_state>"No results found"</Empty_state>)
          selection_mode=`multiple>
          <List_box.Item id="florida" text_value="Florida">
            "Florida" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="delaware" text_value="Delaware">
            "Delaware" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="california" text_value="California">
            "California" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="texas" text_value="Texas">
            "Texas" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="new-york" text_value="New York">
            "New York" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="washington" text_value="Washington">
            "Washington" <List_box.Item_indicator />
          </List_box.Item>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

### Controlled

The ids chosen are `value`, an array, as a select's are.

```ocaml title="autocomplete_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field

let states =
  [|
    ("california", "California");
    ("texas", "Texas");
    ("florida", "Florida");
    ("new-york", "New York");
    ("illinois", "Illinois");
    ("pennsylvania", "Pennsylvania");
  |]

let make () =
  let state, set_state = S.create_signal [| "california" |] in
  let name () =
    match S.get state with
    | [| key |] -> (
        match Array.find_opt (fun (id, _) -> String.equal id key) states with
        | Some (_, name) -> name
        | None -> "None")
    | _ -> "None"
  in
  <div class_="space-y-4">
    <Autocomplete
      class_="w-[256px]"
      placeholder="Select a state"
      value=(S.get state)
      on_change=(S.set set_state)>
      <Label>"State (controlled)"</Label>
      <Autocomplete.Trigger>
        <Autocomplete.Value />
        <Autocomplete.Clear_button />
        <Autocomplete.Indicator />
      </Autocomplete.Trigger>
      <Autocomplete.Popover>
        <Autocomplete.Filter>
          <Search_field
            aria_label="Search states" name="search" variant=`secondary>
            <Search_field.Group>
              <Search_field.Search_icon />
              <Search_field.Input placeholder="Search states..." />
              <Search_field.Clear_button />
            </Search_field.Group>
          </Search_field>
          <List_box
            render_empty_state=(fun _ ->
                                 <Empty_state>"No results found"</Empty_state>)>
            <Solidtype.For each=states>
              (fun (id, name) _ ->
                <List_box.Item id text_value=name>
                  (Jsx.string name) <List_box.Item_indicator />
                </List_box.Item>)
            </Solidtype.For>
          </List_box>
        </Autocomplete.Filter>
      </Autocomplete.Popover>
    </Autocomplete>
    <p class_="text-sm text-muted">(Jsx.string ("Selected: " ^ name ()))</p>
  </div>
```

### Controlled Multiple

```ocaml title="autocomplete_controlled_multiple.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field

let states =
  [|
    ("california", "California");
    ("texas", "Texas");
    ("florida", "Florida");
    ("new-york", "New York");
    ("illinois", "Illinois");
    ("pennsylvania", "Pennsylvania");
  |]

let make () =
  let selected, set_selected = S.create_signal [| "california"; "texas" |] in
  let names () =
    S.get selected |> Array.to_list
    |> List.filter_map (fun key ->
        Option.map snd
          (Array.find_opt (fun (id, _) -> String.equal id key) states))
  in
  <div class_="space-y-4">
    <Autocomplete
      class_="w-[256px]"
      placeholder="Select states"
      selection_mode=`multiple
      value=(S.get selected)
      on_change=(S.set set_selected)>
      <Label>"States (controlled multiple)"</Label>
      <Autocomplete.Trigger>
        <Autocomplete.Value />
        <Autocomplete.Clear_button />
        <Autocomplete.Indicator />
      </Autocomplete.Trigger>
      <Autocomplete.Popover>
        <Autocomplete.Filter>
          <Search_field
            aria_label="Search states" name="search" variant=`secondary>
            <Search_field.Group>
              <Search_field.Search_icon />
              <Search_field.Input placeholder="Search states..." />
              <Search_field.Clear_button />
            </Search_field.Group>
          </Search_field>
          <List_box
            render_empty_state=(fun _ ->
                                 <Empty_state>"No results found"</Empty_state>)
            selection_mode=`multiple>
            <Solidtype.For each=states>
              (fun (id, name) _ ->
                <List_box.Item id text_value=name>
                  (Jsx.string name) <List_box.Item_indicator />
                </List_box.Item>)
            </Solidtype.For>
          </List_box>
        </Autocomplete.Filter>
      </Autocomplete.Popover>
    </Autocomplete>
    <p class_="text-sm text-muted">
      (Jsx.string
         ("Selected: "
         ^
         match names () with
         | [] -> "None"
         | names -> String.concat ", " names))
    </p>
  </div>
```

### Controlled Open State

```ocaml title="autocomplete_controlled_open_state.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Autocomplete = Solidtype_heroui.Autocomplete
module Button = Solidtype_heroui.Button
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field

let states =
  [|
    ("florida", "Florida");
    ("delaware", "Delaware");
    ("california", "California");
    ("texas", "Texas");
    ("new-york", "New York");
    ("washington", "Washington");
  |]

let make () =
  let is_open, set_open = S.create_signal false in
  <div class_="space-y-4">
    <Autocomplete
      class_="w-[256px]"
      is_open=(S.get is_open)
      placeholder="Select one"
      on_open_change=(S.set set_open)>
      <Label>"State"</Label>
      <Autocomplete.Trigger>
        <Autocomplete.Value />
        <Autocomplete.Clear_button />
        <Autocomplete.Indicator />
      </Autocomplete.Trigger>
      <Autocomplete.Popover>
        <Autocomplete.Filter>
          <Search_field
            aria_label="Search states" name="search" variant=`secondary>
            <Search_field.Group>
              <Search_field.Search_icon />
              <Search_field.Input placeholder="Search states..." />
              <Search_field.Clear_button />
            </Search_field.Group>
          </Search_field>
          <List_box
            render_empty_state=(fun _ ->
                                 <Empty_state>"No results found"</Empty_state>)>
            <Solidtype.For each=states>
              (fun (id, name) _ ->
                <List_box.Item id text_value=name>
                  (Jsx.string name) <List_box.Item_indicator />
                </List_box.Item>)
            </Solidtype.For>
          </List_box>
        </Autocomplete.Filter>
      </Autocomplete.Popover>
    </Autocomplete>
    <Button on_click=(fun _ -> S.set set_open (not (S.get is_open)))>
      (Jsx.string
         ((if S.get is_open then "Close" else "Open") ^ " Autocomplete"))
    </Button>
    <p class_="text-sm text-muted">
      (Jsx.string
         ("Autocomplete is " ^ if S.get is_open then "open" else "closed"))
    </p>
  </div>
```

### Asynchronous Filtering

HeroUI's example searches a server for each text typed; here the same names
are searched after the same wait. The filter's `input_value` and
`on_input_change` hold the search's text.

```ocaml title="autocomplete_asynchronous_filtering.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field

(* The first two pages of https://swapi.py4e.com/api/people/, which HeroUI's
   example searches, here searched after the same wait. *)
let characters =
  [|
    "Luke Skywalker";
    "C-3PO";
    "R2-D2";
    "Darth Vader";
    "Leia Organa";
    "Owen Lars";
    "Beru Whitesun lars";
    "R5-D4";
    "Biggs Darklighter";
    "Obi-Wan Kenobi";
    "Anakin Skywalker";
    "Wilhuff Tarkin";
    "Chewbacca";
    "Han Solo";
    "Greedo";
    "Jabba Desilijic Tiure";
    "Wedge Antilles";
    "Jek Tono Porkins";
    "Yoda";
    "Palpatine";
  |]

(* How long the fetch it stands in for takes. *)
let load_ms = 400

(* Whether [part] is in [name], whatever their case, as the search finds it. *)
let holds ~part name =
  let name = String.lowercase_ascii name
  and part = String.lowercase_ascii part in
  let n = String.length part in
  let rec from i =
    i + n <= String.length name
    && (String.equal (String.sub name i n) part || from (i + 1))
  in
  from 0

let make () =
  let filter_text, set_filter_text = S.create_signal "" in
  let found, set_found = S.create_signal characters in
  let search text =
    S.set set_filter_text text;
    let timer =
      Js.Global.setTimeout
        ~f:(fun () ->
          S.set set_found
            (Array.of_list
               (List.filter
                  (fun name -> holds ~part:text name)
                  (Array.to_list characters))))
        load_ms
    in
    S.on_cleanup (fun () -> Js.Global.clearTimeout timer)
  in
  <Autocomplete
    allows_empty_collection=true class_="w-[256px]" placeholder="Search...">
    <Label>"Search a Star Wars characters"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value />
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter
        input_value=(S.get filter_text) on_input_change=search>
        <Search_field
          aria_label="Search characters" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search characters..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          class_="max-h-[420px] overflow-y-auto"
          render_empty_state=(fun _ ->
                               <Empty_state>"No results found"</Empty_state>)>
          <Solidtype.For each=(S.get found)>
            (fun name _ ->
              <List_box.Item id=name text_value=name>
                (Jsx.string name) <List_box.Item_indicator />
              </List_box.Item>)
          </Solidtype.For>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

### Custom Indicator

```ocaml title="autocomplete_custom_indicator.mlx"
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Autocomplete class_="w-[256px]" placeholder="Select one">
    <Label>"State"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value />
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator class_="size-3">
        <Gravity.Chevrons_expand_vertical />
      </Autocomplete.Indicator>
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter>
        <Search_field
          aria_label="Search states" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search states..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                               <Empty_state>"No results found"</Empty_state>)>
          <List_box.Item id="florida" text_value="Florida">
            "Florida" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="delaware" text_value="Delaware">
            "Delaware" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="california" text_value="California">
            "California" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="texas" text_value="Texas">
            "Texas" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="new-york" text_value="New York">
            "New York" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="washington" text_value="Washington">
            "Washington" <List_box.Item_indicator />
          </List_box.Item>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

### Custom Value

`Autocomplete.Value`'s children are a function of the ids chosen, drawn
while one is; the autocomplete draws its placeholder while none is.

```ocaml title="autocomplete_custom_value.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Autocomplete = Solidtype_heroui.Autocomplete
module Description = Solidtype_heroui.Description
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field

type currency = { code : string; id : string; name : string; symbol : string }

let currencies =
  [|
    { code = "USD"; id = "usd"; name = "US Dollar"; symbol = "$" };
    { code = "EUR"; id = "eur"; name = "Euro"; symbol = {js|€|js} };
    { code = "GBP"; id = "gbp"; name = "British Pound"; symbol = {js|£|js} };
    { code = "JPY"; id = "jpy"; name = "Japanese Yen"; symbol = {js|¥|js} };
    { code = "CHF"; id = "chf"; name = "Swiss Franc"; symbol = {js|₣|js} };
  |]

let make () =
  <Autocomplete
    class_="w-[256px]" default_value=[| "usd" |] placeholder="Select a currency">
    <Label>"Currency"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value>
        (fun s ->
          <span class_="contents">
            (match S.get s.selected_keys with
            | [| key |] -> (
                match
                  Array.find_opt (fun c -> String.equal c.id key) currencies
                with
                | Some c ->
                    <span class_="flex min-w-0 items-center gap-1.5">
                      <span class_="font-medium">(Jsx.string c.symbol)</span>
                      <span>(Jsx.string c.code)</span>
                      <span class_="truncate text-muted">
                        (Jsx.string c.name)
                      </span>
                    </span>
                | None -> Jsx.nothing)
            | _ -> Jsx.nothing)
          </span>)
      </Autocomplete.Value>
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter>
        <Search_field
          aria_label="Search currencies" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search currencies..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                               <Empty_state>"No results found"</Empty_state>)>
          <Solidtype.For each=currencies>
            (fun c _ ->
              <List_box.Item id=c.id text_value=(c.code ^ " " ^ c.name)>
                <div class_="flex flex-col">
                  <Label>(Jsx.string c.code)</Label>
                  <Description>(Jsx.string c.name)</Description>
                </div>
                <List_box.Item_indicator />
              </List_box.Item>)
          </Solidtype.For>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

### In Surface

Inside a [`Surface`](surface.md), use `` variant=`secondary ``
for the lower emphasis variant suitable for surface backgrounds.

```ocaml title="autocomplete_in_surface.mlx"
module S = Solidtype.Solid
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field
module Surface = Solidtype_heroui.Surface

let make () =
  let selected, set_selected = S.create_signal [||] in
  <Surface class_="w-[320px] rounded-3xl p-6">
    <Autocomplete
      class_="w-full"
      placeholder="Select one"
      value=(S.get selected)
      variant=`secondary
      on_change=(S.set set_selected)>
      <Label>"State"</Label>
      <Autocomplete.Trigger>
        <Autocomplete.Value />
        <Autocomplete.Clear_button />
        <Autocomplete.Indicator />
      </Autocomplete.Trigger>
      <Autocomplete.Popover>
        <Autocomplete.Filter>
          <Search_field
            aria_label="Search states" name="search" variant=`secondary>
            <Search_field.Group>
              <Search_field.Search_icon />
              <Search_field.Input placeholder="Search states..." />
              <Search_field.Clear_button />
            </Search_field.Group>
          </Search_field>
          <List_box
            render_empty_state=(fun _ ->
                                 <Empty_state>"No results found"</Empty_state>)>
            <List_box.Item id="florida" text_value="Florida">
              "Florida" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="delaware" text_value="Delaware">
              "Delaware" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="california" text_value="California">
              "California" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="texas" text_value="Texas">
              "Texas" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="new-york" text_value="New York">
              "New York" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="washington" text_value="Washington">
              "Washington" <List_box.Item_indicator />
            </List_box.Item>
          </List_box>
        </Autocomplete.Filter>
      </Autocomplete.Popover>
    </Autocomplete>
  </Surface>
```

### Virtualization

Autocomplete supports virtualization through a
[`Virtualizer`](list-box.md#virtualizer) around its list,
drawing only the options in view of the popover. The option the keys move to
is scrolled into view.

```ocaml title="autocomplete_virtualization.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Autocomplete = Solidtype_heroui.Autocomplete
module Description = Solidtype_heroui.Description
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field
module Virtualizer = Solidtype_heroui.Virtualizer
module Users = List_box_virtualization

(* Whether [part] is in [text], whatever their case, as the search finds it. *)
let holds ~part text =
  let text = String.lowercase_ascii text
  and part = String.lowercase_ascii part in
  let n = String.length part in
  let rec from i =
    i + n <= String.length text
    && (String.equal (String.sub text i n) part || from (i + 1))
  in
  from 0

let make () =
  let selected, set_selected = S.create_signal [||] in
  let search, set_search = S.create_signal "" in
  let all_users = Users.generate_users 1000 in
  let found () =
    let part = S.get search in
    if String.equal part "" then all_users
    else
      Js.Array.filter all_users ~f:(fun (u : Users.user) ->
          holds ~part u.name || holds ~part u.email)
  in
  <Autocomplete
    allows_empty_collection=true
    class_="w-[300px]"
    placeholder="Select a user"
    value=(S.get selected)
    on_change=(S.set set_selected)>
    <Label>"User"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value />
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter
        input_value=(S.get search) on_input_change=(S.set set_search)>
        <Search_field
          aria_label="Search users"
          class_="sticky top-0 z-10"
          name="search"
          variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search users..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <Virtualizer layout=(Virtualizer.list_layout ~row_size:50. ())>
          <List_box
            render_empty_state=(fun _ ->
                                 <Empty_state>"No results found"</Empty_state>)>
            <Solidtype.For each=(found ())>
              (fun (user : Users.user) _ ->
                <List_box.Item id=user.id text_value=user.name>
                  <div class_="flex flex-col">
                    <Label>(Jsx.string user.name)</Label>
                    <Description>(Jsx.string user.email)</Description>
                  </div>
                  <List_box.Item_indicator />
                </List_box.Item>)
            </Solidtype.For>
          </List_box>
        </Virtualizer>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

## Advanced Examples

### User Selection

```ocaml title="autocomplete_user_selection.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Avatar = Solidtype_heroui.Avatar
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Search_field = Solidtype_heroui.Search_field

type user = {
  avatar_url : string;
  email : string;
  fallback : string;
  id : string;
  name : string;
}

let users =
  [|
    {
      avatar_url =
        "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg";
      email = "bob@heroui.com";
      fallback = "B";
      id = "1";
      name = "Bob";
    };
    {
      avatar_url =
        "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg";
      email = "fred@heroui.com";
      fallback = "F";
      id = "2";
      name = "Fred";
    };
    {
      avatar_url =
        "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg";
      email = "martha@heroui.com";
      fallback = "M";
      id = "3";
      name = "Martha";
    };
    {
      avatar_url =
        "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/red.jpg";
      email = "john@heroui.com";
      fallback = "J";
      id = "4";
      name = "John";
    };
    {
      avatar_url =
        "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/orange.jpg";
      email = "jane@heroui.com";
      fallback = "J";
      id = "5";
      name = "Jane";
    };
  |]

let make () =
  <Autocomplete class_="w-[256px]" placeholder="Select a user">
    <Label>"User"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value>
        (fun s ->
          <span class_="contents">
            (match S.get s.selected_keys with
            | [| key |] -> (
                match
                  Array.find_opt
                    (fun (user : user) -> String.equal user.id key)
                    users
                with
                | Some user ->
                    <div class_="flex items-center gap-2">
                      <Avatar class_="size-4" size=`sm>
                        <Avatar.Image src=user.avatar_url />
                        <Avatar.Fallback>
                          (Jsx.string user.fallback)
                        </Avatar.Fallback>
                      </Avatar>
                      <span>(Jsx.string user.name)</span>
                    </div>
                | None -> Jsx.nothing)
            | keys ->
                Jsx.string
                  (string_of_int (Array.length keys) ^ " users selected"))
          </span>)
      </Autocomplete.Value>
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter>
        <Search_field
          aria_label="Search users" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search users..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                               <Empty_state>"No results found"</Empty_state>)>
          <Solidtype.For each=users>
            (fun (user : user) _ ->
              <List_box.Item id=user.id text_value=user.name>
                <Avatar size=`sm>
                  <Avatar.Image src=user.avatar_url />
                  <Avatar.Fallback>(Jsx.string user.fallback)</Avatar.Fallback>
                </Avatar>
                <div class_="flex flex-col">
                  <Label>(Jsx.string user.name)</Label>
                  <Description>(Jsx.string user.email)</Description>
                </div>
                <List_box.Item_indicator />
              </List_box.Item>)
          </Solidtype.For>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

### User Selection Multiple

```ocaml title="autocomplete_user_selection_multiple.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Avatar = Solidtype_heroui.Avatar
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Search_field = Solidtype_heroui.Search_field
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group

type user = {
  avatar_url : string;
  email : string;
  fallback : string;
  id : string;
  name : string;
}

let users =
  [|
    {
      avatar_url =
        "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg";
      email = "bob@heroui.com";
      fallback = "B";
      id = "1";
      name = "Bob";
    };
    {
      avatar_url =
        "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg";
      email = "fred@heroui.com";
      fallback = "F";
      id = "2";
      name = "Fred";
    };
    {
      avatar_url =
        "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg";
      email = "martha@heroui.com";
      fallback = "M";
      id = "3";
      name = "Martha";
    };
    {
      avatar_url =
        "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/red.jpg";
      email = "john@heroui.com";
      fallback = "J";
      id = "4";
      name = "John";
    };
    {
      avatar_url =
        "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/orange.jpg";
      email = "jane@heroui.com";
      fallback = "J";
      id = "5";
      name = "Jane";
    };
  |]

let make () =
  let chosen, set_chosen = S.create_signal [||] in
  let remove keys =
    S.set set_chosen
      (Js.Array.filter (S.get chosen) ~f:(fun k ->
           not (Array.exists (String.equal k) keys)))
  in
  let user_of id =
    Array.find_opt (fun (u : user) -> String.equal u.id id) users
  in
  <Autocomplete
    class_="w-[256px]"
    placeholder="Select your teammates"
    selection_mode=`multiple
    value=(S.get chosen)
    on_change=(fun keys -> S.set set_chosen keys)>
    <Label>"Users"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value>
        (fun value ->
          <Tag_group size=`sm on_remove=remove>
            <Tag_group.List>
              <Solidtype.For each=(S.get value.selected_keys)>
                (fun id _ ->
                  match user_of id with
                  | Some user ->
                      <Tag id text_value=user.name>
                        <Avatar class_="size-4" size=`sm>
                          <Avatar.Image src=user.avatar_url />
                          <Avatar.Fallback>
                            (Jsx.string user.fallback)
                          </Avatar.Fallback>
                        </Avatar>
                        <span>(Jsx.string user.name)</span>
                      </Tag>
                  | None -> Jsx.nothing)
              </Solidtype.For>
            </Tag_group.List>
          </Tag_group>)
      </Autocomplete.Value>
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter>
        <Search_field
          aria_label="Search users" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search users..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                               <Empty_state>"No results found"</Empty_state>)
          selection_mode=`multiple>
          <Solidtype.For each=users>
            (fun (user : user) _ ->
              <List_box.Item id=user.id text_value=user.name>
                <Avatar size=`sm>
                  <Avatar.Image src=user.avatar_url />
                  <Avatar.Fallback>(Jsx.string user.fallback)</Avatar.Fallback>
                </Avatar>
                <div class_="flex flex-col">
                  <Label>(Jsx.string user.name)</Label>
                  <Description>(Jsx.string user.email)</Description>
                </div>
                <List_box.Item_indicator />
              </List_box.Item>)
          </Solidtype.For>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

### Location Search

```ocaml title="autocomplete_location_search.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Autocomplete = Solidtype_heroui.Autocomplete
module Description = Solidtype_heroui.Description
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field

type city = { name : string; country : string }

let cities =
  [|
    { country = "USA"; name = "New York" };
    { country = "USA"; name = "Los Angeles" };
    { country = "USA"; name = "Chicago" };
    { country = "UK"; name = "London" };
    { country = "France"; name = "Paris" };
    { country = "Japan"; name = "Tokyo" };
    { country = "Australia"; name = "Sydney" };
    { country = "Canada"; name = "Toronto" };
    { country = "Germany"; name = "Berlin" };
    { country = "Spain"; name = "Madrid" };
  |]

(* How long the search it stands in for takes. *)
let search_ms = 300

(* Whether [part] is in [text], whatever their case. *)
let holds ~part text =
  let text = String.lowercase_ascii text
  and part = String.lowercase_ascii part in
  let n = String.length part in
  let rec from i =
    i + n <= String.length text
    && (String.equal (String.sub text i n) part || from (i + 1))
  in
  from 0

let make () =
  let selected, set_selected = S.create_signal [||] in
  let loading, set_loading = S.create_signal false in
  (* HeroUI's example stands in for a search that takes a while. *)
  let filter text typed =
    String.equal typed ""
    ||
    (S.set set_loading true;
     let (_ : Js.Global.timeoutId) =
       Js.Global.setTimeout ~f:(fun () -> S.set set_loading false) search_ms
     in
     holds ~part:typed text)
  in
  <Autocomplete
    class_="w-[256px]"
    placeholder="Search for a city"
    value=(S.get selected)
    on_change=(S.set set_selected)>
    <Label>"City"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value />
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter filter>
        <Search_field
          aria_label="Search cities" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search cities..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                               <Empty_state>
                                 (Jsx.string
                                    (if S.get loading then "Searching..."
                                     else "No cities found"))
                               </Empty_state>)>
          <Solidtype.For each=cities>
            (fun city _ ->
              <List_box.Item id=city.name text_value=city.name>
                <div class_="flex flex-col">
                  <Label>(Jsx.string city.name)</Label>
                  <Description>(Jsx.string city.country)</Description>
                </div>
                <List_box.Item_indicator />
              </List_box.Item>)
          </Solidtype.For>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

### Tag Group Selection

```ocaml title="autocomplete_tag_group_selection.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Autocomplete = Solidtype_heroui.Autocomplete
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group

let tags =
  [|
    ("react", "React");
    ("typescript", "TypeScript");
    ("javascript", "JavaScript");
    ("nodejs", "Node.js");
    ("python", "Python");
    ("vue", "Vue");
    ("angular", "Angular");
    ("nextjs", "Next.js");
  |]

let name_of id =
  match Array.find_opt (fun (k, _) -> String.equal k id) tags with
  | Some (_, name) -> name
  | None -> id

let make () =
  let chosen, set_chosen = S.create_signal [||] in
  let remove keys =
    S.set set_chosen
      (Js.Array.filter (S.get chosen) ~f:(fun k ->
           not (Array.exists (String.equal k) keys)))
  in
  <Autocomplete
    class_="w-[256px]"
    placeholder="Select tags"
    selection_mode=`multiple
    value=(S.get chosen)
    on_change=(fun keys -> S.set set_chosen keys)>
    <Label>"Tags"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value>
        (fun value ->
          <Tag_group size=`sm on_remove=remove>
            <Tag_group.List>
              <For each=(S.get value.selected_keys)>
                (fun id _ ->
                  <Tag id text_value=(name_of id)>
                    (Jsx.string (name_of id))
                  </Tag>)
              </For>
            </Tag_group.List>
          </Tag_group>)
      </Autocomplete.Value>
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter>
        <Search_field aria_label="Search tags" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search tags..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                               <Empty_state>"No tags found"</Empty_state>)
          selection_mode=`multiple>
          <For each=tags>
            (fun (id, name) _ ->
              <List_box.Item id text_value=name>
                (Jsx.string name) <List_box.Item_indicator />
              </List_box.Item>)
          </For>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

### Email Recipients

```ocaml title="autocomplete_email_recipients.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Autocomplete = Solidtype_heroui.Autocomplete
module Description = Solidtype_heroui.Description
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group

let people =
  [|
    ("alice@example.com", "Alice Johnson");
    ("bob@example.com", "Bob Smith");
    ("charlie@example.com", "Charlie Brown");
    ("diana@example.com", "Diana Prince");
    ("eve@example.com", "Eve Wilson");
  |]

let make () =
  let chosen, set_chosen = S.create_signal [||] in
  let remove keys =
    S.set set_chosen
      (Js.Array.filter (S.get chosen) ~f:(fun k ->
           not (Array.exists (String.equal k) keys)))
  in
  <Autocomplete
    class_="w-[256px]"
    placeholder="Add recipients"
    selection_mode=`multiple
    value=(S.get chosen)
    on_change=(fun keys -> S.set set_chosen keys)>
    <Label>"To"</Label>
    <Autocomplete.Trigger>
      <Autocomplete.Value>
        (fun value ->
          <Tag_group size=`sm on_remove=remove>
            <Tag_group.List>
              <For each=(S.get value.selected_keys)>
                (fun email _ ->
                  <Tag id=email text_value=email>(Jsx.string email)</Tag>)
              </For>
            </Tag_group.List>
          </Tag_group>)
      </Autocomplete.Value>
      <Autocomplete.Clear_button />
      <Autocomplete.Indicator />
    </Autocomplete.Trigger>
    <Autocomplete.Popover>
      <Autocomplete.Filter>
        <Search_field
          aria_label="Search emails" name="search" variant=`secondary>
          <Search_field.Group>
            <Search_field.Search_icon />
            <Search_field.Input placeholder="Search emails..." />
            <Search_field.Clear_button />
          </Search_field.Group>
        </Search_field>
        <List_box
          render_empty_state=(fun _ ->
                               <Empty_state>"No recipients found"</Empty_state>)
          selection_mode=`multiple>
          <For each=people>
            (fun (email, name) _ ->
              <List_box.Item id=email text_value=email>
                <div class_="flex flex-col">
                  <Label>(Jsx.string name)</Label>
                  <Description>(Jsx.string email)</Description>
                </div>
                <List_box.Item_indicator />
              </List_box.Item>)
          </For>
        </List_box>
      </Autocomplete.Filter>
    </Autocomplete.Popover>
  </Autocomplete>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes on every part.

```ocaml title="autocomplete_custom_styles.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Autocomplete = Solidtype_heroui.Autocomplete
module Description = Solidtype_heroui.Description
module Empty_state = Solidtype_heroui.Empty_state
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Search_field = Solidtype_heroui.Search_field
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group

let teammates =
  [|
    ("sarah", "Sarah Chen", "Product Design");
    ("marcus", "Marcus Lee", "Engineering");
    ("priya", "Priya Patel", "Data Science");
    ("jordan", "Jordan Kim", "Customer Success");
    ("alex", "Alex Rivera", "Marketing");
  |]

let name_of id =
  match Array.find_opt (fun (k, _, _) -> String.equal k id) teammates with
  | Some (_, name, _) -> name
  | None -> id

let make () =
  let chosen, set_chosen = S.create_signal [||] in
  let remove keys =
    S.set set_chosen
      (Js.Array.filter (S.get chosen) ~f:(fun k ->
           not (Array.exists (String.equal k) keys)))
  in
  <div class_="w-full max-w-sm pt-6">
    <Autocomplete
      class_="w-full gap-1.5"
      placeholder="Search teammates..."
      selection_mode=`multiple
      value=(S.get chosen)
      on_change=(fun keys -> S.set set_chosen keys)>
      <Label class_="font-medium text-foreground">"Assignees"</Label>
      <Description>
        "People who will be notified when this task updates."
      </Description>
      <Autocomplete.Trigger
        class_="rounded-xl border border-border/80 bg-surface shadow-sm ring-1 \
                ring-accent/5 transition-[box-shadow,border-color] \
                focus-within:border-accent/25 focus-within:ring-2 \
                focus-within:ring-accent/15 dark:border-border/90 \
                dark:bg-surface dark:ring-accent/10 \
                dark:focus-within:border-accent/35">
        <Autocomplete.Value>
          (fun value ->
            <Tag_group size=`sm on_remove=remove>
              <Tag_group.List>
                <For each=(S.get value.selected_keys)>
                  (fun id _ ->
                    <Tag
                      id
                      text_value=(name_of id)
                      class_="border border-accent/15 bg-accent/8 \
                              text-foreground dark:border-accent/25 \
                              dark:bg-accent/12">
                      (Jsx.string (name_of id))
                    </Tag>)
                </For>
              </Tag_group.List>
            </Tag_group>)
        </Autocomplete.Value>
        <Autocomplete.Clear_button />
        <Autocomplete.Indicator />
      </Autocomplete.Trigger>
      <Autocomplete.Popover
        class_="overflow-hidden rounded-xl border border-border/80 bg-surface \
                shadow-xl ring-1 ring-black/3 dark:border-border/90 \
                dark:bg-surface dark:ring-white/5">
        <Autocomplete.Filter>
          <Search_field
            aria_label="Search by name or role" name="search" variant=`secondary>
            <Search_field.Group
              class_="border-b border-separator bg-surface-secondary/50">
              <Search_field.Search_icon class_="text-muted" />
              <Search_field.Input placeholder="Search by name or role..." />
              <Search_field.Clear_button />
            </Search_field.Group>
          </Search_field>
          <List_box
            class_="p-1.5"
            render_empty_state=(fun _ ->
                                 <Empty_state>"No teammates found"</Empty_state>)
            selection_mode=`multiple>
            <For each=teammates>
              (fun (id, name, role) _ ->
                <List_box.Item
                  id
                  text_value=(name ^ " " ^ role)
                  class_="rounded-lg data-[focused=true]:bg-accent/10 \
                          data-[selected=true]:bg-accent/5 \
                          dark:data-[focused=true]:bg-accent/15 \
                          dark:data-[selected=true]:bg-accent/8">
                  <div class_="flex flex-col gap-0.5">
                    <span class_="text-sm font-medium text-foreground">
                      (Jsx.string name)
                    </span>
                    <span class_="text-xs text-muted">(Jsx.string role)</span>
                  </div>
                  <List_box.Item_indicator />
                </List_box.Item>)
            </For>
          </List_box>
        </Autocomplete.Filter>
      </Autocomplete.Popover>
    </Autocomplete>
  </div>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every one, as with
HeroUI in React:

```css
@layer components {
  .autocomplete__trigger {
    @apply rounded-lg border border-border bg-surface;
  }

  .autocomplete__popover {
    @apply rounded-xl;
  }
}
```

## Styling Reference

### CSS Classes

- `.autocomplete` - Base autocomplete container
- `.autocomplete__trigger` - The button that triggers the autocomplete
- `.autocomplete__value` - The displayed value or placeholder
- `.autocomplete__clear-button` - The clear button that removes the selected
  value
- `.autocomplete__indicator` - The dropdown indicator icon
- `.autocomplete__popover` - The popover container
- `.autocomplete--primary` - Primary variant with shadow (default)
- `.autocomplete--secondary` - Secondary variant without shadow, suitable for
  use in surfaces
- `.autocomplete--full-width` - Full width modifier

### Interactive States

- **Open**: `[data-open="true"]` on the autocomplete and its indicator
- **Focus**: `[data-focused="true"]` on the autocomplete while its button has
  the focus; `[data-focus-within="true"]` on its trigger
- **Hover**: `[data-hovered="true"]` on the trigger
- **Placeholder**: `[data-placeholder="true"]` on the value
- **Empty**: `[data-empty="true"]` on the clear button
- **Invalid**, **Disabled**, **Required**: `[data-invalid="true"]`,
  `[data-disabled="true"]`, `[data-required="true"]` on the autocomplete
- **Entering** and **Exiting**: `[data-entering="true"]`,
  `[data-exiting="true"]` on the popover

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Autocomplete

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `placeholder` | `placeholder` | `string` | `"Select an item"` | Temporary text that occupies the autocomplete when it is empty |
| `selectionMode` | `selection_mode` | `` `single `` \| `` `multiple `` | `` `single `` | Whether single or multiple selection is enabled, read as it is made |
| `value` | `value` | `string array` | | Current value (controlled) |
| `defaultValue` | `default_value` | `string array` | | Default value (uncontrolled) |
| `onChange` | `on_change` | `string array -> unit` | | Handler called when the value changes |
| `onClear` | `on_clear` | `unit -> unit` | | Told as it is cleared |
| `disabledKeys` | `disabled_keys` | `string array` | | Keys of disabled items |
| `isOpen` | `is_open` | `bool` | | Sets the open state of the popover (controlled) |
| `defaultOpen` | `default_open` | `bool` | `false` | Sets the default open state of the popover (uncontrolled) |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Handler called when the open state changes |
| `allowsEmptyCollection` | `allows_empty_collection` | `bool` | `false` | Whether the autocomplete allows an empty collection. When true, the list opens even with no items. |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the autocomplete is disabled |
| `isRequired` | `is_required` | `bool` | `false` | Whether user input is required |
| `isInvalid` | `is_invalid` | `bool` | `false` | Whether the autocomplete value is invalid |
| `name` | `name` | `string` | | The name of the input, used when submitting an HTML form |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the autocomplete should take full width of its container |
| `variant` | `variant` | `` `primary `` \| `` `secondary `` | `` `primary `` | Visual variant of the component. `` `primary `` is the default style with shadow. `` `secondary `` is a lower emphasis variant without shadow, suitable for use in surfaces. |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Its label, trigger, description and popover |

### Autocomplete.Filter

| React | solidtype | Type | Description |
|---|---|---|---|
| `filter` | `filter` | `string -> string -> bool` | Custom filter function, given an option's text and the search's; by default, whether the option's text contains the search's, whatever its case or accents |
| `inputValue` | `input_value` | `string` | Controlled input value |
| `onInputChange` | `on_input_change` | `string -> unit` | Handler called when input value changes |
| `children` | `children` | elements | Filter content (`Search_field` and `List_box`) |

### Autocomplete.Trigger, Autocomplete.Popover, Autocomplete.Indicator, Autocomplete.Clear_button

| React | solidtype | Type | Description |
|---|---|---|---|
| `placement` | `placement` | `` `top `` \| `` `bottom `` \| `` `left `` \| `` `right `` | Placement of the popover relative to the trigger, `` `bottom `` by default |
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | What it holds; the indicator's own icon |
| `onClick` | `on_click` | `Dom.mouseEvent -> unit` | The clear button's, called after it clears |

### Autocomplete.Value

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | `string array accessor -> element` | What it draws while something is chosen, given the ids chosen |

## Accessibility

The Autocomplete implements the ARIA combobox pattern with a filtered list and
provides:

- Full keyboard navigation support: a press on the trigger, or Enter, Space or
  an arrow on its indicator, opens the list and focuses the search; the arrows
  move through the options while the focus stays in the search
- Proper focus management: in a choice of one, choosing closes the list and
  returns the focus to the indicator
- Support for disabled states
- Search functionality with filtering, whatever the text's case or accents,
  or by the filter given; the search starts empty each time the list opens
- HTML form integration through `name`
