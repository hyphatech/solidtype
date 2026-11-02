// jsdom has no layout and no canvas, and says so on every call to the
// placeholders it keeps for them. Kobalte scrolls the page as an overlay
// closes, and axe measures text on a canvas: here a scroll goes nowhere
// and a canvas has nothing to draw with, as jsdom's placeholders do,
// without a line each, so what a run prints is only what went wrong.
// Nor has it a ResizeObserver, by which Kobalte's viewport and colour
// wheel measure themselves: one that never reports stands in, as on a
// page with no layout.
window.scrollTo = () => {};
HTMLCanvasElement.prototype.getContext = () => null;
globalThis.ResizeObserver ??= class {
  observe() {}
  unobserve() {}
  disconnect() {}
};
// Nor a size: an element is as wide and as high as a test says by its
// data-client-width and data-client-height, as a table's resizable container
// and a virtualized table measure themselves, and else none, as jsdom has it.
Object.defineProperty(HTMLElement.prototype, "clientWidth", {
  configurable: true,
  get(this: HTMLElement) {
    return Number(this.getAttribute("data-client-width") ?? 0);
  },
});
Object.defineProperty(HTMLElement.prototype, "clientHeight", {
  configurable: true,
  get(this: HTMLElement) {
    return Number(this.getAttribute("data-client-height") ?? 0);
  },
});
// Nor an IntersectionObserver, by which a load-more sentinel sees it is in
// view: one that reports nothing stands in, as for a list scrolled nowhere,
// until a test brings an element into view by its static `intersect`, as a
// scroll to it would, which tells every observer watching it.
const observing = new Set<{
  targets: Set<Element>;
  report: (entries: IntersectionObserverEntry[]) => void;
}>();
globalThis.IntersectionObserver ??= class {
  static intersect(target: Element) {
    for (const o of observing)
      if (o.targets.has(target))
        o.report([{ isIntersecting: true, target } as IntersectionObserverEntry]);
  }
  #watching: {
    targets: Set<Element>;
    report: (entries: IntersectionObserverEntry[]) => void;
  };
  constructor(report: IntersectionObserverCallback) {
    this.#watching = {
      targets: new Set(),
      report: (entries) => report(entries, this as unknown as IntersectionObserver),
    };
  }
  observe(target: Element) {
    this.#watching.targets.add(target);
    observing.add(this.#watching);
  }
  unobserve(target: Element) {
    this.#watching.targets.delete(target);
  }
  disconnect() {
    this.#watching.targets.clear();
    observing.delete(this.#watching);
  }
  takeRecords() {
    return [];
  }
} as unknown as typeof IntersectionObserver;
// Nor has it CSS.escape, by which user-event finds a radio's group as an
// arrow key moves the choice: CSSOM's serialisation of an identifier
// stands in.
globalThis.CSS ??= {} as typeof CSS;
// Nor CSS.supports, by which rhp asks whether a path's outline moves by
// CSS: jsdom has no CSS engine, so nothing is supported.
CSS.supports ??= () => false;
CSS.escape ??= (value: string) => {
  let out = "";
  for (let i = 0; i < value.length; i++) {
    const code = value.charCodeAt(i);
    const c = value.charAt(i);
    if (code === 0) out += "�";
    else if ((code >= 0x1 && code <= 0x1f) || code === 0x7f
      || (i === 0 && code >= 0x30 && code <= 0x39)
      || (i === 1 && code >= 0x30 && code <= 0x39 && value.charCodeAt(0) === 0x2d)) {
      out += `\\${code.toString(16)} `;
    } else if (i === 0 && value.length === 1 && code === 0x2d) out += `\\${c}`;
    else if (code >= 0x80 || code === 0x2d || code === 0x5f || /[0-9A-Za-z]/.test(c)) out += c;
    else out += `\\${c}`;
  }
  return out;
};
// Nor has it matchMedia, by which HeroUI's toast asks whether the page is a
// phone's and whether its reader asks for less motion: a page that matches
// no query stands in, as a wide screen with motion would.
window.matchMedia ??= (query: string) =>
  ({
    matches: false,
    media: query,
    onchange: null,
    addListener() {},
    removeListener() {},
    addEventListener() {},
    removeEventListener() {},
    dispatchEvent: () => false,
  }) as MediaQueryList;
// Nor does its hidden property take "until-found", as HTML's has since a
// hidden element became one find in page reaches: Solid sets the property,
// and a browser writes the attribute so.
const hidden = Object.getOwnPropertyDescriptor(HTMLElement.prototype, "hidden");
if (hidden?.set && hidden.get) {
  const { get, set } = hidden;
  Object.defineProperty(HTMLElement.prototype, "hidden", {
    ...hidden,
    get(this: HTMLElement) {
      return this.getAttribute("hidden") === "until-found" ? "until-found" : get.call(this);
    },
    set(this: HTMLElement, value: unknown) {
      if (value === "until-found") this.setAttribute("hidden", "until-found");
      else set.call(this, value);
    },
  });
}
// Nor has it Web Animations' getAnimations, by which React Aria's selection
// indicator, and the port's, cancel what they start: an element with no
// animation running stands in, as on a page whose styles animate nothing.
Element.prototype.getAnimations ??= () => [];
// Nor has it pointer capture, by which a drawer, HeroUI's and the port's,
// keeps a drag as the pointer leaves it: an element that captures nothing
// stands in, as a pointer that never leaves.
Element.prototype.setPointerCapture ??= () => {};
Element.prototype.releasePointerCapture ??= () => {};
Element.prototype.hasPointerCapture ??= () => false;
