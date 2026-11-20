# Typography

A semantic typography primitive for headings, body copy, and inline code.

Original HeroUI documentation: [Typography](https://heroui.com/en/docs/react/components/typography).

## Usage

```ocaml title="typography_usage.mlx"
module Typography = Solidtype_heroui.Typography

let make () =
  <div class_="flex max-w-xl flex-col gap-4">
    <Typography type_=`h1>"Build better interfaces"</Typography>
    <Typography type_=`h2>"Typography that stays semantic"</Typography>
    <Typography type_=`h3>"Composable by default"</Typography>
    <Typography type_=`h4>"Small heading"</Typography>
    <Typography>
      "HeroUI Typography, with semantic typography types, each the element it \
       means."
    </Typography>
    <Typography color=`muted type_=`body_sm>
      "Smaller muted body copy for secondary descriptions."
    </Typography>
    <Typography type_=`code>"bun add @heroui/styles"</Typography>
  </div>
```

## Parity

The same HeroUI Typography twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two elements:
a marked row is one they disagree on.

## Anatomy

`Typography` maps visual `type_` values to semantic elements by default.

```ocaml
<Typography type_=`h1>"Heading"</Typography>
```

## Examples

### Scale

```ocaml title="typography_scale.mlx"
module Typography = Solidtype_heroui.Typography

let make () =
  <div class_="flex w-full flex-col divide-y divide-border">
    <div class_="grid grid-cols-[160px_1fr] items-center gap-8 py-5">
      <div class_="flex shrink-0 flex-col gap-0.5">
        <span class_="text-sm font-semibold text-foreground">"h1"</span>
        <span class_="text-xs whitespace-nowrap text-muted">
          "36px / 600 / 1.11 / tight"
        </span>
      </div>
      <Typography type_=`h1>"Build better interfaces"</Typography>
    </div>
    <div class_="grid grid-cols-[160px_1fr] items-center gap-8 py-5">
      <div class_="flex shrink-0 flex-col gap-0.5">
        <span class_="text-sm font-semibold text-foreground">"h2"</span>
        <span class_="text-xs whitespace-nowrap text-muted">
          "30px / 600 / 1.17 / tight"
        </span>
      </div>
      <Typography type_=`h2>"Built for the intelligence age"</Typography>
    </div>
    <div class_="grid grid-cols-[160px_1fr] items-center gap-8 py-5">
      <div class_="flex shrink-0 flex-col gap-0.5">
        <span class_="text-sm font-semibold text-foreground">"h3"</span>
        <span class_="text-xs whitespace-nowrap text-muted">
          "24px / 600 / 1.25 / tight"
        </span>
      </div>
      <Typography type_=`h3>"Pricing on your terms"</Typography>
    </div>
    <div class_="grid grid-cols-[160px_1fr] items-center gap-8 py-5">
      <div class_="flex shrink-0 flex-col gap-0.5">
        <span class_="text-sm font-semibold text-foreground">"h4"</span>
        <span class_="text-xs whitespace-nowrap text-muted">
          "20px / 600 / 1.33 / tight"
        </span>
      </div>
      <Typography type_=`h4>"Apply to the startup program"</Typography>
    </div>
    <div class_="grid grid-cols-[160px_1fr] items-center gap-8 py-5">
      <div class_="flex shrink-0 flex-col gap-0.5">
        <span class_="text-sm font-semibold text-foreground">"h5"</span>
        <span class_="text-xs whitespace-nowrap text-muted">
          "18px / 600 / 1.39 / tight"
        </span>
      </div>
      <Typography type_=`h5>"Card titles"</Typography>
    </div>
    <div class_="grid grid-cols-[160px_1fr] items-center gap-8 py-5">
      <div class_="flex shrink-0 flex-col gap-0.5">
        <span class_="text-sm font-semibold text-foreground">"h6"</span>
        <span class_="text-xs whitespace-nowrap text-muted">
          "16px / 600 / 1.50 / tight"
        </span>
      </div>
      <Typography type_=`h6>"Smaller feature headers"</Typography>
    </div>
    <div class_="grid grid-cols-[160px_1fr] items-center gap-8 py-5">
      <div class_="flex shrink-0 flex-col gap-0.5">
        <span class_="text-sm font-semibold text-foreground">"body"</span>
        <span class_="text-xs whitespace-nowrap text-muted">
          "16px / 400 / 1.75"
        </span>
      </div>
      <Typography type_=`body>
        "Primary body text used across documentation, marketing copy, and \
         descriptions."
      </Typography>
    </div>
    <div class_="grid grid-cols-[160px_1fr] items-center gap-8 py-5">
      <div class_="flex shrink-0 flex-col gap-0.5">
        <span class_="text-sm font-semibold text-foreground">"body-sm"</span>
        <span class_="text-xs whitespace-nowrap text-muted">
          "14px / 400 / 1.50"
        </span>
      </div>
      <Typography type_=`body_sm>
        "Secondary body, table cells, navigation, and sidebar items."
      </Typography>
    </div>
    <div class_="grid grid-cols-[160px_1fr] items-center gap-8 py-5">
      <div class_="flex shrink-0 flex-col gap-0.5">
        <span class_="text-sm font-semibold text-foreground">"body-xs"</span>
        <span class_="text-xs whitespace-nowrap text-muted">
          "12px / 400 / 1.25"
        </span>
      </div>
      <Typography type_=`body_xs>
        "Captions, badges, helper text, and fine print."
      </Typography>
    </div>
    <div class_="grid grid-cols-[160px_1fr] items-center gap-8 py-5">
      <div class_="flex shrink-0 flex-col gap-0.5">
        <span class_="text-sm font-semibold text-foreground">"code"</span>
        <span class_="text-xs whitespace-nowrap text-muted">"14px / mono"</span>
      </div>
      <Typography type_=`code>"bun add @heroui/styles"</Typography>
    </div>
  </div>
```

### Primitives

- `Typography.Heading` maps `level=1` to `level=6` to `` type_=`h1 `` through
  `` type_=`h6 ``.
- `Typography.Paragraph` maps `` size=`base ``, `` `sm `` or `` `xs `` to body
  text styles.
- `Typography.Code` maps to the inline code style.
- `Typography.Prose` styles rich content passed as regular HTML children.

```ocaml title="typography_primitives.mlx"
module Typography = Solidtype_heroui.Typography

let make () =
  <div class_="flex max-w-xl flex-col gap-4">
    <Typography.Heading level=1>"Dashboard"</Typography.Heading>
    <Typography.Paragraph>
      "Convenience primitives are thin wrappers over Typography, so you can \
       choose explicit composition without learning a second styling system."
    </Typography.Paragraph>
    <Typography.Paragraph color=`muted size=`sm>
      "Paragraph supports base, sm, and xs sizes."
    </Typography.Paragraph>
    <Typography.Code>"Typography.Code"</Typography.Code>
  </div>
```

### Prose

```ocaml title="typography_prose.mlx"
module Typography = Solidtype_heroui.Typography

let make () =
  <Typography.Prose class_="flex max-w-xl flex-col gap-3">
    <h1>"Prose title"</h1>
    <p>
      "Prose is for authored content where the markup is already semantic and \
       HeroUI applies the default typography rhythm."
    </p>
    <h2>"Section title"</h2>
    <p>
      "Inline code like "
      <code>"element_type"</code>
      " receives the same code treatment as the Typography primitive."
    </p>
  </Typography.Prose>
```

### Element Type

Use `element_type` when you need to customize the rendered element; it keeps
the type's style.

```ocaml title="typography_element_type.mlx"
module Typography = Solidtype_heroui.Typography

let make () =
  <div class_="flex max-w-xl flex-col gap-4">
    <Typography element_type="h2" type_=`h1>
      "H1 visual style, h2 semantic element"
    </Typography>
    <Typography element_type="span">
      "element_type swaps the underlying element while keeping HeroUI's props \
       and styles."
    </Typography>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="typography_tailwind.mlx"
module Typography = Solidtype_heroui.Typography

let make () =
  <div
    class_="flex max-w-md flex-col gap-2 rounded-xl border border-border/80 \
            bg-surface-secondary p-4">
    <Typography
      class_="text-xs font-medium tracking-wide text-accent uppercase"
      type_=`body_xs>
      "Changelog"
    </Typography>
    <Typography class_="font-semibold tracking-tight text-foreground" type_=`h4>
      "Faster search results"
    </Typography>
    <Typography class_="text-sm leading-relaxed text-muted" type_=`body_sm>
      "Queries now return in under 200ms thanks to an improved index."
    </Typography>
  </div>
```

### Global CSS

To customize the Typography component classes, you can use the
`@layer components` directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .typography--h1 {
    @apply font-extrabold tracking-tight;
  }

  .typography--code {
    @apply rounded-md bg-default-100 font-mono dark:bg-default-50/20;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base Classes

- `.typography` - Base typography primitive
- `.typography-prose` - Rich prose container

#### Type Classes

- `.typography--h1` through `.typography--h6`
- `.typography--body`, `.typography--body-sm`, `.typography--body-xs`
- `.typography--code`

#### Modifier Classes

- `.typography--align-start`, `.typography--align-center`,
  `.typography--align-end`, `.typography--align-justify`
- `.typography--color-default`, `.typography--color-muted`
- `.typography--truncate`
- `.typography--weight-normal`, `.typography--weight-medium`,
  `.typography--weight-semibold`, `.typography--weight-bold`

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Typography

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `type` | `type_` | `` [ `body \| `body_sm \| `body_xs \| `code \| `h1 \| ... \| `h6 ] `` | `` `body `` | Semantic typography style |
| `align` | `align` | `` [ `start \| `center \| `end_ \| `justify ] `` | `` `start `` | Text alignment |
| `color` | `color` | `` [ `default \| `muted ] `` | `` `default `` | Text color |
| `weight` | `weight` | `` [ `normal \| `medium \| `semibold \| `bold ] `` | | Font weight override |
| `truncate` | `truncate` | `bool` | | Truncates the text to one line with ellipsis |
| `render` | `element_type` | `string` | | The element it renders, in place of its type's |
| `render` | `as_` | a function of its props | | Custom render function |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Text content |

### Typography.Heading, Paragraph, Code

Each takes Typography's props, but `type_`: `Heading` its `level`, 1 to 6,
`Paragraph` its `size`, `` [ `base \| `sm \| `xs ] ``.

### Typography.Prose

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's class |
| `children` | `children` | elements | The markup it styles |
