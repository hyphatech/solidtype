// HeroUI's TimeField in React, its label, group, segments, description and
// error, which the solidtype port's test renders under the same props, to
// compare every part and walk it as it walks the port's.

import { Time } from "@internationalized/date";
import { Description, FieldError, Label, TimeField } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Clock = { hour?: number; minute?: number; second?: number };

type Props = {
  defaultValue?: Clock;
  granularity?: "hour" | "minute" | "second";
  hourCycle?: 12 | 24;
  isDisabled?: boolean;
  isInvalid?: boolean;
  isRequired?: boolean;
  isReadOnly?: boolean;
  fullWidth?: boolean;
  variant?: "primary" | "secondary";
  onBlur?: () => void;
};

const time = (c: Clock) => new Time(c.hour ?? 0, c.minute ?? 0, c.second ?? 0);

export function render({ defaultValue, variant, ...props }: Props, told: (c: Clock) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <TimeField
        {...props}
        defaultValue={defaultValue ? time(defaultValue) : undefined}
        onChange={(v) => v && told({ hour: v.hour, minute: v.minute, second: v.second })}
        name="time"
        className="w-64"
      >
        <Label>Time</Label>
        <TimeField.Group variant={variant}>
          <TimeField.Input>{(segment) => <TimeField.Segment segment={segment} />}</TimeField.Input>
        </TimeField.Group>
        <Description>When it starts.</Description>
        <FieldError>Pick a time.</FieldError>
      </TimeField>,
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
