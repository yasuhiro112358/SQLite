PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS comments;

DROP TABLE IF EXISTS posts;

DROP TABLE IF EXISTS logs;

DROP TRIGGER IF EXISTS posts_update_trigger;

CREATE TABLE posts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  message TEXT
);

CREATE TABLE logs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  message TEXT,
  created NUMERIC DEFAULT (datetime('now'))
);

CREATE TRIGGER posts_update_trigger
AFTER UPDATE ON posts 
FOR EACH ROW 
BEGIN
  INSERT INTO logs (message)
  VALUES (OLD.message || ' -> ' || NEW.message);
END;

INSERT INTO posts (message)
VALUES ('post-1'),
  ('post-2'),
  ('post-3');

UPDATE posts
SET message = 'post-1 updated'
WHERE id = 1;

SELECT *
FROM posts;

SELECT *
FROM logs;

-- トリガーの表示
SELECT name,
  tbl_name,
  sql
FROM sqlite_master
WHERE type = 'trigger';