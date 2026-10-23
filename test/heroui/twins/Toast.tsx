// HeroUI's Toast in React: its provider, and toasts shown, updated and closed
// by its toast function, which the solidtype port's test drives through the
// same steps, to compare the region and every toast in it.

import { Toast, toast } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Provider = {
  placement?: "top start" | "top" | "top end" | "bottom start" | "bottom" | "bottom end";
  maxVisibleToasts?: number;
};

export function mount(props: Provider): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<Toast.Provider {...props} />));
  mounted = { root, host };
  return host;
}

type Options = {
  description?: string;
  variant?: "default" | "accent" | "success" | "warning" | "danger";
  timeout?: number;
  isLoading?: boolean;
  action?: string;
};

const options = ({ action, ...o }: Options) => ({
  ...o,
  ...(action ? { actionProps: { children: action } } : {}),
});

export function show(title: string, o: Options): string {
  let key = "";
  act(() => {
    key = toast(title, options(o));
  });
  return key;
}

export function update(key: string, title: string, o: Options): void {
  act(() => {
    toast.update(key, title, options(o));
  });
}

export function close(key: string): void {
  act(() => toast.close(key));
}

export async function step(action: () => Promise<void>): Promise<void> {
  await act(action);
}

export function cleanup(): void {
  act(() => toast.clear());
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
