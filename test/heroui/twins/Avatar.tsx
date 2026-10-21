// HeroUI's Avatar in React, on Radix's, which the solidtype port's test
// renders under the same props, to compare the two avatars while the image
// loads and once it has.
//
// jsdom never fetches an image, so an avatar stays loading. Both Radix and
// Kobalte load an avatar's image through window.Image; `loading` stands one
// in that has loaded as soon as its src is set, for a test to install and
// take away, so Kobalte's own test still sees jsdom's.

import { Avatar } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

const jsdomImage = window.Image;

// jsdom's Image makes its own element, so a subclass's getters never apply:
// the stand-in makes one and gives it a src that loads.
function loadedImage(): HTMLImageElement {
  const image = new jsdomImage();
  Object.defineProperty(image, "complete", { get: () => true });
  Object.defineProperty(image, "naturalWidth", { get: () => 1 });
  Object.defineProperty(image, "src", {
    get: () => image.getAttribute("src") ?? "",
    set: (value: string) => {
      image.setAttribute("src", value);
      queueMicrotask(() => image.dispatchEvent(new Event("load")));
    },
  });
  return image;
}

export function loadImages(): void {
  window.Image = loadedImage as unknown as typeof Image;
}

export function stopLoadingImages(): void {
  window.Image = jsdomImage;
}

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  size?: "sm" | "md" | "lg";
  color?: "default" | "accent" | "success" | "warning" | "danger";
  variant?: "default" | "soft";
  fallbackColor?: "default" | "accent" | "success" | "warning" | "danger";
  src?: string;
};

export function render({ fallbackColor, src, ...props }: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Avatar {...props} className="ms-1">
        {src && <Avatar.Image alt="Ada Lovelace" src={src} />}
        <Avatar.Fallback color={fallbackColor}>AL</Avatar.Fallback>
      </Avatar>,
    ),
  );
  mounted = { root, host };
  return host;
}

// Once React has rendered what a loaded image caused.
export async function settle(): Promise<void> {
  await act(async () => {
    await new Promise((resolve) => setTimeout(resolve, 0));
  });
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
