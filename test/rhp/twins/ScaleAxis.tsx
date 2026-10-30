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

const tick = slat(
  {
    room: { end: 32, after: 28 },
    css: ".line { background: var(--rhp-grid); --rhp-tick-width: 1px; } .num { font-size: 11px; color: var(--rhp-muted); padding: 0; } .num:horizontal { top: calc(100% + 8px); translate: -50% 0; }",
  },
  (t) => (
    <div>
      <Tick at={t.at} thick={1} class="line" />
      <Label at={t.at} class="num">{`${t.at}${t.last ? " sold" : ""}`}</Label>
    </div>
  ),
);

export function make() {
  return (
    <Chart scale={[0, 20]}>
      <Scale ticks={every(5, { ends: true })}>{tick}</Scale>
      <Plot rows={fruits}>{fruit}</Plot>
    </Chart>
  );
}
