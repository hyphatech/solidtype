// HeroUI's components in React, rendered into a host the documentation's
// OCaml page owns, beside each port: the one place React runs. Each render
// is flushed at once, so the page reads the result in the same effect.

import { Badge, Button, Checkbox, Chip, Label, Link, Separator, Switch } from "@heroui/react";
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

type SeparatorProps = {
  orientation: "horizontal" | "vertical";
  variant: "default" | "secondary" | "tertiary";
  className: string;
};

export function separator(host: HTMLElement, props: SeparatorProps): void {
  flushSync(() => rootOf(host).render(<Separator {...props} />));
}

type BadgeProps = {
  color: "accent" | "danger" | "default" | "success" | "warning";
  placement: "bottom-left" | "bottom-right" | "top-left" | "top-right";
  size: "lg" | "md" | "sm";
  variant: "primary" | "secondary" | "soft";
  label: string;
};

// A badge over a square it marks, as the port's demo places it.
export function badge(host: HTMLElement, { label, ...props }: BadgeProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Badge.Anchor>
        <span className="block size-10 rounded-lg bg-default" />
        <Badge {...props}>{label}</Badge>
      </Badge.Anchor>,
    ),
  );
}

type ChipProps = {
  color: "accent" | "danger" | "default" | "success" | "warning";
  size: "lg" | "md" | "sm";
  variant: "primary" | "secondary" | "soft" | "tertiary";
  label: string;
};

export function chip(host: HTMLElement, { label, ...props }: ChipProps): void {
  flushSync(() => rootOf(host).render(<Chip {...props}>{label}</Chip>));
}

type LinkProps = { isDisabled: boolean; icon: boolean; label: string };

export function link(host: HTMLElement, { isDisabled, icon, label }: LinkProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Link href="#beside-react" isDisabled={isDisabled}>
        {label}
        {icon && <Link.Icon />}
      </Link>,
    ),
  );
}

type SwitchProps = { size: "sm" | "md" | "lg"; isDisabled: boolean; label: string };

export function switch_(host: HTMLElement, { label, ...props }: SwitchProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Switch {...props}>
        <Switch.Content>
          <Switch.Control>
            <Switch.Thumb />
          </Switch.Control>
          <Label>{label}</Label>
        </Switch.Content>
      </Switch>,
    ),
  );
}

type CheckboxProps = {
  variant: "primary" | "secondary";
  isIndeterminate: boolean;
  isDisabled: boolean;
  isInvalid: boolean;
  label: string;
};

export function checkbox(host: HTMLElement, { label, ...props }: CheckboxProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Checkbox {...props}>
        <Checkbox.Content>
          <Checkbox.Control>
            <Checkbox.Indicator />
          </Checkbox.Control>
          <Label>{label}</Label>
        </Checkbox.Content>
      </Checkbox>,
    ),
  );
}
