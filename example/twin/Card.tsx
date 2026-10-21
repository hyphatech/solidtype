import * as Button from "@kobalte/core/button";
import { Show } from "solid-js";
import type { Task } from "./board.gen";

type Status = Task["status"];

const labels: Record<Status, string> = { to_do: "To do", doing: "Doing", done: "Done" };
const order: Status[] = ["to_do", "doing", "done"];

export function make(props: { task: Task; onMove: (status: Status) => void; onRemove: () => void }) {
  const arrow = (label: string, target: Status | undefined) => {
    if (target === undefined) return <span class="w-7" />;
    return (
      <Button.Root
        class="grid h-7 w-7 place-items-center rounded-md text-stone-400 hover:bg-stone-100 hover:text-stone-700 dark:hover:bg-stone-800 dark:hover:text-stone-200"
        aria-label={"Move " + props.task.title + " to " + labels[target]}
        onClick={() => props.onMove(target)}
      >
        {label}
      </Button.Root>
    );
  };
  const step = (by: number) => order[order.indexOf(props.task.status) + by];
  return (
    <li
      class="group cursor-grab rounded-lg border border-stone-200 bg-white p-3 shadow-sm transition hover:shadow-md active:cursor-grabbing dark:border-stone-700 dark:bg-stone-900"
      draggable={true}
      onDragStart={(e) => e.dataTransfer?.setData("text/plain", String(props.task.id))}
    >
      <div class="flex items-start gap-2">
        <div class="min-w-0 flex-1">
          <p class="truncate font-medium text-stone-900 dark:text-stone-100">{props.task.title}</p>
          <Show when={props.task.note}>
            {(note) => <p class="truncate text-sm text-stone-500 dark:text-stone-400">{note()}</p>}
          </Show>
        </div>
        <Button.Root
          class="grid h-6 w-6 place-items-center rounded-md text-stone-400 opacity-0 transition group-hover:opacity-100 hover:bg-red-50 hover:text-red-600 focus-visible:opacity-100 dark:hover:bg-red-950"
          aria-label={"Remove " + props.task.title}
          onClick={() => props.onRemove()}
        >
          ×
        </Button.Root>
      </div>
      <div class="mt-2 flex items-center justify-between">
        {arrow("←", step(-1))}
        {arrow("→", step(1))}
      </div>
    </li>
  );
}
