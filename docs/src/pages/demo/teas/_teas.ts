// The demo's data, read at build time: Astro makes a page of each tea, and
// nothing of it reaches the browser but the HTML and an island's props. A
// name that starts with an underscore is no route.
export interface Tea {
  slug: string;
  name: string;
  origin: string;
  notes: string;
}

export const teas: Tea[] = [
  { slug: "sencha", name: "Sencha", origin: "Shizuoka, Japan", notes: "Steamed green leaves, grassy and bright." },
  { slug: "darjeeling", name: "Darjeeling", origin: "West Bengal, India", notes: "A first flush, light and floral." },
  { slug: "pu-erh", name: "Pu-erh", origin: "Yunnan, China", notes: "Aged and fermented, deep and earthy." },
];
