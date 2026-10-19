import * as Image from "@kobalte/core/image";
import { createSignal } from "solid-js";

export function make() {
  const [status, setStatus] = createSignal("idle");
  return (
    <div>
      <Image.Root onLoadingStatusChange={(s) => setStatus(s)}>
        <Image.Img src="/avatar.png" alt="Ada Lovelace" />
        <Image.Fallback>AL</Image.Fallback>
      </Image.Root>
      <p>Image {status()}</p>
    </div>
  );
}
