# Components in HeroUI Pro's shape

**Status: Accepted** — Segment, TrendChip and TextShimmer, reimplemented on Kobalte in HeroUI's free design, their pages without a React demo; Segment has landed.
Date: 2026-11-02

## The problem

An application on the stack needs components HeroUI's free set lacks and
HeroUI Pro has: a segmented control first, then a chip that shows a trend
and a label that shimmers while work runs. The owner asked for Pro's
Segment, TrendChip and TextShimmer, in that order.

HeroUI Pro is licensed, in beta (`1.0.0-beta.11`), and its terms forbid
publishing or redistributing any part of its source. The way
`solidtype-heroui` ports a component -- HeroUI's own classes, generated
from its styles package, and a test against its React component, shown
beside ours on a public page -- would put Pro's CSS in a public opam
package, its package in CI and its compiled code on GitHub Pages. So these
components are reimplemented, not ported: Pro's documented API and look,
built here, with nothing of Pro's in the repository.

## Scope

It covers `Segment`, `Trend_chip` and `Text_shimmer`, each a module of
`solidtype-heroui` with its interface, its tests and its documentation page,
and a fix in `solidtype-headless` of any Kobalte component beneath one that
needs it. It touches this repository alone.

It does not cover any other Pro component; each further one is a stage
added here, on the same terms. Nothing of `@heroui-pro/react` is installed,
imported, copied or generated from: not its CSS, its source or its
types. Its public documentation and its public demos are read, as any user
reads them.

## User scenarios

1. **An application switches a view.** It shows a `Segment` of "Monthly"
   and "Yearly", one always selected, controlled from a signal. *Accepted
   when* a test drives it by pointer and by keys -- a radio group, Tab
   reaches it once, the arrows move the selection, never to none, a
   disabled item skipped -- and axe finds nothing.
2. **A dashboard shows a change.** It shows `<Trend_chip trend=`down>"3.1%"`
   with a prefix and a suffix. *Accepted when* its colour and arrow follow
   its trend in each variant and size.
3. **A chat shows it is thinking.** It shows `<Text_shimmer>"Thinking..."`.
   *Accepted when* a reader reads the text once, the highlight sweeps in the
   text's own colour, and under reduced motion the text is still and solid.
4. **A page is prerendered.** Each renders on the server with its state
   attributes, and hydrates. *Accepted when* the documentation's build
   prerenders each page so.

## Requirements

- **FR-1** Each component takes Pro's documented props and parts, named by
  solidtype's one spelling rule: `Segment` and `Segment.Item` and
  `Segment.Separator`; `Trend_chip` and its `Prefix`, `Indicator` and
  `Suffix`; `Text_shimmer`.
- **FR-2** Each looks as Pro's demo does in HeroUI's default theme -- its
  sizes, colours, radii, motion -- built only on HeroUI's free tokens and
  components, so a theme of HeroUI's dresses it as it dresses the rest.
- **FR-3** Its state is declared as the ports declare theirs, React Aria's
  `"true"` or absent, so it is in a prerendered page: `data-selected`,
  `data-hovered`, `data-focus-visible`, `data-disabled`, `data-trend`.
- **FR-4** Its behaviour and accessibility are Kobalte's where Kobalte has
  the pattern, made headless first where it does not.
- **FR-5** Nothing of HeroUI Pro is in the repository, its build or its
  published site.
- **FR-6** Its look is matched by measuring what Pro's public demo renders
  -- each part's size, spacing, token and timing -- and written here; never
  transcribed from Pro's stylesheet or source, in its package or in a
  browser's inspector.

## Design

### What each is made of

- **Segment** is Kobalte's `SegmentedControl`: a radio group, one item
  always selected, as Pro's renders -- React Aria's single toggle group is a
  `radiogroup` of `radio`s -- and an indicator Kobalte sizes and places on
  the selected item. `Segment` dresses it as a port dresses Kobalte's: the
  track, the indicator that moves to the item chosen, and `Separator`, hidden
  beside the selected item. Variants `default` and `ghost`, sizes `sm`,
  `md` and `lg` (28, 32 and 40 pixels high), disabled whole or by item,
  and an item's children given its state, for the example whose items show
  their label only when selected.
- **Trend_chip** is `Chip`, its colour from `trend` -- `up` success, `down`
  danger, `neutral` warning -- and its own arrow, an icon drawn here, which
  `Indicator`'s children replace. No behaviour.
- **Text_shimmer** is a span of the text at 45% of its colour and an
  `aria-hidden` copy that masks a highlight moved by `translate` alone, so
  no frame repaints; the motion is the Web Animations API's, started on
  mount and never under reduced motion, so the server writes the text still.

### Styles

A port's look is HeroUI's own classes, from `@heroui/styles`. These have
none to take, so their look is written here, as Tailwind utilities on
HeroUI's tokens (`bg-surface-secondary`, `text-accent-foreground`) in each
module, its state read by data variants (`data-[selected=true]:`). An
application already builds HeroUI with Tailwind; it adds one `@source` of
the library's compiled output, as the documentation and the example do.
A caller's class is merged over them by `Styles.cn`, HeroUI's own merge, so
it wins as it does over a port's classes. Pro's class names
(`.segment__item`) are documented by Pro and given too,
so a selector a user writes against Pro's names carries across; no rule of
ours is written against them.

### Tests

There is no React twin. Each is tested as a caller meets it, as the
headless components are: its roles, keys and state, and an axe scan, in
`test/heroui/`. Its look is
checked by eye against Pro's public demo in Chrome before it lands, as
every port's is against heroui.com. Its page shows ours alone: no "beside
React" demo and no comparison table, since either would run Pro's
component on a public site. It links to the page of Pro's documentation it
follows, as an rhp page links to rhp's.

### Alternatives rejected

- **Port Pro's CSS and test against `@heroui-pro/react`**, as HeroUI's free
  components are: Pro's terms forbid publishing any part of it, and the
  repository, its CI and its site are public.
- **A stylesheet of our own shipped with the package**: an opam package has
  no place an application's bundler imports CSS from, and the classes would
  be a second system beside Tailwind, which HeroUI's users already run.
- **Segment on Kobalte's toggle group**, buttons pressed or not: Pro's is a
  radio group, read so by a screen reader, and Kobalte's segmented control
  is that pattern with its indicator.
- **A package of its own, `solidtype-heroui-pro`**: it would read as Pro's
  binding, which it is not; these are dressed in HeroUI's free design and
  built on its ports, `Chip` first.

## Rules it adds

- **A component in Pro's shape is reimplemented, never ported** (in
  `AGENTS.md` since Segment landed): nothing
  of `@heroui-pro/react` is installed, imported, copied or generated from;
  its look is Tailwind on HeroUI's tokens, its test a caller's, without a
  twin. Why: Pro is licensed and forbids publishing its source, and this
  repository is public. Symptom: `rg -n heroui-pro` finds anything outside
  this rule and the pages that cite Pro's documentation.

## Stages

- [x] Segment: on Kobalte's segmented control, in HeroUI's look, every
  example on Pro's page, its documentation page and the docs' `@source`
- [ ] TrendChip, every example on Pro's page
- [ ] TextShimmer, every example on Pro's page

## Verification

Each component's test, `make test`, `make lint` and `make docs`, free of
warnings; each page beside Pro's demo in Chrome, by pointer and by keys,
light and dark; and `rg -n heroui-pro` finding only citations.

## Where the facts go

| Fact | Goes to |
|---|---|
| Each component's contract | its `.mli` |
| Its use, its examples, that it is a reimplementation of Pro's | its page under `docs/src/content/docs/heroui/` |
| That it exists | `docs/src/content/docs/heroui/coverage.mdx`, a section of its own, and `README.md` |
| The rule on Pro, and `@source` | `AGENTS.md` |
| What a user can now do | `CHANGES.md` |
