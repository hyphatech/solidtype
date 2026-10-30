import { Bar, Chart, Label, Plot, slat } from "@bezda/rhp";

const stores = [
  { store: "North", sales: 48 },
  { store: "Harbour", sales: 31 },
  { store: "Old town", sales: 17 },
];

const store = slat(
  { thickness: 36, room: { start: 80, end: 48 }, css: ".inside { color: white; }" },
  (d) => (
    <div>
      <Label edge="start">{d.store}</Label>
      <Bar to={d.sales} />
      <Label at={d.sales} side="before" class="inside">{String(d.sales)}</Label>
      <Label edge="end">k€</Label>
    </div>
  ),
);

export function make() {
  return (
    <Chart scale={[0, 50]} ticks={false}>
      <Plot rows={stores}>{store}</Plot>
    </Chart>
  );
}
