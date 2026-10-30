import { Bar, Chart, Label, Plot, Poster, Tick, running, slat } from "@bezda/rhp";
import { Show, createMemo, createSignal } from "solid-js";

const lines = ["Salary", "Rent", "Groceries", "Transport", "Bills", "Going out"];
const month = [4200, -1450, -520, -180, -230, -300];

const budget = { font: "system-ui, sans-serif", ink: "#1c2433", muted: "#6b7385", grid: "#edf0f4", surface: "#ffffff" };

const pounds = (v: number) => (v < 0 ? "−" : "") + "£" + Math.abs(Math.round(v)).toLocaleString("en-GB");

const steps = (cut: boolean[]) => {
  const total = running(month.map((v, i) => (cut[i] ? 0 : v)));
  const saved = total.to[month.length - 1];
  return [
    ...lines.map((item, i) => ({
      line: i,
      item,
      from: total.from[i],
      to: total.to[i],
      amount: month[i],
      cut: cut[i],
      kind: month[i] > 0 ? "in_" : "out",
      class_name: month[i] > 0 ? "in" : "out",
    })),
    { line: lines.length, item: "Saved", from: 0, to: saved, amount: saved, cut: false, kind: "total", class_name: "total" },
  ];
};

const css = `
.item { font-size: 14px; font-weight: 600; }
.item:horizontal { --rhp-label-gap: 14px; }
.item button { all: unset; cursor: pointer; border-radius: 3px; text-decoration: underline 1.5px dotted #b5bcc8; text-underline-offset: 3px; }
.item button:focus-visible { outline: 2px solid #0b8a63; outline-offset: 2px; }
.out:hover .item button { text-decoration-color: #d2423f; }
.cut .item button { color: #8a93a3; text-decoration: line-through 1.5px #d2423f; }
.step { --rhp-radius: 6px; }
.out .step, .ghost { cursor: pointer; }
.out:hover .step { box-shadow: 0 6px 12px -6px rgb(210 66 63 / .8); }
.ghost { background: none; border: 1.5px dashed #f25f5c; opacity: 0; }
.cut .ghost { opacity: .75; }
.amount { font-size: 12px; font-weight: 800; font-variant-numeric: tabular-nums; }
.in .amount { color: #0b8a63; }
.out .amount { color: #d2423f; }
.cut .amount { color: #8a93a3; text-decoration: line-through; }
.amount:horizontal { --rhp-label-gap: 8px; }
.link { background: #b5bcc8; }
.link:horizontal { width: 1px; top: calc(50% + 12px); height: 22px; translate: -50% 0; }
`;

const isExpense = (kind: string) => kind === "out";

const colors = { in_: "#12b886", out: "#f25f5c", total: "#1c2433" };

export function make() {
  const [cut, setCut] = createSignal(month.map(() => false));
  const shown = createMemo(() => steps(cut()));
  const toggle = (line: number) => setCut(cut().map((c, i) => (i === line ? !c : c)));
  const step = slat({ thickness: { horizontal: 46 }, room: { start: 100, end: 66 }, css }, (s) => {
    return (
      <div
        class={s.class_name + (s.cut ? " cut" : "")}
        onClick={() => {
          if (isExpense(s.kind)) toggle(s.line);
        }}
      >
        <Label edge="start" class="item">
          {isExpense(s.kind) ? (
            <button type="button" aria-pressed={s.cut ? "true" : "false"}>
              {s.item}
            </button>
          ) : (
            s.item
          )}
        </Label>
        <Show when={isExpense(s.kind)}>
          <Bar from={s.from} to={s.from + s.amount} thick="24px" class="ghost" />
        </Show>
        <Bar from={s.from} to={s.to} thick="24px" color={colors[s.kind]} class="step" />
        <Show when={s.kind !== "total"}>
          <Tick at={s.to} class="link" />
        </Show>
        <Label at={Math.max(s.from, s.to)} class="amount">{pounds(s.amount)}</Label>
      </div>
    );
  });
  const saved = () => shown()[shown().length - 1].to;
  return (
    <Poster
      look="budget"
      kicker={<span>Monthly budget</span>}
      title={<span>Where the salary goes</span>}
      dek={
        <span>
          <b>{pounds(saved())}</b> left to save this month.
        </span>
      }
      note={<span>Click an expense to cut it from the month; click it again to bring it back.</span>}
    >
      <Chart
        scale={[0, 5000]}
        ticks={[0, 1000, 2000, 3000, 4000, 5000]}
        format={(v) => <span>{v === 0 ? "0" : "£" + v / 1000 + "k"}</span>}
        height={320}
        theme={budget}
      >
        <Plot rows={shown()}>{step}</Plot>
      </Chart>
    </Poster>
  );
}
