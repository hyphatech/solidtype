(* The CSSOM's escape as the stand-in serializes an identifier. *)

module E = Jest.Expect

let () =
  Jest.describe "Css_escape.escape" (fun () ->
      Jest.test "turns NUL into the one replacement character" (fun () ->
          let s = Css_escape.escape "a\000b" in
          E.(expect (s, Js.String.length s) |> toEqual ({js|a\uFFFDb|js}, 3)));
      Jest.test "escapes a leading digit by its code point" (fun () ->
          E.(expect (Css_escape.escape "1a") |> toBe "\\31 a")))
