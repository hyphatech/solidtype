import { Chart, ManyDots } from "@bezda/rhp";

type Point = { x: number; y: number; group: number };

const points: Point[] = (() => {
  let seed = 7;
  const next = () => {
    seed = (seed * 16807) % 2147483647;
    return seed / 2147483647;
  };
  return Array.from({ length: 400 }, (_, i) => {
    const x = next() * 100;
    const y = 5 + x * 0.5 + next() * 40;
    return { x, y, group: i % 3 };
  });
})();

export function make() {
  return (
    <Chart scale={[0, 100]} cross={[0, 100]} height={260} label="400 points">
      <ManyDots
        rows={points}
        at={(p: Point) => p.x}
        cross={(p: Point) => p.y}
        color={(p: Point) => `series-${p.group + 1}`}
        size={5}
      />
    </Chart>
  );
}
