// HeroUI's components in React, rendered into a host the documentation's
// OCaml page owns, beside each port: the one place React runs. Each render
// is flushed at once, so the page reads the result in the same effect.

import { Accordion, Alert, AlertDialog, Avatar, AvatarGroup, Badge, Breadcrumbs, Button, ButtonGroup, Card, Checkbox, CheckboxGroup, Chip, CloseButton, Description, Disclosure, DisclosureGroup, Drawer, Dropdown, FieldError, Fieldset, Input, InputGroup, Kbd, Label, Link, ListBox, Meter, Modal, NumberField, Pagination, Popover, ProgressBar, ProgressCircle, Radio, RadioGroup, ScrollShadow, SearchField, Select, Separator, Skeleton, Slider, Spinner, Surface, Switch, Tabs, TextField, TimeField, ToggleButton, ToggleButtonGroup, Tooltip, Typography } from "@heroui/react";
import { useState } from "react";
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

type TypographyProps = {
  type: "h1" | "h2" | "h3" | "h4" | "h5" | "h6" | "body" | "body-sm" | "body-xs" | "code";
  align: "start" | "center" | "end" | "justify";
  color: "default" | "muted";
  truncate: boolean;
};

export function typography(host: HTMLElement, props: TypographyProps): void {
  flushSync(() => rootOf(host).render(<Typography {...props}>Pricing on your terms</Typography>));
}

type ScrollShadowProps = {
  visibility: "auto" | "both" | "top" | "bottom" | "none";
  hideScrollBar: boolean;
};

// Eight lines, as the port's demo scrolls them.
export function scrollShadow(host: HTMLElement, props: ScrollShadowProps): void {
  flushSync(() =>
    rootOf(host).render(
      <ScrollShadow {...props} className="max-h-[120px] p-4">
        {Array.from({ length: 8 }, (_, i) => (
          <p key={i}>Line {i + 1}</p>
        ))}
      </ScrollShadow>,
    ),
  );
}

type TextFieldProps = {
  variant: "primary" | "secondary";
  isRequired: boolean;
  isDisabled: boolean;
  isInvalid: boolean;
  isReadOnly: boolean;
};

// A field of every part, as the port's demo shows it.
export function textField(host: HTMLElement, props: TextFieldProps): void {
  flushSync(() =>
    rootOf(host).render(
      <TextField {...props} name="email" className="w-64">
        <Label>Email</Label>
        <Input placeholder="Enter your email" />
        <Description>We'll never share it.</Description>
        <FieldError>Enter a valid email.</FieldError>
      </TextField>,
    ),
  );
}

type FieldsetProps = { disabled: boolean };

// A legend and a button, as the port's demo shows them.
export function fieldset(host: HTMLElement, props: FieldsetProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Fieldset {...props}>
        <Fieldset.Legend>Profile</Fieldset.Legend>
        <Fieldset.Actions>
          <Button>Save</Button>
        </Fieldset.Actions>
      </Fieldset>,
    ),
  );
}

type CheckboxGroupProps = { variant: "primary" | "secondary"; isDisabled: boolean; isInvalid: boolean };

// Two checkboxes, as the port's demo groups them.
export function checkboxGroup(host: HTMLElement, props: CheckboxGroupProps): void {
  flushSync(() =>
    rootOf(host).render(
      <CheckboxGroup {...props} name="interests">
        <Label>Interests</Label>
        {["Coding", "Design"].map((label) => (
          <Checkbox key={label} value={label.toLowerCase()}>
            <Checkbox.Content>
              <Checkbox.Control>
                <Checkbox.Indicator />
              </Checkbox.Control>
              {label}
            </Checkbox.Content>
          </Checkbox>
        ))}
      </CheckboxGroup>,
    ),
  );
}

type NumberFieldProps = { variant: "primary" | "secondary"; isDisabled: boolean; isInvalid: boolean };

// A field of a label and its group, as the port's demo shows it.
export function numberField(host: HTMLElement, props: NumberFieldProps): void {
  flushSync(() =>
    rootOf(host).render(
      <NumberField {...props} defaultValue={4} minValue={0} name="width">
        <Label>Width</Label>
        <NumberField.Group>
          <NumberField.DecrementButton />
          <NumberField.Input className="w-[80px]" />
          <NumberField.IncrementButton />
        </NumberField.Group>
      </NumberField>,
    ),
  );
}

type SliderProps = { orientation: "horizontal" | "vertical"; isDisabled: boolean };

// A slider of one thumb, as the port's demo shows it.
export function slider(host: HTMLElement, props: SliderProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Slider {...props} className="h-40 w-56" defaultValue={30}>
        <Label>Volume</Label>
        <Slider.Output />
        <Slider.Track>
          <Slider.Fill />
          <Slider.Thumb />
        </Slider.Track>
      </Slider>,
    ),
  );
}

type SearchFieldProps = { variant: "primary" | "secondary"; isDisabled: boolean };

// A field of a label and its group, as the port's demo shows it.
export function searchField(host: HTMLElement, props: SearchFieldProps): void {
  flushSync(() =>
    rootOf(host).render(
      <SearchField {...props} name="search">
        <Label>Search</Label>
        <SearchField.Group>
          <SearchField.SearchIcon />
          <SearchField.Input placeholder="Search..." />
          <SearchField.ClearButton />
        </SearchField.Group>
      </SearchField>,
    ),
  );
}

type InputGroupProps = { variant: "primary" | "secondary" };

// An input with its prefix and suffix, as the port's demo shows it.
export function inputGroup(host: HTMLElement, props: InputGroupProps): void {
  flushSync(() =>
    rootOf(host).render(
      <InputGroup {...props}>
        <InputGroup.Prefix>https://</InputGroup.Prefix>
        <InputGroup.Input aria-label="Site" placeholder="heroui" />
        <InputGroup.Suffix>.com</InputGroup.Suffix>
      </InputGroup>,
    ),
  );
}

type AlertProps = { status: "default" | "accent" | "success" | "warning" | "danger" };

export function alert(host: HTMLElement, props: AlertProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Alert {...props}>
        <Alert.Indicator />
        <Alert.Content>
          <Alert.Title>Saved</Alert.Title>
          <Alert.Description>Your changes are saved.</Alert.Description>
        </Alert.Content>
      </Alert>,
    ),
  );
}

type MeterProps = {
  color: "default" | "accent" | "success" | "warning" | "danger";
  size: "sm" | "md" | "lg";
};

export function meter(host: HTMLElement, props: MeterProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Meter {...props} value={60} className="w-56">
        <Label>Storage</Label>
        <Meter.Output />
        <Meter.Track>
          <Meter.Fill />
        </Meter.Track>
      </Meter>,
    ),
  );
}

type ProgressBarProps = {
  color: "default" | "accent" | "success" | "warning" | "danger";
  size: "sm" | "md" | "lg";
};

export function progressBar(host: HTMLElement, props: ProgressBarProps): void {
  flushSync(() =>
    rootOf(host).render(
      <ProgressBar {...props} value={60} className="w-56">
        <Label>Loading</Label>
        <ProgressBar.Output />
        <ProgressBar.Track>
          <ProgressBar.Fill />
        </ProgressBar.Track>
      </ProgressBar>,
    ),
  );
}

type TimeFieldProps = {
  variant: "primary" | "secondary";
  is_disabled: boolean;
};

export function timeField(host: HTMLElement, { variant, is_disabled }: TimeFieldProps): void {
  flushSync(() =>
    rootOf(host).render(
      <TimeField isDisabled={is_disabled} className="w-56" name="time">
        <Label>Time</Label>
        <TimeField.Group variant={variant}>
          <TimeField.Input>{(segment) => <TimeField.Segment segment={segment} />}</TimeField.Input>
        </TimeField.Group>
      </TimeField>,
    ),
  );
}

type ProgressCircleProps = {
  color: "default" | "accent" | "success" | "warning" | "danger";
  size: "sm" | "md" | "lg";
};

export function progressCircle(host: HTMLElement, props: ProgressCircleProps): void {
  flushSync(() =>
    rootOf(host).render(
      <ProgressCircle {...props} value={60} aria-label="Loading">
        <ProgressCircle.Track>
          <ProgressCircle.TrackCircle />
          <ProgressCircle.FillCircle />
        </ProgressCircle.Track>
      </ProgressCircle>,
    ),
  );
}

type DisclosureProps = {
  isDisabled: boolean;
};

export function disclosure(host: HTMLElement, props: DisclosureProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Disclosure {...props}>
        <Disclosure.Heading>
          <Disclosure.Trigger className="flex w-full items-center gap-2">
            Shipping
            <Disclosure.Indicator />
          </Disclosure.Trigger>
        </Disclosure.Heading>
        <Disclosure.Content>
          <Disclosure.Body>Orders ship within 2 business days.</Disclosure.Body>
        </Disclosure.Content>
      </Disclosure>,
    ),
  );
}

type DisclosureGroupProps = {
  allowsMultipleExpanded: boolean;
  isDisabled: boolean;
};

export function disclosureGroup(host: HTMLElement, props: DisclosureGroupProps): void {
  flushSync(() =>
    rootOf(host).render(
      <DisclosureGroup {...props} defaultExpandedKeys={["shipping"]}>
        {["shipping", "returns"].map((key) => (
          <Disclosure key={key} id={key}>
            <Disclosure.Heading>
              <Disclosure.Trigger className="flex w-full items-center gap-2">
                {key}
                <Disclosure.Indicator />
              </Disclosure.Trigger>
            </Disclosure.Heading>
            <Disclosure.Content>
              <Disclosure.Body>About {key}.</Disclosure.Body>
            </Disclosure.Content>
          </Disclosure>
        ))}
      </DisclosureGroup>,
    ),
  );
}

type AccordionProps = {
  allowsMultipleExpanded: boolean;
  isDisabled: boolean;
  variant: "default" | "surface";
  hideSeparator: boolean;
};

export function accordion(host: HTMLElement, props: AccordionProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Accordion {...props} defaultExpandedKeys={["shipping"]}>
        {["shipping", "returns"].map((key) => (
          <Accordion.Item key={key} id={key}>
            <Accordion.Heading>
              <Accordion.Trigger>
                {key}
                <Accordion.Indicator />
              </Accordion.Trigger>
            </Accordion.Heading>
            <Accordion.Panel>
              <Accordion.Body>About {key}.</Accordion.Body>
            </Accordion.Panel>
          </Accordion.Item>
        ))}
      </Accordion>,
    ),
  );
}

type TabsProps = {
  orientation: "horizontal" | "vertical";
  variant: "primary" | "secondary";
  align: "start" | "center" | "end";
  isDisabled: boolean;
};

export function tabs(host: HTMLElement, props: TabsProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Tabs {...props} defaultSelectedKey="overview">
        <Tabs.ListContainer>
          <Tabs.List aria-label="Options">
            {["overview", "analytics", "reports"].map((key, i) => (
              <Tabs.Tab key={key} id={key}>
                {i > 0 ? <Tabs.Separator /> : null}
                {key}
                <Tabs.Indicator />
              </Tabs.Tab>
            ))}
          </Tabs.List>
        </Tabs.ListContainer>
        {["overview", "analytics", "reports"].map((key) => (
          <Tabs.Panel key={key} id={key}>
            About {key}.
          </Tabs.Panel>
        ))}
      </Tabs>,
    ),
  );
}

type BreadcrumbsProps = { isDisabled: boolean; onAction: (key: string) => void };

export function breadcrumbs(host: HTMLElement, { isDisabled, onAction }: BreadcrumbsProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Breadcrumbs isDisabled={isDisabled} onAction={(key) => onAction(String(key))}>
        <Breadcrumbs.Item id="home" href="#beside-react">
          Home
        </Breadcrumbs.Item>
        <Breadcrumbs.Item id="products" href="#beside-react">
          Products
        </Breadcrumbs.Item>
        <Breadcrumbs.Item id="laptop">Laptop</Breadcrumbs.Item>
      </Breadcrumbs>,
    ),
  );
}

type PaginationProps = { size: "sm" | "md" | "lg" };

// Its page kept by React, as HeroUI's examples keep it, apart from the port's.
function Pages({ size }: PaginationProps) {
  const [page, onPage] = useState(1);
  return (
      <Pagination size={size}>
        <Pagination.Content>
          <Pagination.Item>
            <Pagination.Previous isDisabled={page === 1} onPress={() => onPage(page - 1)}>
              <Pagination.PreviousIcon />
              <span>Previous</span>
            </Pagination.Previous>
          </Pagination.Item>
          {[1, 2, 3].map((p) => (
            <Pagination.Item key={p}>
              <Pagination.Link isActive={p === page} onPress={() => onPage(p)}>
                {p}
              </Pagination.Link>
            </Pagination.Item>
          ))}
          <Pagination.Item>
            <Pagination.Next isDisabled={page === 3} onPress={() => onPage(page + 1)}>
              <span>Next</span>
              <Pagination.NextIcon />
            </Pagination.Next>
          </Pagination.Item>
        </Pagination.Content>
      </Pagination>
  );
}

export function pagination(host: HTMLElement, props: PaginationProps): void {
  flushSync(() => rootOf(host).render(<Pages {...props} />));
}

type TooltipProps = {
  placement: "top" | "bottom" | "left" | "right";
  showArrow: boolean;
};

export function tooltip(host: HTMLElement, { placement, showArrow }: TooltipProps): void {
  flushSync(() =>
    rootOf(host).render(
      <div className="flex justify-center py-16">
        <Tooltip defaultOpen>
          <Button variant="secondary">Hover me</Button>
          <Tooltip.Content placement={placement} showArrow={showArrow}>
            {showArrow ? <Tooltip.Arrow /> : null}
            <p>This is a tooltip</p>
          </Tooltip.Content>
        </Tooltip>
      </div>,
    ),
  );
}

type PopoverProps = { placement: "top" | "bottom" | "left" | "right"; arrow: boolean };

export function popover(host: HTMLElement, { placement, arrow }: PopoverProps): void {
  flushSync(() =>
    rootOf(host).render(
      <div className="flex justify-center py-16">
        <Popover>
          <Button>Click me</Button>
          <Popover.Content className="max-w-64" placement={placement}>
            <Popover.Dialog>
              {arrow ? <Popover.Arrow /> : null}
              <Popover.Heading>Popover Title</Popover.Heading>
              <p className="mt-2 text-sm text-muted">This is the popover content.</p>
            </Popover.Dialog>
          </Popover.Content>
        </Popover>
      </div>,
    ),
  );
}

type ListBoxProps = {
  selectionMode: "none" | "single" | "multiple";
  variant: "default" | "danger";
};

export function listBox(host: HTMLElement, { selectionMode, variant }: ListBoxProps): void {
  flushSync(() =>
    rootOf(host).render(
      <ListBox
        key={selectionMode}
        aria-label="Users"
        className="w-[220px]"
        selectionMode={selectionMode}
        variant={variant}
        defaultSelectedKeys={["bob"]}
        disabledKeys={["martha"]}
      >
        <ListBox.Item id="bob" textValue="Bob">
          <Label>Bob</Label>
          <ListBox.ItemIndicator />
        </ListBox.Item>
        <ListBox.Item id="fred" textValue="Fred">
          <Label>Fred</Label>
          <ListBox.ItemIndicator />
        </ListBox.Item>
        <ListBox.Item id="martha" textValue="Martha">
          <Label>Martha</Label>
          <ListBox.ItemIndicator />
        </ListBox.Item>
      </ListBox>,
    ),
  );
}

type SelectProps = {
  selectionMode: "single" | "multiple";
  variant: "primary" | "secondary";
  isDisabled: boolean;
};

export function select(host: HTMLElement, { selectionMode, variant, isDisabled }: SelectProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Select
        key={selectionMode}
        className="w-[256px]"
        placeholder="Select one"
        selectionMode={selectionMode}
        variant={variant}
        isDisabled={isDisabled}
      >
        <Label>State</Label>
        <Select.Trigger>
          <Select.Value />
          <Select.Indicator />
        </Select.Trigger>
        <Select.Popover>
          <ListBox>
            <ListBox.Item id="florida" textValue="Florida">
              Florida
              <ListBox.ItemIndicator />
            </ListBox.Item>
            <ListBox.Item id="texas" textValue="Texas">
              Texas
              <ListBox.ItemIndicator />
            </ListBox.Item>
            <ListBox.Item id="utah" textValue="Utah">
              Utah
              <ListBox.ItemIndicator />
            </ListBox.Item>
          </ListBox>
        </Select.Popover>
      </Select>,
    ),
  );
}

type DropdownProps = {
  selectionMode: "none" | "single" | "multiple";
  placement: "top" | "bottom" | "left" | "right";
  trigger: "press" | "longPress";
};

export function dropdown(host: HTMLElement, { selectionMode, placement, trigger }: DropdownProps): void {
  flushSync(() =>
    rootOf(host).render(
      <div className="flex justify-center py-16">
        <Dropdown key={selectionMode} trigger={trigger}>
          <Button aria-label="Menu" variant="secondary">
            Actions
          </Button>
          <Dropdown.Popover placement={placement}>
            <Dropdown.Menu selectionMode={selectionMode} defaultSelectedKeys={["copy"]}>
              <Dropdown.Item id="new" textValue="New file">
                {selectionMode === "none" ? null : <Dropdown.ItemIndicator />}
                <Label>New file</Label>
              </Dropdown.Item>
              <Dropdown.Item id="copy" textValue="Copy link">
                {selectionMode === "none" ? null : <Dropdown.ItemIndicator />}
                <Label>Copy link</Label>
              </Dropdown.Item>
              <Dropdown.Item id="delete" textValue="Delete file" variant="danger">
                {selectionMode === "none" ? null : <Dropdown.ItemIndicator />}
                <Label>Delete file</Label>
              </Dropdown.Item>
            </Dropdown.Menu>
          </Dropdown.Popover>
        </Dropdown>
      </div>,
    ),
  );
}

type ModalProps = {
  variant: "opaque" | "blur" | "transparent";
  placement: "auto" | "center" | "top" | "bottom";
  size: "xs" | "sm" | "md" | "lg" | "cover" | "full";
  isDismissable: boolean;
};

export function modal(host: HTMLElement, { variant, placement, size, isDismissable }: ModalProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Modal>
        <Button variant="secondary">Open Modal</Button>
        <Modal.Backdrop variant={variant} isDismissable={isDismissable}>
          <Modal.Container placement={placement} size={size}>
            <Modal.Dialog>
              <Modal.CloseTrigger />
              <Modal.Header>
                <Modal.Heading>Welcome to HeroUI</Modal.Heading>
              </Modal.Header>
              <Modal.Body>
                <p>A beautiful, fast, and modern React UI library.</p>
              </Modal.Body>
              <Modal.Footer>
                <Button slot="close">Continue</Button>
              </Modal.Footer>
            </Modal.Dialog>
          </Modal.Container>
        </Modal.Backdrop>
      </Modal>,
    ),
  );
}

type AlertDialogProps = {
  status: "default" | "accent" | "success" | "warning" | "danger";
  variant: "opaque" | "blur" | "transparent";
  isDismissable: boolean;
};

export function alertDialog(host: HTMLElement, { status, variant, isDismissable }: AlertDialogProps): void {
  flushSync(() =>
    rootOf(host).render(
      <AlertDialog>
        <Button variant="danger">Delete Project</Button>
        <AlertDialog.Backdrop variant={variant} isDismissable={isDismissable}>
          <AlertDialog.Container>
            <AlertDialog.Dialog>
              <AlertDialog.CloseTrigger />
              <AlertDialog.Header>
                <AlertDialog.Icon status={status} />
                <AlertDialog.Heading>Delete project permanently?</AlertDialog.Heading>
              </AlertDialog.Header>
              <AlertDialog.Body>
                <p>This will permanently delete the project.</p>
              </AlertDialog.Body>
              <AlertDialog.Footer>
                <Button slot="close" variant="tertiary">
                  Cancel
                </Button>
                <Button slot="close" variant="danger">
                  Delete
                </Button>
              </AlertDialog.Footer>
            </AlertDialog.Dialog>
          </AlertDialog.Container>
        </AlertDialog.Backdrop>
      </AlertDialog>,
    ),
  );
}

type DrawerProps = {
  placement: "top" | "bottom" | "left" | "right";
  variant: "opaque" | "blur" | "transparent";
  isDismissable: boolean;
};

export function drawer(host: HTMLElement, { placement, variant, isDismissable }: DrawerProps): void {
  flushSync(() =>
    rootOf(host).render(
      <Drawer>
        <Button variant="secondary">Open Drawer</Button>
        <Drawer.Backdrop variant={variant} isDismissable={isDismissable}>
          <Drawer.Content placement={placement}>
            <Drawer.Dialog>
              <Drawer.Handle />
              <Drawer.CloseTrigger />
              <Drawer.Header>
                <Drawer.Heading>Drawer Title</Drawer.Heading>
              </Drawer.Header>
              <Drawer.Body>
                <p>Drag the handle toward the edge to close.</p>
              </Drawer.Body>
              <Drawer.Footer>
                <Button slot="close">Continue</Button>
              </Drawer.Footer>
            </Drawer.Dialog>
          </Drawer.Content>
        </Drawer.Backdrop>
      </Drawer>,
    ),
  );
}

type ToggleButtonProps = {
  variant: "default" | "ghost";
  size: "sm" | "md" | "lg";
  isIconOnly: boolean;
  isDisabled: boolean;
};

export function toggleButton(host: HTMLElement, props: ToggleButtonProps): void {
  flushSync(() => rootOf(host).render(<ToggleButton {...props}>Like</ToggleButton>));
}

type ToggleButtonGroupProps = {
  selectionMode: "single" | "multiple";
  size: "sm" | "md" | "lg";
  orientation: "horizontal" | "vertical";
  isDetached: boolean;
  fullWidth: boolean;
  isDisabled: boolean;
};

// Three buttons, as the port's demo groups them.
export function toggleButtonGroup(host: HTMLElement, props: ToggleButtonGroupProps): void {
  flushSync(() =>
    rootOf(host).render(
      <ToggleButtonGroup aria-label="Alignment" {...props} defaultSelectedKeys={["center"]}>
        <ToggleButton id="left">Left</ToggleButton>
        <ToggleButton id="center">
          <ToggleButtonGroup.Separator />
          Center
        </ToggleButton>
        <ToggleButton id="right">
          <ToggleButtonGroup.Separator />
          Right
        </ToggleButton>
      </ToggleButtonGroup>,
    ),
  );
}
