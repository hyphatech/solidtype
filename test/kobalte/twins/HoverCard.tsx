import * as HoverCard from "@kobalte/core/hover-card";

export function make() {
  return (
    <HoverCard.Root openDelay={0} closeDelay={0}>
      <HoverCard.Trigger href="https://example.com/ada">Ada</HoverCard.Trigger>
      <HoverCard.Portal>
        <HoverCard.Content>
          <HoverCard.Arrow />
          <p>Ada wrote the first program.</p>
        </HoverCard.Content>
      </HoverCard.Portal>
    </HoverCard.Root>
  );
}
