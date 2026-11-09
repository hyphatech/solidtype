// HeroUI's Table in React with an action on each row and on the table, which
// the solidtype port's test renders under the same props, to compare which
// actions a press, a double press, Enter and Space run, and what they select.

import { Table, type Selection } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

const users = [
  { id: "1", name: "Kate Moore", role: "CEO" },
  { id: "2", name: "John Smith", role: "CTO" },
  { id: "3", name: "Sara Johnson", role: "CMO" },
];

type Props = {
  selectionMode: "none" | "single" | "multiple";
  selectionBehavior?: "toggle" | "replace";
};

export function render(props: Props, ran: (action: string) => void, selected: (keys: string[]) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Table>
        <Table.ScrollContainer>
          <Table.Content
            aria-label="Table with actions"
            {...props}
            onSelectionChange={(s: Selection) => selected(s === "all" ? users.map((u) => u.id) : [...s].map(String).sort())}
            onRowAction={(key) => ran(`table ${key}`)}
          >
            <Table.Header>
              <Table.Column isRowHeader>Name</Table.Column>
              <Table.Column>Role</Table.Column>
            </Table.Header>
            <Table.Body>
              {users.map((u) => (
                <Table.Row key={u.id} id={u.id} onAction={() => ran(`row ${u.id}`)}>
                  <Table.Cell>{u.name}</Table.Cell>
                  <Table.Cell>{u.role}</Table.Cell>
                </Table.Row>
              ))}
            </Table.Body>
          </Table.Content>
        </Table.ScrollContainer>
      </Table>,
    ),
  );
  mounted = { root, host };
  return host;
}

export async function step(action: () => Promise<void>): Promise<void> {
  await act(action);
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
