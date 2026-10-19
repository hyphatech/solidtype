import * as SegmentedControl from "@kobalte/core/segmented-control";

export function make() {
  return (
    <SegmentedControl.Root defaultValue="week">
      <SegmentedControl.Label>View</SegmentedControl.Label>
      <SegmentedControl.Item value="day">
        <SegmentedControl.ItemInput />
        <SegmentedControl.ItemLabel>Day</SegmentedControl.ItemLabel>
      </SegmentedControl.Item>
      <SegmentedControl.Item value="week">
        <SegmentedControl.ItemInput />
        <SegmentedControl.ItemLabel>Week</SegmentedControl.ItemLabel>
      </SegmentedControl.Item>
      <SegmentedControl.Item value="month">
        <SegmentedControl.ItemInput />
        <SegmentedControl.ItemLabel>Month</SegmentedControl.ItemLabel>
      </SegmentedControl.Item>
    </SegmentedControl.Root>
  );
}
