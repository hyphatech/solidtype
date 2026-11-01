// HeroUI's Table in React with expandable rows, HeroUI's own Expandable Rows
// example, which the solidtype port's test renders and walks as it does the
// port's: its rows, their levels and state, and the chevrons that expand them.

import { Button, Table, type Selection } from "@heroui/react";
import { act, useState } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Row = { children: Row[]; date: string; id: string; title: string; type: string };

const data: Row[] = [
  {
    children: [
      {
        children: [
          { children: [], date: "7/10/2025", id: "3", title: "Weekly Report", type: "File" },
          { children: [], date: "8/20/2025", id: "4", title: "Budget", type: "File" },
        ],
        date: "8/2/2025",
        id: "2",
        title: "Project",
        type: "Directory",
      },
    ],
    date: "10/20/2025",
    id: "1",
    title: "Documents",
    type: "Directory",
  },
  {
    children: [
      { children: [], date: "1/23/2026", id: "6", title: "Image 1", type: "File" },
      { children: [], date: "2/3/2026", id: "7", title: "Image 2", type: "File" },
    ],
    date: "2/3/2026",
    id: "5",
    title: "Photos",
    type: "Directory",
  },
];

function ExpandableRows({ told }: { told: (keys: string[]) => void }) {
  const [expandedKeys, setExpandedKeys] = useState<Selection>(() => new Set(["1"]));

  const renderExpandableRow = (item: Row) => (
    <Table.Row id={item.id} textValue={item.title}>
      <Table.Cell textValue={item.title}>
        {({ hasChildItems, isDisabled, isTreeColumn }) => (
          <span className="flex items-center gap-1">
            {hasChildItems && isTreeColumn ? (
              <Button
                isIconOnly
                aria-label="Toggle row"
                isDisabled={isDisabled}
                size="sm"
                slot="chevron"
                variant="ghost"
              >
                <svg aria-hidden="true" />
              </Button>
            ) : null}
            <span>{item.title}</span>
          </span>
        )}
      </Table.Cell>
      <Table.Cell>{item.type}</Table.Cell>
      <Table.Cell>{item.date}</Table.Cell>
      <Table.Collection items={item.children}>{renderExpandableRow}</Table.Collection>
    </Table.Row>
  );

  return (
    <Table>
      <Table.ScrollContainer>
        <Table.Content
          aria-label="Files"
          className="min-w-[520px]"
          expandedKeys={expandedKeys}
          treeColumn="name"
          onExpandedChange={(keys) => {
            told([...(keys as Set<string>)].map(String).sort());
            setExpandedKeys(keys);
          }}
        >
          <Table.Header>
            <Table.Column isRowHeader id="name">
              Name
            </Table.Column>
            <Table.Column id="type">Type</Table.Column>
            <Table.Column id="date">Date Modified</Table.Column>
          </Table.Header>
          <Table.Body items={data}>{renderExpandableRow}</Table.Body>
        </Table.Content>
      </Table.ScrollContainer>
    </Table>
  );
}

export function render(told: (keys: string[]) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<ExpandableRows told={told} />));
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
