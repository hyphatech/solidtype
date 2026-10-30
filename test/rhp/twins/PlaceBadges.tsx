import { Bar, Chart, Label, Place, Plot, slat } from "@bezda/rhp";

const parcels = [
  { route: "Air", kg: 14 },
  { route: "Road", kg: 32 },
  { route: "Sea", kg: 48 },
];

const parcel = slat(
  {
    thickness: 36,
    room: { start: 48, end: 64 },
    css: ".badge { margin-left: 6px; padding: 1px 6px; border-radius: 6px; background: var(--rhp-ink); color: var(--rhp-surface); font-size: 12px; }",
  },
  (d) => (
    <div>
      <Label edge="start">{d.route}</Label>
      <Bar to={d.kg} />
      <Place at={d.kg}>
        <span class="badge">{`${d.kg} kg`}</span>
      </Place>
    </div>
  ),
);

export function make() {
  return (
    <Chart scale={[0, 60]}>
      <Plot rows={parcels}>{parcel}</Plot>
    </Chart>
  );
}
