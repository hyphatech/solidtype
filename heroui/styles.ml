type button_options

(* Every tag of a variant is named by [@mel.as]: where only some are, Melange's
   [@@mel.obj] writes undefined for the rest, and HeroUI its default. *)
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
