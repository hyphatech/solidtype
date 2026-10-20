import * as ColorMode from "@kobalte/core/color-mode";

export function make() {
  return (
    <div>
      <ColorMode.ColorModeScript initialColorMode="dark" storageKey="solidtype-color-mode" />
    </div>
  );
}
