// HeroUI's Autocomplete in React: a select of states whose popover filters
// its list by a search field, one to choose or many, with its label,
// description and clear button, which the solidtype port's test renders
// under the same props, to compare the autocomplete, its list and the focus,
// and steps as it steps the port's.

import { Autocomplete, Description, Label, ListBox, SearchField, useFilter } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  multiple: boolean;
  // What the autocomplete tells, written into the page as it is told.
  told: (said: string) => void;
};

function States({ multiple, told }: Props) {
  const { contains } = useFilter({ sensitivity: "base" });
  return (
    <Autocomplete
      placeholder="Select one"
      selectionMode={multiple ? "multiple" : "single"}
      disabledKeys={["texas"]}
      name="state"
      onChange={(value) =>
        told(`changed ${Array.isArray(value) ? [...value].sort().join(" ") : String(value)}`)
      }
    >
      <Label>State</Label>
      <Autocomplete.Trigger>
        <Autocomplete.Value />
        <Autocomplete.ClearButton />
        <Autocomplete.Indicator />
      </Autocomplete.Trigger>
      <Description>Where you live</Description>
      <Autocomplete.Popover>
        <Autocomplete.Filter filter={contains}>
          <SearchField autoFocus aria-label="Search options" name="search" variant="secondary">
            <SearchField.Group>
              <SearchField.SearchIcon />
              <SearchField.Input placeholder="Search..." />
            </SearchField.Group>
          </SearchField>
          <ListBox selectionMode={multiple ? "multiple" : "single"}>
            <ListBox.Item id="florida" textValue="Florida">
              Florida
              <ListBox.ItemIndicator />
            </ListBox.Item>
            <ListBox.Item id="texas" textValue="Texas">
              Texas
              <ListBox.ItemIndicator />
            </ListBox.Item>
            <ListBox.Item id="utah" textValue="Utah">
              Utah
              <ListBox.ItemIndicator />
            </ListBox.Item>
          </ListBox>
        </Autocomplete.Filter>
      </Autocomplete.Popover>
    </Autocomplete>
  );
}

export function render(props: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <div>
        <button type="button">Before</button>
        <States {...props} />
        <button type="button">After</button>
      </div>,
    ),
  );
  mounted = { root, host };
  return host;
}

export async function step(action: () => Promise<unknown>): Promise<void> {
  await act(async () => {
    await action();
  });
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
