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
  ('post-5', NULL),
  ('post-6', 9),
  ('post-7', 4),
  ('post-8', NULL),
  ('post-9', 31);


SELECT *
FROM posts;

-- カウントのクエリ
SELECT COUNT(likes)
FROM posts;

SELECT COUNT(id)
FROM posts;

SELECT COUNT(*)
FROM posts;

-- 集計関数のクエリ
SELECT SUM(likes)
FROM posts;

SELECT AVG(likes)
FROM posts;

SELECT MAX(likes)
FROM posts;

SELECT MIN(likes)
FROM posts;