module T = Testing

let () =
  Jest.describe "settings" (fun () ->
      Jest.afterEach T.cleanup;
      Jest.test "the switch is Kobalte's, and toggles" (fun () ->
          T.render Example.Settings.make;
          let switch = T.by_role "switch" in
          let before = T.checked switch in
          T.click switch;
          Jest.Expect.(
            expect (before, T.checked switch) |> toEqual (false, true))))
