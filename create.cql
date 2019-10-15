CREATE KEYSPACE IF NOT EXISTS test
WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};

use test;


CREATE TYPE IF NOT EXISTS user_data (
   phone text,
   email text,
);

CREATE TABLE IF NOT EXISTS user(
   user_id int,
   data frozen<user_data>,
   login text,
   password text,
   repo_count int,
   PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS repo(
   user_id int,
   user_login text,
   user_repo_count int static,

   repo_id int,
   deep_link text,
   related_link text,
   PRIMARY KEY (user_id, repo_id)
);

CREATE TABLE IF NOT EXISTS doc(
   repo_id int,

   doc_id int,
   path text,
   format text,
   PRIMARY KEY (repo_id, doc_id)
);

CREATE TABLE IF NOT EXISTS note(
   repo_id int,

   note_id int,
   body text,
   meta map<text, frozen <list<text>>>,
   PRIMARY KEY (repo_id, note_id)
);
