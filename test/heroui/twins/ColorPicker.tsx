// HeroUI's ColorPicker in React, its trigger and a popover holding each colour
// component, which the solidtype port's test renders under the same props, to
// compare its parts and the colour each shows as one of them changes it.

import {
  Button,
  ColorArea,
  ColorField,
  ColorPicker,
  ColorSlider,
  ColorSwatch,
  ColorSwatchPicker,
  Label,
  parseColor,
} from "@heroui/react";
import { act, useState } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  defaultValue?: string;
  // Held by the page, which takes each change, or fixed, which takes none.
  value?: string;
  fixed?: boolean;
  placement?: "bottom" | "bottom left" | "top right" | "right";
  // An area with a colour of its own, and a Button as the trigger.
  ownValue?: string;
  button?: boolean;
};

function Picker({
  defaultValue,
  value,
  fixed,
  placement,
  ownValue,
  button,
  told,
  toldOwn,
}: Props & { told: (hex: string) => void; toldOwn: (hex: string) => void }) {
  const [held, setHeld] = useState(value ? parseColor(value) : undefined);
  return (
    <div>
      <p data-testid="outside">Outside</p>
      <ColorPicker
        defaultValue={defaultValue}
        value={held}
        onChange={(c) => {
          told(c.toString("hex"));
          if (!fixed && held) setHeld(c);
        }}
      >
        {button ? (
          <Button>Pick</Button>
        ) : (
          <ColorPicker.Trigger>
            <ColorSwatch size="lg" />
            <Label>Pick a color</Label>
          </ColorPicker.Trigger>
        )}
        <ColorPicker.Popover placement={placement} shouldFlip={false}>
          <ColorArea
            aria-label="Color area"
            colorSpace="hsb"
            xChannel="saturation"
            yChannel="brightness"
            value={ownValue}
            onChange={(c) => toldOwn(c.toString("hex"))}
          >
            <ColorArea.Thumb />
          </ColorArea>
          <ColorSlider channel="hue" colorSpace="hsb">
            <Label>Hue</Label>
            <ColorSlider.Output />
            <ColorSlider.Track>
              <ColorSlider.Thumb />
            </ColorSlider.Track>
          </ColorSlider>
          <ColorSwatchPicker aria-label="Presets" size="xs">
            {["#ef4444", "#22c55e", "#3b82f6"].map((preset) => (
              <ColorSwatchPicker.Item key={preset} color={preset}>
                <ColorSwatchPicker.Swatch />
              </ColorSwatchPicker.Item>
            ))}
          </ColorSwatchPicker>
          <ColorField aria-label="Hex">
            <ColorField.Group>
              <ColorField.Prefix>
                <ColorSwatch size="xs" />
              </ColorField.Prefix>
              <ColorField.Input />
            </ColorField.Group>
          </ColorField>
          <ColorField aria-label="Red" channel="red" colorSpace="rgb">
            <ColorField.Group>
              <ColorField.Input />
            </ColorField.Group>
          </ColorField>
          <Button>Inside</Button>
        </ColorPicker.Popover>
      </ColorPicker>
    </div>
  );
}

export function render(
  props: Props,
  told: (hex: string) => void,
  toldOwn: (hex: string) => void,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<Picker {...props} told={told} toldOwn={toldOwn} />));
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
