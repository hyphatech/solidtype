// HeroUI's AvatarGroup in React, which the solidtype port's test renders
// under the same props, to compare the group, the avatars it shows and its
// count.

import { Avatar, AvatarGroup } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  size?: "sm" | "md" | "lg";
  color?: "default" | "accent" | "success" | "warning" | "danger";
  variant?: "default" | "soft";
  max?: number;
  isGrid?: boolean;
  overlap?: "clip" | "ring";
  count?: string;
};

// Four avatars, the first of its own color, and the count, if given.
export function render({ count, ...props }: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <AvatarGroup {...props} className="ms-1">
        <Avatar color="danger">
          <Avatar.Fallback>A1</Avatar.Fallback>
        </Avatar>
        <Avatar>
          <Avatar.Fallback>A2</Avatar.Fallback>
        </Avatar>
        <Avatar>
          <Avatar.Fallback>A3</Avatar.Fallback>
        </Avatar>
        <Avatar>
          <Avatar.Fallback>A4</Avatar.Fallback>
        </Avatar>
        {count && <AvatarGroup.Count>{count}</AvatarGroup.Count>}
      </AvatarGroup>,
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
