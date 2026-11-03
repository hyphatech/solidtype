// HeroUI's Table in React with its columns sorted, HeroUI's own sorting
// example, which the solidtype port's test renders and presses as it presses
// the port's, to compare its columns, their headers and its rows' order.

import { Table, type SortDescriptor } from "@heroui/react";
import { act, useMemo, useState } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type User = { id: number; name: string; role: string };

const users: User[] = [
  { id: 1, name: "Kate Moore", role: "CEO" },
  { id: 2, name: "John Smith", role: "CTO" },
  { id: 3, name: "Sara Johnson", role: "CMO" },
];

function Sorting({ told }: { told: (s: string) => void }) {
  const [sort, setSort] = useState<SortDescriptor>({ column: "name", direction: "ascending" });
  const sorted = useMemo(
    () =>
      [...users].sort((a, b) => {
        const col = sort.column as "name" | "role";
        const cmp = a[col].localeCompare(b[col]);
        return sort.direction === "descending" ? -cmp : cmp;
      }),
    [sort],
  );
  return (
    <Table>
      <Table.ScrollContainer>
        <Table.Content
          aria-label="Sortable table"
          sortDescriptor={sort}
          onSortChange={(s) => {
            told(`${s.column}:${s.direction}`);
            setSort(s);
          }}
        >
          <Table.Header>
            <Table.Column allowsSorting isRowHeader id="name">
              {({ sortDirection }) => (
                <Table.SortableColumnHeader sortDirection={sortDirection}>Name</Table.SortableColumnHeader>
              )}
            </Table.Column>
            <Table.Column allowsSorting id="role">
              {({ sortDirection }) => (
                <Table.SortableColumnHeader sortDirection={sortDirection}>Role</Table.SortableColumnHeader>
              )}
            </Table.Column>
            <Table.Column>Actions</Table.Column>
          </Table.Header>
          <Table.Body>
            {sorted.map((u) => (
              <Table.Row key={u.id} id={u.id}>
                <Table.Cell>{u.name}</Table.Cell>
                <Table.Cell>{u.role}</Table.Cell>
                <Table.Cell>-</Table.Cell>
              </Table.Row>
            ))}
          </Table.Body>
        </Table.Content>
      </Table.ScrollContainer>
    </Table>
  );
}

export function render(told: (s: string) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<Sorting told={told} />));
  mounted = { root, host };
  return host;
}

export async function step(action: () => Promise<void>): Promise<void> {
  await act(action);
}

// A table sorted by its name, whose columns and cells draw their children of
// their state, as words in an element marked with each one's name.
export function renderOfState(_: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  const column = (id: string) => (
    <Table.Column allowsSorting isRowHeader={id === "name"} id={id}>
      {(s) => (
        <span data-words={id}>
          {words([
            ["hovered", s.isHovered],
            ["focus-visible", s.isFocusVisible],
            ["sorting", s.allowsSorting],
            ["ascending", s.sortDirection === "ascending"],
            ["descending", s.sortDirection === "descending"],
            ["resizing", s.isResizing],
          ])}
        </span>
      )}
    </Table.Column>
  );
  const cell = (name: string) => (
    <Table.Cell>
      {(s) => (
        <span data-words={name}>
          {words([
            ["selected", s.isSelected],
            ["tree", s.isTreeColumn],
            ["expanded", s.isExpanded],
            ["children", s.hasChildItems],
          ])}
          {` ${s.columnIndex} ${s.level}`}
        </span>
      )}
    </Table.Cell>
  );
  act(() =>
    root.render(
      <Table>
        <Table.ScrollContainer>
          <Table.Content aria-label="Sorted" sortDescriptor={{ column: "name", direction: "ascending" }}>
            <Table.Header>
              {column("name")}
              {column("role")}
            </Table.Header>
            <Table.Body>
              <Table.Row id="1">
                {cell("first")}
                {cell("second")}
              </Table.Row>
            </Table.Body>
          </Table.Content>
        </Table.ScrollContainer>
      </Table>,
    ),
  );
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
