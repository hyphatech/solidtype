import * as ColorMode from "@kobalte/core/color-mode";

function ShowsMode() {
  const mode = ColorMode.useColorMode();
  return (
    <div>
      <p>{mode.colorMode()}</p>
      <button onClick={() => mode.toggleColorMode()}>Toggle</button>
      <button onClick={() => mode.setColorMode("dark")}>Dark</button>
    </div>
  );
}

export function make() {
  return (
    <ColorMode.ColorModeProvider
      initialColorMode="dark"
      storageManager={ColorMode.createLocalStorageManager("solidtype-color-mode")}
    >
      <ShowsMode />
    </ColorMode.ColorModeProvider>
  );
}
