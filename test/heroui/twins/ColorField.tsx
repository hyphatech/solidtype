// HeroUI's ColorField in React, as HeroUI's examples draw it, which the
// solidtype port's test renders under the same props and types into as it
// does the port's, to compare every part and the colour told.

import { ColorField, ColorSwatch, Description, FieldError, Label, parseColor } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  channel?: "hue" | "saturation" | "lightness";
  defaultValue?: string;
  placeholder?: string;
  variant?: "primary" | "secondary";
  isDisabled?: boolean;
  isInvalid?: boolean;
  isRequired?: boolean;
  swatch?: boolean;
  suffix?: string;
  description?: string;
  error?: string;
};

export function render(props: Props, told: (color: string) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  const { channel, defaultValue, placeholder, variant, swatch, suffix, description, error, ...rest } = props;
  act(() =>
    root.render(
      <ColorField
        {...rest}
        channel={channel}
        className="w-[280px]"
        colorSpace={channel ? "hsl" : undefined}
        defaultValue={defaultValue ? parseColor(defaultValue) : undefined}
        name="color"
        onChange={(c) => told(c ? c.toString("hex") : "(empty)")}
      >
        <Label>Color</Label>
        <ColorField.Group variant={variant}>
          {swatch ? (
            <ColorField.Prefix>
              <ColorSwatch color="#0485F7" size="xs" />
            </ColorField.Prefix>
          ) : null}
          <ColorField.Input placeholder={placeholder} />
          {suffix ? (
            <ColorField.Suffix>
              <span className="text-sm text-muted">{suffix}</span>
            </ColorField.Suffix>
          ) : null}
        </ColorField.Group>
        {description ? <Description>{description}</Description> : null}
        {error ? <FieldError>{error}</FieldError> : null}
      </ColorField>,
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
