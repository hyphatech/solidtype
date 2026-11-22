import { configure } from "@solidjs/testing-library";

// The board fetches the page's own origin, /api/tasks, as a browser
// resolves it. jsdom's fetch is Node's, which resolves nothing against the
// page, so a relative URL is resolved here against the page's, the
// server's origin.
const fetched = globalThis.fetch;
globalThis.fetch = (input, init) =>
  fetched(typeof input === "string" ? new URL(input, location.href) : input, init);

// A query that waits for what the server sends waits as long as a run of
// every test file at once can take to send it: Testing Library's second is a
// quiet machine's, and a loaded one answers later.
configure({ asyncUtilTimeout: 5000 });
