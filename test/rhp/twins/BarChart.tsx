import { Bar, Chart, Label, Plot, slat } from "@bezda/rhp";

const fruits = [
  { name: "Apples", sold: 12 },
  { name: "Bananas", sold: 18 },
  { name: "Cherries", sold: 7 },
];

const fruit = slat({ thickness: 32, room: { start: 80, end: 40 } }, (d) => (
  <div>
    <Label edge="start">{d.name}</Label>
    <Bar to={d.sold} />
    <Label at={d.sold}>{String(d.sold)}</Label>
  </div>
));

export function make() {
  return (
    <Chart scale={[0, 30]}>
      <Plot rows={fruits}>{fruit}</Plot>
    </Chart>
  );
}
