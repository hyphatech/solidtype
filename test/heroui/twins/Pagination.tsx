// HeroUI's Pagination in React, its page kept as HeroUI's examples keep it,
// which the solidtype port's test renders under the same props, to compare
// every part, and steps as it steps the port's.

import { Pagination } from "@heroui/react";
import { act, useState } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = { size?: "sm" | "md" | "lg" };

function Pages({ size, onPage }: Props & { onPage: (page: number) => void }) {
  const [page, setPage] = useState(1);
  const go = (p: number) => {
    setPage(p);
    onPage(p);
  };
  return (
    <Pagination size={size}>
      <Pagination.Summary>Page {page} of 3</Pagination.Summary>
      <Pagination.Content>
        <Pagination.Item>
          <Pagination.Previous isDisabled={page === 1} onPress={() => go(page - 1)}>
            <Pagination.PreviousIcon />
            <span>Previous</span>
          </Pagination.Previous>
        </Pagination.Item>
        {[1, 2, 3].map((p) => (
          <Pagination.Item key={p}>
            <Pagination.Link isActive={p === page} onPress={() => go(p)}>
              {p}
            </Pagination.Link>
          </Pagination.Item>
        ))}
        <Pagination.Item>
          <Pagination.Ellipsis />
        </Pagination.Item>
        <Pagination.Item>
          <Pagination.Next isDisabled={page === 3} onPress={() => go(page + 1)}>
            <span>Next</span>
            <Pagination.NextIcon />
          </Pagination.Next>
        </Pagination.Item>
      </Pagination.Content>
    </Pagination>
  );
}

export function render(props: Props, onPage: (page: number) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<Pages {...props} onPage={onPage} />));
  mounted = { root, host };
  return host;
}

export async function step(action: () => Promise<unknown>): Promise<void> {
  await act(async () => {
    await action();
  });
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
