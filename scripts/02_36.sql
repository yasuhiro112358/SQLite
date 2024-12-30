PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS comments;

DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  message TEXT
);

CREATE TABLE comments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  post_id INTEGER,
  comment TEXT,
  parent_id INTEGER,
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO posts (message)
VALUES ('post-1'),
  ('post-2'),
  ('post-3');

INSERT INTO comments (post_id, comment, parent_id)
VALUES (1, 'comment-1-1', NULL),
  (1, 'comment-1-2', NULL),
  (3, 'comment-3-1', NULL),
  (1, 'comment-1-2-1', 2),
  (1, 'comment-1-2-2', 2),
  (1, 'comment-1-2-1-1', 4),
  (1, 'new comment', 6);

-- インデックスの作成
CREATE INDEX idx_comments_post_id ON comments(post_id);
CREATE INDEX idx_comments_parent_id ON comments(parent_id);

SELECT *
FROM posts;

EXPLAIN
SELECT *
FROM posts;

SELECT *
FROM comments;

EXPLAIN
SELECT *
FROM comments;

-- 再帰的なCTE
WITH RECURSIVE comment_tree AS (
  -- n = 1 の場合
  SELECT *
  FROM comments
  WHERE parent_id = 2
  UNION ALL
  -- n >= 2 の場合
  SELECT comments.*
  FROM comments
    JOIN comment_tree ON comments.parent_id = comment_tree.id
)
SELECT *
FROM comment_tree;