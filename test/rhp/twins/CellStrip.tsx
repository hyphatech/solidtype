import { Cell, Chart, Label, Plot, slat } from "@bezda/rhp";

const days = [
  { day: "Mon", visits: 12 },
  { day: "Tue", visits: 30 },
  { day: "Wed", visits: 44 },
  { day: "Thu", visits: 38 },
  { day: "Fri", visits: 21 },
  { day: "Sat", visits: 8 },
  { day: "Sun", visits: 5 },
];

const day = slat({ room: { start: 20 } }, (d) => (
  <div>
    <Cell value={d.visits} />
    <Label edge="start">{d.day}</Label>
  </div>
));

export function make() {
  return (
    <Chart orientation="vertical" height={60} scale={[0, 50]} ticks={false} label="Visits each day">
      <Plot rows={days}>{day}</Plot>
    </Chart>
  );
}
