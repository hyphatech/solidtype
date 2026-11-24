// HeroUI's Toolbar in React, as its documentation's usage draws it, between a
// button before and one after, which the solidtype port's test renders under
// the same props, to compare the toolbar and what is inside it.

import { Button, ButtonGroup, Separator, ToggleButton, ToggleButtonGroup, Toolbar } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  orientation?: "horizontal" | "vertical";
  isAttached?: boolean;
};

export function render(props: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <div>
        <button type="button">Before</button>
        <Toolbar aria-label="Text formatting" {...props}>
          <ToggleButtonGroup aria-label="Text style" selectionMode="multiple">
            <ToggleButton isIconOnly aria-label="Bold" id="bold">
              B
            </ToggleButton>
            <ToggleButton isIconOnly aria-label="Italic" id="italic">
              <ToggleButtonGroup.Separator />I
            </ToggleButton>
          </ToggleButtonGroup>
          <Separator />
          <ButtonGroup variant="tertiary">
            <Button isIconOnly aria-label="Copy">
              C
            </Button>
            <Button isIconOnly aria-label="Cut">
              <ButtonGroup.Separator />X
            </Button>
          </ButtonGroup>
        </Toolbar>
        <button type="button">After</button>
      </div>,
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
