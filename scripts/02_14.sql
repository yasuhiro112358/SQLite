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

-- ORDER BYを追加すると累積を計算する
SELECT *,
  SUM(likes) OVER (
    PARTITION BY area
    ORDER BY likes 
  ) AS area_sum
FROM posts;

SELECT *,
  SUM(likes) OVER (
    PARTITION BY area
    ORDER BY likes 
    ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
  ) AS area_sum
FROM posts;