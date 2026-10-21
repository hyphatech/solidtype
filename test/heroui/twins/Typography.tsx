// HeroUI's Typography in React, and its primitives, which the solidtype
// port's test renders under the same props, to compare the elements.

import { Typography } from "@heroui/react";
import { act, type ReactNode } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

function mount(node: ReactNode): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(node));
  mounted = { root, host };
  return host;
}

export function render(props: Parameters<typeof Typography>[0]): HTMLElement {
  return mount(<Typography {...props}>Text</Typography>);
}

// Each primitive once, as the port's test renders them.
export function primitives(): HTMLElement {
  return mount(
    <>
      <Typography.Heading level={3}>Heading</Typography.Heading>
      <Typography.Paragraph size="xs" color="muted">
        Paragraph
      </Typography.Paragraph>
      <Typography.Paragraph>Paragraph</Typography.Paragraph>
      <Typography.Code>Code</Typography.Code>
      <Typography.Prose className="gap-3">
        <p>Prose</p>
      </Typography.Prose>
    </>,
  );
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
