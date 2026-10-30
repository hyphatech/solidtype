(* @internationalized/date's binding as a caller meets it: a zone's daylight
   saving through each disambiguation, a value of any kind where several are
   taken, a throw as a value or as Invalid_argument, and an instant through
   Js.Date.t. Kyiv's clocks go from 03:00 to 04:00 on 29 March 2026, and from
   04:00 back to 03:00 on 25 October. *)

module D = Solidtype_internationalized_date
module Z = D.Types.ZonedDateTime
module E = Jest.Expect

let kyiv = "Europe/Kyiv"
let hour_ms = 3_600_000

let local ~month ~day ~hour =
  D.Types.CalendarDateTime.make 2026 month day ~hour ~minute:30 ()

let wall z = (Z.hour z, Z.minute z, Z.offset z / hour_ms)

let () =
  Jest.describe "@internationalized/date" (fun () ->
      Jest.test "moves a time its zone skips on, by default" (fun () ->
          let z = D.to_zoned (local ~month:3 ~day:29 ~hour:3) kyiv () in
          E.(expect (wall z) |> toEqual (4, 30, 3)));
      Jest.test "refuses a time its zone skips, as reject asks" (fun () ->
          E.(
            expect
              (D.to_zoned_opt
                 (local ~month:3 ~day:29 ~hour:3)
                 kyiv ~disambiguation:`reject ())
            |> toEqual None));
      Jest.test "takes either of a time its zone repeats" (fun () ->
          let at disambiguation =
            wall
              (D.to_zoned
                 (local ~month:10 ~day:25 ~hour:3)
                 kyiv ~disambiguation ())
          in
          E.(
            expect (at `earlier, at `later) |> toEqual ((3, 30, 3), (3, 30, 2))));
      Jest.test "compares values of different kinds as they are" (fun () ->
          let zoned = D.to_zoned (local ~month:3 ~day:29 ~hour:12) kyiv () in
          let date = D.Types.CalendarDate.make 2026 3 29 in
          E.(expect (D.is_same_day zoned date) |> toBe true));
      Jest.test "gives a difference of instants past an int's range" (fun () ->
          let a = D.to_zoned (local ~month:1 ~day:1 ~hour:12) kyiv () in
          let b = Z.add a (D.Types.DateTimeDuration.make ~days:30 ()) in
          E.(expect (Z.compare b a) |> toBe 2_592_000_000.));
      Jest.test "keeps an instant through Js.Date.t" (fun () ->
          let ms = 1_790_000_000_000. in
          let z = D.from_absolute ms kyiv in
          E.(expect (Js.Date.getTime (Z.to_date z ())) |> toBe ms));
      Jest.test "reads a string it cannot parse as None" (fun () ->
          E.(
            expect (D.parse_time_opt "noon", D.now_opt "Nowhere/City")
            |> toEqual (None, None)));
      Jest.test "raises Invalid_argument where it throws" (fun () ->
          let raised =
            match D.parse_time "noon" with
            | (_ : D.Types.Time.t) -> None
            | exception Invalid_argument message ->
                Some (String.starts_with ~prefix:"parse_time: " message)
          in
          E.(expect raised |> toEqual (Some true))))
