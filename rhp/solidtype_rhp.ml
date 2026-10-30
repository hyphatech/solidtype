(* rhp's components and functions, and the types they name, in Types.
   Generated from the declarations of @bezda/rhp 2.2.0 by generate/rhp.ts;
   never edited by hand.

   A component's props check takes its own props, then its children, then
   the attributes of the element it passes them on to. Each check is
   external, since the compiler checks it and Melange writes none of it.
   What no rule maps is ported by hand, a module each, re-exported here. *)

module Types = Types
module Color = Color
module Ease = Ease
module Plot = Plot
module Row = Row
module Shape = Shape
module Slat = Slat
module Ticks = Ticks

module Area = struct
  module Props = struct
    external check :
      ?points:(float option * float option) option array Solidtype.Check.value ->
      ?peak:float Solidtype.Check.value ->
      ?mirror:bool Solidtype.Check.value ->
      ?smooth:bool Solidtype.Check.value ->
      ?color:Color.t Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Svg.check = "check"
    [@@mel.module "vite-plugin-solidtype/markers"]
  end

  external component : unit Solidtype.Jsx.component = "Area"
  [@@mel.module "@bezda/rhp"]
end

module Axis = struct
  module Props = struct
    external check :
      ticks:float array Solidtype.Check.value ->
      ?format:(float -> Solidtype.Jsx.element) ->
      ?grid:bool Solidtype.Check.value ->
      ?cross:bool Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
    [@@mel.module "vite-plugin-solidtype/markers"]
  end

  external component : unit Solidtype.Jsx.component = "Axis"
  [@@mel.module "@bezda/rhp"]
end

module Bar = struct
  module Props = struct
    external check :
      ?shape:Shape.t Solidtype.Check.value ->
      ?from:float Solidtype.Check.value ->
      ?to_:float Solidtype.Check.value ->
      ?thick:(string, float) Types.Either.t Solidtype.Check.value ->
      ?color:Color.t Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
    [@@mel.module "vite-plugin-solidtype/markers"]
  end

  external component : unit Solidtype.Jsx.component = "Bar"
  [@@mel.module "@bezda/rhp"]
end

module Cell = struct
  module Props = struct
    external check :
      ?shape:Shape.t Solidtype.Check.value ->
      ?value:float Solidtype.Check.value ->
      ?color:Color.t Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
    [@@mel.module "vite-plugin-solidtype/markers"]
  end

  external component : unit Solidtype.Jsx.component = "Cell"
  [@@mel.module "@bezda/rhp"]
end

module Chart = struct
  module Props = struct
    external check :
      ?scale:(float * float) Solidtype.Check.value ->
      ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
      ?height:float Solidtype.Check.value ->
      ?aspect:float Solidtype.Check.value ->
      ?ticks:Ticks.t Solidtype.Check.value ->
      ?grid:bool Solidtype.Check.value ->
      ?format:(float -> Solidtype.Jsx.element) ->
      ?animate:(bool, Types.Timing.t) Types.Either.t Solidtype.Check.value ->
      ?theme:Types.ThemeValues.t Solidtype.Check.value ->
      ?static:bool Solidtype.Check.value ->
      ?no_css_guard:bool Solidtype.Check.value ->
      ?cross:(float * float) Solidtype.Check.value ->
      ?cross_ticks:Ticks.t Solidtype.Check.value ->
      ?cross_grid:bool Solidtype.Check.value ->
      ?cross_format:(float -> Solidtype.Jsx.element) ->
      ?label:string Solidtype.Check.value ->
      ?id:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?role:string Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      ?props:'spread Solidtype.Solid.rest ->
      ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
    [@@mel.module "vite-plugin-solidtype/markers"]
  end

  external component : unit Solidtype.Jsx.component = "Chart"
  [@@mel.module "@bezda/rhp"]
end

module Dot = struct
  module Props = struct
    external check :
      ?shape:Shape.t Solidtype.Check.value ->
      ?at:float Solidtype.Check.value ->
      ?size:(string, float) Types.Either.t Solidtype.Check.value ->
      ?across:float Solidtype.Check.value ->
      ?cross:float Solidtype.Check.value ->
      ?color:Color.t Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
    [@@mel.module "vite-plugin-solidtype/markers"]
  end

  external component : unit Solidtype.Jsx.component = "Dot"
  [@@mel.module "@bezda/rhp"]
end

module Label = struct
  module Props = struct
    external check :
      ?shape:Shape.t Solidtype.Check.value ->
      ?at:float Solidtype.Check.value ->
      ?side:[ `after | `before ] Solidtype.Check.value ->
      ?edge:string Solidtype.Check.value ->
      ?cross:float Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
    [@@mel.module "vite-plugin-solidtype/markers"]
  end

  external component : unit Solidtype.Jsx.component = "Label"
  [@@mel.module "@bezda/rhp"]
end

(** A line through points: a sparkline in a slat, or on a Chart's cross scale a line chart. *)
module Line = struct
  module Props = struct
    external check :
      ?points:(float option * float option) option array Solidtype.Check.value ->
      ?peak:float Solidtype.Check.value ->
      ?fill:bool Solidtype.Check.value ->
      ?base:float Solidtype.Check.value ->
      ?smooth:bool Solidtype.Check.value ->
      ?color:Color.t Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Svg.check = "check"
    [@@mel.module "vite-plugin-solidtype/markers"]
  end

  external component : unit Solidtype.Jsx.component = "Line"
  [@@mel.module "@bezda/rhp"]
end

(** A place on the chart and nothing else: no size and nothing drawn, so whatever you put inside it sits at its value. *)
module Place = struct
  module Props = struct
    external check :
      ?at:float Solidtype.Check.value ->
      ?across:float Solidtype.Check.value ->
      ?cross:float Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
    [@@mel.module "vite-plugin-solidtype/markers"]
  end

  external component : unit Solidtype.Jsx.component = "Place"
  [@@mel.module "@bezda/rhp"]
end

(** A magazine-style panel around a chart: kicker, headline, dek, the chart, a note. Markup only; its look is the page's
    CSS, and \@bezda/rhp/posters.css has the gallery's looks to start from. *)
module Poster = struct
  module Props = struct
    external check :
      ?look:string Solidtype.Check.value ->
      ?kicker:Solidtype.Jsx.element Solidtype.Check.value ->
      ?title:Solidtype.Jsx.element Solidtype.Check.value ->
      ?dek:Solidtype.Jsx.element Solidtype.Check.value ->
      ?note:Solidtype.Jsx.element Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Figure.check = "check"
    [@@mel.module "vite-plugin-solidtype/markers"]
  end

  external component : unit Solidtype.Jsx.component = "Poster"
  [@@mel.module "@bezda/rhp"]
end

external theme : Types.RequiredThemeValues.t = "THEME"
[@@mel.module "@bezda/rhp"]

module Theme = struct
  module Props = struct
    external check :
      value:Types.ThemeValues.t Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
    [@@mel.module "vite-plugin-solidtype/markers"]
  end

  external component : unit Solidtype.Jsx.component = "Theme"
  [@@mel.module "@bezda/rhp"]
end

module Tick = struct
  module Props = struct
    external check :
      ?shape:Shape.t Solidtype.Check.value ->
      ?at:float Solidtype.Check.value ->
      ?thick:(string, float) Types.Either.t Solidtype.Check.value ->
      ?color:Color.t Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
    [@@mel.module "vite-plugin-solidtype/markers"]
  end

  external component : unit Solidtype.Jsx.component = "Tick"
  [@@mel.module "@bezda/rhp"]
end

external animated_js : (unit -> 't) -> ?settings:(unit -> Types.Animated.t) -> unit -> (float option -> 't [@u]) = "animated"
[@@mel.module "@bezda/rhp"]
(** A value that moves to each new value over time: the reader gives the value to draw now, or ms ahead. *)
let animated x0 ?settings () = let r = animated_js x0 ?settings () in fun y0 -> (r y0 [@u])

(** Item i of a data group (a list wraps around; one value is every row's). *)
external at : ('t, 't array) Types.Either.t -> float -> 't option = "at"
[@@mel.module "@bezda/rhp"]

(** Histogram bins: bin k covers x0\[k\]..x1\[k\] and holds tally\[k\] samples. Samples all alike get a scale one wide around
    them, and no samples a scale from 0 to 1. *)
external bins : float option array -> ?options:Types.Bins.t -> unit -> Types.Bins2.t = "bins"
[@@mel.module "@bezda/rhp"]

external curve_js : ?ease:Ease.t -> unit -> (float -> float [@u]) = "curve"
[@@mel.module "@bezda/rhp"]
(** A timing curve as a function of 0..1. *)
let curve ?ease () = let r = curve_js ?ease () in fun y0 -> (r y0 [@u])

(** A Gaussian kernel density estimate: points pairs of \[x, density\] (for Area). *)
external density : float option array -> ?options:Types.Density.t -> unit -> (float * float) array = "density"
[@@mel.module "@bezda/rhp"]

(** Runs f with rhp's style writes going to the page at once instead of in the next frame: for an app that changes
    chart data inside its own requestAnimationFrame callback, so the change shows in that frame. *)
external drawing : (unit -> 't) -> 't = "drawing"
[@@mel.module "@bezda/rhp"]

external every_js : float -> ?options:Types.Every.t -> unit -> ((float * float) -> float array [@u]) = "every"
[@@mel.module "@bezda/rhp"]
(** Ticks at every multiple of step in the scale; with ends, its min and max too. A step that is not above 0 throws.
    
    Raises [Invalid_argument] with rhp's message, where it throws. *)
let every x0 ?options () =
  match every_js x0 ?options () with
  | r -> fun y0 -> (r y0 [@u])
  | exception Js.Exn.Error e -> invalid_arg ("every: " ^ Option.value (Js.Exn.message e) ~default:"")
let every_opt x0 ?options () = match every_js x0 ?options () with r -> Some (fun y0 -> (r y0 [@u])) | exception Js.Exn.Error _ -> None

(** \[smallest, largest\], leaving out missing values (\[Infinity, -Infinity\] when there are none, which nice() makes 0 to 1). *)
external extent : float option array -> (float * float) = "extent"
[@@mel.module "@bezda/rhp"]

(** Call where the app starts, before the first chart: --rhp-position is passed down from each slat root again, so
    anything inside a slat can read it, as in rhp 2.0. Charts take longer to draw (no style is shared between rows). *)
external inherit_position : unit -> unit = "inheritPosition"
[@@mel.module "@bezda/rhp"]

(** Call where the app starts, on the server and in the browser, when the page links \@bezda/rhp/rhp.css itself. *)
external linked_css : unit -> unit = "linkedCss"
[@@mel.module "@bezda/rhp"]

(** A round scale covering lo..hi with about count ticks. *)
external nice : float -> float -> ?count:float -> unit -> Types.Nice.t = "nice"
[@@mel.module "@bezda/rhp"]

(** Call where the app starts, before the first chart, on the server and in the browser: no chart on the page gets the
    guard (the CSS that keeps a page's own rules from reaching a chart). Charts draw faster, and the page's CSS must leave
    their elements alone. A page that links rhp's stylesheet itself links \@bezda/rhp/rhp-no-css-guard.css instead. *)
external no_css_guard : unit -> unit = "noCssGuard"
[@@mel.module "@bezda/rhp"]

(** Box and whisker numbers, leaving out missing samples; low and high are the whisker ends (1.5 x IQR). *)
external summary : float option array -> Types.Summary.t = "summary"
[@@mel.module "@bezda/rhp"]

external use_orientation_js : unit -> (unit -> [ `horizontal | `vertical ] [@u]) = "useOrientation"
[@@mel.module "@bezda/rhp"]
(** The orientation of the Plot around, as a signal. *)
let use_orientation () = let r = use_orientation_js () in fun () -> (r () [@u])
