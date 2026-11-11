module S = Rowtype

type project_id = int
type task_id = int
type colour = Blue | Green | Orange | Purple | Pink

let colour_word = function
  | Blue -> "blue"
  | Green -> "green"
  | Orange -> "orange"
  | Purple -> "purple"
  | Pink -> "pink"

let colours = [ Blue; Green; Orange; Purple; Pink ]

type status = Backlog | To_do | Doing | Review | Done

let status_word = function
  | Backlog -> "backlog"
  | To_do -> "to_do"
  | Doing -> "doing"
  | Review -> "review"
  | Done -> "done"

let statuses = [ Backlog; To_do; Doing; Review; Done ]
let project_id_json = Wiretype.int
let task_id_json = Wiretype.int
let colour_json = Wiretype.enum ~kind:"colour" colour_word colours
let status_json = Wiretype.enum ~kind:"status" status_word statuses

type project = {
  id : project_id;
  name : string;
  colour : colour;
  repo : string option;
  open_tasks : int;
}
[@@deriving wiretype]

type task = {
  id : task_id;
  project : project_id;
  title : string;
  note : string option;
  link : string option;
  labels : string list;
  status : status;
}
[@@deriving wiretype]

type error = Spindle_sqlite.error

let dep : Spindle_sqlite.Pool.t Spindle.Dep.t = Spindle.Dep.of_resource "board"
let resource pool = Spindle.Dep.resource dep pool
let colour_column = S.enum colour_word colours
let status_column = S.enum status_word statuses

let project_row =
  S.map
    (S.t5 S.int S.text colour_column (S.opt S.text) S.int)
    ~parse:(fun (id, name, colour, repo, open_tasks) ->
      { id; name; colour; repo; open_tasks })
    ~print:(fun p -> (p.id, p.name, p.colour, p.repo, p.open_tasks))

let task_row =
  S.map
    (S.t7 S.int S.int S.text (S.opt S.text) (S.opt S.text) (S.array S.text)
       status_column)
    ~parse:(fun (id, project, title, note, link, labels, status) ->
      { id; project; title; note; link; labels; status })
    ~print:(fun t ->
      (t.id, t.project, t.title, t.note, t.link, t.labels, t.status))

let all_projects =
  S.list ~params:S.unit ~row:project_row
    "select p.id, p.name, p.colour, p.repo, (select count(*) from tasks t \
     where t.project = p.id and t.status <> 'done') from projects p order by \
     p.id"

let insert_project =
  S.find_opt
    ~params:(S.t3 S.text colour_column (S.opt S.text))
    ~row:project_row
    "insert into projects (name, colour, repo) values ($1, $2, $3) on conflict \
     (name) do nothing returning id, name, colour, repo, 0"

(* Its tasks go with it, by the migration's [on delete cascade]. *)
let delete_project =
  S.exec_count ~params:S.int "delete from projects where id = $1"

let some_tasks =
  S.list
    ~params:(S.t2 (S.opt S.int) (S.opt status_column))
    ~row:task_row
    "select id, project, title, note, link, labels, status from tasks where \
     ($1 is null or project = $1) and ($2 is null or status = $2) order by id \
     desc"

let insert =
  S.find_opt
    ~params:(S.t5 S.int S.text (S.opt S.text) (S.opt S.text) (S.array S.text))
    ~row:task_row
    "insert into tasks (project, title, note, link, labels) select id, $2, $3, \
     $4, $5 from projects where id = $1 returning id, project, title, note, \
     link, labels, status"

let update_status =
  S.find_opt ~params:(S.t2 status_column S.int) ~row:task_row
    "update tasks set status = $1 where id = $2 returning id, project, title, \
     note, link, labels, status"

let delete = S.exec_count ~params:S.int "delete from tasks where id = $1"

let statements =
  [
    S.Any all_projects;
    S.Any insert_project;
    S.Any delete_project;
    S.Any some_tasks;
    S.Any insert;
    S.Any update_status;
    S.Any delete;
  ]

let projects pool = Spindle_sqlite.Pool.exec pool all_projects ()

let add_project pool ~name ~colour ?repo () =
  Spindle_sqlite.Pool.exec pool insert_project (name, colour, repo)

let remove_project pool id =
  Spindle_sqlite.Pool.exec pool delete_project id |> Result.map (fun n -> n > 0)

let tasks ?project ?status pool =
  Spindle_sqlite.Pool.exec pool some_tasks (project, status)

let add pool ~project ~title ?note ?link ~labels () =
  Spindle_sqlite.Pool.exec pool insert (project, title, note, link, labels)

let move pool id status =
  Spindle_sqlite.Pool.exec pool update_status (status, id)

let remove pool id =
  Spindle_sqlite.Pool.exec pool delete id |> Result.map (fun n -> n > 0)
