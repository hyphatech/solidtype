// HeroUI's Select in React: one option of a list, with its label,
// placeholder, description and clear button, or many, which the solidtype
// port's test renders under the same props, to compare the select, its list
// and the focus, and steps as it steps the port's.

import { Description, Label, ListBox, Select } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  multiple: boolean;
  // What the select tells, written into the page as it is told.
  told: (said: string) => void;
};

export function render({ multiple, told }: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <div>
        <button type="button">Before</button>
        <Select
          placeholder="Select one"
          selectionMode={multiple ? "multiple" : "single"}
          disabledKeys={["texas"]}
          onChange={(value) =>
            told(`changed ${Array.isArray(value) ? [...value].sort().join(" ") : String(value)}`)
          }
        >
          <Label>State</Label>
          <Select.Trigger>
            <Select.Value />
            <Select.ClearButton />
            <Select.Indicator />
          </Select.Trigger>
          <Description>Where you live</Description>
          <Select.Popover>
            <ListBox>
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
          </Select.Popover>
        </Select>
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
