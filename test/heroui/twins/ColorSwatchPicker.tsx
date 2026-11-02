// HeroUI's ColorSwatchPicker in React, as HeroUI's examples draw it, which the
// solidtype port's test renders under the same props and steps into as it
// does the port's, to compare every part and the colour told.

import { ColorSwatchPicker, parseColor } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

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

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
