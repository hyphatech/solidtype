// HeroUI's Table in React with its rows selected, HeroUI's own selection
// example, a checkbox of slot "selection" for all and for each row, which the
// solidtype port's test renders under the same props, to compare every part
// as rows are pressed and checked.

import { Checkbox, Table, type Selection } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

const users = [
  { id: "1", name: "Kate Moore" },
  { id: "2", name: "John Smith" },
  { id: "3", name: "Sara Johnson" },
];

type Props = {
  selectionMode: "single" | "multiple";
  selectionBehavior?: "toggle" | "replace";
  disabledKeys?: string[];
};

// Each change, as its keys in order; all is every row but a disabled one,
// which React Aria's rows show unselected.
const keys = (s: Selection, disabled: string[]) =>
  s === "all" ? users.map((u) => u.id).filter((id) => !disabled.includes(id)) : [...s].map(String).sort();

export function render(props: Props, told: (keys: string[]) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Table>
        <Table.ScrollContainer>
          <Table.Content aria-label="Table with selection" {...props} onSelectionChange={(s) => told(keys(s, props.disabledKeys ?? []))}>
            <Table.Header>
              <Table.Column className="pe-0">
                <Checkbox aria-label="Select all" slot="selection">
                  <Checkbox.Content>
                    <Checkbox.Control>
                      <Checkbox.Indicator />
                    </Checkbox.Control>
                  </Checkbox.Content>
                </Checkbox>
              </Table.Column>
              <Table.Column isRowHeader>Name</Table.Column>
            </Table.Header>
            <Table.Body>
              {users.map((u) => (
                <Table.Row key={u.id} id={u.id}>
                  <Table.Cell className="pe-0">
                    <Checkbox aria-label={`Select ${u.name}`} slot="selection" variant="secondary">
                      <Checkbox.Content>
                        <Checkbox.Control>
                          <Checkbox.Indicator />
                        </Checkbox.Control>
                      </Checkbox.Content>
                    </Checkbox>
                  </Table.Cell>
                  <Table.Cell>{u.name}</Table.Cell>
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
