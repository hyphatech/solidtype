// HeroUI's ListBox in React: a selection of one or of many, actions in
// sections, or disabled items, which the solidtype port's test renders under
// the same props, to compare the list and the focus, and steps as it steps the
// port's.

import { Description, Header, Label, ListBox, Separator } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  // Its items: a selection of one or of many, or actions in two sections.
  list: "single" | "multiple" | "sections";
  // What the list tells, written into the page as it is told.
  told: (said: string) => void;
};

function items({ list, told }: Props) {
  switch (list) {
    case "single":
    case "multiple":
      return (
        <ListBox
          aria-label="Users"
          selectionMode={list}
          defaultSelectedKeys={["bob"]}
          disabledKeys={["martha"]}
          onSelectionChange={(keys) => told(`selected ${[...keys].sort().join(" ")}`)}
        >
          <ListBox.Item id="bob" textValue="Bob">
            <Label>Bob</Label>
            <Description>bob@heroui.com</Description>
            <ListBox.ItemIndicator />
          </ListBox.Item>
          <ListBox.Item id="fred" textValue="Fred">
            <Label>Fred</Label>
            <ListBox.ItemIndicator />
          </ListBox.Item>
          <ListBox.Item id="martha" textValue="Martha">
            <Label>Martha</Label>
          </ListBox.Item>
          <ListBox.Item id="tom" textValue="Tom" variant="danger">
            <Label>Tom</Label>
          </ListBox.Item>
        </ListBox>
      );
    case "sections":
      return (
        <ListBox aria-label="File actions" selectionMode="none" onAction={(key) => told(`action ${key}`)}>
          <ListBox.Section>
            <Header>Actions</Header>
            <ListBox.Item id="new" textValue="New file">
              <Label>New file</Label>
            </ListBox.Item>
            <ListBox.Item id="edit" textValue="Edit file">
              <Label>Edit file</Label>
            </ListBox.Item>
          </ListBox.Section>
          <Separator />
          <ListBox.Section>
            <Header>Danger zone</Header>
            <ListBox.Item id="delete" textValue="Delete file" variant="danger">
              <Label>Delete file</Label>
            </ListBox.Item>
          </ListBox.Section>
        </ListBox>
      );
  }
}

export function render(props: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <div>
        <button type="button">Before</button>
        {items(props)}
      </div>,
    ),
  );
  mounted = { root, host };
  return host;
}

export async function step(action: () => Promise<unknown>): Promise<void> {
  await act(async () => {
    await action();
  });
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
