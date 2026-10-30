// HeroUI's Table in React, HeroUI's own team table, which the solidtype
// port's test renders under the same props, to compare every part and walk
// it by the keys as it walks the port's.

import { Table } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Member = { id: string; name: string; role: string; status: string; email: string };

type Props = { variant?: "primary" | "secondary"; members: Member[] };

export function render({ variant, members }: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Table variant={variant}>
        <Table.ScrollContainer>
          <Table.Content aria-label="Team members" className="min-w-[600px]">
            <Table.Header>
              <Table.Column isRowHeader>Name</Table.Column>
              <Table.Column>Role</Table.Column>
              <Table.Column>Status</Table.Column>
              <Table.Column>Email</Table.Column>
            </Table.Header>
            <Table.Body items={members} renderEmptyState={() => <span>No members</span>}>
              {(m) => (
                <Table.Row id={m.id}>
                  <Table.Cell>{m.name}</Table.Cell>
                  <Table.Cell>{m.role}</Table.Cell>
                  <Table.Cell>{m.status}</Table.Cell>
                  <Table.Cell>{m.email}</Table.Cell>
                </Table.Row>
              )}
            </Table.Body>
          </Table.Content>
        </Table.ScrollContainer>
        <Table.Footer>4 members</Table.Footer>
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
