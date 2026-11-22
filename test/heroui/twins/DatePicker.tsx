// HeroUI's DatePicker in React, its label, field group, trigger and the
// calendar in its popover, which the solidtype port's test renders under the
// same props, to compare every part and walk it as it walks the port's.

import { CalendarDate, CalendarDateTime } from "@internationalized/date";
import { Calendar, DateField, DatePicker, Description, Label } from "@heroui/react";
import { act } from "react";
import { I18nProvider } from "react-aria-components";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Day = { year: number; month: number; day: number; hour?: number; minute?: number };

type Props = {
  locale: string;
  defaultValue?: Day;
  isDisabled?: boolean;
  isReadOnly?: boolean;
  isRequired?: boolean;
  isInvalid?: boolean;
};

const date = (d: Day) =>
  d.hour == null ? new CalendarDate(d.year, d.month, d.day) : new CalendarDateTime(d.year, d.month, d.day, d.hour, d.minute ?? 0);

export function render({ locale, defaultValue, ...props }: Props, told: (iso: string) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <I18nProvider locale={locale}>
        <DatePicker
          {...props}
          className="w-72"
          name="date"
          defaultValue={defaultValue ? date(defaultValue) : undefined}
          onChange={(v) => told(v ? v.toString() : "none")}
        >
          <Label>Date</Label>
          <DateField.Group fullWidth>
            <DateField.Input>{(segment) => <DateField.Segment segment={segment} />}</DateField.Input>
            <DateField.Suffix>
              <DatePicker.Trigger>
                <DatePicker.TriggerIndicator />
              </DatePicker.Trigger>
            </DateField.Suffix>
          </DateField.Group>
          <Description>When it starts</Description>
          <DatePicker.Popover>
            <Calendar aria-label="Event date">
              <Calendar.Header>
                <Calendar.Heading />
                <Calendar.NavButton slot="previous" />
                <Calendar.NavButton slot="next" />
              </Calendar.Header>
              <Calendar.Grid>
                <Calendar.GridHeader>{(day) => <Calendar.HeaderCell>{day}</Calendar.HeaderCell>}</Calendar.GridHeader>
                <Calendar.GridBody>{(d) => <Calendar.Cell date={d} />}</Calendar.GridBody>
              </Calendar.Grid>
            </Calendar>
          </DatePicker.Popover>
        </DatePicker>
      </I18nProvider>,
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
