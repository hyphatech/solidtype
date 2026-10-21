// HeroUI's Fieldset in React, a field, a radio group, a button and a link in
// it, which the solidtype port's test renders under the same props, to
// compare every part, and the disabled state the fieldset gives them.

import {
  Button,
  Description,
  Fieldset,
  Input,
  Label,
  Link,
  Radio,
  RadioGroup,
  TextField,
} from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

export function render(disabled: boolean, buttonEnabled: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Fieldset disabled={disabled} className="max-w-96">
        <Fieldset.Legend>Profile</Fieldset.Legend>
        <Description>Update your profile.</Description>
        <Fieldset.Group>
          <TextField name="name">
            <Label>Name</Label>
            <Input />
          </TextField>
          <RadioGroup defaultValue="pro" name="plan">
            <Label>Plan</Label>
            <Radio value="pro">
              <Radio.Content>
                <Radio.Control>
                  <Radio.Indicator />
                </Radio.Control>
                Pro
              </Radio.Content>
            </Radio>
          </RadioGroup>
        </Fieldset.Group>
        <Fieldset.Actions>
          <Button type="submit">Save</Button>
          <Button isDisabled={buttonEnabled ? false : undefined} variant="secondary">
            Cancel
          </Button>
          <Link href="#help">Help</Link>
        </Fieldset.Actions>
      </Fieldset>,
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
