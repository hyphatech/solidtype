# Alert

Display important messages and notifications to users with status indicators.

Original HeroUI documentation: [Alert](https://heroui.com/en/docs/react/components/alert).

## Usage

```ocaml title="alert_usage.mlx"
module Alert = Solidtype_heroui.Alert
module Button = Solidtype_heroui.Button
module Close_button = Solidtype_heroui.Close_button
module Spinner = Solidtype_heroui.Spinner

let make () =
  <div class_="grid w-full max-w-xl gap-4">
    <Alert>
      <Alert.Indicator />
      <Alert.Content>
        <Alert.Title>"New features available"</Alert.Title>
        <Alert.Description>
          "Check out our latest updates including dark mode support and \
           improved accessibility features."
        </Alert.Description>
      </Alert.Content>
    </Alert>
    <Alert status=`accent>
      <Alert.Indicator />
      <Alert.Content>
        <Alert.Title>"Update available"</Alert.Title>
        <Alert.Description>
          "A new version of the application is available. Please refresh to \
           get the latest features and bug fixes."
        </Alert.Description>
        <Button class_="mt-2 sm:hidden" size=`sm variant=`primary>
          "Refresh"
        </Button>
      </Alert.Content>
      <Button class_="hidden sm:block" size=`sm variant=`primary>
        "Refresh"
      </Button>
    </Alert>
    <Alert status=`danger>
      <Alert.Indicator />
      <Alert.Content>
        <Alert.Title>"Unable to connect to server"</Alert.Title>
        <Alert.Description>
          "We're experiencing connection issues. Please try the following:"
          <ul class_="mt-2 list-inside list-disc space-y-1 text-sm">
            <li>"Check your internet connection"</li>
            <li>"Refresh the page"</li>
            <li>"Clear your browser cache"</li>
          </ul>
        </Alert.Description>
        <Button class_="mt-2 sm:hidden" size=`sm variant=`danger>
          "Retry"
        </Button>
      </Alert.Content>
      <Button class_="hidden sm:block" size=`sm variant=`danger>"Retry"</Button>
    </Alert>
    <Alert status=`success>
      <Alert.Indicator />
      <Alert.Content>
        <Alert.Title>"Profile updated successfully"</Alert.Title>
      </Alert.Content>
      <Close_button />
    </Alert>
    <Alert status=`accent>
      <Alert.Indicator><Spinner size=`sm /></Alert.Indicator>
      <Alert.Content>
        <Alert.Title>"Processing your request"</Alert.Title>
        <Alert.Description>
          "Please wait while we sync your data. This may take a few moments."
        </Alert.Description>
      </Alert.Content>
    </Alert>
    <Alert status=`warning>
      <Alert.Indicator />
      <Alert.Content>
        <Alert.Title>"Scheduled maintenance"</Alert.Title>
        <Alert.Description>
          "Our services will be unavailable on Sunday, March 15th from 2:00 AM \
           to 6:00 AM UTC for scheduled maintenance."
        </Alert.Description>
      </Alert.Content>
    </Alert>
  </div>
```

## Parity

The same HeroUI Alert twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of the two: a marked row is
one they disagree on.

## Anatomy

```ocaml
<Alert>
  <Alert.Indicator />
  <Alert.Content>
    <Alert.Title>"Title"</Alert.Title>
    <Alert.Description>"Description"</Alert.Description>
  </Alert.Content>
</Alert>
```

## Examples

### Announced

`` role=`alert `` has a reader announce the alert as it appears.

```ocaml title="alert_announced.mlx"
module Alert = Solidtype_heroui.Alert

let make () =
  <Alert role=`alert status=`danger>
    <Alert.Indicator />
    <Alert.Content>
      <Alert.Title>"Payment failed"</Alert.Title>
      <Alert.Description>"Your card was declined."</Alert.Description>
    </Alert.Content>
  </Alert>
```

## Customization

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every alert, as with
HeroUI in React:

```css
@layer components {
  .alert {
    @apply rounded-2xl shadow-lg;
  }

  .alert__title {
    @apply font-bold;
  }
}
```

## Styling Reference

### CSS Classes

- `.alert` - Base alert container
- `.alert__indicator` - Icon/indicator container
- `.alert__content` - Content wrapper for title and description
- `.alert__title` - Alert title text
- `.alert__description` - Alert description text
- `.alert--default` - Default gray status
- `.alert--accent` - Accent blue status
- `.alert--success` - Success green status
- `.alert--warning` - Warning yellow/orange status
- `.alert--danger` - Danger red status

### Interactive States

The alert is informational and has no interactive states of its own. It can
contain interactive elements like buttons or close buttons.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Alert

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `status` | `status` | `` [ `default \| `accent \| `success \| `warning \| `danger ] `` | `` `default `` | The visual status of the alert |
| `role` | `role` | `Solidtype.Html.Div.role` | | `` `alert `` to be announced |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | The alert content |

### Alert.Indicator, Content, Title, Description

Each takes `class_`, added after HeroUI's class, and its children. The
indicator's children are a custom indicator icon, which defaults to the status
icon.
