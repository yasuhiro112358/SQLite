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

-- テーブルの代わりにビューを使用
DROP VIEW IF EXISTS posts_tokyo_view;

CREATE VIEW posts_tokyo_view AS
SELECT *
FROM posts
WHERE area = 'Tokyo';

-- データの更新
UPDATE posts
SET likes = 15
WHERE id = 1;

-- データの確認
SELECT *
FROM posts;

SELECT *
FROM posts_tokyo_view;