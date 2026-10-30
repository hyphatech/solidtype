import { Chart, Dot, Plot } from "@bezda/rhp";

const cars = [
  { power: 90, price: 18 },
  { power: 120, price: 24 },
  { power: 150, price: 31 },
  { power: 110, price: 27 },
  { power: 200, price: 45 },
  { power: 170, price: 36 },
];

const car = (c: { power: number; price: number }) => <Dot at={c.power} cross={c.price} />;

export function make() {
  return (
    <Chart scale={[50, 250]} cross={[0, 60]} height={220} label="Price, in k€, by power, in hp">
      <Plot rows={cars} overlap>{car}</Plot>
    </Chart>
  );
}
