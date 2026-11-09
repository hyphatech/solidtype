(** HeroUI's TagGroup: a focusable list of {!Tag}s, chosen, walked by the keys
    and removed, with HeroUI's classes from {!Styles.TagGroup} and
    {!Styles.Tag}. Its {!Label} names its list, and its {!Description} and
    {!Error_message} describe it.

    {[
      <Tag_group selection_mode=`single>
        <Label>"Categories"</Label>
        <Tag_group.List>
          <Tag id="news">"News"</Tag> <Tag id="travel">"Travel"</Tag>
        </Tag_group.List>
      </Tag_group>
    ]}

    Tab reaches the tag last focused, or the first chosen, or the first, then
    its remove button. The arrows move from tag to tag, a disabled one passed
    over, wrapping at either end; Home and End reach the first and the last, and
    typing the start of a tag's name the next tag of that name. A press, Space
    or Enter chooses a tag, and Escape clears what is chosen. Delete and
    Backspace remove the focused tag, or every chosen tag where it is chosen,
    and focus moves to the tag after it. *)

type group = {
  size : unit -> [ `sm | `md | `lg ] option;
  variant : unit -> [ `default | `surface ] option;
}
(** What a {!Tag} reads of the group it is in: the look of its tags. *)

val use_context : string -> group
(** [use_context part] is the group above [part], which raises
    [Invalid_argument] naming [part] outside one. *)

(** The tags: [data-empty] while it holds none, then drawing
    [render_empty_state] in their place. *)
module List : sig
  module Props : sig
    type t

    val check :
      ?render_empty_state:(unit -> Solidtype.Jsx.element) ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Solidtype.Jsx.element) ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The group, its tags of [size], [`md] by default, and [variant], [`default]
    by default. Its tags are chosen as [selection_mode] says, [`none] by
    default: the keys chosen are [selected_keys] while it is given them, else
    those it keeps, [default_selected_keys] at first, and each change calls
    [on_selection_change] with them. A tag whose key [disabled_keys] holds is
    disabled, and every tag while [is_disabled]. Given [on_remove], each tag
    draws a remove button, and the keys to remove are given to it, for the
    caller to take the tags off the page. Its list is named by [aria_label]
    where it has no {!Label}. *)
module Props : sig
  type t

  val check :
    ?size:[ `sm | `md | `lg ] Solidtype.Check.value ->
    ?variant:[ `default | `surface ] Solidtype.Check.value ->
    ?selection_mode:[ `none | `single | `multiple ] Solidtype.Check.value ->
    ?selected_keys:string array Solidtype.Check.value ->
    ?default_selected_keys:string array Solidtype.Check.value ->
    ?on_selection_change:(string array -> unit) ->
    ?disabled_keys:string array Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?on_remove:(string array -> unit) ->
    ?aria_label:string Solidtype.Check.value ->
    ?aria_labelledby:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> Solidtype.Jsx.element) ->
    ?props:t Solidtype.Solid.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
