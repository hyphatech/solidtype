// HeroUI's ComboBox in React: an input that filters a list of animals, one
// to choose or many, with its label, description and the value chosen, which
// the solidtype port's test renders under the same props, to compare the
// combo box, its list and the focus, and steps as it steps the port's.

import { ComboBox, Description, Input, Label, ListBox } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  multiple: boolean;
  // What the combo box tells, written into the page as it is told.
  told: (said: string) => void;
};

export function render({ multiple, told }: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <div>
        <button type="button">Before</button>
        <ComboBox
          selectionMode={multiple ? "multiple" : "single"}
          disabledKeys={["dog"]}
          name="animal"
          onChange={(value) =>
            told(`changed ${Array.isArray(value) ? [...value].sort().join(" ") : String(value)}`)
          }
          onInputChange={(text) => told(`typed ${text}`)}
        >
          <Label>Favorite Animal</Label>
          <ComboBox.InputGroup>
            <Input placeholder="Search animals..." />
            <ComboBox.Trigger />
          </ComboBox.InputGroup>
          {multiple ? <ComboBox.Value placeholder="No animals selected" /> : null}
          <Description>Pick the one you like</Description>
          <ComboBox.Popover>
            <ListBox selectionMode={multiple ? "multiple" : "single"}>
              <ListBox.Item id="cat" textValue="Cat">
                Cat
                <ListBox.ItemIndicator />
              </ListBox.Item>
              <ListBox.Item id="dog" textValue="Dog">
                Dog
                <ListBox.ItemIndicator />
              </ListBox.Item>
              <ListBox.Item id="kangaroo" textValue="Kangaroo">
                Kangaroo
                <ListBox.ItemIndicator />
              </ListBox.Item>
              <ListBox.Item id="panda" textValue="Panda">
                Panda
                <ListBox.ItemIndicator />
              </ListBox.Item>
            </ListBox>
          </ComboBox.Popover>
        </ComboBox>
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

// A combo box of several options chosen whose value draws its children of
// them, the text it is given.
export function renderValueOfState(multiple: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <ComboBox
        aria-label="Animal"
        selectionMode={multiple ? "multiple" : "single"}
        defaultValue={multiple ? ["cat", "panda"] : "cat"}
      >
        <ComboBox.InputGroup>
          <Input />
          <ComboBox.Trigger />
        </ComboBox.InputGroup>
        <ComboBox.Value>{(s) => <span data-words="value">{s.selectedText}</span>}</ComboBox.Value>
        <ComboBox.Popover>
          <ListBox selectionMode={multiple ? "multiple" : "single"}>
            <ListBox.Item id="cat" textValue="Cat">Cat</ListBox.Item>
            <ListBox.Item id="panda" textValue="Panda">Panda</ListBox.Item>
          </ListBox>
        </ComboBox.Popover>
      </ComboBox>,
    ),
  );
  mounted = { root, host };
  return host;
}

// A combo box whose root draws its children of its state, as words in an
// element marked with its name.
export function renderRootOfState(
  isDisabled: boolean,
  isReadOnly: boolean,
  isInvalid: boolean,
  isRequired: boolean,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <ComboBox aria-label="Animal" isDisabled={isDisabled} isReadOnly={isReadOnly} isInvalid={isInvalid} isRequired={isRequired}>
        {(r) => (
          <>
            <span data-words="combo-box">
              {words([
                ["open", r.isOpen],
                ["disabled", r.isDisabled],
                ["invalid", r.isInvalid],
                ["required", r.isRequired],
                ["read-only", r.isReadOnly],
              ])}
            </span>
            <ComboBox.InputGroup>
              <Input />
              <ComboBox.Trigger />
            </ComboBox.InputGroup>
            <ComboBox.Popover>
              <ListBox>
                <ListBox.Item id="cat">Cat</ListBox.Item>
              </ListBox>
            </ComboBox.Popover>
          </>
        )}
      </ComboBox>,
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
