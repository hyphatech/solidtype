// HeroUI's DateRangePicker in React, its label, field group of two inputs,
// separator, trigger and the range calendar in its popover, which the
// solidtype port's test renders under the same props, to compare every part
// and walk it as it walks the port's.

import { CalendarDate, CalendarDateTime } from "@internationalized/date";
import { DateField, DateRangePicker, Description, Label, RangeCalendar } from "@heroui/react";
import { act } from "react";
import { I18nProvider } from "react-aria-components";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Day = { year: number; month: number; day: number; hour?: number; minute?: number };

type Props = {
  locale: string;
  defaultValue?: [Day, Day];
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
        <DateRangePicker
          {...props}
          className="w-80"
          startName="startDate"
          endName="endDate"
          defaultValue={defaultValue ? { start: date(defaultValue[0]), end: date(defaultValue[1]) } : undefined}
          onChange={(v) => told(v ? `${v.start.toString()}..${v.end.toString()}` : "none")}
        >
          <Label>Trip dates</Label>
          <DateField.Group fullWidth>
            <DateField.Input slot="start">{(segment) => <DateField.Segment segment={segment} />}</DateField.Input>
            <DateRangePicker.RangeSeparator />
            <DateField.Input slot="end">{(segment) => <DateField.Segment segment={segment} />}</DateField.Input>
            <DateField.Suffix>
              <DateRangePicker.Trigger>
                <DateRangePicker.TriggerIndicator />
              </DateRangePicker.Trigger>
            </DateField.Suffix>
          </DateField.Group>
          <Description>When you travel</Description>
          <DateRangePicker.Popover>
            <RangeCalendar aria-label="Trip dates">
              <RangeCalendar.Header>
                <RangeCalendar.Heading />
                <RangeCalendar.NavButton slot="previous" />
                <RangeCalendar.NavButton slot="next" />
              </RangeCalendar.Header>
              <RangeCalendar.Grid>
                <RangeCalendar.GridHeader>{(day) => <RangeCalendar.HeaderCell>{day}</RangeCalendar.HeaderCell>}</RangeCalendar.GridHeader>
                <RangeCalendar.GridBody>{(d) => <RangeCalendar.Cell date={d} />}</RangeCalendar.GridBody>
              </RangeCalendar.Grid>
            </RangeCalendar>
          </DateRangePicker.Popover>
        </DateRangePicker>
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
