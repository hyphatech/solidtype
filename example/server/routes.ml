open Spindle.Syntax

(* A repository as GitHub names one, owner and name, since the board links
   to it there. *)
let repo =
  let named s =
    String.length s > 0
    && String.for_all
         (function
           | 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '-' | '_' | '.' -> true
           | _ -> false)
         s
  in
  Wiretype.kind ~kind:"repo" ~doc:"A GitHub repository, owner/name."
    ~parse:(fun s ->
      match String.split_on_char '/' s with
      | [ owner; name ] when named owner && named name -> Ok s
      | _ -> Error "Write the repository as owner/name.")
    ~print:Fun.id
    (Wiretype.string_bounded ~max_length:100 ())

(* A link the page puts in an href: http or https alone, since a
   [javascript:] one would run when it is followed. *)
let link =
  Wiretype.kind ~kind:"link" ~doc:"A page about the task, http or https."
    ~parse:(fun s ->
      let lower = String.lowercase_ascii s in
      if
        String.starts_with ~prefix:"http://" lower
        || String.starts_with ~prefix:"https://" lower
      then Ok s
      else Error "A link starts with http:// or https://.")
    ~print:Fun.id Wiretype.uri

(* Text that names something: spaces alone name nothing, so they are
   refused, and what is kept is kept without the spaces around it. *)
let named ~kind ~max_length message =
  Wiretype.kind ~kind
    ~parse:(fun s ->
      match String.trim s with "" -> Error message | trimmed -> Ok trimmed)
    ~print:Fun.id
    (Wiretype.string_bounded ~min_length:1 ~max_length ())

let name = named ~kind:"name" ~max_length:40 "Give the project a name."
let title = named ~kind:"title" ~max_length:120 "Give the task a title."

let labels =
  Wiretype.list ~max_items:5
    (named ~kind:"label" ~max_length:24 "A label is a word or more.")

type project_draft = {
  name : string; [@with name]
  colour : Store.colour; [@with Store.colour_json]
  repo : (string[@with repo]) option;
}
[@@deriving wiretype]

type draft = {
  project : Store.project_id; [@with Store.project_id_json]
  title : string; [@with title]
  note : string option; [@max_length 200]
  link : (string[@with link]) option;
  labels : string list; [@with labels]
}
[@@deriving wiretype]

type move = { status : Store.status [@with Store.status_json] }
[@@deriving wiretype]

let project_id = Spindle.Path.param "id" Store.project_id_json
let task_id = Spindle.Path.param "id" Store.task_id_json
let by_status = Spindle.Query.optional "status" Store.status_json
let by_project = Spindle.Query.optional "project" Store.project_id_json
let not_found = Spindle.Refusal.Code.not_found

(* A refusal of one field of the body, shown on that field. *)
let refused ~field ~code message =
  Spindle.Refusal.invalid [ { at = "body." ^ field; code; message } ]

let routes =
  [
    Spindle.get ~summary:"The projects, oldest first"
      Spindle.Path.(s "api" / s "projects")
      (Spindle.Returns.json (Wiretype.list Store.project_json))
      (let+ board = Store.dep in
       Store.projects board |> Result.map_error Spindle_sqlite.refusal);
    Spindle.post ~summary:"Start a project"
      Spindle.Path.(s "api" / s "projects")
      (Spindle.Returns.json ~status:`Created Store.project_json)
      (let+ board = Store.dep
       and+ (d : project_draft) = Spindle.json project_draft_json in
       match
         Store.add_project board ~name:d.name ~colour:d.colour ?repo:d.repo ()
       with
       | Ok (Some p) -> Ok p
       | Ok None ->
           Error
             (refused ~field:"name" ~code:"taken"
                "Another project has that name.")
       | Error e -> Error (Spindle_sqlite.refusal e));
    Spindle.delete ~summary:"Remove a project, and its tasks"
      ~refuses:[ not_found ]
      Spindle.Path.(s "api" / s "projects" / project_id)
      (Spindle.Returns.empty ())
      (let+ board = Store.dep and+ id = Spindle.param project_id in
       match Store.remove_project board id with
       | Ok true -> Ok ()
       | Ok false -> Error Spindle.Refusal.not_found
       | Error e -> Error (Spindle_sqlite.refusal e));
    Spindle.get ~summary:"The tasks, newest first"
      Spindle.Path.(s "api" / s "tasks")
      (Spindle.Returns.json (Wiretype.list Store.task_json))
      (let+ board = Store.dep
       and+ project = by_project
       and+ status = by_status in
       Store.tasks ?project ?status board
       |> Result.map_error Spindle_sqlite.refusal);
    Spindle.post ~summary:"Put a task on a project's board"
      Spindle.Path.(s "api" / s "tasks")
      (Spindle.Returns.json ~status:`Created Store.task_json)
      (let+ board = Store.dep and+ (d : draft) = Spindle.json draft_json in
       match
         Store.add board ~project:d.project ~title:d.title ?note:d.note
           ?link:d.link ~labels:d.labels ()
       with
       | Ok (Some t) -> Ok t
       | Ok None ->
           Error (refused ~field:"project" ~code:"missing" "No such project.")
       | Error e -> Error (Spindle_sqlite.refusal e));
    Spindle.put ~summary:"Move a task to another column" ~refuses:[ not_found ]
      Spindle.Path.(s "api" / s "tasks" / task_id / s "status")
      (Spindle.Returns.json Store.task_json)
      (let+ board = Store.dep
       and+ id = Spindle.param task_id
       and+ (m : move) = Spindle.json move_json in
       match Store.move board id m.status with
       | Ok (Some t) -> Ok t
       | Ok None -> Error Spindle.Refusal.not_found
       | Error e -> Error (Spindle_sqlite.refusal e));
    Spindle.delete ~summary:"Take a task off the board" ~refuses:[ not_found ]
      Spindle.Path.(s "api" / s "tasks" / task_id)
      (Spindle.Returns.empty ())
      (let+ board = Store.dep and+ id = Spindle.param task_id in
       match Store.remove board id with
       | Ok true -> Ok ()
       | Ok false -> Error Spindle.Refusal.not_found
       | Error e -> Error (Spindle_sqlite.refusal e));
  ]
