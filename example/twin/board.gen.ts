/* Generated from Kanban Board's routes. Do not edit: change the routes, and generate it again. */

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

export const TaskSchema = z.object({
  id: z.int(),
  title: z.string(),
  note: z.optional(z.string()),
  status: z.enum(["to_do", "doing", "done"]),
});
export type Task = z.infer<typeof TaskSchema>;

export const DraftInputSchema = z.object({
  title: z.string().check(z.minLength(1), z.maxLength(120)),
  note: z.optional(z.nullable(z.string().check(z.maxLength(200)))),
});
export type DraftInput = z.infer<typeof DraftInputSchema>;

export const MoveSchema = z.object({
  status: z.enum(["to_do", "doing", "done"]),
});
export type Move = z.infer<typeof MoveSchema>;

/** Every code a route may refuse with. */
export const CodeSchema = z.enum([
  "busy",
  "cross_origin",
  "internal",
  "invalid",
  "not_found",
  "too_large",
  "unreadable",
  "unsupported_media_type",
]);
export type Code = z.infer<typeof CodeSchema>;

/** Each route, by method and pattern: the body it reads, and what it answers. */
export const routes = {
  "GET /api/tasks": {
    body: null,
    answer: { status: 200, schema: z.array(TaskSchema) },
  },
  "POST /api/tasks": {
    body: DraftInputSchema,
    answer: { status: 201, schema: TaskSchema },
  },
  "PUT /api/tasks/{id}/status": {
    body: MoveSchema,
    answer: { status: 200, schema: TaskSchema },
  },
  "DELETE /api/tasks/{id}": {
    body: null,
    answer: { status: 204 },
  },
} as const;
