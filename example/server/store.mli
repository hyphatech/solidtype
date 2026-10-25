(** The tasks on a board, kept in SQLite, newest first, in the table the
    migrations in [example/migrations] make, which [rowtype-migrate] applies
    before the server starts. *)

(** Where a task is on the board. *)
type status = To_do | Doing | Done

val status_json : status Wiretype.t

type task = {
  id : int;
  title : string;
  note : string option;  (** A line more about it, when there is one. *)
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

val tasks : ?status:status -> Spindle_sqlite.Pool.t -> (task list, error) result
(** Every task, or those with [status]. *)

val add :
  Spindle_sqlite.Pool.t ->
  title:string ->
  ?note:string ->
  unit ->
  (task, error) result
(** A task put on the board, to do. *)

val move : Spindle_sqlite.Pool.t -> int -> status -> (task option, error) result
(** The task [id] at [status], [None] when there is none. *)

val remove : Spindle_sqlite.Pool.t -> int -> (bool, error) result
(** Whether the task [id] was there to take off the board. *)

val statements : Rowtype.any list
(** Every statement the store runs, for [Rowtype_sqlite.verify] to hold to the
    table the migrations make. *)
