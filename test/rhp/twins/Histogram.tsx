import { Bar, Chart, Label, Plot, bins as binsOf, slat } from "@bezda/rhp";

const ages = [23, 25, 31, 34, 35, 36, 38, 41, 41, 42, 44, 45, 47, 48, 52, 53, 55, 58, 61, 64];

const counted = binsOf(ages, { domain: [20, 70], count: 5 });
const bins = counted.tally.map((tally, i) => ({ from: counted.x0[i], tally }));

const bin = slat({ room: { start: 20 } }, (b) => (
  <div>
    <Bar to={b.tally} />
    <Label edge="start">{`${b.from}s`}</Label>
  </div>
));

export function make() {
  return (
    <Chart orientation="vertical" height={160} scale={[0, 8]} label="Customers by age, in bins of ten years">
      <Plot rows={bins}>{bin}</Plot>
    </Chart>
  );
}
