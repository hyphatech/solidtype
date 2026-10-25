(* An island is compiled so a page cannot show code that does not compile,
   and one no page shows is code nobody reads: every island of docs/islands
   is on some page of the site, imported by its alias, [@islands/<name>.mlx?raw]
   or [@islands/<name>.jsx], or is a part other islands are built from. *)

let read path = In_channel.with_open_bin path In_channel.input_all

let contains s sub =
  let n = String.length sub in
  let rec at i =
    i + n <= String.length s
    && (String.equal (String.sub s i n) sub || at (i + 1))
  in
  at 0

let islands = "../docs/islands"

let every_island_is_on_a_page () =
  let sources =
    Sys.readdir islands |> Array.to_list
    |> List.filter (fun f ->
        Filename.check_suffix f ".ml" || Filename.check_suffix f ".mlx")
    |> List.map (fun f ->
        (Filename.remove_extension f, read (Filename.concat islands f)))
  in
  let rec pages dir =
    Sys.readdir dir |> Array.to_list
    |> List.concat_map (fun f ->
        let path = Filename.concat dir f in
        if Sys.is_directory path then pages path
        else if Filename.check_suffix f ".md" || Filename.check_suffix f ".mdx"
        then [ read path ]
        else [])
  in
  let docs = String.concat "\n" (pages "../docs/src/content") in
  let shown name = contains docs (Printf.sprintf {|"@islands/%s.|} name) in
  let built_on name =
    List.exists
      (fun (other, source) ->
        (not (String.equal other name))
        && contains source (String.capitalize_ascii name))
      sources
  in
  Alcotest.(check bool) "docs/islands has islands" true (List.length sources > 1);
  Alcotest.(check (list string))
    "an island on no page, and no part of another" []
    (List.filter_map
       (fun (name, _) ->
         if shown name || built_on name then None else Some name)
       sources)

let () =
  Alcotest.run "docs"
    [
      ( "islands",
        [
          Alcotest.test_case "every island is on a page" `Quick
            every_island_is_on_a_page;
        ] );
    ]
