(** A plot: a slat for each of its rows, stacked in the chart's band, each in
    its place as the rows change.

    [<Plot rows=(fun () -> fruits)>fruit</Plot>], where [fruits] is an array of
    records and [fruit] a {!Slat.t} of that record: a slat reads only the fields
    of its row's type, and a row changed redraws only what reads it.

    Ported by hand: rhp's [Plot] takes any prop it does not know as a data
    group, a column of the rows, which no declaration names, and its rows are
    objects of no type; here the rows are a typed array, and its slat their
    type's. *)

module Props : sig
  external check :
    rows:'row array Solidtype.Check.value ->
    ?reorder:[ `slide | `move | `refill ] Solidtype.Check.value ->
    ?orientation:[ `horizontal | `vertical | `across ] Solidtype.Check.value ->
    ?overlap:bool Solidtype.Check.value ->
    ?slats:float Solidtype.Check.value ->
    ?order:'row Order.t Solidtype.Check.value ->
    ?key:('row Row.t -> 'key) ->
    ?animate:(bool, Types.Timing.t) Types.Either.t Solidtype.Check.value ->
    ?thick:(string, float) Types.Either.t Solidtype.Check.value ->
    ?static:bool Solidtype.Check.value ->
    ?keyboard:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?style:string Js.Dict.t Solidtype.Check.value ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    children:('row Slat.t, [ `render ]) Solidtype.Check.children ->
    unit ->
    unit = "check"
  [@@mel.module "vite-plugin-solidtype/markers"]
  (** [rows], one slat each, read as they change; [reorder], how slats change
      places: slide on screen, the default, move in the page, or refill the
      slots; [orientation], the chart's or the plot's around it by default,
      [`across] the other; [overlap], every slat in one band, for stacked
      segments, strips of dots and layers; [slats], the number of rows, all of
      them by default; [key], what identifies a row, so a row removed takes its
      own slat with it; [animate], the JavaScript version, where the numbers
      themselves move, or its timing; [thick], the share of the band, or a CSS
      length, a plot inside a slat fills; [static], each row drawn once, for
      data that does not change; [keyboard], the slats take focus, Tab stopping
      at one and the arrows, Home and End moving it. *)
end

external component : unit Solidtype.Jsx.component = "Plot"
[@@mel.module "@bezda/rhp"]
