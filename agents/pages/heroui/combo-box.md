# ComboBox

A combo box combines a text input with a listbox, allowing users to filter a list of options to items matching a query.

Original HeroUI documentation: [ComboBox](https://heroui.com/en/docs/react/components/combo-box).

## Usage

```ocaml title="combo_box_usage.mlx"
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

let make () =
  <Combo_box class_="w-[256px]">
    <Label>"Favorite Animal"</Label>
    <Combo_box.Input_group>
      <Input placeholder="Search animals..." /> <Combo_box.Trigger />
    </Combo_box.Input_group>
    <Combo_box.Popover>
      <List_box>
        <List_box.Item id="aardvark" text_value="Aardvark">
          "Aardvark" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="cat" text_value="Cat">
          "Cat" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="dog" text_value="Dog">
          "Dog" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="kangaroo" text_value="Kangaroo">
          "Kangaroo" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="panda" text_value="Panda">
          "Panda" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="snake" text_value="Snake">
          "Snake" <List_box.Item_indicator />
        </List_box.Item>
      </List_box>
    </Combo_box.Popover>
  </Combo_box>
```

## Parity

The same HeroUI ComboBox twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of each input: a
marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

The marked row is Kobalte's: its input says it opens a list, `aria-haspopup="listbox"`, which a combo box means without it and React Aria leaves out.

## Anatomy

```ocaml
<Combo_box>
  <Label>...</Label>
  <Combo_box.Input_group>
    <Input />
    <Combo_box.Trigger />
  </Combo_box.Input_group>
  <Combo_box.Value />
  <Description>...</Description>
  <Combo_box.Popover>
    <List_box>
      <List_box.Item id="...">...</List_box.Item>
    </List_box>
  </Combo_box.Popover>
</Combo_box>
```

`Combo_box.Value` displays the selected values, primarily used for multiple
selection.

## Examples

### Full Width

```ocaml title="combo_box_full_width.mlx"
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

let make () =
  <div class_="w-[400px] space-y-4">
    <Combo_box full_width=true>
      <Label>"Favorite Animal"</Label>
      <Combo_box.Input_group>
        <Input placeholder="Search animals..." /> <Combo_box.Trigger />
      </Combo_box.Input_group>
      <Combo_box.Popover>
        <List_box>
          <List_box.Item id="aardvark" text_value="Aardvark">
            "Aardvark" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="cat" text_value="Cat">
            "Cat" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="dog" text_value="Dog">
            "Dog" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="kangaroo" text_value="Kangaroo">
            "Kangaroo" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="panda" text_value="Panda">
            "Panda" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="snake" text_value="Snake">
            "Snake" <List_box.Item_indicator />
          </List_box.Item>
        </List_box>
      </Combo_box.Popover>
    </Combo_box>
  </div>
```

### With Description

```ocaml title="combo_box_with_description.mlx"
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Description = Solidtype_heroui.Description

let make () =
  <Combo_box class_="w-[256px]">
    <Label>"Favorite Animal"</Label>
    <Combo_box.Input_group>
      <Input placeholder="Search animals..." /> <Combo_box.Trigger />
    </Combo_box.Input_group>
    <Combo_box.Popover>
      <List_box>
        <List_box.Item id="aardvark" text_value="Aardvark">
          "Aardvark" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="cat" text_value="Cat">
          "Cat" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="dog" text_value="Dog">
          "Dog" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="kangaroo" text_value="Kangaroo">
          "Kangaroo" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="panda" text_value="Panda">
          "Panda" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="snake" text_value="Snake">
          "Snake" <List_box.Item_indicator />
        </List_box.Item>
      </List_box>
    </Combo_box.Popover>
    <Description>"Search and select your favorite animal"</Description>
  </Combo_box>
```

### Required

A `Form` checks nothing itself: the example marks the combo box invalid once
a submit finds it empty.

```ocaml title="combo_box_required.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Combo_box = Solidtype_heroui.Combo_box
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]
external alert : string -> unit = "alert" [@@mel.scope "window"]

let make () =
  let animal, set_animal = S.create_signal [||] in
  (* A required combo box shows its error once a submit has been tried, as
     the browser's validation React Aria reads does. *)
  let tried, set_tried = S.create_signal false in
  let missing () = S.get tried && Array.length (S.get animal) = 0 in
  <Form
    class_="flex w-[256px] flex-col gap-4"
    on_submit=(fun e ->
                prevent_default e;
                S.set set_tried true;
                if Array.length (S.get animal) > 0 then
                  alert "Form submitted successfully!")>
    <Combo_box
      is_required=true
      is_invalid=(missing ())
      class_="w-full"
      name="animal"
      on_change=(S.set set_animal)>
      <Label>"Favorite Animal"</Label>
      <Combo_box.Input_group>
        <Input placeholder="Search animals..." /> <Combo_box.Trigger />
      </Combo_box.Input_group>
      <Combo_box.Popover>
        <List_box>
          <List_box.Item id="aardvark" text_value="Aardvark">
            "Aardvark" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="cat" text_value="Cat">
            "Cat" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="dog" text_value="Dog">
            "Dog" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="kangaroo" text_value="Kangaroo">
            "Kangaroo" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="panda" text_value="Panda">
            "Panda" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="snake" text_value="Snake">
            "Snake" <List_box.Item_indicator />
          </List_box.Item>
        </List_box>
      </Combo_box.Popover>
      <Field_error>"Please select an item in the list."</Field_error>
    </Combo_box>
    <Button type_=`submit>"Submit"</Button>
  </Form>
```

### Disabled

```ocaml title="combo_box_disabled.mlx"
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

let make () =
  <Combo_box is_disabled=true class_="w-[256px]" default_value=[| "cat" |]>
    <Label>"Favorite Animal"</Label>
    <Combo_box.Input_group>
      <Input placeholder="Search animals..." /> <Combo_box.Trigger />
    </Combo_box.Input_group>
    <Combo_box.Popover>
      <List_box>
        <List_box.Item id="aardvark" text_value="Aardvark">
          "Aardvark" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="cat" text_value="Cat">
          "Cat" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="dog" text_value="Dog">
          "Dog" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="kangaroo" text_value="Kangaroo">
          "Kangaroo" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="panda" text_value="Panda">
          "Panda" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="snake" text_value="Snake">
          "Snake" <List_box.Item_indicator />
        </List_box.Item>
      </List_box>
    </Combo_box.Popover>
  </Combo_box>
```

### With Disabled Options

```ocaml title="combo_box_with_disabled_options.mlx"
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

let make () =
  <Combo_box class_="w-[256px]" disabled_keys=[| "cat"; "kangaroo" |]>
    <Label>"Animal"</Label>
    <Combo_box.Input_group>
      <Input placeholder="Search animals..." /> <Combo_box.Trigger />
    </Combo_box.Input_group>
    <Combo_box.Popover>
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
    </Combo_box.Popover>
  </Combo_box>
```

### With Sections

A section the input's text leaves empty is not drawn, its header with it.

```ocaml title="combo_box_with_sections.mlx"
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Header = Solidtype_heroui.Header
module Separator = Solidtype_heroui.Separator

let make () =
  <Combo_box class_="w-[256px]">
    <Label>"Country"</Label>
    <Combo_box.Input_group>
      <Input placeholder="Search countries..." /> <Combo_box.Trigger />
    </Combo_box.Input_group>
    <Combo_box.Popover>
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
    </Combo_box.Popover>
  </Combo_box>
```

### Controlled

The ids chosen are `value`, an array: one at most in a choice of one.

```ocaml title="combo_box_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

type animal = { id : string; name : string }

let animals =
  [|
    { id = "cat"; name = "Cat" };
    { id = "dog"; name = "Dog" };
    { id = "bird"; name = "Bird" };
    { id = "fish"; name = "Fish" };
    { id = "hamster"; name = "Hamster" };
  |]

let make () =
  let selected, set_selected = S.create_signal [| "cat" |] in
  let selected_animal () =
    match S.get selected with
    | [| key |] -> Array.find_opt (fun a -> String.equal a.id key) animals
    | _ -> None
  in
  <div class_="space-y-2">
    <Combo_box
      class_="w-[256px]" value=(S.get selected) on_change=(S.set set_selected)>
      <Label>"Animal (controlled)"</Label>
      <Combo_box.Input_group>
        <Input placeholder="Search animals..." /> <Combo_box.Trigger />
      </Combo_box.Input_group>
      <Combo_box.Popover>
        <List_box>
          <Solidtype.For each=animals>
            (fun animal _ ->
              <List_box.Item id=animal.id text_value=animal.name>
                (Jsx.string animal.name) <List_box.Item_indicator />
              </List_box.Item>)
          </Solidtype.For>
        </List_box>
      </Combo_box.Popover>
    </Combo_box>
    <p class_="text-sm text-muted">
      (Jsx.string
         ("Selected: "
         ^ match selected_animal () with Some a -> a.name | None -> "None"))
    </p>
  </div>
```

### Controlled Input Value

```ocaml title="combo_box_controlled_input_value.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

let make () =
  let input_value, set_input_value = S.create_signal "" in
  <div class_="space-y-2">
    <Combo_box
      class_="w-[256px]"
      input_value=(S.get input_value)
      on_input_change=(S.set set_input_value)>
      <Label>"Search (controlled input)"</Label>
      <Combo_box.Input_group>
        <Input placeholder="Type to search..." /> <Combo_box.Trigger />
      </Combo_box.Input_group>
      <Combo_box.Popover>
        <List_box>
          <List_box.Item id="aardvark" text_value="Aardvark">
            "Aardvark" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="cat" text_value="Cat">
            "Cat" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="dog" text_value="Dog">
            "Dog" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="kangaroo" text_value="Kangaroo">
            "Kangaroo" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="panda" text_value="Panda">
            "Panda" <List_box.Item_indicator />
          </List_box.Item>
          <List_box.Item id="snake" text_value="Snake">
            "Snake" <List_box.Item_indicator />
          </List_box.Item>
        </List_box>
      </Combo_box.Popover>
    </Combo_box>
    <p class_="text-sm text-muted">
      (Jsx.string
         ("Input value: "
         ^ match S.get input_value with "" -> "(empty)" | text -> text))
    </p>
  </div>
```

### Asynchronous Loading

The names are searched and loaded a part at a time.
`List_box.Load_more_item` asks for more as the list scrolls to its end, and
the list's `render_empty_state` draws an `Empty_state` while no name holds the
text typed.

```ocaml title="combo_box_asynchronous_loading.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Combo_box = Solidtype_heroui.Combo_box
module Empty_state = Solidtype_heroui.Empty_state
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Spinner = Solidtype_heroui.Spinner

(* The first two pages of https://swapi.py4e.com/api/people/, which HeroUI's
   example searches, here searched and loaded a part at a time. *)
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

(* How long the fetch it stands in for takes, and how many each brings. *)
let load_ms = 600
let page = 10

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
  let loaded, set_loaded = S.create_signal 0 in
  let loading, set_loading = S.create_signal false in
  let found () =
    Array.of_list
      (List.filter
         (fun name -> holds ~part:(S.get filter_text) name)
         (Array.to_list characters))
  in
  let load_more () =
    let now = S.get loaded in
    if (not (S.get loading)) && now < Array.length (found ()) then (
      S.set set_loading true;
      let timer =
        Js.Global.setTimeout
          ~f:(fun () ->
            S.set set_loaded (now + page);
            S.set set_loading false)
          load_ms
      in
      S.on_cleanup (fun () -> Js.Global.clearTimeout timer))
  in
  let search text =
    S.set set_filter_text text;
    S.set set_loaded 0;
    load_more ()
  in
  S.on_mount load_more;
  <Combo_box
    allows_empty_collection=true
    class_="w-[256px]"
    input_value=(S.get filter_text)
    on_input_change=search>
    <Label>"Pick a Character"</Label>
    <Combo_box.Input_group>
      <Input placeholder="Star Wars characters..." /> <Combo_box.Trigger />
    </Combo_box.Input_group>
    <Combo_box.Popover>
      <List_box render_empty_state=(fun _ -> <Empty_state />)>
        <Solidtype.For
          each=(let found = found () in
                Array.sub found 0 (min (S.get loaded) (Array.length found)))>
          (fun name _ ->
            <List_box.Item id=name text_value=name>
              (Jsx.string name) <List_box.Item_indicator />
            </List_box.Item>)
        </Solidtype.For>
        <List_box.Load_more_item
          is_loading=(S.get loading) on_load_more=load_more>
          <div class_="flex items-center justify-center gap-2 py-2">
            <Spinner size=`sm />
            <span class_="muted text-sm">"Loading more..."</span>
          </div>
        </List_box.Load_more_item>
      </List_box>
    </Combo_box.Popover>
  </Combo_box>
```

### Default Selected Key

```ocaml title="combo_box_default_selected_key.mlx"
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

let make () =
  <Combo_box class_="w-[256px]" default_value=[| "cat" |]>
    <Label>"Favorite Animal"</Label>
    <Combo_box.Input_group>
      <Input placeholder="Search animals..." /> <Combo_box.Trigger />
    </Combo_box.Input_group>
    <Combo_box.Popover>
      <List_box>
        <List_box.Item id="aardvark" text_value="Aardvark">
          "Aardvark" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="cat" text_value="Cat">
          "Cat" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="dog" text_value="Dog">
          "Dog" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="kangaroo" text_value="Kangaroo">
          "Kangaroo" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="panda" text_value="Panda">
          "Panda" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="snake" text_value="Snake">
          "Snake" <List_box.Item_indicator />
        </List_box.Item>
      </List_box>
    </Combo_box.Popover>
  </Combo_box>
```

### Allows Custom Value

```ocaml title="combo_box_allows_custom_value.mlx"
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Description = Solidtype_heroui.Description

let make () =
  <Combo_box allows_custom_value=true class_="w-[256px]">
    <Label>"Favorite Animal"</Label>
    <Combo_box.Input_group>
      <Input placeholder="Search or type an animal..." /> <Combo_box.Trigger />
    </Combo_box.Input_group>
    <Combo_box.Popover>
      <List_box>
        <List_box.Item id="aardvark" text_value="Aardvark">
          "Aardvark" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="cat" text_value="Cat">
          "Cat" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="dog" text_value="Dog">
          "Dog" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="kangaroo" text_value="Kangaroo">
          "Kangaroo" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="panda" text_value="Panda">
          "Panda" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="snake" text_value="Snake">
          "Snake" <List_box.Item_indicator />
        </List_box.Item>
      </List_box>
    </Combo_box.Popover>
    <Description>
      "You can type any animal name, even if it's not in the list"
    </Description>
  </Combo_box>
```

### Custom Indicator

```ocaml title="combo_box_custom_indicator.mlx"
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Gravity = Solidtype_gravity_icons

let make () =
  <Combo_box class_="w-[256px]">
    <Label>"Favorite Animal"</Label>
    <Combo_box.Input_group>
      <Input placeholder="Search animals..." />
      <Combo_box.Trigger>
        <Gravity.Chevrons_expand_vertical class_="size-3" />
      </Combo_box.Trigger>
    </Combo_box.Input_group>
    <Combo_box.Popover>
      <List_box>
        <List_box.Item id="aardvark" text_value="Aardvark">
          "Aardvark" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="cat" text_value="Cat">
          "Cat" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="dog" text_value="Dog">
          "Dog" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="kangaroo" text_value="Kangaroo">
          "Kangaroo" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="panda" text_value="Panda">
          "Panda" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="snake" text_value="Snake">
          "Snake" <List_box.Item_indicator />
        </List_box.Item>
      </List_box>
    </Combo_box.Popover>
  </Combo_box>
```

### Custom Value

```ocaml title="combo_box_custom_value.mlx"
module Jsx = Solidtype.Jsx
module Avatar = Solidtype_heroui.Avatar
module Combo_box = Solidtype_heroui.Combo_box
module Description = Solidtype_heroui.Description
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

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
  <Combo_box class_="w-[256px]">
    <Label>"User"</Label>
    <Combo_box.Input_group>
      <Input placeholder="Search users..." /> <Combo_box.Trigger />
    </Combo_box.Input_group>
    <Combo_box.Popover>
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
    </Combo_box.Popover>
  </Combo_box>
```

### Custom Filtering

`default_filter` is given an option's text and the input's, and keeps the
options it answers `true` for.

```ocaml title="combo_box_custom_filtering.mlx"
module Jsx = Solidtype.Jsx
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

type animal = { id : string; name : string }

let animals =
  [|
    { id = "cat"; name = "Cat" };
    { id = "dog"; name = "Dog" };
    { id = "bird"; name = "Bird" };
    { id = "fish"; name = "Fish" };
    { id = "hamster"; name = "Hamster" };
  |]

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
  <Combo_box
    class_="w-[256px]"
    default_filter=(fun text typed ->
                     String.equal typed "" || holds ~part:typed text)>
    <Label>"Animal (custom filter)"</Label>
    <Combo_box.Input_group>
      <Input placeholder="Search animals..." /> <Combo_box.Trigger />
    </Combo_box.Input_group>
    <Combo_box.Popover>
      <List_box>
        <Solidtype.For each=animals>
          (fun animal _ ->
            <List_box.Item id=animal.id text_value=animal.name>
              (Jsx.string animal.name) <List_box.Item_indicator />
            </List_box.Item>)
        </Solidtype.For>
      </List_box>
    </Combo_box.Popover>
  </Combo_box>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

### Menu Trigger

Use the `menu_trigger` prop to control when the popover opens:

- `` `focus `` (default): popover opens when the user focuses the input
- `` `input ``: popover opens when the user edits the input text
- `` `manual ``: popover only opens when the user presses the trigger button
  or uses the arrow keys

```ocaml title="combo_box_menu_trigger.mlx"
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Description = Solidtype_heroui.Description

let make () =
  <div class_="flex flex-col gap-8">
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">"Focus (default)"</p>
      <Combo_box class_="w-[256px]" menu_trigger=`focus>
        <Label>"Favorite Animal"</Label>
        <Combo_box.Input_group>
          <Input placeholder="Search animals..." /> <Combo_box.Trigger />
        </Combo_box.Input_group>
        <Combo_box.Popover>
          <List_box>
            <List_box.Item id="aardvark" text_value="Aardvark">
              "Aardvark" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="cat" text_value="Cat">
              "Cat" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="dog" text_value="Dog">
              "Dog" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="kangaroo" text_value="Kangaroo">
              "Kangaroo" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="panda" text_value="Panda">
              "Panda" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="snake" text_value="Snake">
              "Snake" <List_box.Item_indicator />
            </List_box.Item>
          </List_box>
        </Combo_box.Popover>
        <Description>"Popover opens when the input is focused"</Description>
      </Combo_box>
    </div>
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">"Input"</p>
      <Combo_box class_="w-[256px]" menu_trigger=`input>
        <Label>"Favorite Animal"</Label>
        <Combo_box.Input_group>
          <Input placeholder="Search animals..." /> <Combo_box.Trigger />
        </Combo_box.Input_group>
        <Combo_box.Popover>
          <List_box>
            <List_box.Item id="aardvark" text_value="Aardvark">
              "Aardvark" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="cat" text_value="Cat">
              "Cat" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="dog" text_value="Dog">
              "Dog" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="kangaroo" text_value="Kangaroo">
              "Kangaroo" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="panda" text_value="Panda">
              "Panda" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="snake" text_value="Snake">
              "Snake" <List_box.Item_indicator />
            </List_box.Item>
          </List_box>
        </Combo_box.Popover>
        <Description>
          "Popover opens when the user edits the input text"
        </Description>
      </Combo_box>
    </div>
    <div class_="flex flex-col gap-2">
      <p class_="text-sm font-medium text-muted">"Manual"</p>
      <Combo_box class_="w-[256px]" menu_trigger=`manual>
        <Label>"Favorite Animal"</Label>
        <Combo_box.Input_group>
          <Input placeholder="Search animals..." /> <Combo_box.Trigger />
        </Combo_box.Input_group>
        <Combo_box.Popover>
          <List_box>
            <List_box.Item id="aardvark" text_value="Aardvark">
              "Aardvark" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="cat" text_value="Cat">
              "Cat" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="dog" text_value="Dog">
              "Dog" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="kangaroo" text_value="Kangaroo">
              "Kangaroo" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="panda" text_value="Panda">
              "Panda" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="snake" text_value="Snake">
              "Snake" <List_box.Item_indicator />
            </List_box.Item>
          </List_box>
        </Combo_box.Popover>
        <Description>
          "Popover only opens when the trigger button is pressed or arrow keys \
           are used"
        </Description>
      </Combo_box>
    </div>
  </div>
```

### Form Value

Use the `form_value` prop to control whether the selected item's key or text
is submitted in forms. `` `key `` is the default. When `allows_custom_value`
is true, the text is always submitted.

```ocaml title="combo_box_form_value.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Combo_box = Solidtype_heroui.Combo_box
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]
external current_target : Dom.event -> Dom.element = "currentTarget" [@@mel.get]

type form_data

external form_data : Dom.element -> form_data = "FormData" [@@mel.new]
external get : form_data -> string -> string Js.null = "get" [@@mel.send]

type animal = { id : string; name : string }

let animals =
  [|
    { id = "aardvark"; name = "Aardvark" };
    { id = "cat"; name = "Cat" };
    { id = "dog"; name = "Dog" };
    { id = "kangaroo"; name = "Kangaroo" };
    { id = "panda"; name = "Panda" };
    { id = "snake"; name = "Snake" };
  |]

let list () =
  <List_box>
    <Solidtype.For each=animals>
      (fun animal _ ->
        <List_box.Item id=animal.id text_value=animal.name>
          (Jsx.string animal.name) <List_box.Item_indicator />
        </List_box.Item>)
    </Solidtype.For>
  </List_box>

let make () =
  let message, set_message = S.create_signal None in
  let sent data name =
    Option.value (Js.Null.toOption (get data name)) ~default:"null"
  in
  <Form
    class_="flex w-[256px] flex-col gap-4"
    on_submit=(fun e ->
                prevent_default e;
                let data = form_data (current_target e) in
                S.set set_message
                  (Some
                     ("Key: " ^ sent data "animal" ^ ". Text: "
                    ^ sent data "animal-text" ^ ".")))>
    <Combo_box is_required=true class_="w-full" form_value=`key name="animal">
      <Label>"Animal"</Label>
      <Combo_box.Input_group>
        <Input placeholder="Select an animal..." /> <Combo_box.Trigger />
      </Combo_box.Input_group>
      <Combo_box.Popover>(list ())</Combo_box.Popover>
      <Description>"Submits the selected key"</Description>
      <Field_error />
    </Combo_box>
    <Combo_box
      is_required=true class_="w-full" form_value=`text name="animal-text">
      <Label>"Animal (text)"</Label>
      <Combo_box.Input_group>
        <Input placeholder="Select an animal..." /> <Combo_box.Trigger />
      </Combo_box.Input_group>
      <Combo_box.Popover>(list ())</Combo_box.Popover>
      <Description>"Submits the selected text"</Description>
      <Field_error />
    </Combo_box>
    <Button class_="w-fit" type_=`submit>"Submit"</Button>
    (match S.get message with
    | Some m -> <p class_="text-sm text-muted">(Jsx.string m)</p>
    | None -> Jsx.nothing)
  </Form>
```

### Validation Behavior

There is no `validation_behavior`: a field is invalid while `is_invalid` says
so, whenever the application decides, as the [Form](form.md)
page shows.

### Custom Validation

There is no `validate`: read the value the application keeps, and set
`is_invalid` from it.

```ocaml title="combo_box_custom_validation.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Combo_box = Solidtype_heroui.Combo_box
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]
external alert : string -> unit = "alert" [@@mel.scope "window"]

type animal = { id : string; name : string }

let animals =
  [|
    { id = "aardvark"; name = "Aardvark" };
    { id = "cat"; name = "Cat" };
    { id = "dog"; name = "Dog" };
    { id = "kangaroo"; name = "Kangaroo" };
    { id = "panda"; name = "Panda" };
    { id = "snake"; name = "Snake" };
  |]

(* The rule HeroUI's example gives its validate, here a reading of the value
   the application keeps. *)
let problem = function
  | [||] -> Some "Please select an animal"
  | [| "snake" |] -> Some "Snakes are not allowed"
  | _ -> None

let make () =
  let animal, set_animal = S.create_signal [||] in
  let tried, set_tried = S.create_signal false in
  let error () = if S.get tried then problem (S.get animal) else None in
  <Form
    class_="flex w-[256px] flex-col gap-4"
    on_submit=(fun e ->
                prevent_default e;
                S.set set_tried true;
                if Option.is_none (problem (S.get animal)) then
                  alert "Form submitted successfully!")>
    <Combo_box
      is_required=true
      is_invalid=(Option.is_some (error ()))
      class_="w-full"
      name="animal"
      on_change=(S.set set_animal)>
      <Label>"Favorite Animal"</Label>
      <Combo_box.Input_group>
        <Input placeholder="Search animals..." /> <Combo_box.Trigger />
      </Combo_box.Input_group>
      <Combo_box.Popover>
        <List_box>
          <Solidtype.For each=animals>
            (fun animal _ ->
              <List_box.Item id=animal.id text_value=animal.name>
                (Jsx.string animal.name) <List_box.Item_indicator />
              </List_box.Item>)
          </Solidtype.For>
        </List_box>
      </Combo_box.Popover>
      <Field_error>
        (Jsx.string (Option.value (error ()) ~default:""))
      </Field_error>
    </Combo_box>
    <Button class_="w-fit" type_=`submit>"Submit"</Button>
  </Form>
```

### Read Only

Use the `is_read_only` prop to make the combo box read-only. The selected
value can be focused, but it cannot be changed.

```ocaml title="combo_box_read_only.mlx"
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

let make () =
  <Combo_box is_read_only=true class_="w-[256px]" default_value=[| "cat" |]>
    <Label>"Favorite Animal"</Label>
    <Combo_box.Input_group>
      <Input placeholder="Search animals..." /> <Combo_box.Trigger />
    </Combo_box.Input_group>
    <Combo_box.Popover>
      <List_box>
        <List_box.Item id="aardvark" text_value="Aardvark">
          "Aardvark" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="cat" text_value="Cat">
          "Cat" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="dog" text_value="Dog">
          "Dog" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="kangaroo" text_value="Kangaroo">
          "Kangaroo" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="panda" text_value="Panda">
          "Panda" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="snake" text_value="Snake">
          "Snake" <List_box.Item_indicator />
        </List_box.Item>
      </List_box>
    </Combo_box.Popover>
  </Combo_box>
```

### Multiple Selection

Set ``selection_mode=`multiple`` to allow selecting more than one option. In
multiple selection mode, use `Combo_box.Value` to display the selected items
and pass ``selection_mode=`multiple`` to the inner `List_box` as well.
Selection is controlled with the `value` / `default_value` (`string array`)
props and the `on_change` handler.

```ocaml title="combo_box_multiple_selection.mlx"
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

let make () =
  <Combo_box class_="w-[256px]" selection_mode=`multiple>
    <Label>"Favorite Animals"</Label>
    <Combo_box.Input_group>
      <Input placeholder="Search animals..." /> <Combo_box.Trigger />
    </Combo_box.Input_group>
    <Combo_box.Value placeholder="No animals selected" />
    <Combo_box.Popover>
      <List_box selection_mode=`multiple>
        <List_box.Item id="aardvark" text_value="Aardvark">
          "Aardvark" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="cat" text_value="Cat">
          "Cat" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="dog" text_value="Dog">
          "Dog" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="kangaroo" text_value="Kangaroo">
          "Kangaroo" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="panda" text_value="Panda">
          "Panda" <List_box.Item_indicator />
        </List_box.Item>
        <List_box.Item id="snake" text_value="Snake">
          "Snake" <List_box.Item_indicator />
        </List_box.Item>
      </List_box>
    </Combo_box.Popover>
  </Combo_box>
```

### In Surface

When used inside a [Surface](surface.md) component, use
``variant=`secondary`` to apply the lower emphasis variant suitable for
surface backgrounds.

```ocaml title="combo_box_in_surface.mlx"
module S = Solidtype.Solid
module Button = Solidtype_heroui.Button
module Combo_box = Solidtype_heroui.Combo_box
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Surface = Solidtype_heroui.Surface

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]
external alert : string -> unit = "alert" [@@mel.scope "window"]

let make () =
  let animal, set_animal = S.create_signal [||] in
  (* A required combo box shows its error once a submit has been tried, as
     the browser's validation React Aria reads does. *)
  let tried, set_tried = S.create_signal false in
  let missing () = S.get tried && Array.length (S.get animal) = 0 in
  <Surface class_="w-[320px] rounded-3xl p-6">
    <Form
      class_="flex w-full flex-col gap-4"
      on_submit=(fun e ->
                  prevent_default e;
                  S.set set_tried true;
                  if Array.length (S.get animal) > 0 then
                    alert "Form submitted successfully!")>
      <Combo_box
        is_required=true
        is_invalid=(missing ())
        class_="w-full"
        name="animal"
        variant=`secondary
        on_change=(S.set set_animal)>
        <Label>"Favorite Animal"</Label>
        <Combo_box.Input_group>
          <Input placeholder="Search animals..." /> <Combo_box.Trigger />
        </Combo_box.Input_group>
        <Combo_box.Popover>
          <List_box>
            <List_box.Item id="aardvark" text_value="Aardvark">
              "Aardvark" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="cat" text_value="Cat">
              "Cat" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="dog" text_value="Dog">
              "Dog" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="kangaroo" text_value="Kangaroo">
              "Kangaroo" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="panda" text_value="Panda">
              "Panda" <List_box.Item_indicator />
            </List_box.Item>
            <List_box.Item id="snake" text_value="Snake">
              "Snake" <List_box.Item_indicator />
            </List_box.Item>
          </List_box>
        </Combo_box.Popover>
        <Field_error>"Please select an item in the list."</Field_error>
      </Combo_box>
      <Button type_=`submit>"Submit"</Button>
    </Form>
  </Surface>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="combo_box_tailwind.mlx"
module Combo_box = Solidtype_heroui.Combo_box
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box

let item_class =
  "rounded-lg data-[focused=true]:bg-muted/70 data-[selected=true]:font-medium \
   data-[selected=true]:text-foreground"

let make () =
  <Combo_box class_="w-64 gap-1.5">
    <Label class_="font-medium text-neutral-800 dark:text-neutral-100">
      "Framework"
    </Label>
    <Combo_box.Input_group
      class_="rounded-xl border border-border/80 bg-surface shadow-sm ring-1 \
              ring-black/5 transition-[box-shadow,border-color] \
              focus-within:ring-2 focus-within:ring-neutral-400/25 \
              dark:ring-white/10 dark:focus-within:ring-neutral-500/30">
      <Input placeholder="Search..." />
      <Combo_box.Trigger class_="text-muted" />
    </Combo_box.Input_group>
    <Combo_box.Popover
      class_="rounded-xl border border-border/80 bg-surface p-1 shadow-lg \
              ring-1 ring-black/5 dark:ring-white/10">
      <List_box>
        <List_box.Item class_=item_class id="react" text_value="React">
          "React"
        </List_box.Item>
        <List_box.Item class_=item_class id="vue" text_value="Vue">
          "Vue"
        </List_box.Item>
        <List_box.Item class_=item_class id="svelte" text_value="Svelte">
          "Svelte"
        </List_box.Item>
      </List_box>
    </Combo_box.Popover>
  </Combo_box>
```

### Global CSS

To customize the ComboBox component classes, you can use the
`@layer components` directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .combo-box {
    @apply flex flex-col gap-1;
  }

  .combo-box__input-group {
    @apply relative inline-flex items-center;
  }

  .combo-box__trigger {
    @apply absolute right-0 text-muted;
  }

  .combo-box__popover {
    @apply rounded-lg border border-border bg-surface p-2;
  }
}
```

## Styling Reference

### CSS Classes

- `.combo-box` - Base ComboBox container
- `.combo-box--full-width` - Full width modifier
- `.combo-box__input-group` - Container for the input and trigger button
- `.combo-box__input-group--full-width` - Full width input group
- `.combo-box__value` - The selected value display (used in multiple
  selection)
- `.combo-box__trigger` - The button that triggers the popover
- `.combo-box__popover` - The popover container

### Interactive States

- **Open**: `[data-open="true"]` on the combo box and its trigger
- **Focus**: `[data-focused="true"]` on the combo box and its input, and
  `[data-focus-visible="true"]` on its input and trigger
- **Hover** and **Pressed**: `[data-hovered="true"]`, `[data-pressed="true"]`
  on the trigger, pressed while the list is open
- **Placeholder**: `[data-placeholder="true"]` on the value
- **Invalid**, **Disabled**, **Read-only**, **Required**:
  `[data-invalid="true"]`, `[data-disabled="true"]`, `[data-readonly="true"]`,
  `[data-required="true"]` on the combo box
- **Entering** and **Exiting**: `[data-entering="true"]`,
  `[data-exiting="true"]` on the popover

## API Reference

Each prop beside the name HeroUI's React component gives it.

### ComboBox

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `selectionMode` | `selection_mode` | `` `single `` \| `` `multiple `` | `` `single `` | Whether single or multiple selection is enabled, read as it is made |
| `value`, `selectedKey` | `value` | `string array` | | The currently selected keys (controlled) |
| `defaultValue`, `defaultSelectedKey` | `default_value` | `string array` | | The initial selected keys (uncontrolled) |
| `onChange`, `onSelectionChange` | `on_change` | `string array -> unit` | | Handler called when the selection changes |
| `inputValue` | `input_value` | `string` | | Current input value (controlled) |
| `defaultInputValue` | `default_input_value` | `string` | | Default input value (uncontrolled) |
| `onInputChange` | `on_input_change` | `string -> unit` | | Handler called when the input value changes |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Told as the list opens or closes |
| `disabledKeys` | `disabled_keys` | `string array` | | Keys of disabled items |
| `defaultFilter` | `default_filter` | `string -> string -> bool` | contains | Custom filter function for filtering items, given an option's text and the input's |
| `menuTrigger` | `menu_trigger` | `` `focus `` \| `` `input `` \| `` `manual `` | `` `focus `` | The interaction required to display the ComboBox menu |
| `allowsCustomValue` | `allows_custom_value` | `bool` | `false` | Whether the ComboBox allows custom values not in the list |
| `allowsEmptyCollection` | `allows_empty_collection` | `bool` | `false` | Whether the ComboBox allows an empty collection |
| `shouldFocusWrap` | `should_focus_wrap` | `bool` | `false` | Whether keyboard navigation is circular |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the ComboBox is disabled |
| `isReadOnly` | `is_read_only` | `bool` | `false` | Whether the input can be selected but not changed by the user |
| `isRequired` | `is_required` | `bool` | `false` | Whether user input is required |
| `isInvalid` | `is_invalid` | `bool` | `false` | Whether the ComboBox value is invalid |
| `name` | `name` | `string` | | The name of the input, used when submitting an HTML form |
| `formValue` | `form_value` | `` `key `` \| `` `text `` | `` `key `` | Whether the text or key of the selected item is submitted as part of an HTML form. When `allows_custom_value` is true, the text is always submitted |
| `onBlur` | `on_blur` | `Dom.focusEvent -> unit` | | Told as the focus leaves it |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the ComboBox should take full width of its container |
| `variant` | `variant` | `` `primary `` \| `` `secondary `` | `` `primary `` | Visual variant of the component. `` `primary `` is the default style with shadow. `` `secondary `` is a lower emphasis variant without shadow, suitable for use in surfaces |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Its label, input group, value, description and popover |

### ComboBox.InputGroup, ComboBox.Trigger, ComboBox.Popover

| React | solidtype | Type | Description |
|---|---|---|---|
| `placement` | `placement` | `` `top `` \| `` `bottom `` \| `` `left `` \| `` `right `` | Placement of the popover relative to the trigger, `bottom` by default |
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | What it holds; the trigger's own icon |

### ComboBox.Value

Renders the selected values of a combo box, or a placeholder if no value is
selected. By default the selected items are rendered as a list in the
reader's language, "Cat, Dog, and Panda". Use the render function to customize this (for example, to display
tags).

| React | solidtype | Type | Description |
|---|---|---|---|
| `placeholder` | `placeholder` | `string` | A value to display when no items are selected |
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | `string array accessor -> element` | Custom render function for the selected values, given the ids chosen |

## Accessibility

`Combo_box` implements the ARIA combobox pattern and provides:

- Full keyboard navigation support: the arrows move through the options while
  the focus stays in the input, Enter or a press chooses one, and Escape
  closes the list
- Filtering by the input's text, whatever its case or accents
- Proper focus management
- Support for disabled states
- HTML form integration: a form is sent the ids chosen, or the input's text
  where it is the value
- Support for custom values: Escape on a closed list, or leaving the input,
  puts back the text of the option chosen, unless custom values are allowed

While the list is open, the rest of the page stays reachable by a screen
reader.
