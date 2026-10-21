(** HeroUI's variant functions, from [@heroui/styles]: each gives the classes of
    a component's look, as HeroUI's own components apply them. Bound by hand
    until the generator writes them from HeroUI's declarations. *)

type button_options
(** What {!button} is given: each left out is HeroUI's default, [`primary] and
    [`md]. *)

external button_options :
  ?variant:
    ([ `primary [@mel.as "primary"]
     | `secondary [@mel.as "secondary"]
     | `tertiary [@mel.as "tertiary"]
     | `outline [@mel.as "outline"]
     | `ghost [@mel.as "ghost"]
     | `danger [@mel.as "danger"]
     | `danger_soft [@mel.as "danger-soft"] ]
    [@mel.as "variant"]) ->
  ?size:([ `sm | `md | `lg ][@mel.as "size"]) ->
  ?full_width:(bool[@mel.as "fullWidth"]) ->
  ?is_icon_only:(bool[@mel.as "isIconOnly"]) ->
  ?class_name:(string[@mel.as "className"]) ->
  unit ->
  button_options = ""
[@@mel.obj]

external button : button_options -> string = "buttonVariants"
[@@mel.module "@heroui/styles"]
(** [button (button_options ~variant:`ghost ())] is
    ["button button--md button--ghost"], with [class_name] after it. *)
