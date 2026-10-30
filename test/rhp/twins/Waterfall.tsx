import { Bar, Chart, Label, Plot, running, slat } from "@bezda/rhp";

const names = ["Sales", "Refunds", "Services", "Costs"];
const changes = [40, -12, 18, -6];
const total = running(changes);
const steps = names.map((name, i) => ({ name, change: changes[i], from: total.from[i], to: total.to[i] }));

const step = slat({ thickness: 32, room: { start: 72 } }, (d) => (
  <div>
    <Label edge="start">{d.name}</Label>
    <Bar from={d.from} to={d.to} color={d.change < 0 ? "negative" : "positive"} />
  </div>
));

export function make() {
  return (
    <Chart scale={[0, 60]} label="The month's profit, change by change">
      <Plot rows={steps}>{step}</Plot>
    </Chart>
  );
}
