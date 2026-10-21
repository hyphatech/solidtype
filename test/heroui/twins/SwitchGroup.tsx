// HeroUI's SwitchGroup in React, which the solidtype port's test renders
// under the same props, to compare the group and its items.

import { Switch, SwitchGroup } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

export function render(orientation: "horizontal" | "vertical" | undefined): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <SwitchGroup orientation={orientation} className="ms-1">
        <Switch name="notifications">
          <Switch.Content>
            <Switch.Control>
              <Switch.Thumb />
            </Switch.Control>
            Notifications
          </Switch.Content>
        </Switch>
      </SwitchGroup>,
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
