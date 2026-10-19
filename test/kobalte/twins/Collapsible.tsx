import * as Collapsible from "@kobalte/core/collapsible";

export function make() {
  return (
    <Collapsible.Root>
      <Collapsible.Trigger>Details</Collapsible.Trigger>
      <Collapsible.Content>Shipped in two days.</Collapsible.Content>
    </Collapsible.Root>
  );
}
