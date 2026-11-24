# HeroUI

A maintained port of HeroUI's design system to solidtype.

[HeroUI](https://heroui.com)'s look and feel, reimplemented on Kobalte. The
port follows each HeroUI release, and every component is tested against
HeroUI's own React one.

```ocaml title="card_form.mlx"
module Button = Solidtype_heroui.Button
module Card = Solidtype_heroui.Card
module Form = Solidtype_heroui.Form
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Link = Solidtype_heroui.Link
module Text_field = Solidtype_heroui.Text_field

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]
external alert : string -> unit = "alert"

let make () =
  <Card class_="w-full max-w-md">
    <Card.Header>
      <Card.Title>"Login"</Card.Title>
      <Card.Description>
        "Enter your credentials to access your account"
      </Card.Description>
    </Card.Header>
    <Form
      on_submit=(fun e ->
                  prevent_default e;
                  alert "Form submitted successfully!")>
      <Card.Content>
        <div class_="flex flex-col gap-4">
          <Text_field name="email">
            <Label>"Email"</Label>
            <Input
              placeholder="email@example.com" type_="email" variant=`secondary
            />
          </Text_field>
          <Text_field name="password">
            <Label>"Password"</Label>
            <Input
              placeholder={js|••••••••|js} type_="password" variant=`secondary
            />
          </Text_field>
        </div>
      </Card.Content>
      <Card.Footer class_="mt-4 flex flex-col gap-2">
        <Button class_="w-full" type_=`submit>"Sign In"</Button>
        <Link class_="text-center text-sm" href="#">"Forgot password?"</Link>
      </Card.Footer>
    </Form>
  </Card>
```

## What you get

- **HeroUI's look.** Each component carries HeroUI's own classes from
  `@heroui/styles`, so HeroUI's themes and stylesheets restyle it as they do
  in React.
- **Kobalte's behaviour.** Keyboard, focus and ARIA are Kobalte's, with
  HeroUI's parts and props on top, and what HeroUI does beyond Kobalte.
- **HeroUI's state attributes.** `data-hovered`, `data-pressed`,
  `data-selected` and the rest are on each element, prerendered pages
  included, so HeroUI's selectors work.
- **Parity with HeroUI in React.** Each component's page shows it beside
  HeroUI's own React component.

## How far it goes

66 of HeroUI 3.2's components are ported;
[Coverage](heroui/coverage.md) lists each, what it does, and the one
still to come. Every component has its page in this section, with HeroUI's
own examples written in OCaml.

## Install

```sh
opam install solidtype-heroui
bun add @heroui/styles @kobalte/core tailwindcss
```

```lisp
(libraries solidtype solidtype-kobalte solidtype-heroui melange.dom)
```

Import HeroUI's styles, as HeroUI's own installation does:

```css
@import "tailwindcss";
@import "@heroui/styles";
```

## Icons

HeroUI's components and examples draw [Gravity UI's icons](https://gravity-ui.com/icons).
`solidtype-gravity-icons` has every one, named by the one rule:
`ChevronDown` is `Gravity.Chevron_down`. It imports nothing from npm, and
comes with `solidtype-heroui`, whose components draw their icons from it.

```sh
opam install solidtype-gravity-icons
```

```lisp
(libraries solidtype solidtype-gravity-icons melange.dom)
```

```ocaml
module Gravity = Solidtype_gravity_icons

let icon = <Gravity.Chevron_down class_="size-4" />
```

An icon takes every attribute an `<svg>` does.
