import * as DropdownMenu from "@kobalte/core/dropdown-menu";
import { createSignal } from "solid-js";

export function make() {
  const [chosen, choose] = createSignal("");
  return (
    <div>
      <DropdownMenu.Root>
        <DropdownMenu.Trigger>Edit</DropdownMenu.Trigger>
        <DropdownMenu.Portal>
          <DropdownMenu.Content>
            <DropdownMenu.Item onSelect={() => choose("Cut")}>Cut</DropdownMenu.Item>
            <DropdownMenu.Item onSelect={() => choose("Copy")}>Copy</DropdownMenu.Item>
            <DropdownMenu.Item disabled={true}>Paste</DropdownMenu.Item>
            <DropdownMenu.Separator />
            <DropdownMenu.CheckboxItem>
              <DropdownMenu.ItemIndicator>on</DropdownMenu.ItemIndicator>
              Wrap lines
            </DropdownMenu.CheckboxItem>
            <DropdownMenu.Sub>
              <DropdownMenu.SubTrigger>Find</DropdownMenu.SubTrigger>
              <DropdownMenu.Portal>
                <DropdownMenu.SubContent>
                  <DropdownMenu.Item>Find next</DropdownMenu.Item>
                </DropdownMenu.SubContent>
              </DropdownMenu.Portal>
            </DropdownMenu.Sub>
          </DropdownMenu.Content>
        </DropdownMenu.Portal>
      </DropdownMenu.Root>
      <p>Chose {chosen()}</p>
    </div>
  );
}
