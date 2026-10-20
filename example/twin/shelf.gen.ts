/* Generated from Shelf's routes. Do not edit: change the routes, and generate it again. */

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

export const BookSchema = z.object({
  id: z.int(),
  title: z.string(),
  author: z.string(),
  status: z.enum(["to_read", "reading", "read"]),
  rating: z.optional(z.int().check(z.gte(1), z.lte(5))),
});
export type Book = z.infer<typeof BookSchema>;

export const DraftSchema = z.object({
  title: z.string().check(z.minLength(1), z.maxLength(120)),
  author: z.string().check(z.minLength(1), z.maxLength(80)),
});
export type Draft = z.infer<typeof DraftSchema>;

export const MoveSchema = z.object({
  status: z.enum(["to_read", "reading", "read"]),
});
export type Move = z.infer<typeof MoveSchema>;

export const StarsSchema = z.object({
  stars: z.int().check(z.gte(1), z.lte(5)),
});
export type Stars = z.infer<typeof StarsSchema>;

/** Every code a route may refuse with. */
export const CodeSchema = z.enum([
  "busy",
  "cross_origin",
  "internal",
  "invalid",
  "not_found",
  "not_read",
  "too_large",
  "unreadable",
  "unsupported_media_type",
]);
export type Code = z.infer<typeof CodeSchema>;

/** Each route, by method and pattern: the body it reads, and what it answers. */
export const routes = {
  "GET /api/books": {
    body: null,
    answer: { status: 200, schema: z.array(BookSchema) },
  },
  "POST /api/books": {
    body: DraftSchema,
    answer: { status: 201, schema: BookSchema },
  },
  "PUT /api/books/{id}/status": {
    body: MoveSchema,
    answer: { status: 200, schema: BookSchema },
  },
  "PUT /api/books/{id}/rating": {
    body: StarsSchema,
    answer: { status: 200, schema: BookSchema },
  },
  "DELETE /api/books/{id}": {
    body: null,
    answer: { status: 204 },
  },
} as const;
