# Select

A select displays a collapsible list of options and allows a user to select one of them.

Original HeroUI documentation: [Select](https://heroui.com/en/docs/react/components/select).

## Usage

```ocaml title="select_usage.mlx"
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

let make () =
  <Select class_="w-[256px]" placeholder="Select one">
    <Label>"State"</Label>
    <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
    <Select.Popover>
      <List_box>
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
    </Select.Popover>
  </Select>
```

## Parity

The same HeroUI Select twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of each trigger: a
marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

The marked row is the order Kobalte names its trigger in: its label, then its value, where React Aria's names the value first. A reader hears both.

## Anatomy

```ocaml
<Select>
  <Label />
  <Select.Trigger>
    <Select.Value />
    <Select.Clear_button />
    <Select.Indicator />
  </Select.Trigger>
  <Description />
  <Select.Popover>
    <List_box>
      <List_box.Item id="one">
        <Label />
        <Description />
        <List_box.Item_indicator />
      </List_box.Item>
      <List_box.Section>
        <Header />
        <List_box.Item id="two">
          <Label />
        </List_box.Item>
      </List_box.Section>
    </List_box>
  </Select.Popover>
</Select>
```

## Examples

### Variants

The Select component supports two visual variants:

- **`` `primary ``** (default) - Standard styling with shadow, suitable for
  most use cases
- **`` `secondary ``** - Lower emphasis variant without shadow, suitable for
  use in Surface components

```ocaml title="select_variants.mlx"
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

let make () =
  <div class_="flex flex-col gap-4">
    <Select class_="w-[256px]" placeholder="Select one" variant=`primary>
      <Label>"Primary variant"</Label>
      <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
      <Select.Popover>
        <List_box>
          <List_box.Item id="option1" text_value="Option 1">
            "Option 1" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="option2" text_value="Option 2">
            "Option 2" <List_box.Item_indicator />
          </List_box.Item>
        </List_box>
      </Select.Popover>
    </Select>
    <Select class_="w-[256px]" placeholder="Select one" variant=`secondary>
      <Label>"Secondary variant"</Label>
      <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
      <Select.Popover>
        <List_box>
          <List_box.Item id="option1" text_value="Option 1">
            "Option 1" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="option2" text_value="Option 2">
            "Option 2" <List_box.Item_indicator />
          </List_box.Item>
        </List_box>
      </Select.Popover>
    </Select>
  </div>
```

### Full Width

```ocaml title="select_full_width.mlx"
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

let make () =
  <div class_="w-[400px] space-y-4">
    <Select full_width=true placeholder="Select one">
      <Label>"Favorite Animal"</Label>
      <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
      <Select.Popover>
        <List_box>
          <List_box.Item id="cat" text_value="Cat">
            "Cat" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="dog" text_value="Dog">
            "Dog" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="bird" text_value="Bird">
            "Bird" <List_box.Item_indicator />
          </List_box.Item>
        </List_box>
      </Select.Popover>
    </Select>
  </div>
```

### With Description

```ocaml title="select_with_description.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

let make () =
  <Select class_="w-[256px]" placeholder="Select one">
    <Label>"State"</Label>
    <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
    <Select.Popover>
      <List_box>
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
    </Select.Popover>
    <Description>"Select your state of residence"</Description>
  </Select>
```

### Required

HeroUI's required select is checked by the browser as its form is
submitted. A `Form` here checks nothing itself, as with a
[text field](text-field.md#validation): the example says the
select is invalid once a submit finds it empty.

```ocaml title="select_required.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

let make () =
  let state, set_state = S.create_signal [||] in
  let country, set_country = S.create_signal [||] in
  (* A required select shows its error once a submit has been tried, as the
     browser's validation React Aria reads does. *)
  let tried, set_tried = S.create_signal false in
  let missing chosen = S.get tried && Array.length (S.get chosen) = 0 in
  <Form
    class_="flex w-[256px] flex-col gap-4"
    on_submit=(fun e ->
                prevent_default e;
                S.set set_tried true)>
    <Select
      is_required=true
      is_invalid=(missing state)
      class_="w-full"
      name="state"
      placeholder="Select one"
      on_change=(S.set set_state)>
      <Label>"State"</Label>
      <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
      <Select.Popover>
        <List_box>
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
      </Select.Popover>
      <Field_error>"Please select an item in the list."</Field_error>
    </Select>
    <Select
      is_required=true
      is_invalid=(missing country)
      class_="w-full"
      name="country"
      placeholder="Select a country"
      on_change=(S.set set_country)>
      <Label>"Country"</Label>
      <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
      <Select.Popover>
        <List_box>
          <List_box.Item id="usa" text_value="United States">
            "United States" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="canada" text_value="Canada">
            "Canada" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="mexico" text_value="Mexico">
            "Mexico" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="uk" text_value="United Kingdom">
            "United Kingdom" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="france" text_value="France">
            "France" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="germany" text_value="Germany">
            "Germany" <List_box.Item_indicator />
          </List_box.Item>
        </List_box>
      </Select.Popover>
      <Field_error>"Please select an item in the list."</Field_error>
    </Select>
    <Button type_=`submit>"Submit"</Button>
  </Form>
```

### Disabled

```ocaml title="select_disabled.mlx"
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

let make () =
  <div class_="flex flex-col gap-4">
    <Select
      is_disabled=true
      class_="w-[256px]"
      default_value=[| "california" |]
      placeholder="Select one">
      <Label>"State"</Label>
      <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
      <Select.Popover>
        <List_box>
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
      </Select.Popover>
    </Select>
    <Select
      is_disabled=true
      class_="w-[256px]"
      default_value=[| "argentina"; "japan"; "france" |]
      placeholder="Select countries"
      selection_mode=`multiple>
      <Label>"Countries to Visit"</Label>
      <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
      <Select.Popover>
        <List_box>
          <List_box.Item id="argentina" text_value="Argentina">
            "Argentina" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="venezuela" text_value="Venezuela">
            "Venezuela" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="japan" text_value="Japan">
            "Japan" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="france" text_value="France">
            "France" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="italy" text_value="Italy">
            "Italy" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="spain" text_value="Spain">
            "Spain" <List_box.Item_indicator />
          </List_box.Item>
        </List_box>
      </Select.Popover>
    </Select>
  </div>
```

### With Disabled Options

```ocaml title="select_with_disabled_options.mlx"
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

let make () =
  <Select
    class_="w-[256px]"
    disabled_keys=[| "cat"; "kangaroo" |]
    placeholder="Select an animal">
    <Label>"Animal"</Label>
    <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
    <Select.Popover>
      <List_box>
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
    </Select.Popover>
  </Select>
```

### Multiple Select

```ocaml title="select_multiple_select.mlx"
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

let make () =
  <Select
    class_="w-[256px]" placeholder="Select countries" selection_mode=`multiple>
    <Label>"Countries to Visit"</Label>
    <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
    <Select.Popover>
      <List_box selection_mode=`multiple>
        <List_box.Item id="argentina" text_value="Argentina">
          "Argentina" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="venezuela" text_value="Venezuela">
          "Venezuela" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="japan" text_value="Japan">
          "Japan" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="france" text_value="France">
          "France" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="italy" text_value="Italy">
          "Italy" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="spain" text_value="Spain">
          "Spain" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="thailand" text_value="Thailand">
          "Thailand" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="new-zealand" text_value="New Zealand">
          "New Zealand" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="iceland" text_value="Iceland">
          "Iceland" <List_box.Item_indicator />
        </List_box.Item>
      </List_box>
    </Select.Popover>
  </Select>
```

### With Sections

```ocaml title="select_with_sections.mlx"
module Header = Solidtype_heroui.Header
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select
module Separator = Solidtype_heroui.Separator

let make () =
  <Select class_="w-[256px]" placeholder="Select a country">
    <Label>"Country"</Label>
    <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
    <Select.Popover>
      <List_box>
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
    </Select.Popover>
  </Select>
```

### Controlled

```ocaml title="select_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

type state = { id : string; name : string }

let states =
  [|
    { id = "california"; name = "California" };
    { id = "texas"; name = "Texas" };
    { id = "florida"; name = "Florida" };
    { id = "new-york"; name = "New York" };
    { id = "illinois"; name = "Illinois" };
    { id = "pennsylvania"; name = "Pennsylvania" };
  |]

let make () =
  let state, set_state = S.create_signal [| "california" |] in
  let selected_state () =
    Array.find_opt
      (fun s -> Array.exists (String.equal s.id) (S.get state))
      states
  in
  <div class_="space-y-2">
    <Select
      class_="w-[256px]"
      placeholder="Select a state"
      value=(S.get state)
      on_change=(fun value -> S.set set_state value)>
      <Label>"State (controlled)"</Label>
      <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
      <Select.Popover>
        <List_box>
          <Solidtype.For each=states>
            (fun (state : state) _ ->
              <List_box.Item id=state.id text_value=state.name>
                (Jsx.string state.name) <List_box.Item_indicator />
              </List_box.Item>)
          </Solidtype.For>
        </List_box>
      </Select.Popover>
    </Select>
    <p class_="text-sm text-muted">
      "Selected: "
      (Jsx.string
         (match selected_state () with Some s -> s.name | None -> "None"))
    </p>
  </div>
```

### Controlled Multiple

```ocaml title="select_controlled_multiple.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

let make () =
  let selected, set_selected = S.create_signal [| "california"; "texas" |] in
  <div class_="space-y-4">
    <Select
      class_="w-[256px]"
      placeholder="Select states"
      selection_mode=`multiple
      value=(S.get selected)
      on_change=(fun keys -> S.set set_selected keys)>
      <Label>"States (controlled multiple)"</Label>
      <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
      <Select.Popover>
        <List_box selection_mode=`multiple>
          <List_box.Item id="california" text_value="California">
            "California" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="texas" text_value="Texas">
            "Texas" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="florida" text_value="Florida">
            "Florida" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="new-york" text_value="New York">
            "New York" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="illinois" text_value="Illinois">
            "Illinois" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="pennsylvania" text_value="Pennsylvania">
            "Pennsylvania" <List_box.Item_indicator />
          </List_box.Item>
        </List_box>
      </Select.Popover>
    </Select>
    <p class_="text-sm text-muted">
      "Selected: "
      (Jsx.string
         (match S.get selected with
         | [||] -> "None"
         | keys -> String.concat ", " (Array.to_list keys)))
    </p>
  </div>
```

### Controlled Open State

```ocaml title="select_controlled_open_state.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

let make () =
  let is_open, set_is_open = S.create_signal false in
  <div class_="space-y-4">
    <Select
      class_="w-[256px]"
      is_open=(S.get is_open)
      placeholder="Select one"
      on_open_change=(S.set set_is_open)>
      <Label>"State"</Label>
      <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
      <Select.Popover>
        <List_box>
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
      </Select.Popover>
    </Select>
    <Button on_click=(fun _ -> S.set set_is_open (not (S.get is_open)))>
      (Jsx.string (if S.get is_open then "Close" else "Open")) " Select"
    </Button>
    <p class_="text-sm text-muted">
      "Select is " (Jsx.string (if S.get is_open then "open" else "closed"))
    </p>
  </div>
```

### Asynchronous Loading

HeroUI's example fetches its list from a server; here the same names are
loaded a part at a time. The list's `List_box.Load_more_item` is React
Aria's `ListBoxLoadMoreItem`: it asks for more as the list scrolls to its
end, and shows its children while more load.

```ocaml title="select_asynchronous_loading.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select
module Spinner = Solidtype_heroui.Spinner

(* The first page of https://pokeapi.co/api/v2/pokemon, which HeroUI's example
   fetches, here loaded a part at a time. *)
let pokemon =
  [|
    "bulbasaur";
    "ivysaur";
    "venusaur";
    "charmander";
    "charmeleon";
    "charizard";
    "squirtle";
    "wartortle";
    "blastoise";
    "caterpie";
    "metapod";
    "butterfree";
    "weedle";
    "kakuna";
    "beedrill";
    "pidgey";
    "pidgeotto";
    "pidgeot";
    "rattata";
    "raticate";
  |]

(* How long the fetch it stands in for takes, and how many each brings. *)
let load_ms = 800
let page = 10

let make () =
  let loaded, set_loaded = S.create_signal 0 in
  let loading, set_loading = S.create_signal false in
  let load_more () =
    let now = S.get loaded in
    if (not (S.get loading)) && now < Array.length pokemon then (
      S.set set_loading true;
      let timer =
        Js.Global.setTimeout
          ~f:(fun () ->
            S.set set_loaded (min (Array.length pokemon) (now + page));
            S.set set_loading false)
          load_ms
      in
      S.on_cleanup (fun () -> Js.Global.clearTimeout timer))
  in
  S.on_mount load_more;
  <Select class_="w-[256px]" placeholder="Select a Pokemon">
    <Label>"Pick a Pokemon"</Label>
    <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
    <Select.Popover>
      <List_box>
        <Solidtype.For each=(Array.sub pokemon 0 (S.get loaded))>
          (fun name _ ->
            <List_box.Item id=name text_value=name>
              (Jsx.string name) <List_box.Item_indicator />
            </List_box.Item>)
        </Solidtype.For>
        <List_box.Load_more_item
          is_loading=(S.get loading) on_load_more=load_more>
          <div class_="flex items-center justify-center gap-2 py-2">
            <Spinner size=`sm />
            <span class_="text-sm text-muted">"Loading more..."</span>
          </div>
        </List_box.Load_more_item>
      </List_box>
    </Select.Popover>
  </Select>
```

### Custom Indicator

```ocaml title="select_custom_indicator.mlx"
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select
module Gravity = Solidtype_gravity_icons

let make () =
  <Select class_="w-[256px]" placeholder="Select one">
    <Label>"State"</Label>
    <Select.Trigger>
      <Select.Value />
      <Select.Indicator class_="size-3">
        <Gravity.Chevrons_expand_vertical />
      </Select.Indicator>
    </Select.Trigger>
    <Select.Popover>
      <List_box>
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
    </Select.Popover>
  </Select>
```

### With Clear Button

`Select.Trigger` is a button, so a nested `<button>` cannot be used for clear.
Compose `Select.Clear_button` inside the trigger instead: it renders as a
non-button control and does not open the menu.

Because ARIA treats the children of a button as presentational, the clear
control cannot take focus. It is therefore `aria-hidden` and acts as a pointer
affordance only. When a `Select.Clear_button` is composed, the trigger also
clears on Backspace or Delete, which is how keyboard and screen reader users
clear the selection. Both paths call `on_clear`.

```ocaml title="select_with_clear_button.mlx"
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

let make () =
  <Select
    class_="w-[256px]" default_value=[| "california" |] placeholder="Select one">
    <Label>"State"</Label>
    <Select.Trigger>
      <Select.Value /> <Select.Clear_button /> <Select.Indicator />
    </Select.Trigger>
    <Select.Popover>
      <List_box>
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
    </Select.Popover>
  </Select>
```

### Custom Value

`Select.Value`'s children are a function of the ids chosen, drawn while
one is; the select draws its placeholder while none is.

```ocaml title="select_custom_value.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Avatar = Solidtype_heroui.Avatar
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

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
  <Select class_="w-[256px]" placeholder="Select a user">
    <Label>"User"</Label>
    <Select.Trigger>
      <Select.Value>
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
      </Select.Value>
      <Select.Indicator />
    </Select.Trigger>
    <Select.Popover>
      <List_box>
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
    </Select.Popover>
  </Select>
```

### In Surface

When used inside a [Surface](surface.md) component, use
`` variant=`secondary `` to apply the lower emphasis variant suitable for
surface backgrounds.

```ocaml title="select_in_surface.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select
module Surface = Solidtype_heroui.Surface

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

let make () =
  let state, set_state = S.create_signal [||] in
  let country, set_country = S.create_signal [||] in
  (* A required select shows its error once a submit has been tried, as the
     browser's validation React Aria reads does. *)
  let tried, set_tried = S.create_signal false in
  let missing chosen = S.get tried && Array.length (S.get chosen) = 0 in
  <Surface class_="w-[320px] rounded-3xl p-6">
    <Form
      class_="flex w-full flex-col gap-4"
      on_submit=(fun e ->
                  prevent_default e;
                  S.set set_tried true)>
      <Select
        is_required=true
        is_invalid=(missing state)
        class_="w-full"
        name="state"
        placeholder="Select one"
        variant=`secondary
        on_change=(S.set set_state)>
        <Label>"State"</Label>
        <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
        <Select.Popover>
          <List_box>
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
        </Select.Popover>
        <Field_error>"Please select an item in the list."</Field_error>
      </Select>
      <Select
        is_required=true
        is_invalid=(missing country)
        class_="w-full"
        name="country"
        placeholder="Select a country"
        variant=`secondary
        on_change=(S.set set_country)>
        <Label>"Country"</Label>
        <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
        <Select.Popover>
          <List_box>
            <List_box.Item id="usa" text_value="United States">
              "United States" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="canada" text_value="Canada">
              "Canada" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="mexico" text_value="Mexico">
              "Mexico" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="uk" text_value="United Kingdom">
              "United Kingdom" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="france" text_value="France">
              "France" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="germany" text_value="Germany">
              "Germany" <List_box.Item_indicator />
            </List_box.Item>
          </List_box>
        </Select.Popover>
        <Field_error>"Please select an item in the list."</Field_error>
      </Select>
      <Button type_=`submit>"Submit"</Button>
    </Form>
  </Surface>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="select_tailwind.mlx"
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

let item_class =
  "rounded-lg data-[focused=true]:bg-accent/10 \
   data-[selected=true]:text-foreground"

let make () =
  <Select class_="w-56" placeholder="Pick a plan" variant=`secondary>
    <Label class_="font-medium text-foreground">"Plan"</Label>
    <Select.Trigger class_="rounded-xl bg-default">
      <Select.Value /> <Select.Indicator />
    </Select.Trigger>
    <Select.Popover
      class_="rounded-xl border border-border bg-surface p-1 shadow-lg">
      <List_box>
        <List_box.Item class_=item_class id="free" text_value="Free">
          "Free" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item class_=item_class id="pro" text_value="Pro">
          "Pro" <List_box.Item_indicator />
        </List_box.Item>
      </List_box>
    </Select.Popover>
  </Select>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every one, as with
HeroUI in React:

```css
@layer components {
  .select__trigger {
    @apply rounded-lg border border-border bg-surface;
  }

  .select__popover {
    @apply rounded-xl;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base Classes

- `.select` - Base select container
- `.select__trigger` - The button that triggers the select
- `.select__value` - The displayed value or placeholder
- `.select__clear-button` - The optional clear control inside the trigger
- `.select__indicator` - The dropdown indicator icon
- `.select__popover` - The popover container

#### Variant Classes

- `.select--primary` - Primary variant with shadow (default)
- `.select--secondary` - Secondary variant without shadow, suitable for use in
  surfaces
- `.select--full-width` - Full width modifier

#### State Classes

- `.select[data-invalid="true"]` - Invalid state
- `.select__trigger[data-focus-visible="true"]` - Focused trigger state
- `.select__trigger[data-disabled="true"]` - Disabled trigger state
- `.select__value[data-placeholder="true"]` - Placeholder state
- `.select__clear-button[data-empty="true"]` - Clear button hidden when no
  selection
- `.select__indicator[data-open="true"]` - Open indicator state

### Interactive States

The component supports both CSS pseudo-classes and data attributes for
flexibility:

- **Hover**: `:hover` or `[data-hovered="true"]` on trigger
- **Pressed**: `[data-pressed="true"]` on trigger
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]` on trigger,
  and `[data-focused="true"]` on the select and its trigger
- **Disabled**: `:disabled` or `[data-disabled="true"]` on select
- **Open**: `[data-open="true"]` on the select and its indicator
- **Required**: `[data-required="true"]` on the select
- **Entering** and **Exiting**: `[data-entering="true"]`,
  `[data-exiting="true"]` on the popover

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Select

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `placeholder` | `placeholder` | `string` | `"Select an item"` | Temporary text that occupies the select when it is empty |
| `selectionMode` | `selection_mode` | `` `single `` \| `` `multiple `` | `` `single `` | Whether single or multiple selection is enabled, read as it is made |
| `value` | `value` | `string array` | | Current value (controlled) |
| `defaultValue` | `default_value` | `string array` | | Default value (uncontrolled) |
| `onChange` | `on_change` | `string array -> unit` | | Handler called when the value changes |
| `onClear` | `on_clear` | `unit -> unit` | | Handler called when the selection is cleared |
| `disabledKeys` | `disabled_keys` | `string array` | | Keys of disabled items |
| `isOpen` | `is_open` | `bool` | | Sets the open state of the menu (controlled) |
| `defaultOpen` | `default_open` | `bool` | `false` | Sets the default open state of the menu (uncontrolled) |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Handler called when the open state changes |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the select is disabled |
| `isRequired` | `is_required` | `bool` | `false` | Whether user input is required |
| `isInvalid` | `is_invalid` | `bool` | `false` | Whether the select value is invalid |
| `name` | `name` | `string` | | The name of the input, used when submitting an HTML form |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the select should take full width of its container |
| `variant` | `variant` | `` `primary `` \| `` `secondary `` | `` `primary `` | Visual variant of the component. `` `primary `` is the default style with shadow. `` `secondary `` is a lower emphasis variant without shadow, suitable for use in surfaces |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Select content |

### Select.Trigger, Select.Popover

| React | solidtype | Type | Description |
|---|---|---|---|
| `placement` | `placement` | `` `top `` \| `` `bottom `` \| `` `left `` \| `` `right `` | Placement of the popover relative to the trigger, `` `bottom `` by default |
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | What it holds |

### Select.Value

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | `string array accessor -> element` | What it draws while something is chosen, given the ids chosen |

### Select.Indicator, Select.Clear_button

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | Custom content, replacing the default icon |
| `onClick` | `on_click` | `Dom.mouseEvent -> unit` | The clear button's handler, called when the control is clicked, after it clears |

### List_box.Load_more_item

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `isLoading` | `is_loading` | `bool` | `false` | Whether more are loading, while its children show |
| `onLoadMore` | `on_load_more` | `unit -> unit` | | Asked for more as the list scrolls to it |
| `scrollOffset` | `scroll_offset` | `float` | 1 | How many of the list's heights before its end it asks |
| `children` | `children` | elements | | What shows while more load |

## Accessibility

The Select component implements the ARIA listbox pattern and provides:

- Full keyboard navigation support: a press, Enter, Space or an arrow opens
  the list; the arrows move through it; Enter, Space or a press chooses
- Typeahead search functionality
- Proper focus management: in a choice of one, the list closes on a choice
  and the focus goes back to the trigger; Escape or a press outside closes it
- The page outside hidden from a reader while the list is open
- Support for disabled states
- HTML form integration
