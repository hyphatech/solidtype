external get_element_by_id : string -> Dom.element Js.Nullable.t
  = "getElementById"
[@@mel.scope "document"]

let () =
  match Js.Nullable.toOption (get_element_by_id "app") with
  | Some root -> ignore (Solidtype.Web.render App.make root : unit -> unit)
  | None -> invalid_arg "index.html has no element #app to draw the board in"
