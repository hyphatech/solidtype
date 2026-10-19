import * as Tooltip from "@kobalte/core/tooltip";

export function make() {
  return (
    <Tooltip.Root openDelay={0} closeDelay={0} ignoreSafeArea>
      <Tooltip.Trigger>Save</Tooltip.Trigger>
      <Tooltip.Portal>
        <Tooltip.Content>
          <Tooltip.Arrow />
          Save the draft
        </Tooltip.Content>
      </Tooltip.Portal>
    </Tooltip.Root>
  );
}
