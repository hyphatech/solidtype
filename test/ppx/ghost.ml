(* The props check is no one's code, and a linter reads locations. *)

open Ppxlib [@@litany.allow
              "open-of-ordinary-module: the AST's constructors are matched"]

let () =
  match Ast_io.read_binary Sys.argv.(1) with
  | Error e ->
      prerr_endline e;
      exit 2
  | Ok bin -> (
      match Ast_io.get_ast bin with
      | Intf _ ->
          prerr_endline "an interface, where the lowering is an implementation";
          exit 2
      | Impl structure -> (
          let unmarked = ref [] in
          let iter =
            object
              inherit Ast_traverse.iter as super

              method! expression e =
                (match e.pexp_desc with
                | Pexp_ifthenelse
                    ( ({
                         pexp_desc =
                           Pexp_construct ({ txt = Lident "false"; _ }, None);
                         _;
                       } as condition),
                      _,
                      _ )
                  when not (e.pexp_loc.loc_ghost && condition.pexp_loc.loc_ghost)
                  ->
                    unmarked := e.pexp_loc :: !unmarked
                | _ -> ());
                super#expression e
            end
          in
          iter#structure structure;
          List.iter
            (fun (loc : location) ->
              Printf.printf "line %d: an if false not at a ghost location\n"
                loc.loc_start.pos_lnum)
            (List.rev !unmarked);
          match !unmarked with [] -> () | _ :: _ -> exit 1))
