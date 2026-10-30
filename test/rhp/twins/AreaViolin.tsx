import { Area, Chart, Label, Plot, density, slat } from "@bezda/rhp";

const routes = [
  { route: "Bus", minutes: [22, 25, 24, 31, 28, 26, 35, 24, 27, 29] },
  { route: "Tram", minutes: [18, 19, 21, 20, 19, 22, 18, 20, 21, 19] },
  { route: "Bike", minutes: [15, 17, 16, 18, 15, 16, 17, 19, 16, 15] },
];

const spread = (minutes: number[]) => density(minutes, { domain: [10, 40] });

const route = slat({ thickness: 48, room: { start: 48 } }, (d) => (
  <div>
    <Label edge="start">{d.route}</Label>
    <Area points={spread(d.minutes)} mirror smooth />
  </div>
));

export function make() {
  return (
    <Chart scale={[10, 40]} label="Minutes to work, by route">
      <Plot rows={routes}>{route}</Plot>
    </Chart>
  );
}
