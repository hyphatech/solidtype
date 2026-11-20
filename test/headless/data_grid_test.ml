(* A data grid's rows as its model gives them back: sorted by a column's text
   or its comparison, ascending or turned, ties kept in the order given and
   the rows given untouched; and reordered by a drop, before or after a row,
   one row or several, and left as they are by a drop that names no row to
   land by. *)

module Jsx = Solidtype.Jsx
module Data_grid = Solidtype_headless.Data_grid
module E = Jest.Expect

type deal = { id : string; company : string; amount : float }

let deals =
  [|
    { id = "1"; company = "beta"; amount = 30. };
    { id = "2"; company = "Alpha"; amount = 10. };
    { id = "3"; company = "gamma"; amount = 30. };
    { id = "4"; company = "Delta"; amount = 20. };
  |]

let ids rows = Array.map (fun d -> d.id) rows
let text d = Jsx.string (Solidtype.Solid.get d).company

let columns =
  [|
    Data_grid.column ~id:"company" ~header:(Text "Company")
      ~sort:(By_text (fun d -> d.company))
      text;
    Data_grid.column ~id:"amount" ~header:(Text "Amount")
      ~sort:(By (fun a b -> Float.compare a.amount b.amount))
      text;
    Data_grid.column ~id:"note" ~header:(Text "Note") text;
  |]

(* The page's order ignores case, as a collation for a language does. *)
let compare_text a b =
  String.compare (String.lowercase_ascii a) (String.lowercase_ascii b)

let sort column direction =
  ids
    (Data_grid.sorted ~compare_text columns (Some { column; direction }) deals)

let () =
  Jest.describe "Data_grid.sorted" (fun () ->
      Jest.test "orders the rows by a column's text, in the page's order"
        (fun () ->
          E.(
            expect (sort "company" `ascending, sort "company" `descending)
            |> toEqual ([| "2"; "1"; "4"; "3" |], [| "3"; "4"; "1"; "2" |])));
      Jest.test "orders them by a column's comparison, ties as given" (fun () ->
          E.(
            expect (sort "amount" `ascending, sort "amount" `descending)
            |> toEqual ([| "2"; "4"; "1"; "3" |], [| "1"; "3"; "4"; "2" |])));
      Jest.test "leaves them as given with no sort, or none it can follow"
        (fun () ->
          let given = Array.copy deals in
          let _sorted : deal array =
            Data_grid.sorted ~compare_text columns
              (Some { column = "company"; direction = `ascending })
              given
          in
          E.(
            expect
              ( ids (Data_grid.sorted ~compare_text columns None deals),
                sort "note" `ascending,
                sort "missing" `ascending,
                ids given )
            |> toEqual
                 ( [| "1"; "2"; "3"; "4" |],
                   [| "1"; "2"; "3"; "4" |],
                   [| "1"; "2"; "3"; "4" |],
                   [| "1"; "2"; "3"; "4" |] ))))

let reorder keys position target =
  ids
    (Data_grid.reordered
       ~row_id:(fun d -> d.id)
       deals { keys; target; position })

let () =
  Jest.describe "Data_grid.reordered" (fun () ->
      Jest.test "puts a row before or after the row it lands by" (fun () ->
          E.(
            expect (reorder [| "1" |] `before "4", reorder [| "4" |] `after "1")
            |> toEqual ([| "2"; "3"; "1"; "4" |], [| "1"; "4"; "2"; "3" |])));
      Jest.test "moves several rows together, in their order" (fun () ->
          E.(
            expect (reorder [| "3"; "1" |] `after "4")
            |> toEqual [| "2"; "4"; "1"; "3" |]));
      Jest.test "leaves the rows as they are by a drop on no row to land by"
        (fun () ->
          E.(
            expect
              (reorder [| "1"; "2" |] `after "2", reorder [| "1" |] `before "9")
            |> toEqual ([| "1"; "2"; "3"; "4" |], [| "1"; "2"; "3"; "4" |]))))
