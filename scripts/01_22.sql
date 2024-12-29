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
  ('ありがとう', 4),
  ('Gracias', 15),
  ('Danke', 8);

-- SQLiteではSUBSTRINGの代わりにSUBSTRを使用します
SELECT message,
  SUBSTR(message, 3)
FROM posts;

SELECT message,
  SUBSTR(message, 3, 2)
FROM posts;

SELECT message,
  SUBSTR(message, -2)
FROM posts;

-- SQLiteではCONCAT関数がないため、|| 演算子を使用します
SELECT message || ' - ' || likes
FROM posts;

-- SQLiteではCHAR_LENGTH関数はLENGTH関数と同じです
SELECT message,
  LENGTH(message) AS len
FROM posts;