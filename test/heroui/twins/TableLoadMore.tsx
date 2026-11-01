// HeroUI's Table in React loading more rows, HeroUI's own Async Loading
// example, which the solidtype port's test renders and scrolls as it does the
// port's: its sentinel brought into view, its loading row, and its rows once
// loaded. The test, not a timer, says when loading ends.

import { Spinner, Table } from "@heroui/react";
import { act, useState } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;
let finishing: (() => void) | null = null;

const names = ["Kate Moore", "John Smith", "Sara Johnson", "Michael Brown", "Emily Davis", "Davis Wilson"];

function AsyncLoading({ told }: { told: () => void }) {
  const [count, setCount] = useState(3);
  const [isLoading, setIsLoading] = useState(false);
  const hasMore = count < names.length;
  finishing = () => {
    setCount((c) => c + 3);
    setIsLoading(false);
  };
  return (
    <Table>
      <Table.ScrollContainer className="h-[280px] overflow-y-auto">
        <Table.Content aria-label="Async loading table">
          <Table.Header>
            <Table.Column isRowHeader>Name</Table.Column>
            <Table.Column>Role</Table.Column>
          </Table.Header>
          <Table.Body>
            {names.slice(0, count).map((name) => (
              <Table.Row key={name} id={name}>
                <Table.Cell>{name}</Table.Cell>
                <Table.Cell>Engineer</Table.Cell>
              </Table.Row>
            ))}
            {hasMore && (
              <Table.LoadMore
                isLoading={isLoading}
                scrollOffset={0}
                onLoadMore={() => {
                  told();
                  setIsLoading(true);
                }}
              >
                <Table.LoadMoreContent>
                  <Spinner size="md" />
                </Table.LoadMoreContent>
              </Table.LoadMore>
            )}
          </Table.Body>
        </Table.Content>
      </Table.ScrollContainer>
    </Table>
  );
}

export function render(told: () => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<AsyncLoading told={told} />));
  mounted = { root, host };
  return host;
}

export async function step(action: () => Promise<void>): Promise<void> {
  await act(action);
}

export function finish(): void {
  act(() => finishing?.());
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
  finishing = null;
}
