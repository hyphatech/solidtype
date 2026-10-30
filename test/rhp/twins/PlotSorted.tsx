import { Bar, Chart, Label, Plot, slat, sortBy } from "@bezda/rhp";
import { createSignal } from "solid-js";

const fruits = [
  { name: "Apples", sold: 12 },
  { name: "Bananas", sold: 18 },
  { name: "Cherries", sold: 7 },
  { name: "Dates", sold: 15 },
];

const fruit = slat({ thickness: 32, room: { start: 80 } }, (d) => (
  <div>
    <Label edge="start">{d.name}</Label>
    <Bar to={d.sold} />
  </div>
));

export function make() {
  const [ranked, setRanked] = createSignal(false);
  const order = () => (ranked() ? sortBy((d) => d.sold, "desc") : undefined);
  return (
    <div>
      <Chart scale={[0, 20]} label="Crates sold">
        <Plot rows={fruits} order={order()}>{fruit}</Plot>
      </Chart>
      <button class="button button--secondary" type="button" onClick={() => setRanked(!ranked())}>
        Rank
      </button>
    </div>
  );
}
