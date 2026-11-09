(* An island is compiled so a page cannot show code that does not compile,
   and one no page shows is code nobody reads: every island of docs/islands
   is on some page of the site, imported by its alias, [@islands/<name>.mlx?raw]
   or [@islands/<name>.jsx], or is a part other islands are built from. *)

let read path = In_channel.with_open_bin path In_channel.input_all

let index_of s sub =
  let n = String.length sub in
  let rec at i =
    if i + n > String.length s then None
    else if String.equal (String.sub s i n) sub then Some i
    else at (i + 1)
  in
  at 0

let contains s sub = Option.is_some (index_of s sub)
let islands = "../docs/islands"

(* Every page of the site under [dir], each read whole. *)
let rec pages dir =
  Sys.readdir dir |> Array.to_list
  |> List.concat_map (fun f ->
      let path = Filename.concat dir f in
      if Sys.is_directory path then pages path
      else if Filename.check_suffix f ".md" || Filename.check_suffix f ".mdx"
      then [ read path ]
      else [])

let every_island_is_on_a_page () =
  let sources =
    Sys.readdir islands |> Array.to_list
    (* An island is <name>.ml or <name>.mlx; older dunes leave <name>.mlx.ml
       and <name>.mlx.pp.ml beside it, which are none. *)
    |> List.filter (fun f ->
        (Filename.check_suffix f ".ml" || Filename.check_suffix f ".mlx")
        && not (String.contains (Filename.remove_extension f) '.'))
    |> List.map (fun f ->
        (Filename.remove_extension f, read (Filename.concat islands f)))
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

(* rhp's own documentation is the reference for what a prop does: a page of
   ours says how it is written in OCaml, and links to rhp's it follows. *)
let every_rhp_page_links_to_rhp () =
  let dir = "../docs/src/content/docs/rhp" in
  let pages =
    Sys.readdir dir |> Array.to_list
    |> List.filter (fun f -> Filename.check_suffix f ".mdx")
  in
  Alcotest.(check bool)
    "the rhp section has pages" true
    (not (List.is_empty pages));
  Alcotest.(check (list string))
    "an rhp page with no link to rhp's documentation" []
    (List.filter
       (fun f ->
         not (contains (read (Filename.concat dir f)) "https://rhp.vercel.app/"))
       pages)

(* llms.txt is written by hand, the site's index for a model: it lists every
   page by its URL, and lists no page the site does not have. *)
let site = "https://hyphatech.github.io/solidtype/"

let llms_txt_lists_every_page () =
  let docs = "../docs/src/content/docs" in
  let rec slugs dir =
    Sys.readdir (Filename.concat docs dir)
    |> Array.to_list
    |> List.concat_map (fun f ->
        let path = if String.equal dir "" then f else dir ^ "/" ^ f in
        if Sys.is_directory (Filename.concat docs path) then slugs path
        else if Filename.check_suffix f ".md" || Filename.check_suffix f ".mdx"
        then
          let name = Filename.remove_extension f in
          if String.equal name "index" then
            [ (if String.equal dir "" then "" else dir ^ "/") ]
          else [ Filename.remove_extension path ^ "/" ]
        else [])
  in
  let pages = slugs "" in
  let llms = read "../docs/public/llms.txt" in
  let linked =
    String.split_on_char '(' llms
    |> List.filter_map (fun after ->
        match String.index_opt after ')' with
        | None -> None
        | Some close ->
            let url = String.sub after 0 close in
            let n = String.length site in
            if
              String.starts_with ~prefix:site url
              && String.ends_with ~suffix:"/" url
            then Some (String.sub url n (String.length url - n))
            else None)
  in
  Alcotest.(check bool) "the site has pages" true (List.length pages > 1);
  Alcotest.(check (list string))
    "a page llms.txt does not list" []
    (List.filter (fun page -> not (List.mem page linked)) pages);
  Alcotest.(check (list string))
    "a page llms.txt lists that the site does not have" []
    (List.filter (fun page -> not (List.mem page pages)) linked)

(* The Vite plugin is a release's asset, named by its URL, so a page that
   installs it names the newest release CHANGES.md records: the release
   commit that dates its entry moves the pages with it. *)
let pages_install_the_released_plugin () =
  let released =
    read "../CHANGES.md" |> String.split_on_char '\n'
    |> List.find_map (fun line ->
        match String.split_on_char ' ' line with
        | "##" :: version :: _ when not (String.equal version "Unreleased") ->
            Some version
        | _ -> None)
  in
  let rec version_after = function
    | "releases" :: "download" :: version :: _ -> Some version
    | _ :: rest -> version_after rest
    | [] -> None
  in
  let named =
    pages "../docs/src/content"
    |> List.concat_map (String.split_on_char '\n')
    |> List.filter_map (fun line ->
        version_after (String.split_on_char '/' line))
  in
  Alcotest.(check bool)
    "CHANGES.md records a release" true (Option.is_some released);
  Alcotest.(check bool)
    "a page installs the plugin" true
    (not (List.is_empty named));
  Alcotest.(check (list string))
    "a plugin's release that is not the newest" []
    (List.filter
       (fun version -> not (Option.equal String.equal (Some version) released))
       named)

(* As an rhp page does, a port's page names HeroUI's page it follows before
   its usage, where a reader starts. A port is what the coverage page says is
   ported. *)
let every_port_links_to_heroui_first () =
  let dir = "../docs/src/content/docs/heroui" in
  let ports =
    read (Filename.concat dir "coverage.mdx")
    |> String.split_on_char '\n'
    |> List.filter_map (fun row ->
        match String.split_on_char '|' row with
        | "" :: link :: status :: _
          when String.starts_with ~prefix:" ported" status -> (
            match String.split_on_char '/' link with
            | _ :: "solidtype" :: "heroui" :: slug :: _ -> Some slug
            | _ -> None)
        | _ -> None)
  in
  Alcotest.(check bool)
    "the coverage page lists ports" true
    (List.length ports > 1);
  Alcotest.(check (list string))
    "a port with no link to HeroUI's documentation before its usage" []
    (List.filter
       (fun slug ->
         let page = read (Filename.concat dir (slug ^ ".mdx")) in
         match
           (index_of page "\nOriginal HeroUI ", index_of page "\n## Usage\n")
         with
         | Some link, Some usage -> link > usage
         | Some _, None | None, _ -> true)
       ports)

let () =
  Alcotest.run "docs"
    [
      ( "islands",
        [
          Alcotest.test_case "every island is on a page" `Quick
            every_island_is_on_a_page;
        ] );
      ( "rhp",
        [
          Alcotest.test_case "every page links to rhp's" `Quick
            every_rhp_page_links_to_rhp;
        ] );
      ( "llms.txt",
        [
          Alcotest.test_case "lists every page" `Quick llms_txt_lists_every_page;
        ] );
      ( "install",
        [
          Alcotest.test_case "the newest release's plugin" `Quick
            pages_install_the_released_plugin;
        ] );
      ( "heroui",
        [
          Alcotest.test_case "every port links to HeroUI's first" `Quick
            every_port_links_to_heroui_first;
        ] );
    ]
