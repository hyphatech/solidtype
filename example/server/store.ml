module S = Rowtype

type status = To_do | Doing | Done [@@deriving wiretype]

type task = { id : int; title : string; note : string option; status : status }
[@@deriving wiretype]

type error = Spindle_sqlite.error

let dep : Spindle_sqlite.Pool.t Spindle.Dep.t = Spindle.Dep.of_resource "board"
let resource pool = Spindle.Dep.resource dep pool

(* The words the migration's check allows, and the API's. *)
let status_column =
  S.enum
    (function To_do -> "to_do" | Doing -> "doing" | Done -> "done")
    [ To_do; Doing; Done ]

let task_row =
  S.map
    (S.t4 S.int S.text (S.opt S.text) status_column)
    ~parse:(fun (id, title, note, status) -> { id; title; note; status })
    ~print:(fun t -> (t.id, t.title, t.note, t.status))

let all =
  S.list ~params:S.unit ~row:task_row
    "select id, title, note, status from tasks order by id desc"

let placed =
  S.list ~params:status_column ~row:task_row
    "select id, title, note, status from tasks where status = $1 order by id \
     desc"

let insert =
  S.find
    ~params:(S.t2 S.text (S.opt S.text))
    ~row:task_row
    "insert into tasks (title, note) values ($1, $2) returning id, title, \
     note, status"

let update_status =
  S.find_opt ~params:(S.t2 status_column S.int) ~row:task_row
    "update tasks set status = $1 where id = $2 returning id, title, note, \
     status"

let delete = S.exec_count ~params:S.int "delete from tasks where id = $1"

let statements =
  [ S.Any all; S.Any placed; S.Any insert; S.Any update_status; S.Any delete ]

let tasks ?status pool =
  match status with
  | None -> Spindle_sqlite.Pool.exec pool all ()
  | Some status -> Spindle_sqlite.Pool.exec pool placed status

let add pool ~title ?note () = Spindle_sqlite.Pool.exec pool insert (title, note)

let move pool id status =
  Spindle_sqlite.Pool.exec pool update_status (status, id)

let remove pool id =
  Spindle_sqlite.Pool.exec pool delete id |> Result.map (fun n -> n > 0)
