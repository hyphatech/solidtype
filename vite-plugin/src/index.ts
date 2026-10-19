import type { Plugin } from "vite";
import { rewrite } from "./rewrite.ts";

// Runs before vite-plugin-solid, which then compiles the JSX it writes as it
// compiles TSX.
export default function solidtype(): Plugin {
  return {
    name: "solidtype",
    enforce: "pre",
    async transform(code, id) {
      if (!/\.jsx(\?|$)/.test(id)) return null;
      return rewrite(code, id) as Promise<{ code: string; map: null } | null>;
    },
  };
}
