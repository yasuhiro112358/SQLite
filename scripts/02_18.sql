DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  message TEXT,
  likes INTEGER
);

INSERT INTO posts (message, likes)
VALUES ('post-1', 12),
  ('post-2', 8),
  ('post-3', 11),
  ('post-4', 3),
  ('post-5', 5),
  ('post-6', 9),
  ('post-7', 4),
  ('post-8', 10),
  ('post-9', 31);



SELECT *
FROM posts;


-- START TRANSACTIONの代わりにBEGIN TRANSACTIONを使う
BEGIN TRANSACTION;

UPDATE posts
SET likes = likes - 1
WHERE id = 1;

UPDATE posts
SET likes = likes + 1
WHERE id = 2;

-- COMMIT;

ROLLBACK;

SELECT *
FROM posts;