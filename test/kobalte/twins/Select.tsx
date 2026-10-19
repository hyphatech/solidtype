import * as Select from "@kobalte/core/select";

export function make() {
  return (
    <Select.Root<string>
      options={["Apple", "Banana"]}
      placeholder={<span>Pick a fruit</span>}
      itemComponent={(props) => (
        <Select.Item item={props.item}>
          <Select.ItemLabel>{props.item.rawValue}</Select.ItemLabel>
        </Select.Item>
      )}>
      <Select.Label>Fruit</Select.Label>
      <Select.Trigger>
        <Select.Value<string>>{(state) => <span>{state.selectedOption()}</span>}</Select.Value>
      </Select.Trigger>
      <Select.Portal>
        <Select.Content><Select.Listbox /></Select.Content>
      </Select.Portal>
    </Select.Root>
  );
}
