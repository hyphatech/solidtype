import * as Checkbox from "@kobalte/core/checkbox";

export function make() {
  return (
    <div>
      <Checkbox.Root>
        {(state) => (
          <div>
            <Checkbox.Input />
            <Checkbox.Label>Subscribe</Checkbox.Label>
            <Checkbox.Description>Once a week</Checkbox.Description>
            <Checkbox.Control>
              <Checkbox.Indicator>{state.checked() ? "on" : "off"}</Checkbox.Indicator>
            </Checkbox.Control>
          </div>
        )}
      </Checkbox.Root>
      <Checkbox.Root indeterminate={true}>
        <Checkbox.Input />
        <Checkbox.Label>Select all</Checkbox.Label>
        <Checkbox.Control />
      </Checkbox.Root>
      <Checkbox.Root required={true} validationState="invalid">
        <Checkbox.Input />
        <Checkbox.Label>Accept the terms</Checkbox.Label>
        <Checkbox.ErrorMessage>Accept them to go on</Checkbox.ErrorMessage>
        <Checkbox.Control />
      </Checkbox.Root>
    </div>
  );
}
