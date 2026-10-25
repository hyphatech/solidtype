-- create_tasks: the board's tasks, which the store owns. An id is never
-- given again, so a page that still shows a task taken off the board
-- cannot move another.

create table tasks (
  id integer constraint tasks_pk primary key autoincrement,
  title text not null,
  note text,
  status text not null default 'to_do'
    constraint tasks_status check (status in ('to_do', 'doing', 'done'))
) strict;
