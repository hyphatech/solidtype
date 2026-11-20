module Jsx = Solidtype.Jsx

type 'row sort = By_text of ('row -> string) | By of ('row -> 'row -> int)

type header =
  | Text of string
  | Element of (unit -> Jsx.element)
  | Sorted of ([ `ascending | `descending ] option -> Jsx.element)

type 'row column = {
  id : string;
  header : header;
  cell : 'row Solidtype.Solid.accessor -> Jsx.element;
  sort : 'row sort option;
  is_row_header : bool;
  width : Table.column_size option;
  default_width : Table.column_size option;
  min_width : float option;
  max_width : float option;
  allows_resizing : bool;
  align : [ `start | `center | `end_ ];
  pinned : [ `start | `end_ ] option;
  header_class : string option;
  cell_class : string option;
}

let column ~id ~header ?sort ?(is_row_header = false) ?width ?default_width
    ?min_width ?max_width ?(allows_resizing = false) ?(align = `start) ?pinned
    ?header_class ?cell_class cell =
  {
    id;
    header;
    cell;
    sort;
    is_row_header;
    width;
    default_width;
    min_width;
    max_width;
    allows_resizing;
    align;
    pinned;
    header_class;
    cell_class;
  }

let sorted ~compare_text columns (descriptor : Table.sort_descriptor option)
    rows =
  let by =
    Option.bind descriptor (fun (d : Table.sort_descriptor) ->
        Option.bind
          (Array.find_opt (fun c -> String.equal c.id d.column) columns)
          (fun c ->
            Option.map
              (fun sort ->
                let compare =
                  match sort with
                  | By_text text -> fun a b -> compare_text (text a) (text b)
                  | By compare -> compare
                in
                match d.direction with
                | `ascending -> compare
                | `descending -> fun a b -> compare b a)
              c.sort))
  in
  match by with
  | None -> rows
  | Some compare ->
      let copy = Array.copy rows in
      Array.stable_sort compare copy;
      copy

let reordered ~row_id rows (r : Table.reorder) =
  let moved row = Array.exists (String.equal (row_id row)) r.keys in
  if
    Array.exists (String.equal r.target) r.keys
    || not (Array.exists (fun row -> String.equal (row_id row) r.target) rows)
  then rows
  else
    let carried = List.filter moved (Array.to_list rows) in
    Array.of_list
      (List.concat_map
         (fun row ->
           if moved row then []
           else if String.equal (row_id row) r.target then
             match r.position with
             | `before -> carried @ [ row ]
             | `after -> row :: carried
           else [ row ])
         (Array.to_list rows))
