DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  -- Primary keyはキーワードによりカラムに直接設定
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  message TEXT,
  likes INTEGER
);

INSERT INTO posts (message, likes)
VALUES ('Thanks', 12),
  ('Arigato', 4),
  ('Merci', 4);

SELECT *
FROM posts;