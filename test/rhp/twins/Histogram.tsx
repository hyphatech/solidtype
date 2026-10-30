import { Bar, Chart, Plot, bins as binsOf } from "@bezda/rhp";

const ages = [23, 25, 31, 34, 35, 36, 38, 41, 41, 42, 44, 45, 47, 48, 52, 53, 55, 58, 61, 64];

const bins = binsOf(ages, { domain: [20, 70], count: 5 }).tally.map((tally) => ({ tally }));

const bin = (b: { tally: number }) => (
  <div>
    <Bar to={b.tally} />
  </div>
);

export function make() {
  return (
    <Chart orientation="vertical" height={160} scale={[0, 8]} label="Customers by age, in bins of ten years">
      <Plot rows={bins}>{bin}</Plot>
    </Chart>
  );
}
