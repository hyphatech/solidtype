module T = Testing

let () =
  Jest.describe "counter" (fun () ->
      Jest.afterEach T.cleanup;
      Jest.test "counts its clicks, in its text and its class" (fun () ->
          T.render Example.Counter.make;
          let button = T.by_role "button" in
          let before = (T.text button, T.class_name button) in
          T.click button;
          let once = (T.text button, T.class_name button) in
          T.click button;
          T.click button;
          let thrice = (T.text button, T.class_name button) in
          Jest.Expect.(
            expect [| before; once; thrice |]
            |> toEqual
                 [|
                   ("Clicked 0times", "cold");
                   ("Clicked 1time", "cold");
                   ("Clicked 3times", "hot");
                 |])))
