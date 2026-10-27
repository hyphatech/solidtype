// HeroUI's Dropdown in React, on a Button or on a Dropdown.Trigger of its own,
// its menu of plain items, of items in a selection, of sections, or with a
// submenu, which the solidtype port's test renders under the same props, to
// compare the trigger, the menu and the focus, and steps as it steps the
// port's.

import { Button, Description, Dropdown, Header, Kbd, Label, Separator } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  // The menu's items: actions, a selection of one or of many, two sections,
  // or an item that opens a submenu.
  menu: "actions" | "single" | "multiple" | "sections" | "submenu";
  // A Dropdown.Trigger of its own around a span, where none is a Button.
  custom?: boolean;
  // Opened by a long press, or Alt and an arrow, rather than a press.
  longPress?: boolean;
  // What the menu tells, written into the page as it is told.
  told: (said: string) => void;
};

function items(menu: Props["menu"], told: Props["told"]) {
  switch (menu) {
    case "actions":
      return (
        <Dropdown.Menu onAction={(key) => told(`action ${key}`)}>
          <Dropdown.Item id="new" textValue="New file">
            <Label>New file</Label>
            <Description>Create a new file</Description>
            <Kbd>⌘N</Kbd>
          </Dropdown.Item>
          <Dropdown.Item id="copy" textValue="Copy link" isDisabled>
            <Label>Copy link</Label>
          </Dropdown.Item>
          <Dropdown.Item id="delete" textValue="Delete file" variant="danger">
            <Label>Delete file</Label>
          </Dropdown.Item>
        </Dropdown.Menu>
      );
    case "single":
    case "multiple":
      return (
        <Dropdown.Menu
          selectionMode={menu}
          defaultSelectedKeys={["bold"]}
          onSelectionChange={(keys) => told(`selected ${[...keys].sort().join(" ")}`)}
        >
          <Dropdown.Item id="bold" textValue="Bold">
            <Dropdown.ItemIndicator />
            <Label>Bold</Label>
          </Dropdown.Item>
          <Dropdown.Item id="italic" textValue="Italic">
            <Dropdown.ItemIndicator type="dot" />
            <Label>Italic</Label>
          </Dropdown.Item>
        </Dropdown.Menu>
      );
    case "sections":
      return (
        <Dropdown.Menu onAction={(key) => told(`action ${key}`)}>
          <Dropdown.Section>
            <Header>Actions</Header>
            <Dropdown.Item id="new" textValue="New file">
              <Label>New file</Label>
            </Dropdown.Item>
          </Dropdown.Section>
          <Separator />
          <Dropdown.Section>
            <Header>Danger zone</Header>
            <Dropdown.Item id="delete" textValue="Delete file" variant="danger">
              <Label>Delete file</Label>
            </Dropdown.Item>
          </Dropdown.Section>
        </Dropdown.Menu>
      );
    case "submenu":
      return (
        <Dropdown.Menu onAction={(key) => told(`action ${key}`)}>
          <Dropdown.Item id="new" textValue="New file">
            <Label>New file</Label>
          </Dropdown.Item>
          <Dropdown.SubmenuTrigger>
            <Dropdown.Item id="share" textValue="Share">
              <Label>Share</Label>
              <Dropdown.SubmenuIndicator />
            </Dropdown.Item>
            <Dropdown.Popover>
              <Dropdown.Menu onAction={(key) => told(`action ${key}`)}>
                <Dropdown.Item id="email" textValue="Email">
                  <Label>Email</Label>
                </Dropdown.Item>
              </Dropdown.Menu>
            </Dropdown.Popover>
          </Dropdown.SubmenuTrigger>
        </Dropdown.Menu>
      );
  }
}

export function render({ menu, custom, longPress, told }: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <div>
        <p data-testid="outside">Outside</p>
        <Dropdown trigger={longPress ? "longPress" : "press"}>
          {custom ? (
            <Dropdown.Trigger aria-label="Profile">
              <span>Sarah</span>
            </Dropdown.Trigger>
          ) : (
            <Button aria-label="Menu" variant="secondary">
              Actions
            </Button>
          )}
          <Dropdown.Popover>{items(menu, told)}</Dropdown.Popover>
        </Dropdown>
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
