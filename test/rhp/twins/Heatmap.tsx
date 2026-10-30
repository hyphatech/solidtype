import { Cell, Chart, Label, Plot, Poster, slat, useOrientation } from "@bezda/rhp";
import { Show, createSignal } from "solid-js";

const names = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

const noise = (day: number, hour: number) => {
  const x = Math.sin((day * 24 + hour + 1) * 12.9898) * 43758.5453;
  return x - Math.floor(x);
};

const days = names.map((name, day) => {
  const weekend = day > 4;
  const peak = weekend ? 15 : 13;
  return {
    name,
    hours: Array.from({ length: 24 }, (_, hour) => {
      const h = hour - peak;
      return {
        day,
        hour,
        visitors: Math.max(0, 70 * Math.exp(-(h * h) / 18) + 30 * noise(day, hour) - (weekend ? 15 : 0)),
      };
    }),
  };
});

const heat = { font: "system-ui, sans-serif", ink: "#f3f1ed", muted: "#9b9893", grid: "#2b2a28", surface: "#151515", low: "#332214", high: "#ffb94c" };

const twoDigits = (n: number) => String(n).padStart(2, "0");

const reading = (at: [number, number] | null) => {
  if (at === null) return "Weekdays peak at 1 pm, weekends at 3 pm.";
  const [d, h] = at;
  return `${names[d]} ${twoDigits(h)}:00 · ${Math.round(days[d].hours[h].visitors)} visitors`;
};

export function make() {
  const [picked, setPicked] = createSignal<[number, number] | null>(null);
  const pick = (h: { day: number; hour: number }) => setPicked([h.day, h.hour]);
  const lit = (h: { day: number; hour: number }) => {
    const at = picked();
    return at === null || at[0] === h.day || at[1] === h.hour;
  };
  const hour = slat(
    {
      css: `
.cell { --rhp-cell-gap: 1px; --rhp-radius: 2px; }
.hour { --rhp-label-size: 10px; color: var(--rhp-muted); pointer-events: none; }
.hour:horizontal { width: auto; }
.faded { opacity: .25; }
`,
    },
    (h) => {
      const orientation = useOrientation();
      return (
        <div onPointerEnter={() => pick(h)} onPointerDown={() => pick(h)}>
          <Cell value={h.visitors} class={lit(h) ? "cell" : "cell faded"} />
          <Show when={h.day === 0 && h.hour % 3 === 0}>
            <Label edge={orientation() === "vertical" ? "end" : "start"} class="hour">
              {String(h.hour)}
            </Label>
          </Show>
        </div>
      );
    },
  );
  const day = slat(
    { thickness: { horizontal: 26 }, room: { horizontal: { start: 40, before: 18 }, vertical: { start: 24, before: 30 } } },
    (w) => (
      <div>
        <Label edge="start">{w.name}</Label>
        <Plot orientation="across" rows={w.hours}>{hour}</Plot>
      </div>
    ),
  );
  return (
    <Poster
      look="heat"
      kicker={<span>An online shop · visitors per hour</span>}
      title={<span>Lunch break is rush hour</span>}
      dek={<span>{reading(picked())}</span>}
      note={<span>Point at an hour to read it. Illustrative data.</span>}
      onPointerLeave={(e) => {
        if (e.pointerType !== "touch") setPicked(null);
      }}
    >
      <Chart scale={[0, 100]} ticks={false} height={320} theme={heat}>
        <Plot rows={days}>{day}</Plot>
      </Chart>
    </Poster>
  );
}
