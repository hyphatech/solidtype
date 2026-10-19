import * as Combobox from "@kobalte/core/combobox";

export function make() {
  return (
    <Combobox.Root<string>
      options={["Apple", "Banana", "Blueberry", "Cherry"]}
      placeholder={<span>Pick a fruit</span>}
      itemComponent={(props) => (
        <Combobox.Item item={props.item}>
          <Combobox.ItemLabel>{props.item.rawValue}</Combobox.ItemLabel>
        </Combobox.Item>
      )}>
      <Combobox.Label>Fruit</Combobox.Label>
      <Combobox.Control>
        <Combobox.Input />
        <Combobox.Trigger>
          <Combobox.Icon />
        </Combobox.Trigger>
      </Combobox.Control>
      <Combobox.Portal>
        <Combobox.Content><Combobox.Listbox /></Combobox.Content>
      </Combobox.Portal>
    </Combobox.Root>
  );
}
