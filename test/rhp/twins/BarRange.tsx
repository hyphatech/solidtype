import { Bar, Chart, Label, Plot, slat } from "@bezda/rhp";

const cities = [
  { city: "Oslo", low: -7, high: 22 },
  { city: "Lisbon", low: 8, high: 28 },
  { city: "Cairo", low: 9, high: 35 },
];

const city = slat({ thickness: 32, room: { start: 64 } }, (d) => (
  <div>
    <Label edge="start">{d.city}</Label>
    <Bar from={d.low} to={d.high} thick="10px" color={d.low < 0 ? "negative" : "positive"} />
  </div>
));

export function make() {
  return (
    <Chart scale={[-10, 40]} label="Each city's range of temperatures">
      <Plot rows={cities}>{city}</Plot>
    </Chart>
  );
}
