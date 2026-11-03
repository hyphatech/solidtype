// HeroUI's SearchField in React, its label, group, icon, input, clear button
// and description, which the solidtype port's test renders under the same
// props, to compare every part, and types into as it types into the port's.

import { Description, Label, SearchField } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  variant?: "primary" | "secondary";
  fullWidth?: boolean;
  isDisabled?: boolean;
  isInvalid?: boolean;
};

export function render(
  props: Props,
  onChange: (value: string) => void,
  onSubmit: (value: string) => void,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <SearchField {...props} name="search" onChange={onChange} onSubmit={onSubmit}>
        <Label>Search</Label>
        <SearchField.Group>
          <SearchField.SearchIcon />
          <SearchField.Input placeholder="Search..." />
          <SearchField.ClearButton />
        </SearchField.Group>
        <Description>Find a task.</Description>
      </SearchField>,
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

// A field whose root and group draw their children of their state, as words
// in an element marked with each one's name; its group, to glance at.
export function renderOfState(
  isDisabled: boolean,
  isReadOnly: boolean,
  isInvalid: boolean,
  isRequired: boolean,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <SearchField aria-label="Field" isDisabled={isDisabled} isReadOnly={isReadOnly} isInvalid={isInvalid} isRequired={isRequired}>
        {(r) => (
          <>
            <span data-words="field">
              {words([
                ["empty", r.isEmpty],
                ["disabled", r.isDisabled],
                ["invalid", r.isInvalid],
                ["read-only", r.isReadOnly],
                ["required", r.isRequired],
              ])}
            </span>
            <SearchField.Group>
              {(g) => (
                <>
                  <span data-words="group">
                  {words([
                    ["hovered", g.isHovered],
                    ["focus-within", g.isFocusWithin],
                    ["focus-visible", g.isFocusVisible],
                    ["disabled", g.isDisabled],
                    ["invalid", g.isInvalid],
                  ])}
                </span>
                  <SearchField.Input />
                </>
              )}
            </SearchField.Group>
          </>
        )}
      </SearchField>,
    ),
  );
  mounted = { root, host };
  const group = host.querySelector("[data-slot=search-field-group]");
  if (!(group instanceof HTMLElement)) throw new Error("HeroUI's field rendered no group");
  return group;
}

// A search field of a text whose clear button draws its children of its
// state, as words in an element marked with its name; that button, to glance
// at.
export function renderClearOfState(isDisabled: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <SearchField aria-label="Search" defaultValue="cats" isDisabled={isDisabled}>
        <SearchField.Group>
          <SearchField.Input />
          <SearchField.ClearButton>
            {(s) => (
              <span data-words="clear">
                {words([
                  ["hovered", s.isHovered],
                  ["pressed", s.isPressed],
                  ["focused", s.isFocused],
                  ["focus-visible", s.isFocusVisible],
                  ["disabled", s.isDisabled],
                ])}
              </span>
            )}
          </SearchField.ClearButton>
        </SearchField.Group>
      </SearchField>,
    ),
  );
  mounted = { root, host };
  const button = host.querySelector("[data-slot=search-field-clear-button]");
  if (!(button instanceof HTMLElement)) throw new Error("HeroUI's SearchField rendered no clear button");
  return button;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
