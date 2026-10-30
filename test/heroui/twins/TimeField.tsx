// HeroUI's TimeField in React, its label, group, segments, description and
// error, which the solidtype port's test renders under the same props, to
// compare every part and walk it as it walks the port's.

import { CalendarDateTime, Time, toZoned, type TimeValue } from "@internationalized/date";
import { Description, FieldError, Label, TimeField } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Clock = { hour?: number; minute?: number; second?: number };

// The date a time is on, and the zone, for a field whose value has them.
type On = { year: number; month: number; day: number; timeZone?: string };

type Props = {
  defaultValue?: Clock;
  on?: On;
  granularity?: "hour" | "minute" | "second";
  hourCycle?: 12 | 24;
  hideTimeZone?: boolean;
  isDisabled?: boolean;
  isInvalid?: boolean;
  isRequired?: boolean;
  isReadOnly?: boolean;
  fullWidth?: boolean;
  variant?: "primary" | "secondary";
  onBlur?: () => void;
};

// What the field was told: its time, and the value as a form submits it.
type Told = Clock & { iso: string };

const value = (c: Clock, on: On | undefined): TimeValue => {
  if (!on) return new Time(c.hour ?? 0, c.minute ?? 0, c.second ?? 0);
  const local = new CalendarDateTime(on.year, on.month, on.day, c.hour ?? 0, c.minute ?? 0, c.second ?? 0);
  return on.timeZone ? toZoned(local, on.timeZone) : local;
};

export function render({ defaultValue, on, variant, ...props }: Props, told: (t: Told) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <TimeField
        {...props}
        defaultValue={defaultValue ? value(defaultValue, on) : undefined}
        placeholderValue={on ? value({}, on) : undefined}
        onChange={(v) => v && told({ hour: v.hour, minute: v.minute, second: v.second, iso: v.toString() })}
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
