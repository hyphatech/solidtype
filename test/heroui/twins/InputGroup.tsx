// HeroUI's InputGroup in React, alone and in a TextField, which the
// solidtype port's test renders under the same props, to compare every
// part, and walks as it walks the port's.

import { Description, InputGroup, Label, TextField } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  variant?: "primary" | "secondary";
  fullWidth?: boolean;
  inField: boolean;
  multiline: boolean;
};

export function render({ inField, multiline, ...props }: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  const group = (
    <InputGroup {...props}>
      <InputGroup.Prefix>https://</InputGroup.Prefix>
      {multiline ? (
        <InputGroup.TextArea aria-label={inField ? undefined : "Note"} placeholder="note" />
      ) : (
        <InputGroup.Input aria-label={inField ? undefined : "Site"} placeholder="heroui" />
      )}
      <InputGroup.Suffix>.com</InputGroup.Suffix>
    </InputGroup>
  );
  act(() =>
    root.render(
      inField ? (
        <TextField name="site">
          <Label>Site</Label>
          {group}
          <Description>Your site.</Description>
        </TextField>
      ) : (
        group
      ),
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
      <TextField aria-label="Field" isDisabled={isDisabled} isReadOnly={isReadOnly} isInvalid={isInvalid} isRequired={isRequired}>
        {(r) => (
          <>
            <span data-words="field">
              {words([
                ["disabled", r.isDisabled],
                ["invalid", r.isInvalid],
                ["read-only", r.isReadOnly],
                ["required", r.isRequired],
              ])}
            </span>
            <InputGroup>
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
                  <InputGroup.Input />
                </>
              )}
            </InputGroup>
          </>
        )}
      </TextField>,
    ),
  );
  mounted = { root, host };
  const group = host.querySelector("[data-slot=input-group]");
  if (!(group instanceof HTMLElement)) throw new Error("HeroUI's field rendered no group");
  return group;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
