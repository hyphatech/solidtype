import { Bar, Chart, Dot, Label, Plot, Poster, nice, slat, sortBy } from "@bezda/rhp";

const team = (name: string, gold: number, silver: number, bronze: number) => ({
  name,
  medals: [
    { metal: "gold", value: gold },
    { metal: "silver", value: silver },
    { metal: "bronze", value: bronze },
  ],
  total: gold + silver + bronze,
});

const teams = [team("North", 13, 9, 17), team("East", 16, 6, 8), team("South", 17, 20, 9), team("West", 4, 4, 16)];

const table = { font: "system-ui, sans-serif", ink: "#111214", muted: "#6d6a63", grid: "#e4ddd0", surface: "#f7f3ec" };

const count = slat(
  {
    css: `
.ribbon { --rhp-radius: 2px; background: linear-gradient(var(--rhp-toward-end), transparent, var(--metal)); }
.medal { background: none; }
.face { position: absolute; inset: 0; display: grid; place-items: center; border-radius: 50%;
  font: 800 11px/1 var(--rhp-font); font-variant-numeric: tabular-nums; color: var(--stamp);
  background: radial-gradient(circle at 30% 26%, var(--shine), var(--metal) 46%, var(--edge));
  box-shadow: 0 1px 2px rgb(0 0 0 / .28), inset 0 0 0 2px rgb(255 255 255 / .28);
  transition: scale .3s cubic-bezier(.3, 1.6, .5, 1), translate .3s cubic-bezier(.3, 1.6, .5, 1), box-shadow .3s; }
.count:hover { z-index: 1; }
.count:hover .face { scale: 1.45; translate: 0 -4px; box-shadow: 0 10px 14px -5px rgb(0 0 0 / .45), inset 0 0 0 2px rgb(255 255 255 / .45); }
.count:hover .ribbon { filter: saturate(1.5); }
.gold { --metal: #e0b43f; --shine: #fff4c4; --edge: #a87a14; --stamp: #3f2c02; }
.silver { --metal: #bfc5cb; --shine: #ffffff; --edge: #858d95; --stamp: #22272c; }
.bronze { --metal: #cf8a55; --shine: #ffe2c9; --edge: #8a4b23; --stamp: #2e1405; }
`,
  },
  (m) => (
    <div class={"count " + m.metal}>
      <Bar to={m.value} thick="3px" class="ribbon" />
      <Dot at={m.value} size="24px" class="medal">
        <span class="face">{String(m.value)}</span>
      </Dot>
    </div>
  ),
);

const teamSlat = slat(
  {
    thickness: { horizontal: 84 },
    room: { horizontal: { start: 96, end: 22 }, vertical: { start: 46, end: 18 } },
    css: `
.team { font: 700 22px/1 "Barlow Condensed", "Arial Narrow", sans-serif; letter-spacing: .03em; text-transform: uppercase; }
.team small { display: block; margin-top: 3px; font: 500 11px/1 var(--rhp-font); letter-spacing: .06em; text-transform: none; color: var(--rhp-muted); }
.team:horizontal { --rhp-label-gap: 14px; }
.team:vertical { font-size: 18px; }
`,
  },
  (t) => (
    <div>
      <Label edge="start" class="team">
        {t.name}
        <small>{t.total + " medals"}</small>
      </Label>
      <Plot thick={0.86} rows={t.medals}>{count}</Plot>
    </div>
  ),
);

const ranked = sortBy((d) => d.medals[0].value * 1e4 + d.medals[1].value * 100 + d.medals[2].value, "desc");

export function make() {
  return (
    <Poster
      look="medals"
      kicker={<span>Regional Games · final table</span>}
      title={<span>Gold rush</span>}
      dek={
        <span class="keys">
          <span><i class="gold" />Gold</span>
          <span><i class="silver" />Silver</span>
          <span><i class="bronze" />Bronze</span>
        </span>
      }
    >
      <Chart orientation="vertical" scale={[0, nice(0, 20, 4).max]} height={320} theme={table}>
        <Plot rows={teams} key={(d) => d.name} order={ranked}>{teamSlat}</Plot>
      </Chart>
    </Poster>
  );
}
