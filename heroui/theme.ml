module S = Solidtype.Solid

let storage_key = "heroui-theme"
let prefers_dark = "(prefers-color-scheme: dark)"

type media

external match_media : string -> media = "matchMedia" [@@mel.scope "window"]
external matches : media -> bool = "matches" [@@mel.get]

external listen : media -> string -> (unit -> unit) -> unit = "addEventListener"
[@@mel.send]

external unlisten : media -> string -> (unit -> unit) -> unit
  = "removeEventListener"
[@@mel.send]

external get_item : string -> string Js.null = "getItem"
[@@mel.scope "localStorage"]

external set_item : string -> string -> unit = "setItem"
[@@mel.scope "localStorage"]

type class_list

external html : Dom.element = "documentElement" [@@mel.scope "document"]
external class_list : Dom.element -> class_list = "classList" [@@mel.get]
external add_class : class_list -> string -> unit = "add" [@@mel.send]
external remove_class : class_list -> string -> unit = "remove" [@@mel.send]

external set_attribute : Dom.element -> string -> string -> unit
  = "setAttribute"
[@@mel.send]

(* Reading or writing storage throws where a browser refuses a page its
   storage; the choice then lasts as long as the page. *)
let stored () =
  match get_item storage_key with
  | value -> Js.Null.toOption value
  | exception _ -> None

let store theme =
  match set_item storage_key theme with () -> () | exception _ -> ()

type t = {
  theme : string S.accessor;
  resolved : string option S.accessor;
  set_theme : string -> unit;
}

let use ?(default = "system") () =
  let theme, set = S.create_signal default in
  let system, set_system = S.create_signal None in
  (* Read once the page is hydrated, never as it is made: a prerendered page
     was drawn of the default, and hydrating reads none of its text again. *)
  S.on_mount (fun () ->
      Option.iter (S.set set) (stored ());
      let media = match_media prefers_dark in
      let read () =
        S.set set_system (Some (if matches media then "dark" else "light"))
      in
      read ();
      listen media "change" read;
      S.on_cleanup (fun () -> unlisten media "change" read));
  let resolved =
    S.create_memo (fun () ->
        match S.get theme with "system" -> S.get system | named -> Some named)
  in
  S.create_effect_from ~init:None (fun previous ->
      let now = S.get resolved in
      (match now with
      | Some name when not (Option.equal String.equal previous now) ->
          let classes = class_list html in
          Option.iter (remove_class classes) previous;
          add_class classes name;
          set_attribute html "data-theme" name
      | Some _ | None -> ());
      now);
  {
    theme;
    resolved = (fun[@u] () -> S.get resolved);
    set_theme =
      (fun name ->
        store name;
        S.set set name);
  }
