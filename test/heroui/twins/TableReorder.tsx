// HeroUI's Table in React with its rows reordered by React Aria's drag and
// drop, a button of slot "drag" in each row, which the solidtype port's test
// renders under the same props, to compare each handle and row at rest.

import { Button, Table } from "@heroui/react";
import { act } from "react";
import { useDragAndDrop } from "react-aria-components";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

const users = [
  { id: "1", name: "Kate Moore" },
  { id: "2", name: "John Smith" },
  { id: "3", name: "Sara Johnson" },
];

function Reorderable() {
  const { dragAndDropHooks } = useDragAndDrop({
    getItems: (keys) => [...keys].map((key) => ({ "text/plain": String(key) })),
    onReorder: () => {},
  });
  return (
    <Table>
      <Table.ScrollContainer>
        <Table.Content aria-label="Reorderable" dragAndDropHooks={dragAndDropHooks}>
          <Table.Header>
            <Table.Column>Move</Table.Column>
            <Table.Column isRowHeader>Name</Table.Column>
          </Table.Header>
          <Table.Body>
            {users.map((u) => (
              <Table.Row key={u.id} id={u.id}>
                <Table.Cell>
                  <Button slot="drag" isIconOnly size="sm" variant="ghost">
                    <span aria-hidden="true">::</span>
                  </Button>
                </Table.Cell>
                <Table.Cell>{u.name}</Table.Cell>
              </Table.Row>
            ))}
          </Table.Body>
        </Table.Content>
      </Table.ScrollContainer>
    </Table>
  );
}

export function render(): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<Reorderable />));
  mounted = { root, host };
  return host;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
