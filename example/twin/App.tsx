import * as Toast from "@kobalte/core/toast";
import { createResource, createSignal, For } from "solid-js";
import { isServer } from "solid-js/web";
import { z } from "zod/mini";
import { make as AddBook } from "./AddBook";
import { call } from "./api";
import { make as Card } from "./Card";
import { show } from "./Notice";
import { BookSchema, type Book } from "./shelf.gen";

type Status = Book["status"];

const labels: Record<Status, string> = { to_read: "To read", reading: "Reading", read: "Read" };
const statuses: Status[] = ["to_read", "reading", "read"];

export function make() {
  const [books, { refetch }] = createResource(
    () => !isServer,
    async () => {
      const listed = await call("GET", "/api/books", z.array(BookSchema));
      if (listed.ok) return listed.value;
      show("Could not load the shelf", listed.error);
      return [];
    },
  );
  const changed = (what: string) => {
    refetch();
    show("Done", what);
  };
  const settle = async (what: string, answer: Promise<{ ok: boolean; error?: string }>) => {
    const a = await answer;
    if (a.ok) changed(what);
    else show("Not done", a.error ?? "");
  };
  const move = (b: Book, status: Status) => {
    if (b.status !== status)
      settle(`${b.title} is now in ${labels[status]}`, call("PUT", `/api/books/${b.id}/status`, BookSchema, { status }));
  };
  const shelved = (status: Status) => (books.latest ?? []).filter((b) => b.status === status);
  const find = (id: number) => (books.latest ?? []).find((b) => b.id === id);
  const [over, setOver] = createSignal<Status>();
  return (
    <main class="mx-auto max-w-6xl px-4 py-10">
      <header class="mb-8 flex items-center justify-between">
        <h1 class="font-serif text-3xl font-semibold tracking-tight">Shelf</h1>
        <AddBook onAdded={(title) => changed(title + " is on the shelf")} />
      </header>
      <div class="grid gap-4 md:grid-cols-3">
        <For each={statuses}>
          {(status, _) => (
            <section
              aria-label={labels[status]}
              class={
                over() === status
                  ? "rounded-xl bg-amber-100/70 p-3 ring-2 ring-amber-400 transition dark:bg-amber-950/40"
                  : "rounded-xl bg-stone-100 p-3 transition dark:bg-stone-900/60"
              }
              onDragOver={(e) => {
                e.preventDefault();
                setOver(status);
              }}
              onDragLeave={() => setOver(undefined)}
              onDrop={(e) => {
                e.preventDefault();
                setOver(undefined);
                const b = find(Number(e.dataTransfer?.getData("text/plain")));
                if (b) move(b, status);
              }}
            >
              <h2 class="mb-3 flex items-center justify-between px-1 text-sm font-semibold uppercase tracking-wide text-stone-500 dark:text-stone-400">
                {labels[status]}
                <span class="rounded-full bg-stone-200 px-2 py-0.5 text-xs text-stone-600 dark:bg-stone-800 dark:text-stone-300">
                  {shelved(status).length}
                </span>
              </h2>
              <ul class="flex min-h-24 flex-col gap-2">
                <For
                  each={shelved(status)}
                  fallback={
                    <li class="rounded-lg border border-dashed border-stone-300 p-4 text-center text-sm text-stone-400 dark:border-stone-700">
                      Drop a book here
                    </li>
                  }
                >
                  {(b, _) => (
                    <Card
                      book={b}
                      onMove={(status) => move(b, status)}
                      onRate={(n) => settle(`${b.title} rated ${n}`, call("PUT", `/api/books/${b.id}/rating`, BookSchema, { stars: n }))}
                      onRemove={() => settle(`${b.title} is off the shelf`, call("DELETE", `/api/books/${b.id}`, null))}
                    />
                  )}
                </For>
              </ul>
            </section>
          )}
        </For>
      </div>
      <Toast.Region>
        <Toast.List class="fixed bottom-4 right-4 z-50 flex w-80 max-w-[calc(100vw-2rem)] flex-col gap-2" />
      </Toast.Region>
    </main>
  );
}
