-- add_projects: a task is a project's, and goes through five columns, with
-- labels and a link beside its note. The tasks there are already are put in
-- one project, named for the board they were on. SQLite changes a check
-- only by making the table again, so the tasks are copied across, their ids
-- kept, and the count ids are given from kept with them.

create table projects (
  id integer constraint projects_pk primary key autoincrement,
  name text not null constraint projects_name unique,
  colour text not null
    constraint projects_colour
      check (colour in ('blue', 'green', 'orange', 'purple', 'pink')),
  repo text
) strict;

insert into projects (name, colour)
select 'Board', 'blue' where exists (select 1 from tasks);

create table tasks_by_project (
  id integer constraint tasks_pk primary key autoincrement,
  project integer not null
    constraint tasks_project references projects (id) on delete cascade,
  title text not null,
  note text,
  link text,
  labels text not null default '[]',
  status text not null default 'to_do'
    constraint tasks_status
      check (status in ('backlog', 'to_do', 'doing', 'review', 'done'))
) strict;

insert into tasks_by_project (id, project, title, note, status)
select id, (select id from projects), title, note, status from tasks;

delete from sqlite_sequence where name = 'tasks_by_project';

insert into sqlite_sequence (name, seq)
select 'tasks_by_project', seq from sqlite_sequence where name = 'tasks';

drop table tasks;

alter table tasks_by_project rename to tasks;

create index tasks_of_project on tasks (project);
