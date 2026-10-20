external get_element_by_id : string -> Dom.element = "getElementById"
[@@mel.scope "document"]

let (_ : unit -> unit) = Solidtype.Web.render App.make (get_element_by_id "app")
