// The twins' client: each route called as the OCaml client calls it, its
// answer read by the schemas the server prints, and a refusal as its
// sentence.
import { z } from "zod/mini";
import { RefusalSchema } from "./board.gen";

export async function call<T>(method: string, path: string, schema: z.ZodMiniType<T> | null, body?: unknown) {
  try {
    const res = await fetch(path, {
      method,
      headers: body === undefined ? {} : { "content-type": "application/json" },
      body: body === undefined ? undefined : JSON.stringify(body),
    });
    const json = res.status === 204 ? null : await res.json();
    if (!res.ok) {
      const r = RefusalSchema.safeParse(json);
      return { ok: false as const, error: r.success ? (r.data.problems?.[0]?.message ?? r.data.message) : "Something went wrong at our end." };
    }
    return { ok: true as const, value: (schema ? schema.parse(json) : null) as T };
  } catch {
    return { ok: false as const, error: "The board cannot be reached." };
  }
}
