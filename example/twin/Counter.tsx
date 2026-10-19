import { createSignal } from "solid-js";
import * as Label from "./Label.tsx";

export function make() {
  const [count, setCount] = createSignal(0);
  return (
    <button
      type="button"
      onClick={(_) => setCount(count() + 1)}
      class={count() > 2 ? "hot" : "cold"}>
      Clicked {count()}
      <Label.component text={count() === 1 ? "time" : "times"} />
    </button>
  );
}
