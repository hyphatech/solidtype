// HeroUI's Autocomplete in React: a select of states whose popover filters
// its list by a search field, one to choose or many, with its label,
// description and clear button, which the solidtype port's test renders
// under the same props, to compare the autocomplete, its list and the focus,
// and steps as it steps the port's.

import { Autocomplete, Description, Label, ListBox, SearchField, useFilter } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

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

// An autocomplete of options chosen whose value draws its children of them,
// the text it is given.
export function renderValueOfState(multiple: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Autocomplete
        aria-label="State"
        selectionMode={multiple ? "multiple" : "single"}
        defaultValue={multiple ? ["florida", "utah"] : "florida"}
      >
        <Autocomplete.Trigger>
          <Autocomplete.Value>{(s) => <span data-words="value">{s.selectedText}</span>}</Autocomplete.Value>
        </Autocomplete.Trigger>
        <Autocomplete.Popover>
          <ListBox selectionMode={multiple ? "multiple" : "single"}>
            <ListBox.Item id="florida" textValue="Florida">Florida</ListBox.Item>
            <ListBox.Item id="utah" textValue="Utah">Utah</ListBox.Item>
          </ListBox>
        </Autocomplete.Popover>
      </Autocomplete>,
    ),
  );
  mounted = { root, host };
  return host;
}

// An autocomplete whose root and trigger draw their children of their state,
// as words in an element marked with each one's name.
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
      <Autocomplete aria-label="State" isDisabled={isDisabled} isReadOnly={isReadOnly} isInvalid={isInvalid} isRequired={isRequired}>
        {(r) => (
          <>
            <span data-words="autocomplete">
              {words([
                ["focused", r.isFocused],
                ["focus-visible", r.isFocusVisible],
                ["disabled", r.isDisabled],
                ["open", r.isOpen],
                ["invalid", r.isInvalid],
                ["required", r.isRequired],
              ])}
            </span>
            <Autocomplete.Trigger>
              {(t) => (
                <span data-words="trigger">
                  {words([
                    ["hovered", t.isHovered],
                    ["focus-within", t.isFocusWithin],
                    ["focus-visible", t.isFocusVisible],
                    ["disabled", t.isDisabled],
                    ["invalid", t.isInvalid],
                  ])}
                </span>
              )}
            </Autocomplete.Trigger>
            <Autocomplete.Popover>
              <ListBox>
                <ListBox.Item id="florida">Florida</ListBox.Item>
              </ListBox>
            </Autocomplete.Popover>
          </>
        )}
      </Autocomplete>,
    ),
  );
  mounted = { root, host };
  const trigger = host.querySelector("[data-slot=autocomplete-trigger]");
  if (!(trigger instanceof HTMLElement)) throw new Error("HeroUI's Autocomplete rendered no trigger");
  return trigger;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
