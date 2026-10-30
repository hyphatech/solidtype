import { Bar, Chart, Label, Plot, Theme, series, slat } from "@bezda/rhp";

const cities = [
  { city: "Lisbon", hours: 8.2 },
  { city: "Athens", hours: 9.1 },
  { city: "Seville", hours: 9.4 },
  { city: "Malta", hours: 8.8 },
];

const sunset = { series: ["#ff6b4a", "#ffa94d", "#f0b400", "#b197fc"], font: "Georgia, serif" };

const colors = series();

const city = slat({ thickness: 32, room: { start: 64 } }, (d) => (
  <div>
    <Label edge="start">{d.city}</Label>
    <Bar to={d.hours} color={colors(d)} />
  </div>
));

export function make() {
  return (
    <Theme value={sunset}>
      <Chart scale={[0, 12]} label="Hours of sun a day in June">
        <Plot rows={cities}>{city}</Plot>
      </Chart>
    </Theme>
  );
}
