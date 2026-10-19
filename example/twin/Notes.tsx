import { createResource, createSignal, For } from "solid-js";
import { z } from "zod/mini";
import { DraftSchema, NoteSchema, RefusalSchema, type Note } from "./notes.gen";

function mark(n: Note) {
  return n.state === "open" ? "open" : "done";
}

async function refusal(res: Response) {
  const r = RefusalSchema.safeParse(await res.json().catch(() => null));
  return r.success ? r.data.message : "Something went wrong at our end.";
}

export function make(props: { origin?: string }) {
  const origin = () => props.origin ?? "";
  const [problem, setProblem] = createSignal("");
  const [notes, { refetch }] = createResource(async () => {
    const res = await fetch(`${origin()}/notes`);
    if (!res.ok) {
      setProblem(await refusal(res));
      return [];
    }
    return z.array(NoteSchema).parse(await res.json());
  });
  const [draft, setDraft] = createSignal("");
  const add = async (_: MouseEvent) => {
    const body = DraftSchema.safeParse({ text: draft() });
    if (!body.success) return setProblem("A note is one to eighty characters.");
    const res = await fetch(`${origin()}/notes`, {
      method: "POST",
      headers: { "content-type": "application/json" },
      body: JSON.stringify(body.data),
    });
    if (!res.ok) return setProblem(await refusal(res));
    setDraft("");
    setProblem("");
    refetch();
  };
  return (
    <section class="notes">
      <ul>
        <For each={notes() ?? []}>{(n, _) => <li class={mark(n)}>{n.text}</li>}</For>
      </ul>
      <input
        aria-label="New note"
        value={draft()}
        onInput={(e) => setDraft(e.currentTarget.value)}
      />
      <button type="button" onClick={add}>Add</button>
      <p role="status">{problem()}</p>
    </section>
  );
}
