import { createSignal, For, Show } from "solid-js";

export function make() {
  const [items, setItems] = createSignal(["milk", "bread"]);
  return (
    <section>
      <Show when={items().length > 0} fallback={<p>Nothing to do</p>}>
        <ul>
          <For each={items()}>{(item, _) => <li>{item}</li>}</For>
        </ul>
      </Show>
      <button type="button" onClick={(_) => setItems([])}>Clear</button>
    </section>
  );
}
