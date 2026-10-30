import { Bar, Chart, Label, Plot, Poster, Tick, nice, slat } from "@bezda/rhp";
import { Show, createSignal } from "solid-js";

const draw = (k: number, lo: number, hi: number) => {
  const x = Math.sin(k * 12.9898) * 43758.5453;
  return lo + (x - Math.floor(x)) * (hi - lo);
};

const count = 22;
let price = 48;
const days = Array.from({ length: count }, (_, day) => {
  const open = price;
  const close = Math.max(20, open + draw(day * 3 + 1, -3.2, 3.6));
  price = close;
  return {
    day,
    open,
    close,
    low: Math.min(open, close) - draw(day * 3 + 2, 0.2, 2.2),
    high: Math.max(open, close) + draw(day * 3 + 3, 0.2, 2.2),
    latest: day === count - 1,
  };
});

const range = nice(Math.min(...days.map((d) => d.low)), Math.max(...days.map((d) => d.high)), 4);

const market = { font: "system-ui, sans-serif", ink: "#33302e", muted: "#66605c", grid: "#eadbcc", surface: "#fff1e5" };

const dollars = (v: number) => "$" + v.toFixed(v < 100 ? 2 : 0);

const rose = (d: { open: number; close: number }) => d.close >= d.open;

const crossed = (i: number | undefined) => (i === undefined ? [] : [days[i]]);

const cross = slat(
  {
    room: {},
    css: `
.cross { background: none; --rhp-tick-width: 0px; }
.cross:horizontal { border-left: 1px dashed var(--rhp-ink); }
.cross:vertical { border-top: 1px dashed var(--rhp-ink); }
.price { padding: 3px 6px; border-radius: 3px; background: var(--rhp-ink); color: var(--rhp-surface); font-size: 11px; font-weight: 800; }
.price:horizontal { top: calc(100% + 1px); translate: -50% 0; }
.price:vertical { left: auto; right: calc(100% + 3px); translate: 0 50%; }
`,
  },
  (d) => (
    <div>
      <Tick at={d.close} thick={1} class="cross" />
      <Label at={d.close} class="price">{dollars(d.close)}</Label>
    </div>
  ),
);

export function make() {
  const [picked, setPicked] = createSignal<number | undefined>(undefined);
  const read = () => {
    const i = picked();
    return i === undefined ? days.length - 1 : i;
  };
  const change = () => {
    const i = read();
    const before = i > 0 ? days[i - 1].close : days[i].open;
    return ((days[i].close - before) / before) * 100;
  };
  const candle = slat(
    {
      thickness: { horizontal: 15 },
      room: { horizontal: { start: 24, end: 64 }, vertical: { start: 10, end: 30 } },
      css: `
.day:hover { background: rgb(51 48 46 / .07); }
.wick { background: #807973; }
.body { --rhp-radius: 1px; }
.last { font-size: 11.5px; font-weight: 800; color: #fff; padding: 2px 6px; border-radius: 3px; background: var(--rhp-color); font-variant-numeric: tabular-nums; }
.last:horizontal { margin-left: 8px; }
.last:vertical { left: auto; right: 0; translate: 0 -8px; }
`,
    },
    (d) => {
      const pick = () => setPicked(d.day);
      return (
        <div class="day" onPointerEnter={pick} onPointerDown={pick}>
          <Bar from={d.low} to={d.high} thick="1.5px" class="wick" />
          <Bar from={d.open} to={d.close} thick={0.72} color={rose(d) ? "#0d7680" : "#990f3d"} class="body" />
          <Show when={d.latest}>
            <Label at={d.close} class="last" style={"--rhp-color: " + (rose(d) ? "#0d7680" : "#990f3d")}>
              {dollars(d.close)}
            </Label>
          </Show>
        </div>
      );
    },
  );
  return (
    <Poster
      look="market"
      kicker={<span>Share price · daily</span>}
      title={<span>A month on the market</span>}
      dek={<span>Each candle is a day: its body runs from the open to the close, its wick covers the day's range.</span>}
      note={<span>Illustrative data. Point at a day for its prices.</span>}
      onPointerLeave={(e) => {
        if (e.pointerType !== "touch") setPicked(undefined);
      }}
    >
      <p class="ohlc">
        <b>{"Day " + (read() + 1)}</b>
        <span>{"Open " + dollars(days[read()].open)}</span>
        <span>{"High " + dollars(days[read()].high)}</span>
        <span>{"Low " + dollars(days[read()].low)}</span>
        <span>
          Close{" "}
          <b class={change() >= 0 ? "up" : "down"}>
            {dollars(days[read()].close) + (change() >= 0 ? " ▲ " : " ▼ ") + Math.abs(change()).toFixed(1) + "%"}
          </b>
        </span>
      </p>
      <Chart
        orientation="vertical"
        scale={[range.min, range.max]}
        ticks={range.ticks}
        format={(v) => <span>{"$" + v}</span>}
        height={300}
        theme={market}
      >
        <Plot rows={days}>{candle}</Plot>
        <Plot rows={crossed(picked())} overlap style={{ "pointer-events": "none" }}>
          {cross}
        </Plot>
      </Chart>
    </Poster>
  );
}
