// HeroUI's Label in React, which the solidtype port's test renders under the
// same props, to compare the two labels.

import { Label } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = { isRequired?: boolean; isDisabled?: boolean; isInvalid?: boolean };

export function render(props: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<Label {...props} className="ms-1">Email</Label>));
  mounted = { root, host };
  const label = host.firstElementChild;
  if (!(label instanceof HTMLElement)) throw new Error("HeroUI's Label rendered nothing");
  return label;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
