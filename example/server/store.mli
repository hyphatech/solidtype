(** The tasks on a board, kept in memory, newest first, and the rules a change
    to one keeps. *)

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

type t
(** A board, safe to share between the server's domains. *)

val create : unit -> t
(** An empty board. *)

val dep : t Spindle.Dep.t
(** The board, as a route reads it. *)

val resource : t -> Spindle.Dep.resource
(** [board] as the one {!dep} reads, for [Spindle.serve ~resources]. *)

val tasks : ?status:status -> t -> task list
(** Every task, or those with [status]. *)

val add : t -> title:string -> ?note:string -> unit -> task
(** A task put on the board, to do. *)

val move : t -> int -> status -> task option
(** The task [id] at [status], [None] when there is none. *)

val remove : t -> int -> bool
(** Whether the task [id] was there to take off the board. *)
