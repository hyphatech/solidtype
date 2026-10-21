// HeroUI's components in React, rendered into a host the documentation's
// OCaml page owns, beside each port: the one place React runs. Each render
// is flushed at once, so the page reads the result in the same effect.

import { Avatar, AvatarGroup, Badge, Button, ButtonGroup, Card, Checkbox, Chip, CloseButton, Description, Kbd, Label, Link, Radio, RadioGroup, Separator, Skeleton, Spinner, Surface, Switch } from "@heroui/react";
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

type ButtonGroupProps = {
  variant: ButtonProps["variant"];
  size: ButtonProps["size"];
  orientation: "horizontal" | "vertical";
  fullWidth: boolean;
  isDisabled: boolean;
};

// Three buttons, as the port's demo groups them.
export function buttonGroup(host: HTMLElement, props: ButtonGroupProps): void {
  flushSync(() =>
    rootOf(host).render(
      <ButtonGroup {...props}>
        <Button>First</Button>
        <Button>
          <ButtonGroup.Separator />
          Second
        </Button>
        <Button>
          <ButtonGroup.Separator />
          Third
        </Button>
      </ButtonGroup>,
    ),
  );
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

type CloseButtonProps = { isDisabled: boolean };

export function closeButton(host: HTMLElement, props: CloseButtonProps): void {
  flushSync(() => rootOf(host).render(<CloseButton {...props} />));
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

type RadioGroupProps = {
  variant: "primary" | "secondary";
  orientation: "horizontal" | "vertical";
  isDisabled: boolean;
  isInvalid: boolean;
};

export function radioGroup(host: HTMLElement, props: RadioGroupProps): void {
  flushSync(() =>
    rootOf(host).render(
      <RadioGroup {...props} defaultValue="pro">
        <Label>Plan</Label>
        <Radio value="starter">
          <Radio.Content>
            <Radio.Control>
              <Radio.Indicator />
            </Radio.Control>
            Starter
          </Radio.Content>
          <Description>For side projects</Description>
        </Radio>
        <Radio value="pro">
          <Radio.Content>
            <Radio.Control>
              <Radio.Indicator />
            </Radio.Control>
            Pro
          </Radio.Content>
          <Description>Advanced reporting</Description>
        </Radio>
      </RadioGroup>,
    ),
  );
}

type SurfaceProps = {
  variant: "default" | "secondary" | "tertiary" | "transparent";
  className: string;
};

export function surface(host: HTMLElement, props: SurfaceProps): void {
  flushSync(() => rootOf(host).render(<Surface {...props}>Surface Content</Surface>));
}

type CardProps = { variant: "default" | "secondary" | "tertiary" | "transparent" };

// A card's header and content, as the port's demo shows them.
export function card(host: HTMLElement, props: CardProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Card {...props} className="w-[280px]">
        <Card.Header>
          <Card.Title>Card Title</Card.Title>
          <Card.Description>A description</Card.Description>
        </Card.Header>
        <Card.Content>
          <p>Its content</p>
        </Card.Content>
      </Card>,
    ),
  );
}

type KbdProps = {
  variant: "default" | "light";
  keyValue: Parameters<typeof Kbd.Abbr>[0]["keyValue"];
};

export function kbd(host: HTMLElement, { variant, keyValue }: KbdProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Kbd variant={variant}>
        <Kbd.Abbr keyValue={keyValue} />
        <Kbd.Content>K</Kbd.Content>
      </Kbd>,
    ),
  );
}

type SpinnerProps = {
  color: "accent" | "current" | "danger" | "success" | "warning";
  size: "sm" | "md" | "lg" | "xl";
};

export function spinner(host: HTMLElement, props: SpinnerProps): void {
  flushSync(() => rootOf(host).render(<Spinner {...props} />));
}

type SkeletonProps = { animationType: "shimmer" | "pulse" | "none"; className: string };

export function skeleton(host: HTMLElement, props: SkeletonProps): void {
  flushSync(() => rootOf(host).render(<Skeleton {...props} />));
}

type AvatarProps = {
  size: "sm" | "md" | "lg";
  color: "default" | "accent" | "success" | "warning" | "danger";
  variant: "default" | "soft";
};

export function avatar(host: HTMLElement, props: AvatarProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Avatar {...props}>
        <Avatar.Fallback>AL</Avatar.Fallback>
      </Avatar>,
    ),
  );
}

type AvatarGroupProps = {
  size: "sm" | "md" | "lg";
  overlap: "clip" | "ring";
  max?: number;
  isGrid: boolean;
};

// Four avatars, as the port's demo groups them.
export function avatarGroup(host: HTMLElement, props: AvatarGroupProps): void {
  flushSync(() =>
    rootOf(host).render(
      <AvatarGroup {...props}>
        {["AL", "GH", "KJ", "BL"].map((initials) => (
          <Avatar key={initials}>
            <Avatar.Fallback>{initials}</Avatar.Fallback>
          </Avatar>
        ))}
      </AvatarGroup>,
    ),
  );
}
