(* HeroUI's variant functions through the generated binding: each gives the
   classes HeroUI's own call gives for the same options. *)

module Styles = Solidtype_heroui.Styles
module E = Jest.Expect

let () =
  Jest.describe "Styles" (fun () ->
      Jest.test "a variant function gives its class string" (fun () ->
          E.(
            expect
              (Styles.Button.classes
                 (Styles.Button.options ~variant:`danger_soft ~size:`lg ()))
            |> toBe "button button--lg button--danger-soft"));
      Jest.test "a component of several parts gives a class string per part"
        (fun () ->
          let parts =
            Styles.Checkbox.slots
              (Styles.Checkbox.options ~variant:`secondary ())
          in
          E.(
            expect (Styles.Checkbox.base parts, Styles.Checkbox.indicator parts)
            |> toEqual ("checkbox checkbox--secondary", "checkbox__indicator")));
      Jest.test "a key with a hyphen reaches HeroUI as it writes it" (fun () ->
          E.(
            expect
              (Styles.Badge.base
                 (Styles.Badge.slots
                    (Styles.Badge.options ~placement:`bottom_left ())))
            |> toBe
                 "badge badge--default badge--bottom-left badge--md \
                  badge--primary"));
      Jest.test "a key with a space reaches HeroUI as it writes it" (fun () ->
          E.(
            expect
              (Styles.Toast.region
                 (Styles.Toast.slots
                    (Styles.Toast.options ~placement:`bottom_end ())))
            |> toBe "toast-region toast-region--bottom-end")))
