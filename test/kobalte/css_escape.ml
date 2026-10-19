(* jsdom has no CSS.escape, which user-event calls to find a radio's group
   when an arrow key walks it. This is the CSSOM's "serialize an identifier",
   installed where the window has none. *)

type css

external window : Dom.window = "window"
external css : Dom.window -> css Js.Undefined.t = "CSS" [@@mel.get]
external set_css : Dom.window -> css -> unit = "CSS" [@@mel.set]
external make : escape:(string -> string) -> unit -> css = "" [@@mel.obj]

let code_point c = Printf.sprintf "\\%x " c

let escape s =
  let n = Js.String.length s in
  let code i = int_of_float (Js.String.charCodeAt ~index:i s) in
  let digit c = c >= 0x30 && c <= 0x39 in
  let plain c =
    c >= 0x80 || c = 0x2d || c = 0x5f || digit c
    || (c >= 0x41 && c <= 0x5a)
    || (c >= 0x61 && c <= 0x7a)
  in
  List.init n (fun i ->
      let c = code i in
      if c = 0 then "\u{FFFD}"
      else if (c >= 0x1 && c <= 0x1f) || c = 0x7f then code_point c
      else if i = 0 && digit c then code_point c
      else if i = 1 && digit c && code 0 = 0x2d then code_point c
      else if i = 0 && n = 1 && c = 0x2d then "\\-"
      else if plain c then Js.String.charAt ~index:i s
      else "\\" ^ Js.String.charAt ~index:i s)
  |> String.concat ""

let install () =
  if Js.Undefined.testAny (css window) then set_css window (make ~escape ())
