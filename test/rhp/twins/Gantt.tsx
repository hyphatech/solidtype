import { Bar, Chart, Label, Plot, Poster, Scale, Tick, every, slat, sortBy } from "@bezda/rhp";
import { Show } from "solid-js";

const trades = [
  { trade: "Groundworks", start: 0, end: 6 },
  { trade: "Frame", start: 5, end: 13 },
  { trade: "Roof", start: 12, end: 17 },
  { trade: "Services", start: 14, end: 23 },
  { trade: "Interiors", start: 20, end: 30 },
  { trade: "Garden", start: 27, end: 32 },
];

const months = ["Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct"];
const now = { week: 14 };

const drawing = { font: "system-ui, sans-serif", ink: "#141414", muted: "#77736d", grid: "#e7e4de", surface: "#fbfaf7" };

const month = slat(
  {
    room: { horizontal: { before: 26 }, vertical: { before: 40 } },
    css: `
.band { background: none; --rhp-radius: 0px; }
.odd .band { background: rgb(20 20 20 / .035); }
.band:horizontal { top: 0; height: 100%; translate: none; }
.band:vertical { left: 0; width: 100%; translate: none; }
.month { font-size: 10.5px; font-weight: 700; letter-spacing: .08em; text-transform: uppercase; color: var(--rhp-muted); padding: 0; }
.month:horizontal { top: -20px; translate: 6px 0; }
.month:vertical { left: -34px; translate: 0 -4px; }
@container (max-width: 360px) { .odd > .month:horizontal { display: none; } }
`,
  },
  (t) => {
    const i = t.index;
    return (
      <div class={i % 2 === 1 ? "odd" : ""}>
        <Bar from={t.at} to={t.next} class="band" />
        <Show when={!t.last}>
          <Label at={t.at} class="month">{months[i]}</Label>
        </Show>
      </div>
    );
  },
);

const trade = slat(
  {
    thickness: { horizontal: 44 },
    room: { horizontal: { start: 116, end: 16 }, vertical: { start: 40, end: 10 } },
    css: `
.trade { font-size: 14px; font-weight: 700; }
.trade small { display: block; font-size: 10.5px; font-weight: 500; color: var(--rhp-muted); }
.trade:horizontal { --rhp-label-gap: 14px; }
.job { background: #d8d5cf; --rhp-radius: 99px; }
.done { background: #ff5a1f; --rhp-radius: 99px; }
.slat:hover .job { background: #c4c0b8; }
.slat:hover .trade { color: #ff5a1f; }
.dim, .weeks { visibility: hidden; }
.slat:hover :is(.dim, .weeks) { visibility: visible; }
.dim { background: var(--rhp-ink); --rhp-radius: 0px; }
.dim:horizontal { translate: 0 -13px; }
.dim::before, .dim::after { content: ""; position: absolute; background: var(--rhp-ink); }
.dim:horizontal::before, .dim:horizontal::after { top: -4px; width: 1px; height: 9px; }
.dim:horizontal::before { left: 0; } .dim:horizontal::after { right: 0; }
.weeks { padding: 0 4px; font-size: 10.5px; font-weight: 800; letter-spacing: .06em; background: var(--rhp-surface); }
.weeks:horizontal { translate: -50% calc(-50% - 13px); }
`,
  },
  (t) => (
    <div class="slat">
      <Label edge="start" class="trade">
        {t.trade}
        <small>{"wk " + t.start + "-" + t.end}</small>
      </Label>
      <Bar from={t.start} to={t.end} thick="10px" class="job" />
      <Show when={t.start < now.week}>
        <Bar from={t.start} to={Math.min(now.week, t.end)} thick="10px" class="done" />
      </Show>
      <Bar from={t.start} to={t.end} thick="1px" class="dim" />
      <Label at={(t.start + t.end) / 2} class="weeks">{t.end - t.start + " WK"}</Label>
    </div>
  ),
);

const today = slat(
  {
    room: { horizontal: { after: 24 } },
    css: `
.now { background: #ff5a1f; --rhp-tick-width: 2px; }
.now-label { font-size: 10.5px; font-weight: 800; letter-spacing: .08em; color: #ff5a1f; padding: 0; }
.now-label:horizontal { top: calc(100% + 6px); translate: -50% 0; }
`,
  },
  (n) => (
    <div>
      <Tick at={n.week} thick={1} class="now" />
      <Label at={n.week} class="now-label">TODAY</Label>
    </div>
  ),
);

export function make() {
  return (
    <Poster
      look="drawing"
      kicker={<span>Building a house · week 14 of 32</span>}
      title={<span>From plot to keys</span>}
      dek={<span>Each bar is a trade on site; the orange part is done. Point at one to measure it.</span>}
    >
      <Chart scale={[0, 32]} height={340} theme={drawing}>
        <Scale ticks={every(4)}>{month}</Scale>
        <Plot rows={trades} key={(d) => d.trade} order={sortBy((d) => d.start)}>{trade}</Plot>
        <Plot rows={[now]} overlap style={{ "pointer-events": "none" }}>{today}</Plot>
      </Chart>
    </Poster>
  );
}
