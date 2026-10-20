import * as Button from "@kobalte/core/button";
import * as Dialog from "@kobalte/core/dialog";
import * as TextField from "@kobalte/core/text-field";
import { batch, createSignal } from "solid-js";
import { call } from "./api";
import { BookSchema } from "./shelf.gen";

export function make(props: { onAdded: (title: string) => void }) {
  const [open, setOpen] = createSignal(false);
  const [title, setTitle] = createSignal("");
  const [author, setAuthor] = createSignal("");
  const [problem, setProblem] = createSignal("");
  return (
    <Dialog.Root open={open()} onOpenChange={(v) => setOpen(v)}>
      <Dialog.Trigger class="rounded-lg bg-amber-700 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-amber-800 dark:bg-amber-500 dark:text-stone-950 dark:hover:bg-amber-400">
        Add a book
      </Dialog.Trigger>
      <Dialog.Portal>
        <Dialog.Overlay class="fixed inset-0 bg-stone-950/40 backdrop-blur-sm" />
        <div class="fixed inset-0 grid place-items-center p-4">
          <Dialog.Content class="w-full max-w-md rounded-2xl bg-white p-6 shadow-xl dark:bg-stone-900">
            <Dialog.Title class="mb-4 font-serif text-xl font-semibold">Add a book</Dialog.Title>
            <form
              onSubmit={async (e) => {
                e.preventDefault();
                const added = await call("POST", "/api/books", BookSchema, { title: title(), author: author() });
                if (!added.ok) return setProblem(added.error);
                batch(() => {
                  setTitle("");
                  setAuthor("");
                  setProblem("");
                  setOpen(false);
                });
                props.onAdded(added.value.title);
              }}
            >
              <TextField.Root class="mb-4 flex flex-col gap-1" value={title()} onChange={(v) => setTitle(v)} required={true}>
                <TextField.Label class="text-sm text-stone-500 dark:text-stone-400">Title</TextField.Label>
                <TextField.Input class="rounded-lg border border-stone-300 bg-stone-50 px-3 py-2 outline-none focus:border-amber-500 focus:ring-2 focus:ring-amber-500/30 dark:border-stone-700 dark:bg-stone-950" />
              </TextField.Root>
              <TextField.Root class="mb-4 flex flex-col gap-1" value={author()} onChange={(v) => setAuthor(v)} required={true}>
                <TextField.Label class="text-sm text-stone-500 dark:text-stone-400">Author</TextField.Label>
                <TextField.Input class="rounded-lg border border-stone-300 bg-stone-50 px-3 py-2 outline-none focus:border-amber-500 focus:ring-2 focus:ring-amber-500/30 dark:border-stone-700 dark:bg-stone-950" />
              </TextField.Root>
              <p class="mb-2 min-h-6 text-sm text-red-600 dark:text-red-400" role="alert">
                {problem()}
              </p>
              <div class="flex justify-end gap-2">
                <Dialog.CloseButton class="rounded-lg px-4 py-2 text-sm text-stone-600 hover:bg-stone-100 dark:text-stone-300 dark:hover:bg-stone-800">
                  Cancel
                </Dialog.CloseButton>
                <Button.Root
                  class="rounded-lg bg-amber-700 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-amber-800 dark:bg-amber-500 dark:text-stone-950 dark:hover:bg-amber-400"
                  type="submit"
                >
                  Add
                </Button.Root>
              </div>
            </form>
          </Dialog.Content>
        </div>
      </Dialog.Portal>
    </Dialog.Root>
  );
}
