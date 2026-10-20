(lang dune 3.18)
(name solidtype)

(using melange 0.1)

(dialect
 (name mlx)
 (implementation
  (extension mlx)
  (merlin_reader mlx)
  (format
   (run ocamlformat-mlx --impl %{input-file}))
  (preprocess
   (run mlx-pp %{input-file}))))

(implicit_transitive_deps false)

(generate_opam_files true)

(maintainers "Hypha Technologies Ltd <dev@hyphatech.io>")

(authors "Hypha Technologies Ltd")

(license MIT)

(maintenance_intent "(latest)")

(source
 (github hyphatech/solidtype))

(package
 (name solidtype)
 (synopsis "Solid, typed: OCaml front ends on SolidJS, through Melange")
 (description
  "Bindings to Solid for Melange, written in OCaml's JSX, where a reactive read in the wrong place does not compile. The JSX reaches the browser as the code Solid's own compiler emits for it.")
 (depends
  (ocaml
   (>= 5.5))
  (melange
   (>= 7.0.1-55))
  (mlx
   (>= 0.11))
  (ppx_solidtype
   (= :version))
  (melange-jest
   (and
    :with-test
    (>= 0.2.0)))
  ; The example's server, which its notes island is printed from and
  ; called against.
  (spindle
   (and
    :with-test
    (>= 0.8.0)
    (< 0.9.0)))
  (wiretype
   (and
    :with-test
    (>= 0.6.0)
    (< 0.7.0)))
  (ppx_wiretype
   (and
    :with-test
    (>= 0.6.0)
    (< 0.7.0)))
  (spindle-cli
   (and
    :with-test
    (>= 0.8.0)
    (< 0.9.0)))
  (eio_main
   (and
    :with-test
    (>= 1.6)))
  (merlin
   (and
    :with-dev-setup
    (>= 5.6-504)))
  (ocaml-lsp-server
   (and
    :with-dev-setup
    (>= 1.25.0)))
  (ocamlformat
   (and
    :with-dev-setup
    (= 0.29.0)))
  (ocamlformat-mlx
   (and
    :with-dev-setup
    (= 0.29.0.1)))))

(package
 (name solidtype-kobalte)
 (synopsis "Kobalte for solidtype: Solid's accessible components, typed")
 (description
  "Every component of Kobalte 0.13, part by part, its hooks and utilities, for OCaml front ends on Solid written with solidtype. Generated from Kobalte's own declarations.")
 (depends
  (ocaml
   (>= 5.5))
  (melange
   (>= 7.0.1-55))
  (solidtype
   (= :version))))

(package
 (name ppx_solidtype)
 (synopsis "The JSX lowering of solidtype: OCaml's JSX to Solid's")
 (description
  "Lowers each JSX element MLX parses into one call Solid's compiler is handed, with every dynamic attribute, child and prop a thunk.")
 (depends
  (ocaml
   (>= 5.5))
  (ppxlib
   (>= 0.36.0))
  (alcotest
   (and
    :with-test
    (>= 1.9.1)))))
