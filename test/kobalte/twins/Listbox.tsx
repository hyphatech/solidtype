import * as Listbox from "@kobalte/core/listbox";

export function make() {
  return (
    <Listbox.Root<string>
      aria-label="Fruit"
      options={["Apple", "Banana", "Cherry"]}
      renderItem={(item) => (
        <Listbox.Item item={item}>
          <Listbox.ItemLabel>{item.rawValue}</Listbox.ItemLabel>
          <Listbox.ItemDescription>{`${item.rawValue} in season`}</Listbox.ItemDescription>
        </Listbox.Item>
      )}
    />
  );
}
