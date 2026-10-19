import * as Popover from "@kobalte/core/popover";

export function make() {
  return (
    <Popover.Root>
      <Popover.Trigger>Share</Popover.Trigger>
      <Popover.Portal>
        <Popover.Content>
          <Popover.Arrow />
          <Popover.Title>Share the page</Popover.Title>
          <Popover.Description>Anyone with the link can see it.</Popover.Description>
          <Popover.CloseButton>Done</Popover.CloseButton>
        </Popover.Content>
      </Popover.Portal>
    </Popover.Root>
  );
}
