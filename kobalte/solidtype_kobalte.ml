(* Every Kobalte component, part by part, its hooks and utilities, and the
   types they name, in Types. Generated from the declarations of
   @kobalte/core 0.13.14 by generate/kobalte.ts; never edited by hand.

   A part's props check takes its own props, then its children, then the
   attributes of the element it renders, which it passes on. Each check is
   external, since the compiler checks it and Melange writes none of it. *)

module Types = Types

module Accordion = struct
  (** Contains the content to be rendered when the `Accordion.Item` is expanded. *)
  module Content = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/accordion"]
  end

  (** Wraps an `Accordion.Trigger`.
      Use the `as` prop to update it to the appropriate heading level for your page. *)
  module Header = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.H3.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Header"
    [@@mel.module "@kobalte/core/accordion"]
  end

  (** An item of the accordion, contains all the parts of a collapsible section. *)
  module Item = struct
    module Props = struct
      external check :
        value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/accordion"]
  end

  (** A vertically stacked set of interactive headings that each reveal an associated section of content. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string array Solidtype.Check.value ->
        ?default_value:string array Solidtype.Check.value ->
        ?on_change:(string array -> unit) ->
        ?multiple:bool Solidtype.Check.value ->
        ?collapsible:bool Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/accordion"]
  end

  (** Toggles the collapsed state of its associated item. It should be nested inside an `Accordion.Header`. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/accordion"]
  end

  external use_accordion_context : unit -> Types.AccordionContextValue.t = "useAccordionContext"
  [@@mel.module "@kobalte/core/accordion"]
end

module Alert = struct
  (** Alert displays a brief, important message
      in a way that attracts the user's attention without interrupting the user's task. *)
  module Root = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/alert"]
  end
end

module AlertDialog = struct
  (** The button that closes the dialog. *)
  module CloseButton = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CloseButton"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** Overrides the regular `Dialog.Content` with role="alertdialog" to interrupt the user. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_open_auto_focus:(Dom.event -> unit) ->
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** An optional accessible description to be announced when the dialog is open. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.P.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** A layer that covers the inert portion of the view when the dialog is open. *)
  module Overlay = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Overlay"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** Portals its children into the `body` when the dialog is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** A dialog is a window overlaid on either the primary window or another dialog window. *)
  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.AlertDialog_Root_Translations.t Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** An accessible title to be announced when the dialog is open. *)
  module Title = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.H2.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Title"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** The button that opens the dialog. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end
end

module Badge = struct
  module Root = struct
    module Props = struct
      external check :
        ?text_value:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/badge"]
  end
end

module Breadcrumbs = struct
  (** The breadcrumbs link. *)
  module Link = struct
    module Props = struct
      external check :
        ?current:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.A.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Link"
    [@@mel.module "@kobalte/core/breadcrumbs"]
  end

  (** Breadcrumbs show hierarchy and navigational context for a user’s location within an application. *)
  module Root = struct
    module Props = struct
      external check :
        ?separator:Solidtype.Jsx.element Solidtype.Check.value ->
        ?translations:Types.Breadcrumbs_Root_Translations.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Nav.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/breadcrumbs"]
  end

  (** The visual separator between each breadcrumb items.
      It will not be visible by screen readers. *)
  module Separator = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Separator"
    [@@mel.module "@kobalte/core/breadcrumbs"]
  end

  external use_breadcrumbs_context : unit -> Types.BreadcrumbsContextValue.t = "useBreadcrumbsContext"
  [@@mel.module "@kobalte/core/breadcrumbs"]
end

module Button = struct
  (** Button enables users to trigger an action or event, such as submitting a form,
      opening a dialog, canceling an action, or performing a delete operation.
      This component is based on the \[WAI-ARIA Button Pattern\](https://www.w3.org/WAI/ARIA/apg/patterns/button/) *)
  module Root = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/button"]
  end
end

module Checkbox = struct
  (** The element that visually represents a checkbox. *)
  module Control = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Control"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The description that gives the user more information on the checkbox. *)
  module Description = struct
    module Props = struct
      external check :
        ?id:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The error message that gives the user information about how to fix a validation error on the checkbox. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The visual indicator rendered when the checkbox is in a checked or indeterminate state.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module Indicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Indicator"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The native html input that is visually hidden in the checkbox. *)
  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The label that gives the user information on the checkbox. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** A control that allows the user to toggle between checked and not checked. *)
  module Root = struct
    module Props = struct
      external check :
        ?checked:bool Solidtype.Check.value ->
        ?default_checked:bool Solidtype.Check.value ->
        ?on_change:(bool -> unit) ->
        ?indeterminate:bool Solidtype.Check.value ->
        ?value:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:(Types.CheckboxRootState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  external use_checkbox_context : unit -> Types.CheckboxContextValue.t = "useCheckboxContext"
  [@@mel.module "@kobalte/core/checkbox"]
end

module Collapsible = struct
  (** Contains the content to be rendered when the collapsible is expanded. *)
  module Content = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/collapsible"]
  end

  (** An interactive component which expands/collapses a content. *)
  module Root = struct
    module Props = struct
      external check :
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/collapsible"]
  end

  (** The button that expands/collapses the collapsible content. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/collapsible"]
  end

  external use_collapsible_context : unit -> Types.CollapsibleContextValue.t = "useCollapsibleContext"
  [@@mel.module "@kobalte/core/collapsible"]
end

module ColorArea = struct
  module Background = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Background"
    [@@mel.module "@kobalte/core/color-area"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-area"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-area"]
  end

  module HiddenInputX = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenInputX"
    [@@mel.module "@kobalte/core/color-area"]
  end

  module HiddenInputY = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenInputY"
    [@@mel.module "@kobalte/core/color-area"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-area"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.ColorArea_Root_Translations.t Solidtype.Check.value ->
        ?value:Types.Color.t Solidtype.Check.value ->
        ?default_value:Types.Color.t Solidtype.Check.value ->
        ?on_change:(Types.Color.t -> unit) ->
        ?on_change_end:(Types.Color.t -> unit) ->
        ?x_channel:[ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Solidtype.Check.value ->
        ?y_channel:[ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Solidtype.Check.value ->
        ?color_space:[ `rgb | `hsl | `hsb ] Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?x_name:string Solidtype.Check.value ->
        ?y_name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-area"]
  end

  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Thumb"
    [@@mel.module "@kobalte/core/color-area"]
  end

  external use_color_area_context : unit -> Types.ColorAreaContextValue.t = "useColorAreaContext"
  [@@mel.module "@kobalte/core/color-area"]
end

module ColorChannelField = struct
  module DecrementTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "DecrementTrigger"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  module IncrementTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "IncrementTrigger"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:Types.Color.t Solidtype.Check.value ->
        ?default_value:Types.Color.t Solidtype.Check.value ->
        ?on_change:(Types.Color.t -> unit) ->
        channel:[ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Solidtype.Check.value ->
        ?color_space:[ `rgb | `hsl | `hsb ] Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?translations:Types.ColorChannelField_Root_Translations.t Solidtype.Check.value ->
        ?min_value:float Solidtype.Check.value ->
        ?max_value:float Solidtype.Check.value ->
        ?step:float Solidtype.Check.value ->
        ?large_step:float Solidtype.Check.value ->
        ?change_on_wheel:bool Solidtype.Check.value ->
        ?format:bool Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end
end

module ColorField = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/color-field"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-field"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:string Solidtype.Check.value ->
        ?default_value:string Solidtype.Check.value ->
        ?on_change:(string -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-field"]
  end

  external use_color_field_context : unit -> Types.ColorFieldContextValue.t = "useColorFieldContext"
  [@@mel.module "@kobalte/core/color-field"]
end

module ColorMode = struct
  external color_mode_storage_key : string = "COLOR_MODE_STORAGE_KEY"
  [@@mel.module "@kobalte/core/color-mode"]

  external color_mode_context : Types.ColorModeContextType.t option Types.Context.t = "ColorModeContext"
  [@@mel.module "@kobalte/core/color-mode"]

  (** Provides context for the color mode based on config in `theme`
      Returns the color mode and function to toggle the color mode *)
  module ColorModeProvider = struct
    module Props = struct
      external check :
        ?initial_color_mode:[ `light | `dark | `system ] Solidtype.Check.value ->
        ?disable_transition_on_change:bool Solidtype.Check.value ->
        ?storage_manager:Types.ColorModeStorageManager.t Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ColorModeProvider"
    [@@mel.module "@kobalte/core/color-mode"]
  end

  module ColorModeScript = struct
    module Props = struct
      external check :
        ?initial_color_mode:[ `light | `dark | `system ] Solidtype.Check.value ->
        ?storage_type:[ `localStorage | `cookie ] Solidtype.Check.value ->
        ?storage_key:string Solidtype.Check.value ->
        ?nonce:string Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ColorModeScript"
    [@@mel.module "@kobalte/core/color-mode"]
  end

  external cookie_storage_manager : Types.ColorModeStorageManager.t = "cookieStorageManager"
  [@@mel.module "@kobalte/core/color-mode"]

  external cookie_storage_manager_ssr : string -> Types.ColorModeStorageManager.t = "cookieStorageManagerSSR"
  [@@mel.module "@kobalte/core/color-mode"]

  external create_cookie_storage_manager : string -> string option -> Types.ColorModeStorageManager.t = "createCookieStorageManager"
  [@@mel.module "@kobalte/core/color-mode"]

  external create_local_storage_manager : string -> Types.ColorModeStorageManager.t = "createLocalStorageManager"
  [@@mel.module "@kobalte/core/color-mode"]

  external local_storage_manager : Types.ColorModeStorageManager.t = "localStorageManager"
  [@@mel.module "@kobalte/core/color-mode"]

  (** Primitive that reads from `ColorModeProvider` context,
      Returns the color mode and function to toggle it. *)
  external use_color_mode : unit -> Types.ColorModeContextType.t = "useColorMode"
  [@@mel.module "@kobalte/core/color-mode"]

  (** Change value based on color mode. *)
  external use_color_mode_value : 't_light -> 't_dark -> ('t_light, 't_dark) Types.Either.t Solidtype.Solid.accessor = "useColorModeValue"
  [@@mel.module "@kobalte/core/color-mode"]
end

module ColorSlider = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  (** The native html input that is visually hidden in the slider thumb. *)
  module Input = struct
    module Props = struct
      external check :
        ?style:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:Types.Color.t Solidtype.Check.value ->
        ?default_value:Types.Color.t Solidtype.Check.value ->
        ?on_change:(Types.Color.t -> unit) ->
        ?on_change_end:(Types.Color.t -> unit) ->
        channel:[ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Solidtype.Check.value ->
        ?color_space:[ `rgb | `hsl | `hsb ] Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?get_value_label:(Types.Color.t -> string) ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?translations:Types.ColorSlider_Root_Translations.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Thumb"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Track"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  (** The accessible label text representing the current value in a human-readable format. *)
  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ValueLabel"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  external use_color_slider_context : unit -> Types.ColorSliderContextValue.t = "useColorSliderContext"
  [@@mel.module "@kobalte/core/color-slider"]
end

module ColorSwatch = struct
  module Root = struct
    module Props = struct
      external check :
        value:Types.Color.t Solidtype.Check.value ->
        ?color_name:string Solidtype.Check.value ->
        ?translations:Types.ColorSwatch_Root_Translations.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-swatch"]
  end
end

module ColorWheel = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module Input = struct
    module Props = struct
      external check :
        ?style:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.ColorSlider_Root_Translations.t Solidtype.Check.value ->
        ?value:Types.Color.t Solidtype.Check.value ->
        ?default_value:Types.Color.t Solidtype.Check.value ->
        ?thickness:float Solidtype.Check.value ->
        ?on_change:(Types.Color.t -> unit) ->
        ?on_change_end:(Types.Color.t -> unit) ->
        ?get_value_label:(Types.Color.t -> string) ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Thumb"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Track"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ValueLabel"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  external use_color_wheel_context : unit -> Types.ColorWheelContextValue.t = "useColorWheelContext"
  [@@mel.module "@kobalte/core/color-wheel"]
end

module Colors = struct
  external color_intl_translations : Types.ColorSlider_Root_Translations.t = "COLOR_INTL_TRANSLATIONS"
  [@@mel.module "@kobalte/core/colors"]

  (** Returns a list of color channels for a given color space. *)
  external get_color_channels : [ `rgb | `hsl | `hsb ] -> ([ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] * [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] * [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ]) = "getColorChannels"
  [@@mel.module "@kobalte/core/colors"]

  external normalize_color : (string, Types.Color.t) Types.Either.t -> Types.Color.t = "normalizeColor"
  [@@mel.module "@kobalte/core/colors"]

  (** Returns the hue value normalized to the range of 0 to 360. *)
  external normalize_hue : float -> float = "normalizeHue"
  [@@mel.module "@kobalte/core/colors"]

  external parse_color_js : string -> Types.Color.t = "parseColor"
  [@@mel.module "@kobalte/core/colors"]
  (** Parses a color from a string value. Throws an error if the string could not be parsed.
      
      @raise Invalid_argument with Kobalte's message, where it throws. *)
  let parse_color x0 =
    match parse_color_js x0 with
    | v -> v
    | exception Js.Exn.Error e -> invalid_arg ("parse_color: " ^ Option.value (Js.Exn.message e) ~default:"")
  let parse_color_opt x0 = match parse_color_js x0 with v -> Some v | exception Js.Exn.Error _ -> None
end

module Combobox = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The component that pops out when the combobox is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** Contains the combobox input and trigger. *)
  module Control = struct
    module Props = struct
      external check :
        (?children:('option Types.ComboboxControlState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Control"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module HiddenSelect = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Select.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenSelect"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** A small icon often displayed next to the value as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** An item of the listbox. *)
  module Item = struct
    module Props = struct
      external check :
        item:_ Types.CollectionNode.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** An optional accessible description to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The visual indicator rendered when the item is selected.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** An accessible label to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** Contains all the items of a `Combobox`. *)
  module Listbox = struct
    module Props = struct
      external check :
        ?scroll_ref:Dom.htmlElement option Solidtype.Solid.accessor Solidtype.Check.value ->
        ?scroll_to_item:(string -> unit) ->
        (?children:(('option, 'opt_group) Types.Either.t Types.CollectionNode.t Types.Collection.t Solidtype.Solid.accessor -> Solidtype.Jsx.element, [ `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Listbox"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** Portals its children into the `body` when the combobox is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:'option Js.Nullable.t Solidtype.Check.value ->
        ?default_value:'option Solidtype.Check.value ->
        ?on_change:('option Js.Nullable.t -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?translations:Types.Combobox_Root_Translations.t Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?no_reset_input_on_blur:bool Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> [ `focus | `input | `manual ] option -> unit) ->
        ?on_input_change:(string -> unit) ->
        ?trigger_mode:[ `focus | `input | `manual ] Solidtype.Check.value ->
        ?placeholder:Solidtype.Jsx.element Solidtype.Check.value ->
        options:('option, 'opt_group) Types.Either.t array Solidtype.Check.value ->
        ?option_value:('option -> (string, float) Types.Either.t) ->
        ?option_text_value:('option -> string) ->
        ?option_label:('option -> string) ->
        ?option_disabled:('option -> bool) ->
        ?option_group_children:string Solidtype.Check.value ->
        ?keyboard_delegate:Types.KeyboardDelegate.t Solidtype.Check.value ->
        ?default_filter:(([ `contains | `startsWith | `endsWith ], 'option -> string -> bool) Types.Either.t) Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        ?allows_empty_collection:bool Solidtype.Check.value ->
        ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
        ?allow_duplicate_selection_events:bool Solidtype.Check.value ->
        ?disallow_empty_selection:bool Solidtype.Check.value ->
        ?close_on_selection:bool Solidtype.Check.value ->
        ?remove_on_backspace:bool Solidtype.Check.value ->
        ?virtualized:bool Solidtype.Check.value ->
        ?item_component:('option Types.ComboboxBaseItemComponentProps.t -> Solidtype.Jsx.element) ->
        ?section_component:('opt_group Types.ComboboxBaseSectionComponentProps.t -> Solidtype.Jsx.element) ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module Root_multiple = struct
    module Props = struct
      external check :
        ?value:'option array Solidtype.Check.value ->
        ?default_value:'option array Solidtype.Check.value ->
        ?on_change:('option array -> unit) ->
        multiple:bool Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?translations:Types.Combobox_Root_Translations.t Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?no_reset_input_on_blur:bool Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> [ `focus | `input | `manual ] option -> unit) ->
        ?on_input_change:(string -> unit) ->
        ?trigger_mode:[ `focus | `input | `manual ] Solidtype.Check.value ->
        ?placeholder:Solidtype.Jsx.element Solidtype.Check.value ->
        options:('option, 'opt_group) Types.Either.t array Solidtype.Check.value ->
        ?option_value:('option -> (string, float) Types.Either.t) ->
        ?option_text_value:('option -> string) ->
        ?option_label:('option -> string) ->
        ?option_disabled:('option -> bool) ->
        ?option_group_children:string Solidtype.Check.value ->
        ?keyboard_delegate:Types.KeyboardDelegate.t Solidtype.Check.value ->
        ?default_filter:(([ `contains | `startsWith | `endsWith ], 'option -> string -> bool) Types.Either.t) Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        ?allows_empty_collection:bool Solidtype.Check.value ->
        ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
        ?allow_duplicate_selection_events:bool Solidtype.Check.value ->
        ?disallow_empty_selection:bool Solidtype.Check.value ->
        ?close_on_selection:bool Solidtype.Check.value ->
        ?remove_on_backspace:bool Solidtype.Check.value ->
        ?virtualized:bool Solidtype.Check.value ->
        ?item_component:('option Types.ComboboxBaseItemComponentProps.t -> Solidtype.Jsx.element) ->
        ?section_component:('opt_group Types.ComboboxBaseSectionComponentProps.t -> Solidtype.Jsx.element) ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** A component used to render the label of a listbox option group.
      It won't be focusable using arrow keys. *)
  module Section = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Section"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/combobox"]
  end

  external use_combobox_context : unit -> Types.ComboboxContextValue.t = "useComboboxContext"
  [@@mel.module "@kobalte/core/combobox"]
end

module ContextMenu = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An item that can be controlled and rendered like a checkbox. *)
  module CheckboxItem = struct
    module Props = struct
      external check :
        ?checked:bool Solidtype.Check.value ->
        ?default_checked:bool Solidtype.Check.value ->
        ?on_change:(bool -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?indeterminate:bool Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CheckboxItem"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  module Content = struct
    module Props = struct
      external check :
        ?on_open_auto_focus:(Dom.event -> unit) ->
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A container used to group multiple `Menu.Item`s. *)
  module Group = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Group"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A component used to render the label of a `Menu.Group`.
      It won't be focusable using arrow keys. *)
  module GroupLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "GroupLabel"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A small icon often displayed inside the menu trigger as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon by providing a `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An item of the menu. *)
  module Item = struct
    module Props = struct
      external check :
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An optional accessible description to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** The visual indicator rendered when the parent menu `CheckboxItem` or `RadioItem` is checked.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An accessible label to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** Portals its children into the `body` when the menu is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A container used to group multiple `Menu.RadioItem`s and manage the selection. *)
  module RadioGroup = struct
    module Props = struct
      external check :
        ?value:'t_value Solidtype.Check.value ->
        ?default_value:'t_value Solidtype.Check.value ->
        ?on_change:('t_value -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioGroup"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An item that can be controlled and rendered like a radio. *)
  module RadioItem = struct
    module Props = struct
      external check :
        value:'t_value Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioItem"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** Displays a menu located at the pointer, triggered by a right-click or a long-press. *)
  module Root = struct
    module Props = struct
      external check :
        ?id:string Solidtype.Check.value ->
        ?value:string Solidtype.Check.value ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A separator visually or semantically separates content. *)
  module Separator = struct
    module Props = struct
      external check :
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Separator"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** Contains all the parts of a submenu. *)
  module Sub = struct
    module Props = struct
      external check :
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Sub"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** The component that pops out when a submenu is open. *)
  module SubContent = struct
    module Props = struct
      external check :
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubContent"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An item that opens a submenu. *)
  module SubTrigger = struct
    module Props = struct
      external check :
        ?text_value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubTrigger"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  module Trigger = struct
    module Props = struct
      external check :
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  external use_context_menu_context : unit -> Types.ContextMenuContextValue.t = "useContextMenuContext"
  [@@mel.module "@kobalte/core/context-menu"]
end

module Dialog = struct
  (** The button that closes the dialog. *)
  module CloseButton = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CloseButton"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** Contains the content to be rendered when the dialog is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_open_auto_focus:(Dom.event -> unit) ->
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** An optional accessible description to be announced when the dialog is open. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.P.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** A layer that covers the inert portion of the view when the dialog is open. *)
  module Overlay = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Overlay"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** Portals its children into the `body` when the dialog is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** A dialog is a window overlaid on either the primary window or another dialog window. *)
  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.AlertDialog_Root_Translations.t Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** An accessible title to be announced when the dialog is open. *)
  module Title = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.H2.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Title"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** The button that opens the dialog. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/dialog"]
  end

  external use_dialog_context : unit -> Types.DialogContextValue.t = "useDialogContext"
  [@@mel.module "@kobalte/core/dialog"]
end

module DropdownMenu = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An item that can be controlled and rendered like a checkbox. *)
  module CheckboxItem = struct
    module Props = struct
      external check :
        ?checked:bool Solidtype.Check.value ->
        ?default_checked:bool Solidtype.Check.value ->
        ?on_change:(bool -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?indeterminate:bool Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CheckboxItem"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** Contains the content to be rendered when the dropdown menu is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_open_auto_focus:(Dom.event -> unit) ->
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A container used to group multiple `Menu.Item`s. *)
  module Group = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Group"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A component used to render the label of a `Menu.Group`.
      It won't be focusable using arrow keys. *)
  module GroupLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "GroupLabel"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A small icon often displayed inside the menu trigger as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon by providing a `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An item of the menu. *)
  module Item = struct
    module Props = struct
      external check :
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An optional accessible description to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** The visual indicator rendered when the parent menu `CheckboxItem` or `RadioItem` is checked.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An accessible label to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** Portals its children into the `body` when the menu is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A container used to group multiple `Menu.RadioItem`s and manage the selection. *)
  module RadioGroup = struct
    module Props = struct
      external check :
        ?value:'t_value Solidtype.Check.value ->
        ?default_value:'t_value Solidtype.Check.value ->
        ?on_change:('t_value -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioGroup"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An item that can be controlled and rendered like a radio. *)
  module RadioItem = struct
    module Props = struct
      external check :
        value:'t_value Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioItem"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** Displays a menu to the user —such as a set of actions or functions— triggered by a button. *)
  module Root = struct
    module Props = struct
      external check :
        ?id:string Solidtype.Check.value ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?value:string Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A separator visually or semantically separates content. *)
  module Separator = struct
    module Props = struct
      external check :
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Separator"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** Contains all the parts of a submenu. *)
  module Sub = struct
    module Props = struct
      external check :
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Sub"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** The component that pops out when a submenu is open. *)
  module SubContent = struct
    module Props = struct
      external check :
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubContent"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An item that opens a submenu. *)
  module SubTrigger = struct
    module Props = struct
      external check :
        ?text_value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubTrigger"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** The button that toggles the menu. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end
end

module FileField = struct
  external context : Types.FileFieldContextValue.t option Types.Context.t = "Context"
  [@@mel.module "@kobalte/core/file-field"]

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Dropzone = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Dropzone"
    [@@mel.module "@kobalte/core/file-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Item = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemDeleteTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDeleteTrigger"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemList = struct
    module Props = struct
      external check :
        (children:(Types.File.t -> Solidtype.Jsx.element, [ `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemList"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemName = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemName"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemPreview = struct
    module Props = struct
      external check :
        type_:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemPreview"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemPreviewImage = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Img.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemPreviewImage"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemSize = struct
    module Props = struct
      external check :
        ?precision:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemSize"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.FileField_Root_Translations.t Solidtype.Check.value ->
        ?multiple:bool Solidtype.Check.value ->
        ?accept:(string, string array) Types.Either.t Solidtype.Check.value ->
        ?max_files:float Solidtype.Check.value ->
        ?allow_drag_and_drop:bool Solidtype.Check.value ->
        ?max_file_size:float Solidtype.Check.value ->
        ?min_file_size:float Solidtype.Check.value ->
        ?on_file_accept:(Types.File.t array -> unit) ->
        ?on_file_reject:(Types.FileRejection.t array -> unit) ->
        ?on_file_change:(Types.Details.t -> unit) ->
        ?validate:(Types.File.t -> [ `TOO_MANY_FILES | `FILE_INVALID_TYPE | `FILE_TOO_LARGE | `FILE_TOO_SMALL ] array Js.Nullable.t) ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/file-field"]
  end

  external use_file_field_context : unit -> Types.FileFieldContextValue.t = "useFileFieldContext"
  [@@mel.module "@kobalte/core/file-field"]
end

module HoverCard = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/hover-card"]
  end

  (** Contains the content to be rendered when the hovercard is open. *)
  module Content = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/hover-card"]
  end

  (** Portals its children into the `body` when the hovercard is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/hover-card"]
  end

  (** A popover that allows sighted users to preview content available behind a link. *)
  module Root = struct
    module Props = struct
      external check :
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?open_delay:float Solidtype.Check.value ->
        ?close_delay:float Solidtype.Check.value ->
        ?ignore_safe_area:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/hover-card"]
  end

  (** The link that opens the hovercard when hovered. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.A.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/hover-card"]
  end

  external use_hover_card_context : unit -> Types.HoverCardContextValue.t = "useHoverCardContext"
  [@@mel.module "@kobalte/core/hover-card"]
end

module I18n = struct
  (** Provides the locale for the application to all child components. *)
  module I18nProvider = struct
    module Props = struct
      external check :
        ?locale:string Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "I18nProvider"
    [@@mel.module "@kobalte/core/i18n"]
  end

  external rtl_langs : string Js.Set.t = "RTL_LANGS"
  [@@mel.module "@kobalte/core/i18n"]

  (** Provides localized string collation for the current locale. Automatically updates when the locale changes,
      and handles caching of the collator for performance. *)
  external create_collator : Types.CollatorOptions.t option -> Types.Collator.t Solidtype.Solid.accessor = "createCollator"
  [@@mel.module "@kobalte/core/i18n"]

  (** Provides localized date formatting for the current locale. Automatically updates when the locale changes,
      and handles caching of the date formatter for performance. *)
  external create_date_formatter : (Types.DateTimeFormatOptions.t, Types.DateTimeFormatOptions.t Solidtype.Solid.accessor) Types.Either.t -> Types.DateTimeFormat.t Solidtype.Solid.accessor = "createDateFormatter"
  [@@mel.module "@kobalte/core/i18n"]

  (** Returns an accessor for the current browser/system language, and updates when it changes. *)
  external create_default_locale : unit -> Types.I18n_CreateDefaultLocale.t = "createDefaultLocale"
  [@@mel.module "@kobalte/core/i18n"]

  (** Provides localized string search functionality that is useful for filtering or matching items
      in a list. Options can be provided to adjust the sensitivity to case, diacritics, and other parameters. *)
  external create_filter : Types.CollatorOptions.t option -> Types.Filter.t = "createFilter"
  [@@mel.module "@kobalte/core/i18n"]

  (** Provides localized number formatting for the current locale. Automatically updates when the locale changes,
      and handles caching of the number formatter for performance. *)
  external create_number_formatter : (Types.NumberFormatOptions.t, Types.NumberFormatOptions.t Solidtype.Solid.accessor) Types.Either.t -> Types.NumberFormat.t Solidtype.Solid.accessor = "createNumberFormatter"
  [@@mel.module "@kobalte/core/i18n"]

  (** Gets the locale setting of the browser. *)
  external get_default_locale : unit -> Types.Locale.t = "getDefaultLocale"
  [@@mel.module "@kobalte/core/i18n"]

  external get_reading_direction : string -> [ `rtl | `ltr ] = "getReadingDirection"
  [@@mel.module "@kobalte/core/i18n"]

  (** Determines if a locale is read right to left using \[Intl.Locale\]
      \{\@link https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale\}. *)
  external is_rtl : string -> bool = "isRTL"
  [@@mel.module "@kobalte/core/i18n"]

  (** Returns an accessor for the current locale and layout direction. *)
  external use_locale : unit -> Types.I18n_UseLocale.t = "useLocale"
  [@@mel.module "@kobalte/core/i18n"]
end

module Image = struct
  (** An element that renders when the image hasn't loaded.
      This means whilst it's loading, or if there was an error. *)
  module Fallback = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Fallback"
    [@@mel.module "@kobalte/core/image"]
  end

  (** The image to render. By default, it will only render when it has loaded. *)
  module Img = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Img.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Img"
    [@@mel.module "@kobalte/core/image"]
  end

  (** An image element with an optional fallback for loading and error status. *)
  module Root = struct
    module Props = struct
      external check :
        ?fallback_delay:float Solidtype.Check.value ->
        ?on_loading_status_change:([ `idle | `loading | `loaded | `error ] -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/image"]
  end

  external use_image_context : unit -> Types.ImageContextValue.t = "useImageContext"
  [@@mel.module "@kobalte/core/image"]
end

module Link = struct
  (** Link allows a user to navigate to another page or resource within a web page or application. *)
  module Root = struct
    module Props = struct
      external check :
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.A.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/link"]
  end
end

module Listbox = struct
  (** An item of the listbox. *)
  module Item = struct
    module Props = struct
      external check :
        item:_ Types.CollectionNode.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** An optional accessible description to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** The visual indicator rendered when the item is selected.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** An accessible label to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** Listbox presents a list of options and allows a user to select one or more of them. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string array Solidtype.Check.value ->
        ?default_value:string array Solidtype.Check.value ->
        ?on_change:(string Js.Set.t -> unit) ->
        ?options:('option, 'opt_group) Types.Either.t array Solidtype.Check.value ->
        ?option_value:('option -> string) ->
        ?option_text_value:('option -> string) ->
        ?option_disabled:('option -> bool) ->
        ?option_group_children:('opt_group -> 'option array) ->
        ?state:Types.ListState.t Solidtype.Check.value ->
        ?keyboard_delegate:Types.KeyboardDelegate.t Solidtype.Check.value ->
        ?auto_focus:([ `first | `last ], bool) Types.Either.t Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        ?should_use_virtual_focus:bool Solidtype.Check.value ->
        ?should_select_on_press_up:bool Solidtype.Check.value ->
        ?should_focus_on_hover:bool Solidtype.Check.value ->
        ?scroll_ref:Dom.htmlElement option Solidtype.Solid.accessor Solidtype.Check.value ->
        ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
        ?allow_duplicate_selection_events:bool Solidtype.Check.value ->
        ?selection_mode:[ `none | `single | `multiple ] Solidtype.Check.value ->
        ?disallow_empty_selection:bool Solidtype.Check.value ->
        ?select_on_focus:bool Solidtype.Check.value ->
        ?disallow_type_ahead:bool Solidtype.Check.value ->
        ?allows_tab_navigation:bool Solidtype.Check.value ->
        ?virtualized:bool Solidtype.Check.value ->
        ?render_item:('option Types.CollectionNode.t -> Solidtype.Jsx.element) ->
        ?render_section:('opt_group Types.CollectionNode.t -> Solidtype.Jsx.element) ->
        ?scroll_to_item:(string -> unit) ->
        (?children:(('option, 'opt_group) Types.Either.t Types.CollectionNode.t Types.Collection.t Solidtype.Solid.accessor -> Solidtype.Jsx.element, [ `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** A component used to render the label of a listbox option group.
      It won't be focusable using arrow keys. *)
  module Section = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Section"
    [@@mel.module "@kobalte/core/listbox"]
  end

  external use_listbox_context : unit -> Types.ListboxContextValue.t = "useListboxContext"
  [@@mel.module "@kobalte/core/listbox"]
end

module Menubar = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An item that can be controlled and rendered like a checkbox. *)
  module CheckboxItem = struct
    module Props = struct
      external check :
        ?checked:bool Solidtype.Check.value ->
        ?default_checked:bool Solidtype.Check.value ->
        ?on_change:(bool -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?indeterminate:bool Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CheckboxItem"
    [@@mel.module "@kobalte/core/menubar"]
  end

  module Content = struct
    module Props = struct
      external check :
        ?on_open_auto_focus:(Dom.event -> unit) ->
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A container used to group multiple `Menu.Item`s. *)
  module Group = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Group"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A component used to render the label of a `Menu.Group`.
      It won't be focusable using arrow keys. *)
  module GroupLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "GroupLabel"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A small icon often displayed inside the menu trigger as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon by providing a `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An item of the menu. *)
  module Item = struct
    module Props = struct
      external check :
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An optional accessible description to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** The visual indicator rendered when the parent menu `CheckboxItem` or `RadioItem` is checked.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An accessible label to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** Displays a menu to the user —such as a set of actions or functions— triggered by a button. *)
  module Menu = struct
    module Props = struct
      external check :
        ?id:string Solidtype.Check.value ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?value:string Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Menu"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** Portals its children into the `body` when the menu is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A container used to group multiple `Menu.RadioItem`s and manage the selection. *)
  module RadioGroup = struct
    module Props = struct
      external check :
        ?value:'t_value Solidtype.Check.value ->
        ?default_value:'t_value Solidtype.Check.value ->
        ?on_change:('t_value -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioGroup"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An item that can be controlled and rendered like a radio. *)
  module RadioItem = struct
    module Props = struct
      external check :
        value:'t_value Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioItem"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A visually persistent menu common in desktop applications that provides quick access to a consistent set of commands. *)
  module Root = struct
    module Props = struct
      external check :
        ?default_value:string Solidtype.Check.value ->
        ?value:string Js.Nullable.t Solidtype.Check.value ->
        ?on_value_change:(string Js.Nullable.t -> unit) ->
        ?loop:bool Solidtype.Check.value ->
        ?focus_on_alt:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?auto_focus_menu:bool Solidtype.Check.value ->
        ?on_auto_focus_menu_change:bool Solidtype.Solid.setter Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A separator visually or semantically separates content. *)
  module Separator = struct
    module Props = struct
      external check :
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Separator"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** Contains all the parts of a submenu. *)
  module Sub = struct
    module Props = struct
      external check :
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Sub"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** The component that pops out when a submenu is open. *)
  module SubContent = struct
    module Props = struct
      external check :
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubContent"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An item that opens a submenu. *)
  module SubTrigger = struct
    module Props = struct
      external check :
        ?text_value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubTrigger"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** The button that toggles the menubar menu or a menubar link. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/menubar"]
  end

  external use_menubar_context : unit -> Types.MenubarContextValue.t = "useMenubarContext"
  [@@mel.module "@kobalte/core/menubar"]
end

module Meter = struct
  (** The component that visually represents the meter value.
      Used to visually show the fill of `Meter.Track`. *)
  module Fill = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Fill"
    [@@mel.module "@kobalte/core/meter"]
  end

  (** An accessible label that gives the user information on the meter. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/meter"]
  end

  (** Meter displays numeric value that varies within a defined range. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:float Solidtype.Check.value ->
        ?min_value:float Solidtype.Check.value ->
        ?max_value:float Solidtype.Check.value ->
        ?get_value_label:(Types.GetValueLabelParams.t -> string) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/meter"]
  end

  (** The component that visually represents the meter track.
      Act as a container for `Meter.Fill`. *)
  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Track"
    [@@mel.module "@kobalte/core/meter"]
  end

  (** The accessible label text representing the current value in a human-readable format. *)
  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ValueLabel"
    [@@mel.module "@kobalte/core/meter"]
  end

  external use_meter_context : unit -> Types.MeterContextValue.t = "useMeterContext"
  [@@mel.module "@kobalte/core/meter"]
end

module NavigationMenu = struct
  (** An optional arrow element to render alongside the viewport content.
      Must be rendered in the viewport. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An item that can be controlled and rendered like a checkbox. *)
  module CheckboxItem = struct
    module Props = struct
      external check :
        ?checked:bool Solidtype.Check.value ->
        ?default_checked:bool Solidtype.Check.value ->
        ?on_change:(bool -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?indeterminate:bool Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CheckboxItem"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  module Content = struct
    module Props = struct
      external check :
        ?on_open_auto_focus:(Dom.event -> unit) ->
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A container used to group multiple `Menu.Item`s. *)
  module Group = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Group"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A component used to render the label of a `Menu.Group`.
      It won't be focusable using arrow keys. *)
  module GroupLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "GroupLabel"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A small icon often displayed inside the menu trigger as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon by providing a `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An item of the navigation menu. *)
  module Item = struct
    module Props = struct
      external check :
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.A.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An optional accessible description to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** The visual indicator rendered when the parent menu `CheckboxItem` or `RadioItem` is checked.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An accessible label to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** Displays a menu to the user —such as a set of actions or functions— triggered by a button. *)
  module Menu = struct
    module Props = struct
      external check :
        ?id:string Solidtype.Check.value ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?value:string Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Menu"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** Portals its children into the NavigationMenu.Viewport when the menu is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A container used to group multiple `Menu.RadioItem`s and manage the selection. *)
  module RadioGroup = struct
    module Props = struct
      external check :
        ?value:'t_value Solidtype.Check.value ->
        ?default_value:'t_value Solidtype.Check.value ->
        ?on_change:('t_value -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioGroup"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An item that can be controlled and rendered like a radio. *)
  module RadioItem = struct
    module Props = struct
      external check :
        value:'t_value Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioItem"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A visually persistent menu common in desktop applications that provides quick access to a consistent set of commands. *)
  module Root = struct
    module Props = struct
      external check :
        ?delay_duration:float Solidtype.Check.value ->
        ?skip_delay_duration:float Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?auto_focus_menu:bool Solidtype.Check.value ->
        ?on_auto_focus_menu_change:bool Solidtype.Solid.setter Solidtype.Check.value ->
        ?default_value:string Solidtype.Check.value ->
        ?value:string Js.Nullable.t Solidtype.Check.value ->
        ?on_value_change:(string Js.Nullable.t -> unit) ->
        ?loop:bool Solidtype.Check.value ->
        ?focus_on_alt:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A separator visually or semantically separates content. *)
  module Separator = struct
    module Props = struct
      external check :
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Separator"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** Contains all the parts of a submenu. *)
  module Sub = struct
    module Props = struct
      external check :
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Sub"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** The component that pops out when a submenu is open. *)
  module SubContent = struct
    module Props = struct
      external check :
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubContent"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An item that opens a submenu. *)
  module SubTrigger = struct
    module Props = struct
      external check :
        ?text_value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubTrigger"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** The button that toggles the menubar menu or a menubar link. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  module Viewport = struct
    module Props = struct
      external check :
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Viewport"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  external use_navigation_menu_context : unit -> Types.NavigationMenuContextValue.t = "useNavigationMenuContext"
  [@@mel.module "@kobalte/core/navigation-menu"]
end

module NumberField = struct
  module DecrementTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "DecrementTrigger"
    [@@mel.module "@kobalte/core/number-field"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/number-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/number-field"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/number-field"]
  end

  module IncrementTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "IncrementTrigger"
    [@@mel.module "@kobalte/core/number-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/number-field"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/number-field"]
  end

  (** A text input that allow users to input custom text entries with a keyboard. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:(string, float) Types.Either.t Solidtype.Check.value ->
        ?default_value:(string, float) Types.Either.t Solidtype.Check.value ->
        ?on_change:(string -> unit) ->
        ?raw_value:float Solidtype.Check.value ->
        ?on_raw_value_change:(float -> unit) ->
        ?min_value:float Solidtype.Check.value ->
        ?max_value:float Solidtype.Check.value ->
        ?step:float Solidtype.Check.value ->
        ?large_step:float Solidtype.Check.value ->
        ?change_on_wheel:bool Solidtype.Check.value ->
        ?format:bool Solidtype.Check.value ->
        ?format_options:Types.NumberFormatOptions2.t Solidtype.Check.value ->
        ?allowed_input:Js.Re.t Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?translations:Types.ColorChannelField_Root_Translations.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/number-field"]
  end

  external use_number_field_context : unit -> Types.NumberFieldContextValue.t = "useNumberFieldContext"
  [@@mel.module "@kobalte/core/number-field"]
end

module Pagination = struct
  module Ellipsis = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Ellipsis"
    [@@mel.module "@kobalte/core/pagination"]
  end

  module Item = struct
    module Props = struct
      external check :
        page:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/pagination"]
  end

  module Items = struct
    module Props = struct
      external check :
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Items"
    [@@mel.module "@kobalte/core/pagination"]
  end

  module Next = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Next"
    [@@mel.module "@kobalte/core/pagination"]
  end

  module Previous = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Previous"
    [@@mel.module "@kobalte/core/pagination"]
  end

  (** A list of page number that allows users to change the current page. *)
  module Root = struct
    module Props = struct
      external check :
        ?page:float Solidtype.Check.value ->
        ?default_page:float Solidtype.Check.value ->
        ?on_page_change:(float -> unit) ->
        count:float Solidtype.Check.value ->
        ?sibling_count:float Solidtype.Check.value ->
        ?show_first:bool Solidtype.Check.value ->
        ?show_last:bool Solidtype.Check.value ->
        ?fixed_items:(string, bool) Types.Either.t Solidtype.Check.value ->
        item_component:(Types.Pagination_Root_ItemComponent.t -> Solidtype.Jsx.element) ->
        ellipsis_component:(unit -> Solidtype.Jsx.element) ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Nav.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/pagination"]
  end

  external use_pagination_context : unit -> Types.PaginationContextValue.t = "usePaginationContext"
  [@@mel.module "@kobalte/core/pagination"]
end

module Popover = struct
  (** An optional element to position the `Popover.Content` against.
      If this part is not used, the content will position alongside the `Popover.Trigger`. *)
  module Anchor = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Anchor"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** The button that closes the popover. *)
  module CloseButton = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CloseButton"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** Contains the content to be rendered when the popover is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_open_auto_focus:(Dom.event -> unit) ->
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** An optional accessible description to be announced when the popover is open. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.P.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** Portals its children into the `body` when the popover is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** A popover is a dialog positioned relative to an anchor element. *)
  module Root = struct
    module Props = struct
      external check :
        ?anchor_ref:Dom.htmlElement option Solidtype.Solid.accessor Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?translations:Types.Popover_Root_Translations.t Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** An accessible title to be announced when the popover is open. *)
  module Title = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.H2.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Title"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** The button that opens the popover. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/popover"]
  end

  external use_popover_context : unit -> Types.PopoverContextValue.t = "usePopoverContext"
  [@@mel.module "@kobalte/core/popover"]
end

module Progress = struct
  (** The component that visually represents the progress value.
      Used to visually show the fill of `Progress.Track`. *)
  module Fill = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Fill"
    [@@mel.module "@kobalte/core/progress"]
  end

  (** An accessible label that gives the user information on the progress. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/progress"]
  end

  (** Progress show either determinate or indeterminate progress of an operation over time. *)
  module Root = struct
    module Props = struct
      external check :
        ?indeterminate:bool Solidtype.Check.value ->
        ?value:float Solidtype.Check.value ->
        ?min_value:float Solidtype.Check.value ->
        ?max_value:float Solidtype.Check.value ->
        ?get_value_label:(Types.GetValueLabelParams.t -> string) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/progress"]
  end

  (** The component that visually represents the progress track.
      Act as a container for `Progress.Fill`. *)
  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Track"
    [@@mel.module "@kobalte/core/progress"]
  end

  (** The accessible label text representing the current value in a human-readable format. *)
  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ValueLabel"
    [@@mel.module "@kobalte/core/progress"]
  end

  external use_progress_context : unit -> Types.ProgressContextValue.t = "useProgressContext"
  [@@mel.module "@kobalte/core/progress"]
end

module RadioGroup = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The root container for a radio button. *)
  module Item = struct
    module Props = struct
      external check :
        value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The element that visually represents a radio button. *)
  module ItemControl = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemControl"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The description that gives the user more information on the radio button. *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The visual indicator rendered when the radio item is in a checked state.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The native html input that is visually hidden in the radio button. *)
  module ItemInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemInput"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The label that gives the user information on the radio button. *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The label that gives the user information on the radio group. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** A set of checkable buttons, known as radio buttons, where no more than one of the buttons can be checked at a time.
      This component is based on the \[WAI-ARIA Radio Group Pattern\](https://www.w3.org/WAI/ARIA/apg/patterns/radiobutton/) *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string Solidtype.Check.value ->
        ?default_value:string Solidtype.Check.value ->
        ?on_change:(string -> unit) ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  external use_radio_group_context : unit -> Types.RadioGroupContextValue.t = "useRadioGroupContext"
  [@@mel.module "@kobalte/core/radio-group"]
end

module Rating = struct
  module Control = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Control"
    [@@mel.module "@kobalte/core/rating"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/rating"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/rating"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/rating"]
  end

  module Item = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/rating"]
  end

  module ItemControl = struct
    module Props = struct
      external check :
        (?children:(Types.RatingItemState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemControl"
    [@@mel.module "@kobalte/core/rating"]
  end

  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/rating"]
  end

  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/rating"]
  end

  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/rating"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:float Solidtype.Check.value ->
        ?default_value:float Solidtype.Check.value ->
        ?on_change:(float -> unit) ->
        ?allow_half:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/rating"]
  end
end

module Search = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/search"]
  end

  (** The component that pops out when the combobox is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/search"]
  end

  (** Contains the combobox input and trigger. *)
  module Control = struct
    module Props = struct
      external check :
        (?children:('option Types.ComboboxControlState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Control"
    [@@mel.module "@kobalte/core/search"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/search"]
  end

  module HiddenSelect = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Select.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenSelect"
    [@@mel.module "@kobalte/core/search"]
  end

  (** A small icon often displayed next to the value as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/search"]
  end

  module Indicator = struct
    module Props = struct
      external check :
        ?loading_component:Solidtype.Jsx.element Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Indicator"
    [@@mel.module "@kobalte/core/search"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/search"]
  end

  (** An item of the listbox. *)
  module Item = struct
    module Props = struct
      external check :
        item:_ Types.CollectionNode.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/search"]
  end

  (** An optional accessible description to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/search"]
  end

  (** An accessible label to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/search"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/search"]
  end

  (** Contains all the items of a `Combobox`. *)
  module Listbox = struct
    module Props = struct
      external check :
        ?scroll_ref:Dom.htmlElement option Solidtype.Solid.accessor Solidtype.Check.value ->
        ?scroll_to_item:(string -> unit) ->
        (?children:(('option, 'opt_group) Types.Either.t Types.CollectionNode.t Types.Collection.t Solidtype.Solid.accessor -> Solidtype.Jsx.element, [ `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Listbox"
    [@@mel.module "@kobalte/core/search"]
  end

  (** Displayed in portal when no options are presented *)
  module NoResult = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "NoResult"
    [@@mel.module "@kobalte/core/search"]
  end

  (** Portals its children into the `body` when the combobox is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/search"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:'option Js.Nullable.t Solidtype.Check.value ->
        ?default_value:'option Solidtype.Check.value ->
        ?on_change:('option Js.Nullable.t -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?translations:Types.Combobox_Root_Translations.t Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?no_reset_input_on_blur:bool Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> [ `focus | `input | `manual ] option -> unit) ->
        ?on_input_change:(string -> unit) ->
        ?trigger_mode:[ `focus | `input | `manual ] Solidtype.Check.value ->
        ?placeholder:Solidtype.Jsx.element Solidtype.Check.value ->
        options:('option, 'opt_group) Types.Either.t array Solidtype.Check.value ->
        ?option_value:('option -> (string, float) Types.Either.t) ->
        ?option_text_value:('option -> string) ->
        ?option_label:('option -> string) ->
        ?option_disabled:('option -> bool) ->
        ?option_group_children:string Solidtype.Check.value ->
        ?keyboard_delegate:Types.KeyboardDelegate.t Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        ?allows_empty_collection:bool Solidtype.Check.value ->
        ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
        ?allow_duplicate_selection_events:bool Solidtype.Check.value ->
        ?disallow_empty_selection:bool Solidtype.Check.value ->
        ?close_on_selection:bool Solidtype.Check.value ->
        ?remove_on_backspace:bool Solidtype.Check.value ->
        ?virtualized:bool Solidtype.Check.value ->
        ?item_component:('option Types.ComboboxBaseItemComponentProps.t -> Solidtype.Jsx.element) ->
        ?section_component:('opt_group Types.ComboboxBaseSectionComponentProps.t -> Solidtype.Jsx.element) ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?debounce_options_millisecond:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/search"]
  end

  module Root_multiple = struct
    module Props = struct
      external check :
        ?value:'option array Solidtype.Check.value ->
        ?default_value:'option array Solidtype.Check.value ->
        ?on_change:('option array -> unit) ->
        multiple:bool Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?translations:Types.Combobox_Root_Translations.t Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?no_reset_input_on_blur:bool Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> [ `focus | `input | `manual ] option -> unit) ->
        ?on_input_change:(string -> unit) ->
        ?trigger_mode:[ `focus | `input | `manual ] Solidtype.Check.value ->
        ?placeholder:Solidtype.Jsx.element Solidtype.Check.value ->
        options:('option, 'opt_group) Types.Either.t array Solidtype.Check.value ->
        ?option_value:('option -> (string, float) Types.Either.t) ->
        ?option_text_value:('option -> string) ->
        ?option_label:('option -> string) ->
        ?option_disabled:('option -> bool) ->
        ?option_group_children:string Solidtype.Check.value ->
        ?keyboard_delegate:Types.KeyboardDelegate.t Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        ?allows_empty_collection:bool Solidtype.Check.value ->
        ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
        ?allow_duplicate_selection_events:bool Solidtype.Check.value ->
        ?disallow_empty_selection:bool Solidtype.Check.value ->
        ?close_on_selection:bool Solidtype.Check.value ->
        ?remove_on_backspace:bool Solidtype.Check.value ->
        ?virtualized:bool Solidtype.Check.value ->
        ?item_component:('option Types.ComboboxBaseItemComponentProps.t -> Solidtype.Jsx.element) ->
        ?section_component:('opt_group Types.ComboboxBaseSectionComponentProps.t -> Solidtype.Jsx.element) ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?debounce_options_millisecond:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/search"]
  end

  (** A component used to render the label of a listbox option group.
      It won't be focusable using arrow keys. *)
  module Section = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Section"
    [@@mel.module "@kobalte/core/search"]
  end

  external use_search_context : unit -> Types.SearchContextValue.t = "useSearchContext"
  [@@mel.module "@kobalte/core/search"]
end

module SegmentedControl = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  module Indicator = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Indicator"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  module Item = struct
    module Props = struct
      external check :
        value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The element that visually represents a radio button. *)
  module ItemControl = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemControl"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The description that gives the user more information on the radio button. *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The visual indicator rendered when the radio item is in a checked state.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  module ItemInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemInput"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The label that gives the user information on the radio button. *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The label that gives the user information on the radio group. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:string Solidtype.Check.value ->
        ?default_value:string Solidtype.Check.value ->
        ?on_change:(string -> unit) ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?ref:((Dom.htmlElement, Dom.htmlElement -> unit) Types.Either.t) Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  external use_segmented_control_context : unit -> Types.SegmentedControlContextValue.t = "useSegmentedControlContext"
  [@@mel.module "@kobalte/core/segmented-control"]
end

module Select = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The component that pops out when the select is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/select"]
  end

  module HiddenSelect = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Select.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenSelect"
    [@@mel.module "@kobalte/core/select"]
  end

  (** A small icon often displayed next to the value as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/select"]
  end

  (** An item of the listbox. *)
  module Item = struct
    module Props = struct
      external check :
        item:_ Types.CollectionNode.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/select"]
  end

  (** An optional accessible description to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The visual indicator rendered when the item is selected.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/select"]
  end

  (** An accessible label to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The label that gives the user information on the select. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/select"]
  end

  (** Contains all the items of a `Select`. *)
  module Listbox = struct
    module Props = struct
      external check :
        ?scroll_ref:Dom.htmlElement option Solidtype.Solid.accessor Solidtype.Check.value ->
        ?scroll_to_item:(string -> unit) ->
        (?children:(('option, 'opt_group) Types.Either.t Types.CollectionNode.t Types.Collection.t Solidtype.Solid.accessor -> Solidtype.Jsx.element, [ `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Listbox"
    [@@mel.module "@kobalte/core/select"]
  end

  (** Portals its children into the `body` when the select is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/select"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:'option Js.Nullable.t Solidtype.Check.value ->
        ?default_value:'option Solidtype.Check.value ->
        ?on_change:('option Js.Nullable.t -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?placeholder:Solidtype.Jsx.element Solidtype.Check.value ->
        options:('option, 'opt_group) Types.Either.t array Solidtype.Check.value ->
        ?option_value:('option -> (string, float) Types.Either.t) ->
        ?option_text_value:('option -> string) ->
        ?option_disabled:('option -> bool) ->
        ?option_group_children:string Solidtype.Check.value ->
        ?keyboard_delegate:Types.KeyboardDelegate.t Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
        ?allow_duplicate_selection_events:bool Solidtype.Check.value ->
        ?disallow_empty_selection:bool Solidtype.Check.value ->
        ?close_on_selection:bool Solidtype.Check.value ->
        ?virtualized:bool Solidtype.Check.value ->
        ?item_component:('option Types.SelectBaseItemComponentProps.t -> Solidtype.Jsx.element) ->
        ?section_component:('opt_group Types.SelectBaseSectionComponentProps.t -> Solidtype.Jsx.element) ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?disallow_type_ahead:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/select"]
  end

  module Root_multiple = struct
    module Props = struct
      external check :
        ?value:'option array Solidtype.Check.value ->
        ?default_value:'option array Solidtype.Check.value ->
        ?on_change:('option array -> unit) ->
        multiple:bool Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?placeholder:Solidtype.Jsx.element Solidtype.Check.value ->
        options:('option, 'opt_group) Types.Either.t array Solidtype.Check.value ->
        ?option_value:('option -> (string, float) Types.Either.t) ->
        ?option_text_value:('option -> string) ->
        ?option_disabled:('option -> bool) ->
        ?option_group_children:string Solidtype.Check.value ->
        ?keyboard_delegate:Types.KeyboardDelegate.t Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
        ?allow_duplicate_selection_events:bool Solidtype.Check.value ->
        ?disallow_empty_selection:bool Solidtype.Check.value ->
        ?close_on_selection:bool Solidtype.Check.value ->
        ?virtualized:bool Solidtype.Check.value ->
        ?item_component:('option Types.SelectBaseItemComponentProps.t -> Solidtype.Jsx.element) ->
        ?section_component:('opt_group Types.SelectBaseSectionComponentProps.t -> Solidtype.Jsx.element) ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?disallow_type_ahead:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/select"]
  end

  (** A component used to render the label of a listbox option group.
      It won't be focusable using arrow keys. *)
  module Section = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Section"
    [@@mel.module "@kobalte/core/select"]
  end

  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The part that reflects the selected value(s). *)
  module Value = struct
    module Props = struct
      external check :
        (?children:('option Types.SelectValueState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Value"
    [@@mel.module "@kobalte/core/select"]
  end

  external use_select_context : unit -> Types.SelectContextValue.t = "useSelectContext"
  [@@mel.module "@kobalte/core/select"]
end

module Separator = struct
  (** A separator visually or semantically separates content. *)
  module Root = struct
    module Props = struct
      external check :
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/separator"]
  end
end

module Skeleton = struct
  module Root = struct
    module Props = struct
      external check :
        ?visible:bool Solidtype.Check.value ->
        ?width:float Solidtype.Check.value ->
        ?height:float Solidtype.Check.value ->
        ?circle:bool Solidtype.Check.value ->
        ?radius:float Solidtype.Check.value ->
        ?animate:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/skeleton"]
  end
end

module Slider = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The component that visually represents the slider value.
      Used to visually show the fill of `Slider.Track`. *)
  module Fill = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Fill"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The native html input that is visually hidden in the slider thumb. *)
  module Input = struct
    module Props = struct
      external check :
        ?style:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/slider"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:float array Solidtype.Check.value ->
        ?default_value:float array Solidtype.Check.value ->
        ?on_change:(float array -> unit) ->
        ?on_change_end:(float array -> unit) ->
        ?inverted:bool Solidtype.Check.value ->
        ?min_value:float Solidtype.Check.value ->
        ?max_value:float Solidtype.Check.value ->
        ?step:float Solidtype.Check.value ->
        ?min_steps_between_thumbs:float Solidtype.Check.value ->
        ?get_value_label:(Types.GetValueLabelParams2.t -> string) ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/slider"]
  end

  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Thumb"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The component that visually represents the slider track.
      Act as a container for `Slider.Fill`. *)
  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Track"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The accessible label text representing the current value in a human-readable format. *)
  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ValueLabel"
    [@@mel.module "@kobalte/core/slider"]
  end

  external use_slider_context : unit -> Types.SliderContextValue.t = "useSliderContext"
  [@@mel.module "@kobalte/core/slider"]
end

module SpinButton = struct
  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.ColorChannelField_Root_Translations.t Solidtype.Check.value ->
        ?value:(string, float) Types.Either.t Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?min_value:float Solidtype.Check.value ->
        ?max_value:float Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?on_increment:(unit -> unit) ->
        ?on_increment_page:(unit -> unit) ->
        ?on_decrement:(unit -> unit) ->
        ?on_decrement_page:(unit -> unit) ->
        ?on_decrement_to_min:(unit -> unit) ->
        ?on_increment_to_max:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/spin-button"]
  end
end

module Switch = struct
  (** The element that visually represents a switch. *)
  module Control = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Control"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The description that gives the user more information on the switch. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The error message that gives the user information about how to fix a validation error on the switch. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The native html input that is visually hidden in the switch. *)
  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The label that gives the user information on the switch. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** A control that allows users to choose one of two values: on or off. *)
  module Root = struct
    module Props = struct
      external check :
        ?checked:bool Solidtype.Check.value ->
        ?default_checked:bool Solidtype.Check.value ->
        ?on_change:(bool -> unit) ->
        ?value:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:(Types.SwitchRootState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The thumb that is used to visually indicate whether the switch is on or off. *)
  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Thumb"
    [@@mel.module "@kobalte/core/switch"]
  end

  external use_switch_context : unit -> Types.SwitchContextValue.t = "useSwitchContext"
  [@@mel.module "@kobalte/core/switch"]
end

module Tabs = struct
  (** Contains the content associated with a tab trigger. *)
  module Content = struct
    module Props = struct
      external check :
        value:string Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/tabs"]
  end

  (** The visual indicator displayed at the bottom of the tab list to indicate the selected tab.
      It provides the base style needed to display a smooth transition to the new selected tab. *)
  module Indicator = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Indicator"
    [@@mel.module "@kobalte/core/tabs"]
  end

  (** Contains the tabs that are aligned along the edge of the active tab panel. *)
  module List = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "List"
    [@@mel.module "@kobalte/core/tabs"]
  end

  (** A set of layered sections of content, known as tab panels, that display one panel of content at a time.
      `Tabs` contains all the parts of a tabs component and provide context for its children. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string Solidtype.Check.value ->
        ?default_value:string Solidtype.Check.value ->
        ?on_change:(string -> unit) ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?activation_mode:[ `manual | `automatic ] Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/tabs"]
  end

  (** The button that activates its associated tab panel. *)
  module Trigger = struct
    module Props = struct
      external check :
        value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/tabs"]
  end

  external use_tabs_context : unit -> Types.TabsContextValue.t = "useTabsContext"
  [@@mel.module "@kobalte/core/tabs"]
end

module TextField = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/text-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/text-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/text-field"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/text-field"]
  end

  (** A text input that allow users to input custom text entries with a keyboard. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string Solidtype.Check.value ->
        ?default_value:string Solidtype.Check.value ->
        ?on_change:(string -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/text-field"]
  end

  (** The native html textarea of the textfield. *)
  module TextArea = struct
    module Props = struct
      external check :
        ?auto_resize:bool Solidtype.Check.value ->
        ?submit_on_enter:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Textarea.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "TextArea"
    [@@mel.module "@kobalte/core/text-field"]
  end

  external use_text_field_context : unit -> Types.TextFieldContextValue.t = "useTextFieldContext"
  [@@mel.module "@kobalte/core/text-field"]
end

module TimeField = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/time-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:([ `hour | `minute | `second | `dayPeriod ] Solidtype.Solid.accessor -> Solidtype.Jsx.element, [ `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:Types.Time.t Solidtype.Check.value ->
        ?default_value:Types.Time.t Solidtype.Check.value ->
        ?on_change:(Types.Time.t -> unit) ->
        ?hour_cycle:float Solidtype.Check.value ->
        ?granularity:([ `hour | `minute | `second ], Types.TimeField_Root_Granularity.t) Types.Either.t Solidtype.Check.value ->
        ?force_leading_zeros:bool Solidtype.Check.value ->
        ?placeholder:Types.Time.t Solidtype.Check.value ->
        ?min:Types.Time.t Solidtype.Check.value ->
        ?max:Types.Time.t Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?translations:Types.TimeField_Root_Translations.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module Segment = struct
    module Props = struct
      external check :
        segment:[ `hour | `minute | `second | `dayPeriod ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Segment"
    [@@mel.module "@kobalte/core/time-field"]
  end
end

module Toast = struct
  (** The button that closes the toast. *)
  module CloseButton = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CloseButton"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** An optional accessible description to be announced when the toast is open. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** The list containing all rendered toasts.
      Must be inside a `Toast.Region`. *)
  module List = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ol.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "List"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** The component that visually represents the toast remaining lifetime.
      Used to visually show the fill of `Toast.ProgressTrack`. *)
  module ProgressFill = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ProgressFill"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** The component that visually represents the toast lifetime.
      Act as a container for `Toast.ProgressFill`. *)
  module ProgressTrack = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ProgressTrack"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** The fixed area where toasts appear. Users can jump to by pressing a hotkey.
      It is up to you to ensure the discoverability of the hotkey for keyboard users. *)
  module Region = struct
    module Props = struct
      external check :
        ?translations:Types.Toast_Region_Translations.t Solidtype.Check.value ->
        ?hotkey:string array Solidtype.Check.value ->
        ?duration:float Solidtype.Check.value ->
        ?limit:float Solidtype.Check.value ->
        ?swipe_direction:[ `left | `right | `up | `down ] Solidtype.Check.value ->
        ?swipe_threshold:float Solidtype.Check.value ->
        ?pause_on_interaction:bool Solidtype.Check.value ->
        ?pause_on_page_idle:bool Solidtype.Check.value ->
        ?top_layer:bool Solidtype.Check.value ->
        ?region_id:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Region"
    [@@mel.module "@kobalte/core/toast"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.Toast_Root_Translations.t Solidtype.Check.value ->
        toast_id:float Solidtype.Check.value ->
        ?priority:[ `high | `low ] Solidtype.Check.value ->
        ?duration:float Solidtype.Check.value ->
        ?persistent:bool Solidtype.Check.value ->
        ?on_pause:(unit -> unit) ->
        ?on_resume:(unit -> unit) ->
        ?on_swipe_start:(Types.SwipeEvent.t -> unit) ->
        ?on_swipe_move:(Types.SwipeEvent.t -> unit) ->
        ?on_swipe_cancel:(Types.SwipeEvent.t -> unit) ->
        ?on_swipe_end:(Types.SwipeEvent.t -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** An accessible title to be announced when the toast is open. *)
  module Title = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Title"
    [@@mel.module "@kobalte/core/toast"]
  end

  external toaster : Types.Toast_Toaster.t = "toaster"
  [@@mel.module "@kobalte/core/toast"]

  external use_toast_context : unit -> Types.ToastContextValue.t = "useToastContext"
  [@@mel.module "@kobalte/core/toast"]
end

module ToggleButton = struct
  (** A two-state button that allow users to toggle a selection on or off.
      This component is based on the \[WAI-ARIA Button Pattern\](https://www.w3.org/WAI/ARIA/apg/patterns/button/) *)
  module Root = struct
    module Props = struct
      external check :
        ?pressed:bool Solidtype.Check.value ->
        ?default_pressed:bool Solidtype.Check.value ->
        ?on_change:(bool -> unit) ->
        (?children:(Types.ToggleButtonRootState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/toggle-button"]
  end
end

module ToggleGroup = struct
  module Item = struct
    module Props = struct
      external check :
        value:string Solidtype.Check.value ->
        (?children:(Types.ToggleButtonRootState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/toggle-group"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:string Js.Nullable.t Solidtype.Check.value ->
        ?default_value:string Solidtype.Check.value ->
        ?on_change:(string Js.Nullable.t -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/toggle-group"]
  end

  module Root_multiple = struct
    module Props = struct
      external check :
        ?value:string array Solidtype.Check.value ->
        ?default_value:string array Solidtype.Check.value ->
        ?on_change:(string array -> unit) ->
        multiple:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/toggle-group"]
  end

  external use_toggle_group_context : unit -> Types.ToggleGroupContextValue.t = "useToggleGroupContext"
  [@@mel.module "@kobalte/core/toggle-group"]
end

module Tooltip = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  (** Contains the content to be rendered when the tooltip is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  (** Portals its children into the `body` when the tooltip is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  (** A popup that displays information related to an element
      when the element receives keyboard focus or the mouse hovers over it. *)
  module Root = struct
    module Props = struct
      external check :
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        ?trigger_on_focus_only:bool Solidtype.Check.value ->
        ?open_delay:float Solidtype.Check.value ->
        ?close_delay:float Solidtype.Check.value ->
        ?skip_delay_duration:float Solidtype.Check.value ->
        ?ignore_safe_area:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?on_current_placement_change:(string -> unit) ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  (** The button that opens the tooltip when hovered. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  external use_tooltip_context : unit -> Types.TooltipContextValue.t = "useTooltipContext"
  [@@mel.module "@kobalte/core/tooltip"]
end
