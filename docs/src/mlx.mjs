// MLX's JSX inside OCaml, for Shiki. Its OCaml grammar has no JSX, so a
// block of `.mlx` read as OCaml leaves every tag and attribute plain. This
// grammar is injected into OCaml's, and reads a tag and its attributes,
// each value OCaml again. A parenthesised value is consumed whole before the
// tag's end is looked for, since `->` or `a > b` inside one is not a tag's
// `>`.
export default {
  name: "mlx-jsx",
  scopeName: "source.ocaml.mlx-jsx",
  injectTo: ["source.ocaml"],
  injectionSelector: "L:source.ocaml -comment -string",
  patterns: [{ include: "#closing" }, { include: "#opening" }],
  repository: {
    closing: {
      match: "(</)([A-Za-z_][\\w.']*)(>)",
      captures: {
        1: { name: "punctuation.definition.tag.begin.jsx" },
        2: { name: "entity.name.tag.jsx" },
        3: { name: "punctuation.definition.tag.end.jsx" },
      },
    },
    opening: {
      begin: "(<)([A-Za-z_][\\w.']*)(?=[\\s/>])",
      beginCaptures: {
        1: { name: "punctuation.definition.tag.begin.jsx" },
        2: { name: "entity.name.tag.jsx" },
      },
      end: "(/?>)",
      endCaptures: { 1: { name: "punctuation.definition.tag.end.jsx" } },
      patterns: [
        { include: "#parens" },
        {
          match: "(\\??)([a-z_][\\w']*)(?==)",
          captures: {
            1: { name: "punctuation.definition.attribute.jsx" },
            2: { name: "entity.other.attribute-name.jsx" },
          },
        },
        { match: "=", name: "punctuation.separator.key-value.jsx" },
        { match: "(?<![=`])\\b[a-z_][\\w']*\\b", name: "entity.other.attribute-name.jsx" },
        { include: "source.ocaml#term" },
      ],
    },
    parens: {
      begin: "\\((?!\\*)",
      end: "\\)",
      patterns: [
        { include: "#parens" },
        { include: "source.ocaml#comment" },
        { include: "#closing" },
        { include: "#opening" },
        { include: "source.ocaml#term" },
      ],
    },
  },
};
