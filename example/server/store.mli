(** The projects and their tasks, kept in SQLite, in the tables the migrations
    in [example/migrations] make, which [rowtype-migrate] applies before the
    server starts. *)

type project_id = private int
(** A project's, never given again once the project is removed. *)

val project_id_json : project_id Wiretype.t

type task_id = private int
(** A task's, never given again once the task is off the board. *)

val task_id_json : task_id Wiretype.t

(** The colour a project is told apart by. *)
type colour = Blue | Green | Orange | Purple | Pink

val colour_json : colour Wiretype.t
(** Each colour as its word, [blue] to [pink]: the API's, and the column's. *)

type project = {
  id : project_id;
  name : string;
  colour : colour;
  repo : string option;  (** Its code's repository on GitHub, [owner/name]. *)
  open_tasks : int;  (** Its tasks not yet done. *)
}

val project_json : project Wiretype.t

(** Where a task is on the board, a column each, in the order work goes. *)
type status = Backlog | To_do | Doing | Review | Done

val status_json : status Wiretype.t
(** Each status as its word, [backlog] to [done]: the API's, and the column's.
*)

type task = {
  id : task_id;
  project : project_id;
  title : string;
  note : string option;  (** A line more about it, when there is one. *)
  link : string option;  (** A page about it, http or https. *)
  labels : string list;
  status : status;
}

val task_json : task Wiretype.t

type error = Spindle_sqlite.error
(** A statement's failure, or the pool's, which {!Spindle_sqlite.refusal}
    answers. *)

val dep : Spindle_sqlite.Pool.t Spindle.Dep.t
(** The board's database, as a route reads it. *)

val resource : Spindle_sqlite.Pool.t -> Spindle.Dep.resource
(** [pool] as the one {!dep} reads, for [Spindle.serve ~resources]. *)

val projects : Spindle_sqlite.Pool.t -> (project list, error) result
(** Every project, oldest first. *)

val add_project :
  Spindle_sqlite.Pool.t ->
  name:string ->
  colour:colour ->
  ?repo:string ->
  unit ->
  (project option, error) result
(** A project with no tasks, [None] when another has its name. *)

val remove_project : Spindle_sqlite.Pool.t -> project_id -> (bool, error) result
(** Whether the project [id] was there to remove, with its tasks. *)

val tasks :
  ?project:project_id ->
  ?status:status ->
  Spindle_sqlite.Pool.t ->
  (task list, error) result
(** Every task, or those of [project], or at [status], newest first. *)

val add :
  Spindle_sqlite.Pool.t ->
  project:project_id ->
  title:string ->
  ?note:string ->
  ?link:string ->
  labels:string list ->
  unit ->
  (task option, error) result
(** A task put on [project]'s board, to do, [None] when there is no such
    project. *)

val move :
  Spindle_sqlite.Pool.t -> task_id -> status -> (task option, error) result
(** The task [id] at [status], [None] when there is none. *)

val remove : Spindle_sqlite.Pool.t -> task_id -> (bool, error) result
(** Whether the task [id] was there to take off the board. *)

val statements : Rowtype.any list
(** Every statement the store runs, for [Rowtype_sqlite.verify] to hold to the
    tables the migrations make. *)
