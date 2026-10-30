import { Bar, Chart, Label, Plot, every, slat } from "@bezda/rhp";

const months = [
  { month: "Jan", rain: 61 },
  { month: "Feb", rain: 48 },
  { month: "Mar", rain: 52 },
  { month: "Apr", rain: 44 },
  { month: "May", rain: 51 },
  { month: "Jun", rain: 45 },
];

const column = slat({ room: { start: 24 } }, (d) => (
  <div>
    <Label edge="start">{d.month}</Label>
    <Bar to={d.rain} color="series-2" />
  </div>
));

export function make() {
  return (
    <Chart
      orientation="vertical"
      height={200}
      scale={[0, 80]}
      ticks={every(20)}
      format={(mm) => <span>{`${mm} mm`}</span>}
      label="Rain each month">
      <Plot rows={months}>{column}</Plot>
    </Chart>
  );
}
