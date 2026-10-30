import { Bar, Chart, Label, Plot, slat, stackUp } from "@bezda/rhp";

const teams = [
  { team: "Web", hours: [12, 8, 5] },
  { team: "Mobile", hours: [9, null, 7] },
  { team: "Data", hours: [4, 11, 6] },
];

const segments = (hours: (number | null)[]) => {
  const stack = stackUp(hours);
  return stack.from.map((from, part) => ({ from, to: stack.to[part], part }));
};

const segment = (s: { from: number; to: number; part: number }) => (
  <Bar from={s.from} to={s.to} color={`series-${s.part + 1}`} />
);

const team = slat({ thickness: 32, room: { start: 64 } }, (d) => (
  <div>
    <Label edge="start">{d.team}</Label>
    <Plot rows={segments(d.hours)} overlap>{segment}</Plot>
  </div>
));

export function make() {
  return (
    <Chart scale={[0, 30]} label="Hours a week, by task">
      <Plot rows={teams}>{team}</Plot>
    </Chart>
  );
}
