import { createSignal } from "solid-js";
import * as TextField from "@kobalte/core/text-field";

export function make() {
  const [name, setName] = createSignal("");
  return (
    <div>
      <TextField.Root
        value={name()}
        onChange={setName}
        required={true}
        validationState={name() === "" ? "invalid" : "valid"}>
        <TextField.Label>Name</TextField.Label>
        <TextField.Input />
        <TextField.Description>As on your passport</TextField.Description>
        <TextField.ErrorMessage>A name is needed</TextField.ErrorMessage>
      </TextField.Root>
      <output>{name()}</output>
      <TextField.Root defaultValue="Hello">
        <TextField.Label>Notes</TextField.Label>
        <TextField.TextArea />
      </TextField.Root>
    </div>
  );
}
