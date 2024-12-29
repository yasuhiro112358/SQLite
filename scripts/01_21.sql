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

SELECT likes * 500 / 3.0 AS bonus,
  -- SQLiteではFLOOR関数がないため、CASTを使用
  CAST(likes * 500 / 3.0 AS INTEGER) AS floor,
  -- SQLiteではCEIL関数がないため、CASTを使用
  CAST(likes * 500 / 3.0 + 0.999999 AS INTEGER) AS ceil,
  ROUND(likes * 500 / 3.0) AS round,
  ROUND(likes * 500 / 3.0, 2) AS round
FROM posts;