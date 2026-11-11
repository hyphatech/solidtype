// The icons HeroUI's React components draw, each beside the Gravity UI icon
// it copies. A port draws Gravity's own, whose path is spelt otherwise -- a
// command repeated, a closing Z, a start elsewhere on the same outline -- and
// draws the same shape, so a twin's test reads either path as the icon.

import * as Gravity from "@gravity-ui/icons";
import * as HeroUI from "@heroui/react";
import type { ReactElement, SVGProps } from "react";

type Icon = (props: SVGProps<SVGSVGElement>) => ReactElement;

const copies: [string, Icon, Icon][] = [
  ["chevron-down", HeroUI.IconChevronDown, Gravity.ChevronDown],
  ["chevron-up", HeroUI.IconChevronUp, Gravity.ChevronUp],
  ["chevron-left", HeroUI.IconChevronLeft, Gravity.ChevronLeft],
  ["chevron-right", HeroUI.IconChevronRight, Gravity.ChevronRight],
  ["xmark", HeroUI.CloseIcon, Gravity.Xmark],
  ["circle-info", HeroUI.InfoIcon, Gravity.CircleInfo],
  ["circle-check", HeroUI.SuccessIcon, Gravity.CircleCheck],
  ["triangle-exclamation", HeroUI.WarningIcon, Gravity.TriangleExclamation],
  ["circle-exclamation", HeroUI.DangerIcon, Gravity.CircleExclamation],
  ["plus", HeroUI.IconPlus, Gravity.Plus],
  ["minus", HeroUI.IconMinus, Gravity.Minus],
  ["magnifier", HeroUI.IconSearch, Gravity.Magnifier],
];

function path(icon: Icon): string {
  const svg = icon({}) as ReactElement<{ children: ReactElement<{ d: string }> }>;
  return svg.props.children.props.d;
}

const names = new Map(
  copies.flatMap(([name, heroui, gravity]) => [
    [path(heroui), name],
    [path(gravity), name],
  ]),
);

export function icon(d: string): string | undefined {
  return names.get(d);
}
