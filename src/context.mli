(** Solid's context: a value given to every component below its provider.

    {[
      module Theme = Solidtype.Context.Make (struct
        type t = theme

        let default = light
      end)

      <Theme.Provider value=(fun () -> dark)>...</Theme.Provider>
      let theme = Theme.use ()
    ]}

    A context is a module, since its provider is a component named in JSX. *)

module type Value = sig
  type t

  val default : t
  (** What a component reads with no provider above it. *)
end

module Make (V : Value) : sig
  module Provider : sig
    module Props : sig
      val check :
        value:V.t Check.value ->
        ?children:('f, [ `nodes ]) Check.children ->
        unit ->
        unit
    end

    val component : unit Jsx.component
  end

  val use : unit -> V.t
  (** The value of the nearest provider above, else the default. *)
end

(** A context with no default. *)
module Make_optional (V : sig
  type t
end) : sig
  module Provider : sig
    module Props : sig
      val check :
        value:V.t Check.value ->
        ?children:('f, [ `nodes ]) Check.children ->
        unit ->
        unit
    end

    val component : unit Jsx.component
  end

  val use : unit -> V.t option
  (** The value of the nearest provider above, [None] with none. *)
end
