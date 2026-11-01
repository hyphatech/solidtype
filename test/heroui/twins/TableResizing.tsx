// HeroUI's Table in React with its columns resized, HeroUI's own Column
// Resizing example, which the solidtype port's test renders at the same width
// and resizes by the same keys and drag, to compare its columns and resizers.

import { Table } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Sizes = Map<string | number, number | string>;

export function render(ended: (sizes: string[]) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  const told = (sizes: Sizes) =>
    ended(
      [...sizes].map(([key, size]) => `${key}:${typeof size === "number" ? `${size}px` : size}`),
    );
  act(() =>
    root.render(
      <Table>
        <Table.ResizableContainer data-client-width="700" onResizeEnd={told}>
          <Table.Content aria-label="Table with resizable columns" className="min-w-[700px]">
            <Table.Header>
              <Table.Column isRowHeader defaultWidth="1fr" id="name" minWidth={160}>
                Name
                <Table.ColumnResizer />
              </Table.Column>
              <Table.Column defaultWidth="1fr" id="role" minWidth={220}>
                Role
                <Table.ColumnResizer />
              </Table.Column>
              <Table.Column defaultWidth="1fr" id="status" minWidth={100}>
                Status
                <Table.ColumnResizer />
              </Table.Column>
              <Table.Column defaultWidth="1fr" id="email" minWidth={200}>
                Email
              </Table.Column>
            </Table.Header>
            <Table.Body>
              <Table.Row id="1">
                <Table.Cell>Kate Moore</Table.Cell>
                <Table.Cell>CEO</Table.Cell>
                <Table.Cell>Active</Table.Cell>
                <Table.Cell>kate@acme.com</Table.Cell>
              </Table.Row>
            </Table.Body>
          </Table.Content>
        </Table.ResizableContainer>
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
