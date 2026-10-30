(* The types rhp's components and functions name, each a module.
   Generated from the declarations of @bezda/rhp 2.2.0 by generate/rhp.ts;
   never edited by hand. *)

(* Members of different JavaScript kinds, each as it is. *)
type ('a, 'b) either

type t_timing
type t_theme_values
type t_required_theme_values
type t_animated
type t_bins
type t_bins2
type t_density
type t_every
type t_nice
type t_summary

module Either : sig
  type ('a, 'b) t = ('a, 'b) either

  external left : 'a -> ('a, 'b) t = "%identity"
  external right : 'b -> ('a, 'b) t = "%identity"
end

module Timing : sig
  type t = t_timing
  (** ms a value takes to move (150 by default). *)
  external duration : t -> float option = "duration" [@@mel.get]
  external ease : t -> Ease.t option = "ease" [@@mel.get]
  (** ms a slat takes to slide to a new place (175 in the JS version by default). *)
  external slide : t -> float option = "slide" [@@mel.get]
  external make : ?duration:(float [@mel.as "duration"]) -> ?ease:(Ease.t [@mel.as "ease"]) -> ?slide:(float [@mel.as "slide"]) -> unit -> t = "" [@@mel.obj]
end

(** The colors and font a chart draws with. *)
module ThemeValues : sig
  type t = t_theme_values
  external series : t -> string array option = "series" [@@mel.get]
  external positive : t -> string option = "positive" [@@mel.get]
  external negative : t -> string option = "negative" [@@mel.get]
  external ink : t -> string option = "ink" [@@mel.get]
  external muted : t -> string option = "muted" [@@mel.get]
  external grid : t -> string option = "grid" [@@mel.get]
  external surface : t -> string option = "surface" [@@mel.get]
  external low : t -> string option = "low" [@@mel.get]
  external high : t -> string option = "high" [@@mel.get]
  external font : t -> string option = "font" [@@mel.get]
  external make : ?series:(string array [@mel.as "series"]) -> ?positive:(string [@mel.as "positive"]) -> ?negative:(string [@mel.as "negative"]) -> ?ink:(string [@mel.as "ink"]) -> ?muted:(string [@mel.as "muted"]) -> ?grid:(string [@mel.as "grid"]) -> ?surface:(string [@mel.as "surface"]) -> ?low:(string [@mel.as "low"]) -> ?high:(string [@mel.as "high"]) -> ?font:(string [@mel.as "font"]) -> unit -> t = "" [@@mel.obj]
end

module RequiredThemeValues : sig
  type t = t_required_theme_values
  external series : t -> string array = "series" [@@mel.get]
  external positive : t -> string = "positive" [@@mel.get]
  external negative : t -> string = "negative" [@@mel.get]
  external ink : t -> string = "ink" [@@mel.get]
  external muted : t -> string = "muted" [@@mel.get]
  external grid : t -> string = "grid" [@@mel.get]
  external surface : t -> string = "surface" [@@mel.get]
  external low : t -> string = "low" [@@mel.get]
  external high : t -> string = "high" [@@mel.get]
  external font : t -> string = "font" [@@mel.get]
  external make : series:(string array [@mel.as "series"]) -> positive:(string [@mel.as "positive"]) -> negative:(string [@mel.as "negative"]) -> ink:(string [@mel.as "ink"]) -> muted:(string [@mel.as "muted"]) -> grid:(string [@mel.as "grid"]) -> surface:(string [@mel.as "surface"]) -> low:(string [@mel.as "low"]) -> high:(string [@mel.as "high"]) -> font:(string [@mel.as "font"]) -> unit -> t = "" [@@mel.obj]
end

module Animated : sig
  type t = t_animated
  external duration : t -> float option = "duration" [@@mel.get]
  external ease : t -> Ease.t option = "ease" [@@mel.get]
  external make : ?duration:(float [@mel.as "duration"]) -> ?ease:(Ease.t [@mel.as "ease"]) -> unit -> t = "" [@@mel.obj]
end

module Bins : sig
  type t = t_bins
  external domain : t -> (float * float) option = "domain" [@@mel.get]
  external count : t -> float option = "count" [@@mel.get]
  external make : ?domain:((float * float) [@mel.as "domain"]) -> ?count:(float [@mel.as "count"]) -> unit -> t = "" [@@mel.obj]
end

module Bins2 : sig
  type t = t_bins2
  external x0 : t -> float array = "x0" [@@mel.get]
  external x1 : t -> float array = "x1" [@@mel.get]
  external tally : t -> float array = "tally" [@@mel.get]
  external make : x0:(float array [@mel.as "x0"]) -> x1:(float array [@mel.as "x1"]) -> tally:(float array [@mel.as "tally"]) -> unit -> t = "" [@@mel.obj]
end

module Density : sig
  type t = t_density
  external domain : t -> (float * float) option = "domain" [@@mel.get]
  external points : t -> float option = "points" [@@mel.get]
  external bandwidth : t -> float option = "bandwidth" [@@mel.get]
  external make : ?domain:((float * float) [@mel.as "domain"]) -> ?points:(float [@mel.as "points"]) -> ?bandwidth:(float [@mel.as "bandwidth"]) -> unit -> t = "" [@@mel.obj]
end

module Every : sig
  type t = t_every
  external ends : t -> bool option = "ends" [@@mel.get]
  external make : ?ends:(bool [@mel.as "ends"]) -> unit -> t = "" [@@mel.obj]
end

module Nice : sig
  type t = t_nice
  external min : t -> float = "min" [@@mel.get]
  external max : t -> float = "max" [@@mel.get]
  external step : t -> float = "step" [@@mel.get]
  external ticks : t -> float array = "ticks" [@@mel.get]
  external make : min:(float [@mel.as "min"]) -> max:(float [@mel.as "max"]) -> step:(float [@mel.as "step"]) -> ticks:(float array [@mel.as "ticks"]) -> unit -> t = "" [@@mel.obj]
end

module Summary : sig
  type t = t_summary
  external min : t -> float = "min" [@@mel.get]
  external q1 : t -> float = "q1" [@@mel.get]
  external median : t -> float = "median" [@@mel.get]
  external q3 : t -> float = "q3" [@@mel.get]
  external max : t -> float = "max" [@@mel.get]
  external low : t -> float = "low" [@@mel.get]
  external high : t -> float = "high" [@@mel.get]
  external mean : t -> float = "mean" [@@mel.get]
  external outliers : t -> float array = "outliers" [@@mel.get]
  external make : min:(float [@mel.as "min"]) -> q1:(float [@mel.as "q1"]) -> median:(float [@mel.as "median"]) -> q3:(float [@mel.as "q3"]) -> max:(float [@mel.as "max"]) -> low:(float [@mel.as "low"]) -> high:(float [@mel.as "high"]) -> mean:(float [@mel.as "mean"]) -> outliers:(float array [@mel.as "outliers"]) -> unit -> t = "" [@@mel.obj]
end
