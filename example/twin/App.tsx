import { createResource, createSignal, For } from "solid-js";
import { isServer } from "solid-js/web";
import * as Chip from "solidtype-heroui/chip.jsx";
import * as EmptyState from "solidtype-heroui/empty_state.jsx";
import * as Toast from "solidtype-heroui/toast.jsx";
import { z } from "zod/mini";
import { make as AddTask } from "./AddTask";
import { call } from "./api";
import { make as Card } from "./Card";
import { TaskSchema, type Task } from "./board.gen";

type Status = Task["status"];

const labels: Record<Status, string> = { to_do: "To do", doing: "Doing", done: "Done" };
const statuses: Status[] = ["to_do", "doing", "done"];

export function make() {
  const [tasks, { refetch }] = createResource(
    () => !isServer,
    async () => {
      const listed = await call("GET", "/api/tasks", z.array(TaskSchema));
      if (listed.ok) return listed.value;
      Toast.danger(undefined, listed.error, undefined, undefined, undefined, undefined, "Could not load the board");
      return [];
    },
  );
  const changed = (what: string) => {
    refetch();
    Toast.success(undefined, what, undefined, undefined, undefined, undefined, "Done");
  };
  const settle = async (what: string, answer: Promise<{ ok: boolean; error?: string }>) => {
    const a = await answer;
    if (a.ok) changed(what);
    else Toast.danger(undefined, a.error ?? "", undefined, undefined, undefined, undefined, "Not done");
  };
  const move = (t: Task, status: Status) => {
    if (t.status !== status)
      settle(`${t.title} is now in ${labels[status]}`, call("PUT", `/api/tasks/${t.id}/status`, TaskSchema, { status }));
  };
  const inColumn = (status: Status) => (tasks.latest ?? []).filter((t) => t.status === status);
  const find = (id: number) => (tasks.latest ?? []).find((t) => t.id === id);
  const [over, setOver] = createSignal<Status>();
  return (
    <main class="mx-auto max-w-6xl px-4 py-10">
      <header class="mb-8 flex items-center justify-between gap-4">
        <h1 class="text-3xl font-semibold tracking-tight">Kanban Board</h1>
        <AddTask onAdded={(title) => changed(title + " is on the board")} />
      </header>
      <div class="grid gap-4 md:grid-cols-3">
        <For each={statuses}>
          {(status, _) => (
            <section
              aria-label={labels[status]}
              class={
                over() === status
                  ? "rounded-3xl bg-accent-soft p-3 ring-2 ring-accent transition"
                  : "rounded-3xl bg-surface-secondary p-3 transition"
              }
              onDragOver={(e) => {
                e.preventDefault();
                setOver(status);
              }}
              onDragLeave={() => setOver(undefined)}
              onDrop={(e) => {
                e.preventDefault();
                setOver(undefined);
                const t = find(Number(e.dataTransfer?.getData("text/plain")));
                if (t) move(t, status);
              }}
            >
              <h2 class="mb-3 flex items-center justify-between px-2 text-sm font-medium text-muted">
                {labels[status]}
                <Chip.component color="accent" size="sm" variant="soft">
                  {inColumn(status).length}
                </Chip.component>
              </h2>
              <ul class="flex min-h-24 flex-col gap-2">
                <For
                  each={inColumn(status)}
                  fallback={
                    <li class="rounded-2xl border border-dashed border-border">
                      <EmptyState.component class="p-4 text-center">Drop a task here</EmptyState.component>
                    </li>
                  }
                >
                  {(t, _) => (
                    <Card
                      task={t}
                      onMove={(status) => move(t, status)}
                      onRemove={() => settle(`${t.title} is off the board`, call("DELETE", `/api/tasks/${t.id}`, null))}
                    />
                  )}
                </For>
              </ul>
            </section>
          )}
        </For>
      </div>
      <Toast.Provider.component placement="bottom_end" />
    </main>
  );
}
