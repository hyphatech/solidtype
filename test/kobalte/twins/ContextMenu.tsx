import * as ContextMenu from "@kobalte/core/context-menu";

export function make() {
  return (
    <ContextMenu.Root>
      <ContextMenu.Trigger>Right-click the page</ContextMenu.Trigger>
      <ContextMenu.Portal>
        <ContextMenu.Content>
          <ContextMenu.Item>Back</ContextMenu.Item>
          <ContextMenu.Item>Reload</ContextMenu.Item>
          <ContextMenu.Separator />
          <ContextMenu.Group>
            <ContextMenu.GroupLabel>Text size</ContextMenu.GroupLabel>
            <ContextMenu.RadioGroup defaultValue="Small">
              <ContextMenu.RadioItem value="Small">Small</ContextMenu.RadioItem>
              <ContextMenu.RadioItem value="Large">Large</ContextMenu.RadioItem>
            </ContextMenu.RadioGroup>
          </ContextMenu.Group>
        </ContextMenu.Content>
      </ContextMenu.Portal>
    </ContextMenu.Root>
  );
}
