(** React Aria's Virtualizer, as HeroUI's components take it: around a
    {!List_box}, alone or inside a {!Select}, a {!Combo_box} or an
    {!Autocomplete}, it draws only the entries in view of what scrolls them, in
    a block the size of them all, each placed by its [layout]: the option with
    the focus drawn wherever it is, and one the keys move to scrolled into view;
    a reader is told each option's place in the whole list, [aria-posinset] and
    [aria-setsize], as Kobalte tells it. It is
    {!Solidtype_headless.Virtualizer}, which HeroUI's components read.

    {[
      <Virtualizer layout=(fun () -> Virtualizer.list_layout ~row_size:50. ())>
        <List_box aria_label="Users" class_="h-[400px] overflow-y-auto">
          ...
        </List_box>
      </Virtualizer>
    ]} *)

include module type of struct
  include Solidtype_headless.Virtualizer
end
