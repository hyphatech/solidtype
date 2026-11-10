SWITCH ?= solidtype
OPAM = opam exec --switch=$(SWITCH) --
DOCS_PORT ?= 4321
REFERENCE = solidtype solidtype-kobalte solidtype-headless solidtype-heroui solidtype-rhp solidtype-internationalized-date ppx_solidtype odoc.support

.DEFAULT_GOAL := help
.PHONY: help setup build test lint fmt example example-serve docs docs-serve generate release

help: ## list targets
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	  | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-14s %s\n", $$1, $$2}'

setup: ## create the switch and install dependencies
	@command -v bun >/dev/null 2>&1 || echo "The plugin and the example need Bun 1.3 or later."
	@opam switch list --short | grep -qx $(SWITCH) || opam switch create $(SWITCH) --empty -y
	opam repo add open-opam https://github.com/open-opam/opam-repository.git --switch=$(SWITCH) --rank=1
	opam install . --switch=$(SWITCH) --deps-only --with-test --with-dev-setup -y
	bun install --frozen-lockfile

build: ## build everything
	$(OPAM) dune build @all

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
	$(OPAM) bun generate/rhp.ts --check
	$(OPAM) bun generate/internationalized_date.ts --check

fmt: ## format the code
	$(OPAM) dune fmt

example: build node_modules ## build the example, as a Vite page and an Astro one
	bun --bun vite build --config example/vite.config.ts
	bun --bun astro build --root example

BOARD_DB ?= example/board.db

example-serve: example ## serve the example and its API on http://localhost:4420
	@test -f $(BOARD_DB) || $(OPAM) rowtype-migrate create --url sqlite:$(BOARD_DB)
	$(OPAM) rowtype-migrate up --dir example/migrations --url sqlite:$(BOARD_DB)
	BOARD_DB=$(BOARD_DB) _build/default/example/server/serve.exe

docs: build node_modules ## build the documentation site
	$(OPAM) dune build @doc
	rm -rf docs/public/reference
	mkdir -p docs/public/reference
	cd _build/default/_doc/_html && cp -R $(REFERENCE) $(CURDIR)/docs/public/reference/
	chmod -R u+w docs/public/reference
	bun --bun astro build --root docs

# The built documentation, as a host serves it: Pagefind's index exists only
# in a build, and a page served as it changes loads its styles after its
# text. Run from docs/, where Astro finds its config again.
docs-serve: docs ## serve the built documentation site
	cd docs && bun --bun astro preview --open --port $(DOCS_PORT)

generate: node_modules ## write the generated bindings
	$(OPAM) bun generate/html.ts
	$(OPAM) bun generate/kobalte.ts
	$(OPAM) bun generate/heroui.ts
	$(OPAM) bun generate/rhp.ts
	$(OPAM) bun generate/internationalized_date.ts

release: node_modules ## tag VERSION and make its release
	@test "$$(git show HEAD:CHANGES.md | grep -m1 '^## ' | cut -d' ' -f2)" = "$(VERSION)" \
	  || { echo "CHANGES.md must open with ## $(VERSION)" >&2; exit 2; }
	rm -rf _build/plugin && bun vite-plugin/pack.ts $(VERSION) _build/plugin
	open-opam release $(VERSION) --attach _build/plugin/vite-plugin-solidtype-$(VERSION).tgz
