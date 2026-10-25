import { Show } from "solid-js";
import * as Button from "solidtype-heroui/button.jsx";
import * as Card from "solidtype-heroui/card.jsx";
import * as CloseButton from "solidtype-heroui/close_button.jsx";
import type { Task } from "./board.gen";

type Status = Task["status"];

const labels: Record<Status, string> = { to_do: "To do", doing: "Doing", done: "Done" };
const order: Status[] = ["to_do", "doing", "done"];

export function make(props: { task: Task; onMove: (status: Status) => void; onRemove: () => void }) {
  const arrow = (label: string, target: Status | undefined) => {
    if (target === undefined) return <span class="size-8" />;
    return (
      <Button.component
        variant="ghost"
        size="sm"
        isIconOnly={true}
        aria-label={"Move " + props.task.title + " to " + labels[target]}
        onClick={() => props.onMove(target)}
      >
        {label}
      </Button.component>
    );
  };
  const step = (by: number) => order[order.indexOf(props.task.status) + by];
  return (
    <li
      class="cursor-grab active:cursor-grabbing"
      draggable={true}
      onDragStart={(e) => e.dataTransfer?.setData("text/plain", String(props.task.id))}
    >
      <Card.component class="gap-1 p-3">
        <Card.Header.component class="flex-row items-start gap-2">
          <div class="min-w-0 flex-1">
            <Card.Title.component class="truncate">{props.task.title}</Card.Title.component>
            <Show when={props.task.note}>
              {(note) => <Card.Description.component class="truncate">{note()}</Card.Description.component>}
            </Show>
          </div>
          <CloseButton.component aria-label={"Remove " + props.task.title} onClick={() => props.onRemove()} />
        </Card.Header.component>
        <Card.Footer.component class="justify-between">
          {arrow("←", step(-1))}
          {arrow("→", step(1))}
        </Card.Footer.component>
      </Card.component>
    </li>
  );
}
