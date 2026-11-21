# EmptyState

What a list shows where it has nothing to show.

What a list, a table or a select shows where it has nothing to show. It says
"No results found" unless it is given children.

Original HeroUI source: [EmptyState](https://github.com/heroui-inc/heroui/tree/v3/packages/react/src/components/empty-state), which heroui.com has no page for.

## Usage

```ocaml title="empty_state_usage.mlx"
module Empty_state = Solidtype_heroui.Empty_state

let make () =
  <div class_="flex flex-col gap-4">
    <Empty_state /> <Empty_state>"No tasks yet"</Empty_state>
  </div>
```

## Styling Reference

### CSS Classes

- `.empty-state` - Base empty state container

## API Reference

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `className` | `class_` | `string` | | Added after HeroUI's class |
| `children` | `children` | elements | "No results found" | Its content |
