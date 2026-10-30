import { Chart, ManyDots } from "@bezda/rhp";
import { createSignal } from "solid-js";

type Point = { id: number; x: number; y: number; group: number; color: string };
type Coloring = "shared" | "category" | "unique";

const samples = (seed: number): Point[] => {
  let state = seed * 7919 + 7;
  const next = () => {
    state = (state * 16807) % 2147483647;
    return state / 2147483647;
  };
  return Array.from({ length: 1200 }, (_, id) => {
    const x = 4 + next() * 92;
    const y = 4 + next() * 92;
    return { id, x, y, group: id % 4, color: "hsl(" + ((id * 137.508) % 360) + " 65% 48%)" };
  });
};

const coloringOf = (v: string): Coloring => (v === "shared" ? "shared" : v === "unique" ? "unique" : "category");

const modeClass = (m: Coloring) => "mode-" + m;

const coordinates = (p: Point) => "Point " + (p.id + 1) + ": " + p.x.toFixed(1) + ", " + p.y.toFixed(1);

const hovering = (p: Point | undefined) => (p ? coordinates(p) : "Hover over a point, or tap/click one to select it.");

const selection = (p: Point | undefined) => (p ? "Selected " + coordinates(p).toLowerCase() + "." : "No point selected.");

const css = `
.manydots-demo .mode-category .group-0 { background-color: var(--rhp-series-1); }
.manydots-demo .mode-category .group-1 { background-color: var(--rhp-series-2); }
.manydots-demo .mode-category .group-2 { background-color: var(--rhp-series-3); }
.manydots-demo .mode-category .group-3 { background-color: var(--rhp-series-4); }
.manydots-demo .rhp-manydot:hover,
.manydots-demo .rhp-manydot.selected { outline: 2px solid var(--rhp-ink); outline-offset: 2px; }
.manydots-demo .controls { display: flex; flex-wrap: wrap; align-items: center; gap: .5rem; margin-bottom: .75rem; }
.manydots-demo select { font: inherit; color: inherit; background: transparent; border: 1px solid var(--color-border); border-radius: .5rem; padding: .2rem .4rem; }
.manydots-demo .readout { min-height: 1.5em; margin: .5rem 0 0; font-size: .875rem; }
`;

export function make() {
  const [rows, setRows] = createSignal(samples(0));
  const [mode, setMode] = createSignal<Coloring>("category");
  const [hovered, setHovered] = createSignal<Point | undefined>(undefined);
  const [selected, setSelected] = createSignal<number | undefined>(undefined);
  let seed = 0;
  const rowAt = (target: Element) => {
    const point = target.closest(".rhp-manydot");
    if (!point) return undefined;
    const index = point.getAttribute("data-rhp-index");
    if (index === null) return undefined;
    const all = rows();
    const i = Number(index);
    return Number.isInteger(i) && i >= 0 && i < all.length ? all[i] : undefined;
  };
  const clear = () => {
    setHovered(undefined);
    setSelected(undefined);
  };
  const chosen = () => {
    const id = selected();
    return id === undefined ? undefined : rows().find((p) => p.id === id);
  };
  return (
    <div class="manydots-demo">
      <style>{css}</style>
      <div class="controls">
        <label>
          Coloring{" "}
          <select onChange={(e) => setMode(coloringOf((e.target as HTMLSelectElement).value))}>
            <option value="shared">Shared color</option>
            <option value="category" selected={true}>Category classes</option>
            <option value="unique">Unique colors</option>
          </select>
        </label>
        <button
          class="button button--sm button--secondary"
          type="button"
          onClick={() => {
            clear();
            seed += 1;
            setRows(samples(seed));
          }}
        >
          New data
        </button>
        <button class="button button--sm button--secondary" type="button" onClick={() => clear()}>
          Clear selection
        </button>
      </div>
      <Chart
        scale={[0, 100]}
        cross={[0, 100]}
        ticks={[0, 25, 50, 75, 100]}
        crossTicks={[0, 25, 50, 75, 100]}
        height={290}
        label="1,200 sample measurements, each with two coordinates from 4 to 96"
      >
        <ManyDots
          rows={rows()}
          at={(p: Point) => p.x}
          cross={(p: Point) => p.y}
          key={(p: Point) => p.id}
          size="5px"
          class={modeClass(mode())}
          color={mode() === "unique" ? (p: Point) => p.color : "series-1"}
          pointClass={(() => {
            const picked = selected();
            return (p: Point) => "group-" + p.group + (picked === p.id ? " selected" : "");
          })()}
          onPointerMove={(e) => {
            if (e.pointerType !== "touch") setHovered(rowAt(e.target as Element));
          }}
          onPointerLeave={() => setHovered(undefined)}
          onClick={(e) => {
            setHovered(undefined);
            setSelected(rowAt(e.target as Element)?.id);
          }}
        />
      </Chart>
      <p class="readout">{hovering(hovered())}</p>
      <p class="readout" role="status">
        {selection(chosen())}
      </p>
    </div>
  );
}
