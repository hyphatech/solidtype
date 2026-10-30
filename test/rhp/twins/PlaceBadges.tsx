import { Bar, Chart, Label, Place, Plot, slat } from "@bezda/rhp";
import css from "../../../docs/islands/rhp_place_badges.css?raw";

const parcels = [
  { route: "Air", kg: 14 },
  { route: "Road", kg: 32 },
  { route: "Sea", kg: 48 },
];

const parcel = slat(
  {
    thickness: 36,
    room: { start: 48, end: 64 },
    css,
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
