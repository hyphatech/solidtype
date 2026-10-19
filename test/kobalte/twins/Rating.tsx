import * as Rating from "@kobalte/core/rating";
import { For } from "solid-js";

export function make() {
  return (
    <Rating.Root defaultValue={3}>
      <Rating.Label>Score</Rating.Label>
      <Rating.Control>
        <For each={["1 star", "2 stars", "3 stars", "4 stars", "5 stars"]}>
          {(label) => (
            <Rating.Item>
              <Rating.ItemControl>
                {(state) => <span>{state.highlighted() ? "★" : "☆"}</span>}
              </Rating.ItemControl>
              <Rating.ItemLabel>{label}</Rating.ItemLabel>
            </Rating.Item>
          )}
        </For>
      </Rating.Control>
    </Rating.Root>
  );
}
