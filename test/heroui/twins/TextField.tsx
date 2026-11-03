// HeroUI's TextField in React and the parts it holds, and its Input and
// TextArea alone, which the solidtype port's test renders under the same
// props, to compare every element, and walks as it walks the port's.

import { Description, FieldError, Form, Input, Label, TextArea, TextField } from "@heroui/react";
import { act, type ReactNode } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

function mount(node: ReactNode): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(node));
  mounted = { root, host };
  return host;
}

type Field = {
  variant?: "primary" | "secondary";
  fullWidth?: boolean;
  isRequired?: boolean;
  isDisabled?: boolean;
  isInvalid?: boolean;
  isReadOnly?: boolean;
  defaultValue?: string;
  multiline?: boolean;
};

// A field of every part: its label, its input or text area, its description
// and its error.
export function field({ multiline, ...props }: Field): HTMLElement {
  return mount(
    <TextField {...props} name="email" className="max-w-64">
      <Label>Email</Label>
      {multiline ? <TextArea placeholder="Your message" /> : <Input placeholder="Enter your email" />}
      <Description>We'll never share it.</Description>
      <FieldError>Enter a valid email.</FieldError>
    </TextField>,
  );
}

type Alone = {
  variant?: "primary" | "secondary";
  fullWidth?: boolean;
  disabled?: boolean;
  multiline?: boolean;
};

export function alone({ multiline, ...props }: Alone): HTMLElement {
  return mount(
    multiline ? (
      <TextArea {...props} placeholder="Your message" aria-label="Message" />
    ) : (
      <Input {...props} placeholder="Name" aria-label="Name" />
    ),
  );
}

export async function step(action: () => Promise<unknown>): Promise<void> {
  await act(async () => {
    await action();
  });
}

// A field a form gives an error, whose error draws its children of its state,
// as text in an element marked with its name.
export function renderErrorOfState(_: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Form validationErrors={{ email: "Too short." }}>
        <TextField name="email">
          <Label>Email</Label>
          <Input />
          <FieldError>
            {(s) => (
              <span data-words="error">{`${s.isInvalid}|${s.validationErrors.join(",")}`}</span>
            )}
          </FieldError>
        </TextField>
      </Form>,
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
