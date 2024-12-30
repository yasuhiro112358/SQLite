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
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO posts (message)
VALUES ('post-1'),
  ('post-2'),
  ('post-3');

INSERT INTO comments (post_id, comment)
VALUES (1, 'comment-1-1'),
  (1, 'comment-1-2'),
  (3, 'comment-3-1');

INSERT INTO posts (message)
VALUES ('new post!');


-- last_insert_rowid() は直前の INSERT 文で挿入された行の id を取得する関数
INSERT INTO comments (post_id, comment)
VALUES (last_insert_rowid(), 'new comment');

SELECT *
FROM posts;

SELECT *
FROM comments;