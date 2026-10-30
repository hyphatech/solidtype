// HeroUI's Tabs in React, three tabs and their panels, which the solidtype
// port's test renders under the same props, to compare every part, and steps
// as it steps the port's.

import { Tabs } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  selectedKey?: string;
  defaultSelectedKey?: string;
  orientation?: "horizontal" | "vertical";
  variant?: "primary" | "secondary";
  align?: "start" | "center" | "end";
  keyboardActivation?: "automatic" | "manual";
  isDisabled?: boolean;
  // The key of the one tab given isDisabled of its own.
  disabled?: string;
  // Whether the list is held by Tabs.ListContainer.
  container?: boolean;
  // Whether each tab is a link, to #<key>.
  links?: boolean;
};

export function render(
  { disabled, container, links, ...props }: Props,
  onSelectionChange: (key: string) => void,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  const list = (
    <Tabs.List aria-label="Options">
      {["overview", "analytics", "reports"].map((key, i) => (
        <Tabs.Tab
          key={key}
          id={key}
          href={links ? `#${key}` : undefined}
          isDisabled={key === disabled ? true : undefined}
        >
          {i > 0 ? <Tabs.Separator /> : null}
          {key}
          <Tabs.Indicator />
        </Tabs.Tab>
      ))}
    </Tabs.List>
  );
  act(() =>
    root.render(
      <Tabs {...props} onSelectionChange={(key) => onSelectionChange(String(key))}>
        {container ? <Tabs.ListContainer>{list}</Tabs.ListContainer> : list}
        {["overview", "analytics", "reports"].map((key) => (
          <Tabs.Panel key={key} id={key}>
            About {key}.
          </Tabs.Panel>
        ))}
      </Tabs>,
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

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
