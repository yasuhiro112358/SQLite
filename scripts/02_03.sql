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

-- 集計クエリ
SELECT area,
  SUM(likes)
FROM posts
GROUP BY area;

-- 集計クエリ（HAVING句を使用）
SELECT area,
  SUM(likes)
FROM posts
GROUP BY area
HAVING SUM(likes) > 30;

-- 集計クエリ（WHERE句を使用）
SELECT area,
  SUM(likes)
FROM posts
WHERE likes > 10
GROUP BY area;