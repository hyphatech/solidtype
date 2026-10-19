import * as Accordion from "@kobalte/core/accordion";

export function make() {
  return (
    <Accordion.Root>
      <Accordion.Item value="shipping">
        <Accordion.Header>
          <Accordion.Trigger>Shipping</Accordion.Trigger>
        </Accordion.Header>
        <Accordion.Content>Two days.</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item value="returns">
        <Accordion.Header>
          <Accordion.Trigger>Returns</Accordion.Trigger>
        </Accordion.Header>
        <Accordion.Content>Thirty days.</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item value="warranty">
        <Accordion.Header>
          <Accordion.Trigger>Warranty</Accordion.Trigger>
        </Accordion.Header>
        <Accordion.Content>One year.</Accordion.Content>
      </Accordion.Item>
    </Accordion.Root>
  );
}
