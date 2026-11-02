(* The island as the server renders it, read by the setup alone, so the
   browser's build never names Solid's server functions. *)

let html () = Solidtype.Server.render_to_string Island.make

(* The chart as the server renders it, rhp's CSS written into it. *)
let chart () = Solidtype.Server.render_to_string Chart.make

(* A HeroUI Select, Kobalte's, as the server renders it. *)
let select () = Solidtype.Server.render_to_string Select_island.make

(* A HeroUI TimeField, Kobalte's, as the server renders it. *)
let time_field () = Solidtype.Server.render_to_string Time_field_island.make

(* A HeroUI CheckboxGroup, with its label and description, as the server
   renders it. *)
let checkbox_group () =
  Solidtype.Server.render_to_string Checkbox_group_island.make

(* The script a page rendered on the server carries in its head, which
   hydration reads. *)
let script () = Solidtype.Server.generate_hydration_script ()
