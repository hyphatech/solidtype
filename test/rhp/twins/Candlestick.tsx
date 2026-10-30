import { Bar, Chart, Label, Plot, Poster, Tick, nice, slat } from "@bezda/rhp";
import { Show, createSignal } from "solid-js";
import crossCss from "../../../docs/islands/rhp_candlestick_cross.css?raw";
import candleCss from "../../../docs/islands/rhp_candlestick_candle.css?raw";

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
    css: crossCss,
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
      css: candleCss,
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
