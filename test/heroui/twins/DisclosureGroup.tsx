// HeroUI's DisclosureGroup in React, three disclosures inside it, which the
// solidtype port's test renders under the same props, to compare every
// part, and steps as it steps the port's.

import { Disclosure, DisclosureGroup } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  defaultExpandedKeys?: string[];
  allowsMultipleExpanded?: boolean;
  isDisabled?: boolean;
  // The key of the one disclosure given isDisabled of its own.
  disabled?: string;
};

export function render(
  { disabled, ...props }: Props,
  onExpandedChange: (keys: string[]) => void,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <DisclosureGroup {...props} onExpandedChange={(keys) => onExpandedChange([...keys].map(String))}>
        {["shipping", "returns", "warranty"].map((key) => (
          <Disclosure key={key} id={key} isDisabled={key === disabled ? true : undefined}>
            <Disclosure.Heading>
              <Disclosure.Trigger>
                {key}
                <Disclosure.Indicator />
              </Disclosure.Trigger>
            </Disclosure.Heading>
            <Disclosure.Content>
              <Disclosure.Body>About {key}.</Disclosure.Body>
            </Disclosure.Content>
          </Disclosure>
        ))}
      </DisclosureGroup>,
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
