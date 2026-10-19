module Colors = Solidtype_kobalte.Colors
module Types = Solidtype_kobalte.Types
module Color = Types.Color
module Range = Types.ColorChannelRange
module E = Jest.Expect

let red () = Colors.parse_color "#ff0000"

let channel_name = function
  | `hue -> "hue"
  | `saturation -> "saturation"
  | `brightness -> "brightness"
  | `lightness -> "lightness"
  | `red -> "red"
  | `green -> "green"
  | `blue -> "blue"
  | `alpha -> "alpha"

let channel_names (x, y, z) = List.map channel_name [ x; y; z ]

let () =
  Jest.describe "colors" (fun () ->
      Jest.test "a colour parsed from hex reads its channels back" (fun () ->
          let c = red () in
          E.(
            expect
              (List.map
                 (Color.get_channel_value c)
                 [ `red; `green; `blue; `alpha ])
            |> toEqual [ 255.; 0.; 0.; 1. ]));
      Jest.test "a colour prints in each format" (fun () ->
          let c = red () in
          E.(
            expect
              ( Color.to_string c (Some `hex),
                Color.to_string c (Some `rgb),
                Color.to_string (Color.to_format c `hsl) (Some `hsl),
                Color.to_hex_int c () )
            |> toEqual
                 ("#FF0000", "rgb(255, 0, 0)", "hsl(0 100% 50%)", 16711680.)));
      Jest.test "a colour in HSL parses, and converts through RGB to hex"
        (fun () ->
          let green = Colors.parse_color "hsl(120, 100%, 50%)" in
          let refused =
            match Color.to_format green `hex with
            | _ -> false
            | exception Js.Exn.Error _ -> true
          in
          E.(
            expect
              ( Color.get_channel_value green `hue,
                Color.to_string (Color.to_format green `rgb) (Some `hex),
                refused )
            |> toEqual (120., "#00FF00", true)));
      Jest.test "a channel set gives a new colour, and leaves the first"
        (fun () ->
          let c = red () in
          let faded = Color.with_channel_value c `alpha 0.5 in
          E.(
            expect
              ( Color.to_string faded (Some `rgba),
                Color.get_channel_value c `alpha )
            |> toEqual ("rgba(255, 0, 0, 0.5)", 1.)));
      Jest.test "a colour knows its space and its channels" (fun () ->
          let c = red () in
          let space =
            match Color.get_color_space c () with
            | `rgb -> "rgb"
            | `hsl -> "hsl"
            | `hsb -> "hsb"
          in
          E.(
            expect
              ( space,
                channel_names (Color.get_color_channels c ()),
                channel_names (Colors.get_color_channels `hsb) )
            |> toEqual
                 ( "rgb",
                   [ "red"; "green"; "blue" ],
                   [ "hue"; "saturation"; "brightness" ] )));
      Jest.test "a channel's range, format and name" (fun () ->
          let hsl = Color.to_format (red ()) `hsl in
          let range = Color.get_channel_range hsl `hue in
          E.(
            expect
              ( [
                  Range.min_value range;
                  Range.max_value range;
                  Range.step range;
                  Range.page_size range;
                ],
                Color.format_channel_value hsl `saturation,
                Color.get_channel_name hsl `hue Colors.color_intl_translations,
                Color.get_color_name hsl Colors.color_intl_translations )
            |> toEqual ([ 0.; 360.; 1.; 15. ], "100%", "Hue", "vibrant Red")));
      Jest.test "a hue wraps into a turn, which keeps 360" (fun () ->
          E.(
            expect (List.map Colors.normalize_hue [ 370.; -10.; 360.; 720. ])
            |> toEqual [ 10.; 350.; 360.; 0. ]));
      Jest.test "normalizeColor takes a string or a colour" (fun () ->
          let from_string = Colors.normalize_color (Types.Either.left "#00f") in
          let from_colour =
            Colors.normalize_color (Types.Either.right (red ()))
          in
          E.(
            expect
              ( Color.to_string from_string (Some `hex),
                Color.to_string from_colour (Some `hex) )
            |> toEqual ("#0000FF", "#FF0000")));
      Jest.test "a string that is no colour is refused" (fun () ->
          let refused =
            match Colors.parse_color "not a colour" with
            | _ -> false
            | exception Js.Exn.Error _ -> true
          in
          E.(expect refused |> toBe true)))
