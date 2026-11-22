// HeroUI's Calendar in React, its header, heading, navigation, grid, cells
// and year picker, which the solidtype port's test renders under the same
// props, to compare every part and walk it as it walks the port's.

import { CalendarDate } from "@internationalized/date";
import { Calendar } from "@heroui/react";
import { act } from "react";
import { I18nProvider } from "react-aria-components";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Day = { year: number; month: number; day: number };

type Props = {
  locale: string;
  defaultValue?: Day;
  focusedValue: Day;
  minValue?: Day;
  maxValue?: Day;
  unavailableDays?: number[];
  multiple?: boolean;
  isDisabled?: boolean;
  isReadOnly?: boolean;
  isInvalid?: boolean;
  weeks?: number;
  weeksInMonth?: number;
  yearPicker?: boolean;
};

const date = (d: Day) => new CalendarDate(d.year, d.month, d.day);

export function render(
  {
    locale,
    defaultValue,
    focusedValue,
    minValue,
    maxValue,
    unavailableDays,
    multiple,
    weeks,
    yearPicker,
    ...props
  }: Props,
  told: (iso: string) => void,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  const shared = {
    ...props,
    "aria-label": "Event date",
    defaultFocusedValue: date(focusedValue),
    minValue: minValue ? date(minValue) : undefined,
    maxValue: maxValue ? date(maxValue) : undefined,
    isDateUnavailable: unavailableDays ? (d: { day: number }) => unavailableDays.includes(d.day) : undefined,
    visibleDuration: weeks ? { weeks } : undefined,
  };
  const inside = (
    <>
      <Calendar.Header>
        {yearPicker ? (
          <Calendar.YearPickerTrigger>
            <Calendar.YearPickerTriggerHeading />
            <Calendar.YearPickerTriggerIndicator />
          </Calendar.YearPickerTrigger>
        ) : (
          <Calendar.Heading />
        )}
        <Calendar.NavButton slot="previous" />
        <Calendar.NavButton slot="next" />
      </Calendar.Header>
      <Calendar.Grid>
        <Calendar.GridHeader>{(day) => <Calendar.HeaderCell>{day}</Calendar.HeaderCell>}</Calendar.GridHeader>
        <Calendar.GridBody>{(d) => <Calendar.Cell date={d} />}</Calendar.GridBody>
      </Calendar.Grid>
      {yearPicker ? (
        <Calendar.YearPickerGrid>
          <Calendar.YearPickerGridBody>{({ year }) => <Calendar.YearPickerCell year={year} />}</Calendar.YearPickerGridBody>
        </Calendar.YearPickerGrid>
      ) : null}
    </>
  );
  const calendar = multiple ? (
    <Calendar
      {...shared}
      selectionMode="multiple"
      defaultValue={defaultValue ? [date(defaultValue)] : undefined}
      onChange={(v) => told((v ?? []).map((x) => x.toString()).join(","))}
    >
      {inside}
    </Calendar>
  ) : (
    <Calendar
      {...shared}
      defaultValue={defaultValue ? date(defaultValue) : undefined}
      onChange={(v) => told(v ? v.toString() : "none")}
    >
      {inside}
    </Calendar>
  );
  act(() => root.render(<I18nProvider locale={locale}>{calendar}</I18nProvider>));
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
