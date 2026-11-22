// HeroUI's DateField in React, its label, group, segments, description and
// error, which the solidtype port's test renders under the same props, to
// compare every part and walk it as it walks the port's.

import { CalendarDate, CalendarDateTime, toZoned, type DateValue } from "@internationalized/date";
import { DateField, Description, FieldError, Label } from "@heroui/react";
import { act } from "react";
import { I18nProvider } from "react-aria-components";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Day = { year: number; month: number; day: number; hour?: number; minute?: number };

// What a field holds: a date, one with a time, or one with a time in a zone.
type Kind = "date" | "dateTime" | "zoned";

type Props = {
  kind?: Kind;
  timeZone?: string;
  defaultValue?: Day;
  placeholderValue?: Day;
  minValue?: Day;
  locale?: string;
  granularity?: "day" | "hour" | "minute" | "second";
  hourCycle?: 12 | 24;
  hideTimeZone?: boolean;
  isDisabled?: boolean;
  isInvalid?: boolean;
  isRequired?: boolean;
  isReadOnly?: boolean;
  variant?: "primary" | "secondary";
};

const value = (d: Day, kind: Kind, timeZone: string | undefined): DateValue => {
  if (kind === "date") return new CalendarDate(d.year, d.month, d.day);
  const local = new CalendarDateTime(d.year, d.month, d.day, d.hour ?? 0, d.minute ?? 0);
  return kind === "zoned" && timeZone ? toZoned(local, timeZone) : local;
};

export function render(
  { kind = "date", timeZone, defaultValue, placeholderValue, minValue, locale, variant, ...props }: Props,
  told: (iso: string) => void,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  const field = (
    <DateField
      {...props}
      defaultValue={defaultValue ? value(defaultValue, kind, timeZone) : undefined}
      placeholderValue={placeholderValue ? value(placeholderValue, kind, timeZone) : undefined}
      minValue={minValue ? value(minValue, kind, timeZone) : undefined}
      validationBehavior="aria"
      onChange={(v) => told(v ? v.toString() : "none")}
      name="date"
      className="w-64"
    >
      <Label>Date</Label>
      <DateField.Group variant={variant}>
        <DateField.Input>{(segment) => <DateField.Segment segment={segment} />}</DateField.Input>
      </DateField.Group>
      <Description>When it starts.</Description>
      <FieldError>Pick a date.</FieldError>
    </DateField>
  );
  act(() => root.render(locale ? <I18nProvider locale={locale}>{field}</I18nProvider> : field));
  mounted = { root, host };
  return host;
}

export async function step(action: () => Promise<void>): Promise<void> {
  await act(action);
}

// A field whose root and group draw their children of their state, as words
// in an element marked with each one's name; its group, to glance at.
export function renderOfState(
  isDisabled: boolean,
  isReadOnly: boolean,
  isInvalid: boolean,
  isRequired: boolean,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <DateField aria-label="Field" isDisabled={isDisabled} isReadOnly={isReadOnly} isInvalid={isInvalid} isRequired={isRequired}>
        {(r) => (
          <>
            <span data-words="field">
              {words([
                ["disabled", r.isDisabled],
                ["invalid", r.isInvalid],
                ["read-only", r.isReadOnly],
                ["required", r.isRequired],
              ])}
            </span>
            <DateField.Group>
              {(g) => (
                <>
                  <span data-words="group">
                    {words([
                      ["hovered", g.isHovered],
                      ["focus-within", g.isFocusWithin],
                      ["focus-visible", g.isFocusVisible],
                      ["disabled", g.isDisabled],
                      ["invalid", g.isInvalid],
                    ])}
                  </span>
                  <DateField.Input>{(segment) => <DateField.Segment segment={segment} />}</DateField.Input>
                </>
              )}
            </DateField.Group>
          </>
        )}
      </DateField>,
    ),
  );
  mounted = { root, host };
  const group = host.querySelector("[data-slot=date-input-group]");
  if (!(group instanceof HTMLElement)) throw new Error("HeroUI's field rendered no group");
  return group;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
