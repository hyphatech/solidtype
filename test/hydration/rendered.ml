(* The island as the server renders it, read by the setup alone, so the
   browser's build never names Solid's server functions. *)

let html () = Solidtype.Server.render_to_string Island.make

(* The chart as the server renders it, rhp's CSS written into it. *)
let chart () = Solidtype.Server.render_to_string Chart.make

(* The script a page rendered on the server carries in its head, which
   hydration reads. *)
let script () = Solidtype.Server.generate_hydration_script ()
