(* The state a port keeps of an element, watched once however many times
   Kobalte hands the element to its ref, as it does while its props change. *)

module Interaction = Solidtype_heroui.Interaction
module E = Jest.Expect

external create_element : string -> Dom.element = "createElement"
[@@mel.scope "document"]

(* Counts the listeners added to the element, in place of adding them. *)
external set_add_event_listener :
  Dom.element -> ((string -> (Dom.event -> unit) -> unit)[@mel.uncurry]) -> unit
  = "addEventListener"
[@@mel.set]

let () =
  Jest.describe "Interaction" (fun () ->
      Jest.test "listens to an element once, however often it is watched"
        (fun () ->
          let element = create_element "button" in
          let added = ref 0 in
          set_add_event_listener element (fun _ _ -> incr added);
          let i = Interaction.create () in
          Interaction.watch i element;
          let once = !added in
          Interaction.watch i element;
          Interaction.watch i element;
          E.(expect (once > 0, !added) |> toEqual (true, once))))
