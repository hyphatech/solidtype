SWITCH ?= hypha-solidtype
OPAM = opam exec --switch=$(SWITCH) --
DOCS_PORT ?= 4321
# odoc's reference: dune's @doc-new builds a package's pages by its index, links
# them to the standard library's, built beside them, and styles them all.
REFERENCE = _build/default/_doc_new/html/docs
REFERENCE_FILES = local/solidtype/Solidtype/index.html \
  local/solidtype-kobalte/Solidtype_kobalte/index.html \
  local/solidtype-heroui/Solidtype_heroui/index.html \
  local/ppx_solidtype/Ppx_solidtype/index.html \
  stdlib/Stdlib/index.html odoc.support/odoc.css

.DEFAULT_GOAL := help
.PHONY: help setup build test lint fmt example example-serve docs docs-serve generate

help: ## list targets
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	  | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-14s %s\n", $$1, $$2}'

setup: ## create the switch and install dependencies
	@command -v bun >/dev/null 2>&1 || echo "The plugin and the example need Bun 1.3 or later."
	@opam switch list --short | grep -qx $(SWITCH) || opam switch create $(SWITCH) --empty -y
	opam repo add hypha https://github.com/hyphatech/opam-repository.git --switch=$(SWITCH) --rank=1
	opam install . --switch=$(SWITCH) --deps-only --with-test --with-dev-setup -y
	bun install --frozen-lockfile

build: ## build everything
	$(OPAM) dune build @all

# Bun's dependencies, the documentation's among them, installed again whenever
# the lockfile or a manifest changes, so no target runs against what an older
# checkout installed.
node_modules: package.json docs/package.json bun.lock
	bun install --frozen-lockfile
	@touch node_modules

# The plugin's and the example's suites read Melange's output, so the build
# comes first.
test: build node_modules ## run the tests
	$(OPAM) dune test --force
	$(OPAM) bun run test

# Release is the profile opam installs with.
lint: node_modules ## check formatting, types, the release build and bindings
	$(OPAM) dune build @all @fmt
	$(OPAM) dune build --profile release @all
	bun run tsc -p vite-plugin
	bun run tsc -p generate
	$(OPAM) bun generate/html.ts --check
	$(OPAM) bun generate/kobalte.ts --check
	$(OPAM) bun generate/heroui.ts --check

fmt: ## format the code
	$(OPAM) dune fmt

example: build node_modules ## build the example, as a Vite page and an Astro one
	bun --bun vite build --config example/vite.config.ts
	bun --bun astro build --root example

# The board's tasks, kept in this file from one serve to the next, migrated
# before the server starts, never by it.
BOARD_DB ?= example/board.db

example-serve: example ## serve the example and its API on http://localhost:4420
	@test -f $(BOARD_DB) || $(OPAM) rowtype-migrate create --url sqlite:$(BOARD_DB)
	$(OPAM) rowtype-migrate up --dir example/migrations --url sqlite:$(BOARD_DB)
	BOARD_DB=$(BOARD_DB) _build/default/example/server/serve.exe

# odoc's reference from the .mli files is copied in first, for the site to
# serve as it is.
docs: build node_modules ## build the documentation site
	$(OPAM) dune build $(REFERENCE_FILES:%=$(REFERENCE)/%)
	rm -rf docs/public/reference
	cp -R $(REFERENCE) docs/public/reference
	chmod -R u+w docs/public/reference
	bun --bun astro build --root docs

# The built documentation, as a host serves it: Pagefind's index exists only
# in a build, and a page served as it changes loads its styles after its
# text. Run from docs/, where Astro finds its config again.
docs-serve: docs ## serve the built documentation site
	cd docs && bun --bun astro preview --open --port $(DOCS_PORT)

generate: node_modules ## write the bindings from Solid's, Kobalte's and HeroUI's types
	$(OPAM) bun generate/html.ts
	$(OPAM) bun generate/kobalte.ts
	$(OPAM) bun generate/heroui.ts
