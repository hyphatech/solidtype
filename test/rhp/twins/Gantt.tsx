import { Bar, Chart, Label, Plot, Poster, Scale, Tick, every, slat, sortBy } from "@bezda/rhp";
import { Show } from "solid-js";
import monthCss from "../../../docs/islands/rhp_gantt_month.css?raw";
import tradeCss from "../../../docs/islands/rhp_gantt_trade.css?raw";
import todayCss from "../../../docs/islands/rhp_gantt_today.css?raw";

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
    css: monthCss,
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
    css: tradeCss,
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
    css: todayCss,
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
