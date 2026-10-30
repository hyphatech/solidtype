import { Bar, Chart, Dot, Label, Plot, slat } from "@bezda/rhp";

const pays = [
  { role: "Design", before: 48, after: 61 },
  { role: "Support", before: 35, after: 39 },
  { role: "Sales", before: 52, after: 58 },
];

const pay = slat({ thickness: 36, room: { start: 72 } }, (d) => (
  <div>
    <Label edge="start">{d.role}</Label>
    <Bar from={d.before} to={d.after} thick="2px" color="muted" />
    <Dot at={d.before} color="series-2" />
    <Dot at={d.after} />
  </div>
));

export function make() {
  return (
    <Chart scale={[30, 70]} label="Pay before and after, in k€">
      <Plot rows={pays}>{pay}</Plot>
    </Chart>
  );
}
