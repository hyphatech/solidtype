// The board fetches the page's own origin, /api/tasks, as a browser
// resolves it. jsdom's fetch is Node's, which resolves nothing against the
// page, so a relative URL is resolved here against the page's, the
// server's origin.
const fetched = globalThis.fetch;
globalThis.fetch = (input, init) =>
  fetched(typeof input === "string" ? new URL(input, location.href) : input, init);
