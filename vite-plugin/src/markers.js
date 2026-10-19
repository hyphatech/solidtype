// The markers never run: vite-plugin-solidtype rewrites every one into JSX.
// A build that reaches this file has not configured the plugin.
throw new Error(
  "solidtype: an OCaml component was bundled without vite-plugin-solidtype; add solidtype() to the Vite plugins, before solid()",
);
