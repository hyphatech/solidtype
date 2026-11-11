-- A board to look at: three projects and their tasks, put on a new
-- database by `make example-serve`, never by a migration, so a test's
-- database starts empty.

insert into projects (id, name, colour, repo) values
  (1, 'API', 'blue', 'acme/api'),
  (2, 'Docs', 'green', null),
  (3, 'Website', 'orange', 'acme/website');

insert into tasks (id, project, title, note, link, labels, status) values
  (1, 1, 'Paginate the audit log', 'Cursor, not offset.', null, '["backend"]', 'backlog'),
  (2, 1, 'Drop Node 18 from CI', null, null, '[]', 'backlog'),
  (3, 1, 'Cache product images on the CDN', 'Images are 40% of the bandwidth.', null, '["perf"]', 'to_do'),
  (4, 1, 'Renew the TLS certificate', 'Through the registrar, before Nov 30.', null, '[]', 'to_do'),
  (5, 1, 'Log slow queries over 200 ms', 'Add the query and its plan to the log.', null, '[]', 'to_do'),
  (6, 1, 'Remove the v1 endpoints', 'Nobody has called them in 90 days.', null, '[]', 'to_do'),
  (7, 1, 'Fix the login redirect loop', 'Users with an expired session get sent back to the login page.', null, '["bug"]', 'doing'),
  (8, 1, 'Retry failed webhooks', 'Back off: 1 min, 5 min, 30 min, then give up.', null, '[]', 'doing'),
  (9, 1, 'Rate limit the export endpoint', 'Big exports slow the database for everyone. Limit each key.', 'https://github.com/acme/api/issues/9', '["backend"]', 'doing'),
  (10, 1, 'Add a health check', null, null, '[]', 'done'),
  (11, 1, 'Rotate the signing keys', null, null, '["security"]', 'done'),
  (12, 1, 'Sketch the billing API', 'Plans, invoices, usage.', null, '[]', 'backlog'),
  (13, 2, 'Write the getting-started guide', null, null, '["docs"]', 'to_do'),
  (14, 3, 'Compress the hero image', null, null, '["perf"]', 'review'),
  (15, 1, 'Index orders by date', 'The monthly report reads the whole table.', 'https://github.com/acme/api/pull/42', '["perf"]', 'review'),
  (16, 1, 'Check webhook signatures', null, null, '["security"]', 'review');
