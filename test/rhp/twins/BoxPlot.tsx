import { Bar, Chart, Label, Plot, Tick, slat, summary } from "@bezda/rhp";

const runners = [
  { runner: "Ana", laps: [61, 63, 62, 65, 60, 64, 70, 62] },
  { runner: "Ben", laps: [58, 66, 59, 71, 62, 57, 64, 60] },
  { runner: "Cleo", laps: [67, 68, 66, 69, 67, 70, 68, 66] },
];

const runner = slat({ thickness: 36, room: { start: 48 } }, (d) => {
  const s = summary(d.laps);
  return (
    <div>
      <Label edge="start">{d.runner}</Label>
      <Bar from={s.low} to={s.high} thick="2px" color="muted" />
      <Bar from={s.q1} to={s.q3} />
      <Tick at={s.median} color="surface" />
    </div>
  );
});

export function make() {
  return (
    <Chart scale={[55, 75]} label="Lap times, in seconds">
      <Plot rows={runners}>{runner}</Plot>
    </Chart>
  );
}
