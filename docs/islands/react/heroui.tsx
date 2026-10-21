// HeroUI's own components, rendered by React into a host the playground's
// OCaml page owns, beside each port: the one place React runs. Each render
// is flushed at once, so the page reads the result in the same effect.

import { Button } from "@heroui/react";
import { flushSync } from "react-dom";
import { createRoot, type Root } from "react-dom/client";

const roots = new WeakMap<HTMLElement, Root>();

function rootOf(host: HTMLElement): Root {
  let root = roots.get(host);
  if (!root) {
    root = createRoot(host);
    roots.set(host, root);
  }
  return root;
}

export function unmount(host: HTMLElement): void {
  roots.get(host)?.unmount();
  roots.delete(host);
}

type ButtonProps = {
  variant: "primary" | "secondary" | "tertiary" | "outline" | "ghost" | "danger" | "danger-soft";
  size: "sm" | "md" | "lg";
  fullWidth: boolean;
  isIconOnly: boolean;
  isDisabled: boolean;
  label: string;
};

export function button(host: HTMLElement, { label, ...props }: ButtonProps): void {
  flushSync(() => rootOf(host).render(<Button {...props}>{label}</Button>));
}
