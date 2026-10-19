import * as Search from "@kobalte/core/search";
import { createSignal } from "solid-js";

const fruits = ["Apple", "Banana", "Blueberry", "Cherry"];

function matching(query: string) {
  if (query === "") return [];
  const prefix = query.toLowerCase();
  return fruits.filter((f) => f.toLowerCase().startsWith(prefix));
}

export function make() {
  const [options, setOptions] = createSignal<string[]>([]);
  const [chosen, setChosen] = createSignal("");
  return (
    <div>
      <Search.Root<string>
        options={options()}
        onInputChange={(query) => setOptions(matching(query))}
        onChange={(fruit) => setChosen(fruit ?? "")}
        itemComponent={(props) => (
          <Search.Item item={props.item}>
            <Search.ItemLabel>{props.item.rawValue}</Search.ItemLabel>
          </Search.Item>
        )}>
        <Search.Label>Fruit</Search.Label>
        <Search.Control>
          <Search.Indicator>Find</Search.Indicator>
          <Search.Input />
        </Search.Control>
        <Search.Portal>
          <Search.Content>
            <Search.Listbox />
            <Search.NoResult>No fruit</Search.NoResult>
          </Search.Content>
        </Search.Portal>
      </Search.Root>
      <p>Chosen: {chosen()}</p>
    </div>
  );
}
