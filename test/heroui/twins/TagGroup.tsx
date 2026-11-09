// HeroUI's TagGroup in React, as HeroUI's examples draw it, which the
// solidtype port's test renders under the same props and steps into as it
// does the port's, to compare every part, the selection told and the tags
// removed.

import { Description, EmptyState, ErrorMessage, Label, Tag, TagGroup, type Key } from "@heroui/react";
import { act, useState } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  tags: string[];
  selectionMode?: "none" | "single" | "multiple";
  selectedKeys?: string[];
  defaultSelectedKeys?: string[];
  disabledKeys?: string[];
  disabled?: string;
  isDisabled?: boolean;
  size?: "sm" | "md" | "lg";
  variant?: "default" | "surface";
  removable?: boolean;
  customRemove?: boolean;
  label?: string;
  description?: string;
  errorMessage?: string;
  ariaLabel?: string;
};

const toldOf = (keys: Iterable<Key> | "all") =>
  keys === "all" ? "all" : Array.from(keys).map(String).sort().join(",");

function Group({ props, told }: { props: Props; told: (s: string) => void }) {
  const [tags, setTags] = useState(props.tags);
  const { disabled, removable, customRemove } = props;
  return (
    <TagGroup
      aria-label={props.ariaLabel}
      selectionMode={props.selectionMode}
      selectedKeys={props.selectedKeys}
      defaultSelectedKeys={props.defaultSelectedKeys}
      disabledKeys={props.disabledKeys}
      isDisabled={props.isDisabled}
      size={props.size}
      variant={props.variant}
      onSelectionChange={(keys) => told("selected " + toldOf(keys))}
      onRemove={
        removable
          ? (keys) => {
              told("removed " + toldOf(keys));
              setTags((ts) => ts.filter((t) => !keys.has(t)));
            }
          : undefined
      }
    >
      {props.label ? <Label>{props.label}</Label> : null}
      <TagGroup.List renderEmptyState={() => <EmptyState>No tags</EmptyState>}>
        {tags.map((t) => (
          <Tag key={t} id={t} isDisabled={t === disabled || undefined}>
            {t}
            {customRemove ? (
              <Tag.RemoveButton>
                <svg data-cross="" viewBox="0 0 16 16" />
              </Tag.RemoveButton>
            ) : null}
          </Tag>
        ))}
      </TagGroup.List>
      {props.description ? <Description>{props.description}</Description> : null}
      {props.errorMessage !== undefined ? <ErrorMessage>{props.errorMessage}</ErrorMessage> : null}
    </TagGroup>
  );
}

export function render(props: Props, told: (s: string) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<Group props={props} told={told} />));
  mounted = { root, host };
  return host;
}

export async function step(action: () => Promise<void>): Promise<void> {
  await act(action);
}

// A group whose first tag draws its children of its state, as words; that
// tag, to walk.
export function renderOfState(disabled: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <TagGroup aria-label="Tags" selectionMode="multiple" onRemove={() => {}}>
        <TagGroup.List>
          <Tag id="news" textValue="News" isDisabled={disabled}>
            {(s) => (
              <span data-words="tag">
                {words([
                  ["hovered", s.isHovered],
                  ["pressed", s.isPressed],
                  ["selected", s.isSelected],
                  ["focused", s.isFocused],
                  ["focus-visible", s.isFocusVisible],
                  ["disabled", s.isDisabled],
                  ["removable", s.allowsRemoving],
                ])}
              </span>
            )}
          </Tag>
          <Tag id="travel">Travel</Tag>
        </TagGroup.List>
      </TagGroup>,
    ),
  );
  mounted = { root, host };
  const tag = host.querySelector("[role=row]");
  if (!(tag instanceof HTMLElement)) throw new Error("HeroUI's TagGroup rendered no tag");
  return tag;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
