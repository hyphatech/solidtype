/* Generated from Notes's routes. Do not edit: change the routes, and generate it again. */

import { z } from "zod/mini";

/** One input that is not what it should be. */
export const ProblemSchema = z.object({
  /** Where: path.x, query.x, body.x. */
  at: z.string(),
  code: z.string(),
  message: z.string(),
});
export type Problem = z.infer<typeof ProblemSchema>;

/** A refusal: the code a client branches on, and a sentence for a person. */
export const RefusalSchema = z.object({
  /** The code. */
  error: z.string(),
  /** A sentence. */
  message: z.string(),
  /** For invalid: each input that is not what it should be. */
  problems: z.optional(z.array(ProblemSchema)),
});
export type Refusal = z.infer<typeof RefusalSchema>;

export const NoteSchema = z.object({
  id: z.int(),
  /** What is to be done. */
  text: z.string().check(z.minLength(1), z.maxLength(80)),
  state: z.enum(["open", "done"]),
});
export type Note = z.infer<typeof NoteSchema>;

export const DraftSchema = z.object({
  text: z.string().check(z.minLength(1), z.maxLength(80)),
});
export type Draft = z.infer<typeof DraftSchema>;

/** Every code a route may refuse with. */
export const CodeSchema = z.enum([
  "busy",
  "cross_origin",
  "internal",
  "invalid",
  "too_large",
  "unreadable",
  "unsupported_media_type",
]);
export type Code = z.infer<typeof CodeSchema>;

/** Each route, by method and pattern: the body it reads, and what it answers. */
export const routes = {
  "GET /notes": {
    body: null,
    answer: { status: 200, schema: z.array(NoteSchema) },
  },
  "POST /notes": {
    body: DraftSchema,
    answer: { status: 201, schema: NoteSchema },
  },
  "PUT /notes/{id}/done": {
    body: null,
    answer: { status: 200, schema: NoteSchema },
  },
} as const;
