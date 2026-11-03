// HeroUI's ToggleButton and ToggleButtonGroup in React, on React Aria, which
// the solidtype port's test puts through the same steps as the port. Each
// step runs inside act, which React asks of a test.

import { ToggleButton, ToggleButtonGroup } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

function mount(node: React.ReactNode): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(node));
  mounted = { root, host };
  return host;
}

type Button = {
  variant?: "default" | "ghost";
  size?: "sm" | "md" | "lg";
  isIconOnly?: boolean;
  defaultSelected?: boolean;
  isDisabled?: boolean;
};

export function render(props: Button): HTMLElement {
  const host = mount(<ToggleButton {...props}>Like</ToggleButton>);
  const button = host.querySelector("button");
  if (!button) throw new Error("HeroUI's ToggleButton rendered no button");
  return button;
}

// The button whose children are its render function's, its state as words:
// the interaction's, since Kobalte's button turns on Enter going down, as a
// native button clicks, where React Aria's turns as it goes up.
export function renderOfState(props: Button): HTMLElement {
  const host = mount(
    <ToggleButton {...props}>
      {(s) =>
        words([
          ["hovered", s.isHovered],
          ["pressed", s.isPressed],
          ["focused", s.isFocused],
          ["focus-visible", s.isFocusVisible],
          ["disabled", s.isDisabled],
        ])
      }
    </ToggleButton>,
  );
  const button = host.querySelector("button");
  if (!button) throw new Error("HeroUI's ToggleButton rendered no button");
  return button;
}

// A vertical group of one button whose group draws its children of its
// state, as words in an element marked with its name; its button, to walk.
export function renderGroupOfState(isDisabled: boolean): HTMLElement {
  const host = mount(
    <ToggleButtonGroup aria-label="Alignment" orientation="vertical" isDisabled={isDisabled}>
      {(g) => (
        <>
          <span data-words="group">
            {words([
              ["vertical", g.orientation === "vertical"],
              ["disabled", g.isDisabled],
            ])}
          </span>
          <ToggleButton id="left">Left</ToggleButton>
        </>
      )}
    </ToggleButtonGroup>,
  );
  const button = host.querySelector("button");
  if (!button) throw new Error("HeroUI's ToggleButtonGroup rendered no button");
  return button;
}

type Group = {
  selectionMode: "single" | "multiple";
  defaultSelectedKeys: string[];
  disallowEmptySelection: boolean;
  orientation: "horizontal" | "vertical";
  size?: "sm" | "md" | "lg";
  isDetached: boolean;
  fullWidth: boolean;
  isDisabled: boolean;
  enabled?: string;
};

// Three buttons, left, center and right, a separator in each but the first,
// [enabled] the one that sets isDisabled={false} over the group's.
export function renderGroup({ enabled, ...props }: Group): HTMLElement {
  return mount(
    <ToggleButtonGroup aria-label="Alignment" {...props}>
      {["left", "center", "right"].map((key, i) => (
        <ToggleButton key={key} id={key} isDisabled={key === enabled ? false : undefined}>
          {i > 0 ? <ToggleButtonGroup.Separator /> : null}
          {key}
        </ToggleButton>
      ))}
    </ToggleButtonGroup>,
  );
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
