// HeroUI's ButtonGroup in React, which the solidtype port's test renders
// under the same props, to compare the group, its buttons and its separator.

import { Button, ButtonGroup } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  variant?: "primary" | "secondary" | "tertiary" | "ghost" | "danger";
  size?: "sm" | "md" | "lg";
  orientation?: "horizontal" | "vertical";
  fullWidth?: boolean;
  isDisabled?: boolean;
};

// A group of three buttons, the last of its own variant and enabled, as the
// port's test renders it.
export function render(props: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <ButtonGroup {...props}>
        <Button>One</Button>
        <Button>
          <ButtonGroup.Separator />
          Two
        </Button>
        <Button variant="outline" isDisabled={false}>
          <ButtonGroup.Separator />
          Three
        </Button>
      </ButtonGroup>,
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
