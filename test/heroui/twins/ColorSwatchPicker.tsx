// HeroUI's ColorSwatchPicker in React, as HeroUI's examples draw it, which the
// solidtype port's test renders under the same props and steps into as it
// does the port's, to compare every part and the colour told.

import { ColorSwatchPicker, parseColor } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  colors: string[];
  value?: string;
  defaultValue?: string;
  size?: "xs" | "sm" | "md" | "lg" | "xl";
  variant?: "circle" | "square";
  layout?: "grid" | "stack";
  disabled?: number;
  heart?: boolean;
};

export function render(props: Props, told: (color: string) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  const { colors, value, defaultValue, disabled, heart, ...rest } = props;
  act(() =>
    root.render(
      <ColorSwatchPicker
        {...rest}
        value={value ? parseColor(value) : undefined}
        defaultValue={defaultValue}
        onChange={(c) => told(c.toString("hex"))}
      >
        {colors.map((color, i) => (
          <ColorSwatchPicker.Item key={color} color={color} isDisabled={i === disabled}>
            <ColorSwatchPicker.Swatch />
            {heart ? (
              <ColorSwatchPicker.Indicator>
                <svg data-heart="" viewBox="0 0 16 16" />
              </ColorSwatchPicker.Indicator>
            ) : (
              <ColorSwatchPicker.Indicator />
            )}
          </ColorSwatchPicker.Item>
        ))}
      </ColorSwatchPicker>,
    ),
  );
  mounted = { root, host };
  return host;
}

export async function step(action: () => Promise<void>): Promise<void> {
  await act(action);
}

// A picker whose first item draws its children of its state, as words and its
// colour in an element marked with its name; that item, to walk.
export function renderOfState(disabled: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <ColorSwatchPicker aria-label="Colour">
        <ColorSwatchPicker.Item color="#0485F7" isDisabled={disabled}>
          {(s) => (
            <span data-words="item">
              {words([
                ["hovered", s.isHovered],
                ["pressed", s.isPressed],
                ["selected", s.isSelected],
                ["focused", s.isFocused],
                ["focus-visible", s.isFocusVisible],
                ["disabled", s.isDisabled],
              ])}
              {" " + s.color.toString("hex")}
            </span>
          )}
        </ColorSwatchPicker.Item>
        <ColorSwatchPicker.Item color="#EF4444">
          <ColorSwatchPicker.Swatch />
        </ColorSwatchPicker.Item>
      </ColorSwatchPicker>,
    ),
  );
  mounted = { root, host };
  const item = host.querySelector("[role=option]");
  if (!(item instanceof HTMLElement)) throw new Error("HeroUI's ColorSwatchPicker rendered no item");
  return item;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
