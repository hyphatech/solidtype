// HeroUI's useTheme in React, which the port's Theme is put through the same
// steps as. Both read the same page: its <html>, its storage and an operating
// system's colour scheme, stood in for here, as jsdom has none.

import { useTheme } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

const original = window.matchMedia;
let dark = false;
const listeners = new Set<() => void>();

// A page as a browser shows it to a new visitor, on a light system.
export function reset(): void {
  localStorage.clear();
  document.documentElement.removeAttribute("class");
  document.documentElement.removeAttribute("data-theme");
  dark = false;
  listeners.clear();
  window.matchMedia = ((query: string) => ({
    get matches() {
      return query === "(prefers-color-scheme: dark)" && dark;
    },
    media: query,
    addEventListener: (_: string, f: () => void) => listeners.add(f),
    removeEventListener: (_: string, f: () => void) => listeners.delete(f),
  })) as unknown as typeof window.matchMedia;
}

export function restore(): void {
  window.matchMedia = original;
}

export function listening(): number {
  return listeners.size;
}

export function setSystemDark(value: boolean): void {
  dark = value;
  for (const f of listeners) f();
}

export function store(value: string): void {
  localStorage.setItem("heroui-theme", value);
}

// What the page says: <html>'s class and data-theme, and what is stored.
export function page(): string[] {
  const html = document.documentElement;
  return [html.className, html.getAttribute("data-theme") ?? "", localStorage.getItem("heroui-theme") ?? ""];
}

let theme: ReturnType<typeof useTheme> | null = null;
let mounted: { root: Root; host: HTMLElement } | null = null;

function Holder({ initial }: { initial?: string }) {
  theme = useTheme(initial);
  return null;
}

export function mount(initial?: string): void {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<Holder initial={initial} />));
  mounted = { root, host };
}

export function chosen(): string[] {
  return [theme?.theme ?? "", theme?.resolvedTheme ?? ""];
}

export function choose(name: string): void {
  act(() => theme?.setTheme(name));
}

export function system(value: boolean): void {
  act(() => setSystemDark(value));
}

export function cleanup(): void {
  if (mounted) {
    act(() => mounted?.root.unmount());
    mounted.host.remove();
  }
  mounted = null;
}
