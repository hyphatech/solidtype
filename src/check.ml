type 'a value
type ('f, 'kind) children

external literal : 'a -> 'a value = "%identity"
external thunk : (unit -> 'a) -> 'a value = "%identity"
external nodes : unit -> ('f, [> `nodes ]) children = "%identity"
external render : 'f -> ('f, [> `render ]) children = "%identity"
external element : unit -> Jsx.element value = "%identity"
