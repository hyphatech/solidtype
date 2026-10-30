import { Bar, Chart, Label, Plot, slat } from "@bezda/rhp";
import { createSignal } from "solid-js";

const start = [
  { team: "Ravens", points: 21 },
  { team: "Otters", points: 14 },
  { team: "Herons", points: 9 },
];

const team = slat({ thickness: 32, room: { start: 72 } }, (d) => (
  <div>
    <Label edge="start">{d.team}</Label>
    <Bar to={d.points} />
  </div>
));

export function make() {
  const [teams, setTeams] = createSignal(start);
  const score = (i: number) =>
    setTeams(teams().map((t, j) => (i === j ? { ...t, points: t.points + 3 } : t)));
  return (
    <div>
      <Chart scale={[0, 40]} label="Points">
        <Plot rows={teams()} keyboard>{team}</Plot>
      </Chart>
      <button class="button button--secondary" type="button" onClick={() => score(2)}>
        Herons score
      </button>
    </div>
  );
}
