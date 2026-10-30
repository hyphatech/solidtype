import { Bar, Chart, Label, Plot, Poster, slat } from "@bezda/rhp";

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

export function make() {
  return (
    <Poster
      look="market"
      kicker={<span>The market</span>}
      title={<span>Bananas sell best</span>}
      dek={<span>Crates sold on Saturday, by fruit</span>}
      note={<span>Counted at the stall's till.</span>}>
      <Chart scale={[0, 20]}>
        <Plot rows={fruits}>{fruit}</Plot>
      </Chart>
    </Poster>
  );
}
