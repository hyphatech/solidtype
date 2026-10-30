import { Chart, Label, Line, Plot, slat } from "@bezda/rhp";

const cities = [
  { city: "Oslo", temps: [-4, -4, 0, 5, 11, 15, 17, 16, 11, 6, 1, -3] },
  { city: "Lisbon", temps: [11, 12, 14, 15, 17, 20, 22, 23, 21, 18, 14, 12] },
  { city: "Cairo", temps: [14, 15, 18, 22, 25, 27, 28, 28, 26, 24, 19, 16] },
];

const points = (temps: number[]) => temps.map((t, i) => [i, t + 5] as [number, number]);

const city = slat({ thickness: 56, room: { start: 64 } }, (d) => (
  <div>
    <Label edge="start">{d.city}</Label>
    <Line points={points(d.temps)} peak={34} smooth fill />
  </div>
));

export function make() {
  return (
    <Chart scale={[0, 11]} ticks={false} label="Each month's temperature">
      <Plot rows={cities}>{city}</Plot>
    </Chart>
  );
}
