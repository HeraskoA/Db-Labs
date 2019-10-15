use test;
INSERT INTO user (user_id, data, login, password, repo_count) VALUES (1, {"phone":'test1', "email": 'test1'}, 'test1', 'test4', 1);
INSERT INTO user (user_id, data, login, password, repo_count) VALUES (2, {"phone":'test2', "email": 'test2'}, 'test2', 'test5', 2);
INSERT INTO user (user_id, data, login, password, repo_count) VALUES (3, {"phone":'test3', "email": 'test3'}, 'test3', 'test6', 3);

SELECT * FROM user;

INSERT INTO repo (repo_id, user_id, deep_link, related_link) VALUES (1, 1, 'ds', 'sdg');
INSERT INTO repo (repo_id, user_id, deep_link, related_link) VALUES (2, 1, 'sdg', 'sg');
INSERT INTO repo (repo_id, user_id, deep_link, related_link) VALUES (3, 2, 'sdg', 'sdg');

SELECT * FROM repo;

INSERT INTO doc (doc_id, repo_id, path, format) VALUES (1, 1, 'sdg', 'pdf');
INSERT INTO doc (doc_id, repo_id, path, format) VALUES (2, 1, 'sdg', 'xml');
INSERT INTO doc (doc_id, repo_id, path, format) VALUES (3, 1, 'sdg', 'jpg');

SELECT * FROM doc;

INSERT INTO note (note_id, repo_id, body, meta) VALUES (1, 1, 'test_body', {'tags': ['lol1', 'dbis1']});
INSERT INTO note (note_id, repo_id, body, meta) VALUES (2, 1, 'test_body', {'tags': ['lol2', 'dbis2']});
INSERT INTO note (note_id, repo_id, body, meta) VALUES (3, 2, 'test_body', {'tags': ['lol3', 'dbis3']});


SELECT * FROM note;



UPDATE user
SET
	data = {
		 phone: 'test',
		 email: 'test'
		},
	repo_count = 3
WHERE user_id = 1 IF EXISTS;

SELECT * FROM user;

UPDATE user
SET repo_count = 1
WHERE user_id = 2 IF EXISTS;

SELECT * FROM user;

UPDATE user
SET login = 'qeqtqw'
WHERE user_id = 2 IF EXISTS;

SELECT * FROM user;


UPDATE repo
SET deep_link = 'asfsaf'
WHERE user_id = 1  AND repo_id = 1 IF EXISTS;

SELECT * FROM repo;


UPDATE repo
SET related_link = 'asfsaf1'
WHERE repo_id = 1 AND user_id = 1 IF EXISTS;

SELECT * FROM repo;


UPDATE repo
SET related_link = 'hfhg'
WHERE repo_id = 1 AND user_id = 1 IF EXISTS;

SELECT * FROM repo;




UPDATE doc
SET path = 'asfasf'
WHERE doc_id = 1 and repo_id = 1 IF EXISTS;

SELECT * FROM doc;


UPDATE doc
SET format = 'jog'
WHERE doc_id = 2 and repo_id = 2 IF EXISTS;

SELECT * FROM doc;


UPDATE doc
SET format = 'html'
WHERE doc_id = 3 and repo_id = 1 IF EXISTS;

SELECT * FROM doc;



UPDATE note
SET body = 'asfasf'
WHERE note_id = 2 and repo_id = 2 IF EXISTS;

SELECT * FROM note;



UPDATE note
SET 
	meta= {
		'tags': ['ta1', 'ta2', 'ta3']
	}
WHERE note_id = 2 and repo_id = 2 IF EXISTS;

SELECT * FROM note;

UPDATE note
SET body = 'wef'
WHERE note_id = 3 and repo_id = 2 IF EXISTS;

SELECT * FROM note;



select * from user where user_id = 1;
select * from repo where user_id = 2;
select * from doc where repo_id = 1;
select * from note where repo_id = 2;


delete from user where user_id = 1;
delete from user where user_id = 2;
delete from user where user_id = 3;



delete from repo where user_id = 1 and repo_id = 1;
delete from repo where user_id = 1 and repo_id = 2;
delete from repo where user_id = 2 and repo_id = 3;


delete from doc where doc_id = 1 and repo_id = 1;
delete from doc where doc_id = 2 and repo_id = 1;
delete from doc where doc_id = 3 and repo_id = 1;


delete from note where note_id = 1 and repo_id = 1;
delete from note where note_id = 2 and repo_id = 1;
delete from note where note_id = 3 and repo_id = 2;
