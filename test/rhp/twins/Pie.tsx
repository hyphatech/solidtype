import { Bar, Chart, Label, Plot, Poster, animated, shares, slat, stackUp } from "@bezda/rhp";

const names = ["Sleep", "Chores and errands", "Work and study", "Free time"];
const hours = [8.8, 5.8, 5.0, 4.4];
const colors = ["#8d93ff", "#9aa7c7", "#ffb547", "#ff5d73"];
const stack = stackUp(shares(hours));
const parts = names.map((name, i) => ({ name, hours: hours[i], color: colors[i], from: stack.from[i], to: stack.to[i] }));

const day = { font: "system-ui, sans-serif", ink: "#eef1f8", muted: "#8b93ab", grid: "#242a3e", surface: "#0f1220" };

const TAU = Math.PI * 2;
const CORNER = 1.9;
const GAP = 1.9;
const HOLE = 9;
const OFF = CORNER + GAP / 2;
const R = 50 - CORNER;
const RIM = Math.asin(OFF / R) / TAU;
const INNER = Math.asin(Math.min(1, OFF / HOLE)) / TAU;
const xy = (t: number, r: number) => `${r * Math.sin(t * TAU)},${-r * Math.cos(t * TAU)}`;
const big = (turns: number) => (turns > 0.5 ? 1 : 0);

const wedge = ([from, to]: [number, number]) => {
  const a = from / 100, b = to / 100, mid = (a + b) / 2;
  const u = Math.min(a + RIM, mid), v = Math.max(b - RIM, mid);
  const rim = `L${xy(u, R)}A${R},${R} 0 ${big(v - u)} 1 ${xy(v, R)}`;
  if (b - a <= 2 * INNER) return `M${xy(mid, Math.min(OFF / Math.sin((b - a) * Math.PI), R))}${rim}Z`;
  const s = a + INNER, e = b - INNER;
  return `M${xy(s, HOLE)}${rim}L${xy(e, HOLE)}A${HOLE},${HOLE} 0 ${big(e - s)} 0 ${xy(s, HOLE)}Z`;
};

const css = `
.slat { container-type: size; }
.slat:vertical .slice { inset: 0; left: 0; top: 0; width: 100%; height: 100%; translate: none; background: none; }
.slat:vertical .slice svg { display: block; width: 100%; height: 100%; }
.slat:vertical { pointer-events: none; }
.slat:vertical :is(.slice path, .tag) { pointer-events: auto; }
.slice path { fill: var(--rhp-color); stroke: var(--rhp-color); stroke-width: 3.8; stroke-linejoin: round; }
.slat:vertical .tag { left: 50%; top: 50%; bottom: auto; translate: -50% -50%; padding: 0;
  transform: rotate(calc(var(--turn) * 1turn)) translateY(-31cqmin) rotate(calc(var(--turn) * -1turn)); }
.slat:vertical .slice { --mid: calc((var(--rhp-lo) + var(--rhp-hi)) / 2); }
.slat:vertical :is(.slice svg, .tag .move) { transition: translate .25s ease-out; }
.slat:vertical:is(:hover, :focus-within) .slice svg { translate: calc(sin(var(--mid) * 1turn) * 13px) calc(cos(var(--mid) * 1turn) * -13px); }
.slat:vertical:is(:hover, :focus-within) .tag .move { translate: calc(sin(var(--rhp-p) * 1turn) * 13px) calc(cos(var(--rhp-p) * 1turn) * -13px); }
.tag { z-index: 2; color: var(--rhp-surface); text-align: center; }
.move { display: block; }
.tag b { display: block; font: 800 clamp(20px, 6cqmin, 32px)/1 var(--rhp-font); letter-spacing: -.03em; }
.said { display: grid; font-size: clamp(9px, 2.2cqmin, 12px); }
.said i { grid-area: 1 / 1; font-style: normal; transition: opacity .2s; }
.said i + i { opacity: 0; }
.slat:is(:hover, :focus-within) .said i { opacity: 0; }
.slat:is(:hover, :focus-within) .said i + i { opacity: 1; }
.slat:focus-visible { outline: none; }
.slat:focus-visible .tag b { text-decoration: underline; text-underline-offset: 4px; }
`;

const part = slat({ thickness: { horizontal: 82 }, room: { start: 24, end: 24 }, css }, (p) => {
  const span = animated(() => [p.from, p.to] as [number, number], () => ({ duration: 600 }));
  return (
    <div class="slat">
      <Bar from={p.from} to={p.to} color={p.color} class="slice">
        <svg viewBox="-50 -50 100 100" preserveAspectRatio="xMidYMid meet" aria-hidden={true}>
          <path d={wedge(span())} />
        </svg>
      </Bar>
      <Label at={(p.from + p.to) / 2} class="tag" style={"--turn: " + (span()[0] + span()[1]) / 200}>
        <span class="move">
          <b>{Math.round(p.to - p.from) + "%"}</b>
          <span class="said">
            <i>{p.name}</i>
            <i>{p.hours.toFixed(1) + " hours"}</i>
          </span>
        </span>
      </Label>
    </div>
  );
});

export function make() {
  return (
    <Poster
      look="day"
      kicker={<span>A day · 25 to 34 year olds</span>}
      title={<span>Four hours to yourself</span>}
      dek={<span>Sleep takes the largest share of a day, and once work and the running of a life are counted, about four hours of it are yours.</span>}
      note={<span>Illustrative, after the American Time Use Survey, averaged over every day of the week. Point at a slice, or tab into the chart, for the hours behind its share.</span>}
    >
      <Chart orientation="vertical" scale={[0, 100]} ticks={false} height={450} theme={day}>
        <Plot rows={parts} keyboard overlap key={(d) => d.name}>{part}</Plot>
      </Chart>
    </Poster>
  );
}
