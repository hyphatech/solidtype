import { Bar, Chart, Label, Plot, slat } from "@bezda/rhp";

const languages = [
  { name: "OCaml", share: 64 },
  { name: "TypeScript", share: 28 },
  { name: "Shell", share: 8 },
];

const language = slat(
  {
    thickness: 40,
    inset: 0.3,
    room: "auto",
    css: ".bar { --rhp-end-radius: 8px; } .value { color: var(--rhp-muted); }",
  },
  (d) => (
    <div>
      <Label edge="start">{d.name}</Label>
      <Bar to={d.share} class="bar" />
      <Label edge="end" class="value">{`${d.share}%`}</Label>
    </div>
  ),
);

export function make() {
  return (
    <Chart scale={[0, 100]}>
      <Plot rows={languages}>{language}</Plot>
    </Chart>
  );
}
