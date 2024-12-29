DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  message TEXT,
  likes INTEGER,
  area TEXT
);

INSERT INTO posts (message, likes, area)
VALUES ('post-1', 12, 'Tokyo'),
  ('post-2', 8, 'Fukuoka'),
  ('post-3', 11, 'Tokyo'),
  ('post-4', 3, 'Osaka'),
  ('post-5', 8, 'Tokyo'),
  ('post-6', 9, 'Osaka'),
  ('post-7', 4, 'Tokyo'),
  ('post-8', 10, 'Osaka'),
  ('post-9', 31, 'Fukuoka');

-- IF関数はSQLiteには存在しない

-- likesの値に基づいてteamを決定（複数の条件）
SELECT *,
  CASE
    WHEN likes > 10 THEN 'A'
    WHEN likes > 5 THEN 'B'
    ELSE 'C'
  END AS team
FROM posts;