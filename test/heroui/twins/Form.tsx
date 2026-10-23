// HeroUI's Form in React, a text field of every part and a submit button,
// which the solidtype port's test renders under the same server errors, to
// compare the field as it is shown and then changed.

import { Button, FieldError, Form, Input, Label, TextField } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = { validationErrors?: Record<string, string> };

export function render(props: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Form {...props} onSubmit={(e) => e.preventDefault()}>
        <TextField name="email">
          <Label>Email</Label>
          <Input />
          <FieldError />
        </TextField>
        <Button type="submit">Save</Button>
      </Form>,
    ),
  );
  mounted = { root, host };
  return host;
}

export async function step(action: () => Promise<void>): Promise<void> {
  await act(action);
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
