DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  message TEXT,
  likes INTEGER
);

INSERT INTO posts (message, likes)
VALUES ('Thanks', 12),
  ('Merci', 4),
  ('Arigato', 4),
  ('Gracias', 15),
  ('Danke', 8);

-- データの並び替え
SELECT *
FROM posts
ORDER BY likes;

SELECT *
FROM posts
ORDER BY likes DESC;

SELECT *
FROM posts
ORDER BY likes DESC,
  message;

SELECT *
FROM posts
ORDER BY likes DESC,
  message
LIMIT 3;

SELECT *
FROM posts
ORDER BY likes DESC,
  message
LIMIT 3 OFFSET 2;

SELECT *
FROM posts
ORDER BY likes DESC,
  message
LIMIT 2, 3;