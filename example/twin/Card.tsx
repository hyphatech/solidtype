import * as Button from "@kobalte/core/button";
import * as Rating from "@kobalte/core/rating";
import { For, Show } from "solid-js";
import type { Book } from "./shelf.gen";

type Status = Book["status"];

const labels: Record<Status, string> = { to_read: "To read", reading: "Reading", read: "Read" };
const order: Status[] = ["to_read", "reading", "read"];
const stars = [1, 2, 3, 4, 5];

export function make(props: {
  book: Book;
  onMove: (status: Status) => void;
  onRate: (stars: number) => void;
  onRemove: (e: MouseEvent) => void;
}) {
  const arrow = (label: string, target: Status | undefined) => {
    if (target === undefined) return <span class="w-7" />;
    return (
      <Button.Root
        class="grid h-7 w-7 place-items-center rounded-md text-stone-400 hover:bg-stone-100 hover:text-stone-700 dark:hover:bg-stone-800 dark:hover:text-stone-200"
        aria-label={"Move " + props.book.title + " to " + labels[target]}
        onClick={() => props.onMove(target)}
      >
        {label}
      </Button.Root>
    );
  };
  const step = (by: number) => order[order.indexOf(props.book.status) + by];
  return (
    <li
      class="group cursor-grab rounded-lg border border-stone-200 bg-white p-3 shadow-sm transition hover:shadow-md active:cursor-grabbing dark:border-stone-700 dark:bg-stone-900"
      draggable={true}
      onDragStart={(e) => e.dataTransfer?.setData("text/plain", String(props.book.id))}
    >
      <div class="flex items-start gap-2">
        <div class="min-w-0 flex-1">
          <p class="truncate font-medium text-stone-900 dark:text-stone-100">{props.book.title}</p>
          <p class="truncate text-sm text-stone-500 dark:text-stone-400">{props.book.author}</p>
        </div>
        <Button.Root
          class="grid h-6 w-6 place-items-center rounded-md text-stone-400 opacity-0 transition group-hover:opacity-100 hover:bg-red-50 hover:text-red-600 focus-visible:opacity-100 dark:hover:bg-red-950"
          aria-label={"Remove " + props.book.title}
          onClick={(e) => props.onRemove(e)}
        >
          ×
        </Button.Root>
      </div>
      <div class="mt-2 flex items-center justify-between">
        {arrow("←", step(-1))}
        <Show when={props.book.status === "read"}>
          <Rating.Root value={props.book.rating ?? 0} onChange={(v) => props.onRate(v)}>
            <Rating.Label class="sr-only">Rating</Rating.Label>
            <Rating.Control class="flex">
              <For each={stars}>
                {(n, _) => (
                  <Rating.Item class="cursor-pointer px-px text-lg text-amber-500">
                    <Rating.ItemControl>{(state) => <span>{state.highlighted() ? "★" : "☆"}</span>}</Rating.ItemControl>
                    <Rating.ItemLabel class="sr-only">{String(n) + " stars"}</Rating.ItemLabel>
                  </Rating.Item>
                )}
              </For>
            </Rating.Control>
          </Rating.Root>
        </Show>
        {arrow("→", step(1))}
      </div>
    </li>
  );
}
