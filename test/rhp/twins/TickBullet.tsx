import { Bar, Chart, Label, Plot, Tick, slat } from "@bezda/rhp";

const metrics = [
  { metric: "Revenue", value: 72, goal: 80 },
  { metric: "Signups", value: 91, goal: 75 },
  { metric: "Retention", value: 58, goal: 65 },
];

const metric = slat({ thickness: 32, room: { start: 80 } }, (d) => (
  <div>
    <Label edge="start">{d.metric}</Label>
    <Bar to={d.value} thick={0.4} />
    <Tick at={d.goal} thick={0.8} color="ink" />
  </div>
));

export function make() {
  return (
    <Chart scale={[0, 100]} label="Each metric against its goal">
      <Plot rows={metrics}>{metric}</Plot>
    </Chart>
  );
}
