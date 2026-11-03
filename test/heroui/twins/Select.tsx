// HeroUI's Select in React: one option of a list, with its label,
// placeholder, description and clear button, or many, which the solidtype
// port's test renders under the same props, to compare the select, its list
// and the focus, and steps as it steps the port's.

import { Description, Label, ListBox, Select } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

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

// A select whose root and trigger draw their children of their state, as
// words in an element marked with each one's name; its trigger, to walk.
export function renderOfState(disabled: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Select aria-label="State" isDisabled={disabled}>
        {(r) => (
          <>
            <span data-words="select">
              {words([
                ["focused", r.isFocused],
                ["focus-visible", r.isFocusVisible],
                ["disabled", r.isDisabled],
                ["open", r.isOpen],
                ["invalid", r.isInvalid],
                ["required", r.isRequired],
              ])}
            </span>
            <Select.Trigger>
              {(s) => (
                <span data-words="trigger">
                  {words([
            ["hovered", s.isHovered],
            ["pressed", s.isPressed],
            ["focused", s.isFocused],
            ["focus-visible", s.isFocusVisible],
                    ["disabled", s.isDisabled],
                  ])}
                </span>
              )}
            </Select.Trigger>
            <Select.Popover>
              <ListBox>
                <ListBox.Item id="florida">Florida</ListBox.Item>
                <ListBox.Item id="texas">Texas</ListBox.Item>
              </ListBox>
            </Select.Popover>
          </>
        )}
      </Select>,
    ),
  );
  mounted = { root, host };
  const trigger = host.querySelector("button");
  if (!trigger) throw new Error("HeroUI's Select rendered no trigger");
  return trigger;
}

// A select of options chosen whose value draws its children of them, the
// text it is given.
export function renderValueOfState(multiple: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Select
        aria-label="State"
        selectionMode={multiple ? "multiple" : "single"}
        defaultValue={multiple ? ["florida", "utah"] : "florida"}
      >
        <Select.Trigger>
          <Select.Value>{(s) => <span data-words="value">{s.selectedText}</span>}</Select.Value>
        </Select.Trigger>
        <Select.Popover>
          <ListBox selectionMode={multiple ? "multiple" : "single"}>
            <ListBox.Item id="florida" textValue="Florida">Florida</ListBox.Item>
            <ListBox.Item id="utah" textValue="Utah">Utah</ListBox.Item>
          </ListBox>
        </Select.Popover>
      </Select>,
    ),
  );
  mounted = { root, host };
  return host;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
