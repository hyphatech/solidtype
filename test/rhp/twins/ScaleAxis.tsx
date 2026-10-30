import { Bar, Chart, Label, Plot, Scale, Tick, every, slat } from "@bezda/rhp";

const fruits = [
  { name: "Apples", sold: 12 },
  { name: "Bananas", sold: 18 },
  { name: "Cherries", sold: 7 },
];

const fruit = slat({ thickness: 32, room: { start: 80 } }, (d) => (
  <div>
    <Label edge="start">{d.name}</Label>
    <Bar to={d.sold} />
  </div>
));

const tick = (d: { at: number; last: boolean }) => (
  <div>
    <Tick at={d.at} />
    <Label at={d.at}>{`${d.at}${d.last ? " sold" : ""}`}</Label>
  </div>
);

export function make() {
  return (
    <Chart scale={[0, 20]}>
      <Plot rows={fruits}>{fruit}</Plot>
      <Scale ticks={every(5, { ends: true })}>{tick}</Scale>
    </Chart>
  );
}
