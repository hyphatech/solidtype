SWITCH ?= hypha-solidtype
OPAM = opam exec --switch=$(SWITCH) --
PORT ?= 4321

.DEFAULT_GOAL := help
.PHONY: help setup build test lint fmt example serve generate

help: ## list targets
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	  | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-10s %s\n", $$1, $$2}'

setup: ## create the switch and install dependencies
	@command -v bun >/dev/null 2>&1 || echo "The plugin and the example need Bun 1.3 or later."
	@opam switch list --short | grep -qx $(SWITCH) || opam switch create $(SWITCH) --empty -y
	opam repo add hypha https://github.com/hyphatech/opam-repository.git --switch=$(SWITCH) --rank=1
	opam install . --switch=$(SWITCH) --deps-only --with-test --with-dev-setup -y
	bun install --frozen-lockfile

build: ## build everything
	$(OPAM) dune build @all

# The plugin's and the example's suites read Melange's output, so the build
# comes first.
test: build ## run the tests
	$(OPAM) dune test --force
	bun run test

# Release is the profile opam installs with.
lint: ## check formatting, the plugin's types, the release build and the generated bindings
	$(OPAM) dune build @all @fmt
	$(OPAM) dune build --profile release @all
	bun run tsc -p vite-plugin
	$(OPAM) bun generate/html.ts --check
	$(OPAM) bun generate/kobalte.ts --check

fmt: ## format the code
	$(OPAM) dune fmt

example: build ## build the example site into _build/example-dist
	bun --bun astro build

serve: example ## serve the example site and its notes on http://localhost:$(PORT)
	_build/default/example/server/serve.exe $(PORT) _build/example-dist

generate: ## write the bindings generated from Solid's and Kobalte's types
	$(OPAM) bun generate/html.ts
	$(OPAM) bun generate/kobalte.ts
