# PRDs

A PRD here is one piece of work being decided and built, as Hypha's
`PRD.md` says. When its work lands, each fact it holds moves to the
document that owns that kind of fact, and the PRD is deleted.

| A fact about | Lives in |
|---|---|
| what a user can do, and a package's state | `README.md` |
| what changed, for a user deciding to upgrade | `CHANGES.md` |
| what a contributor must not break, and the layout | `AGENTS.md` |
| how a part behaves, its contract | its `.mli` |
| a port's use, its examples and how it differs from React's | its page under `docs/src/content/docs/heroui/` |
| which of HeroUI's components are ported, and what of each is not yet | `docs/src/content/docs/heroui/coverage.mdx` |
