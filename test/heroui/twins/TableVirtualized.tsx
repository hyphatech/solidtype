// HeroUI's Table in React, virtualized, HeroUI's own Virtualization example,
// which the solidtype port's test renders at the same size and scrolls as it
// does the port's: the rows drawn, each placed, and the block they are in.

import { Table, TableLayout, Virtualizer } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type User = { id: number; name: string; role: string; email: string };

const users: User[] = Array.from({ length: 1000 }, (_, i) => ({
  id: i + 1,
  name: `User ${i + 1}`,
  role: "Engineer",
  email: `user${i + 1}@acme.com`,
}));

export function render(): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Virtualizer layout={TableLayout} layoutOptions={{ headingHeight: 42, rowHeight: 42 }}>
        <Table>
          <Table.ScrollContainer>
            <Table.Content
              aria-label="Virtualized table with 1000 rows"
              className="h-[300px] min-w-[700px] overflow-auto"
              data-client-height="300"
              data-client-width="700"
            >
              <Table.Header className="h-full w-full">
                <Table.Column isRowHeader id="name" minWidth={160}>
                  Name
                </Table.Column>
                <Table.Column id="role" minWidth={220}>
                  Role
                </Table.Column>
                <Table.Column id="email" minWidth={240}>
                  Email
                </Table.Column>
              </Table.Header>
              <Table.Body items={users}>
                {(user) => (
                  <Table.Row id={user.id}>
                    <Table.Cell>{user.name}</Table.Cell>
                    <Table.Cell>{user.role}</Table.Cell>
                    <Table.Cell>{user.email}</Table.Cell>
                  </Table.Row>
                )}
              </Table.Body>
            </Table.Content>
          </Table.ScrollContainer>
        </Table>
      </Virtualizer>,
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
