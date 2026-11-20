# TextShimmer

Text with a highlight sweeping across it, for a label of work under way.

A label of work under way, a highlight sweeping across it. Its look is a
stylesheet the library ships, imported as [Theming](theming.md#setup) shows.
Under reduced motion the text is still.

## Usage

```ocaml title="text_shimmer_usage.mlx"
module Text_shimmer = Solidtype_heroui.Text_shimmer

let make () =
  <div class_="flex flex-col gap-4 text-sm">
    <Text_shimmer>"Thinking..."</Text_shimmer>
    <Text_shimmer>"Generating response..."</Text_shimmer>
  </div>
```

## Color

The shimmer is drawn in the text's colour, so a colour class keeps it.

```ocaml title="text_shimmer_color.mlx"
module Text_shimmer = Solidtype_heroui.Text_shimmer

let make () =
  <Text_shimmer class_="text-sm text-muted">"Thinking..."</Text_shimmer>
```

## Styling Reference

### CSS Classes

- `.text-shimmer`
- `.text-shimmer__text`
- `.text-shimmer__highlight`

## API Reference

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after its own classes |
| `children` | `children` | elements | Its text |
