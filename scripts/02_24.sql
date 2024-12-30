PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS comments;

DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  message TEXT
);

CREATE TABLE comments (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  post_id INTEGER,
  comment TEXT,
  FOREIGN KEY (post_id) REFERENCES posts(id)
);

INSERT INTO posts (message)
VALUES ('post-1'),
  ('post-2'),
  ('post-3');

INSERT INTO comments (post_id, comment)
VALUES (1, 'comment-1-1'),
  (1, 'comment-1-2'),
  (3, 'comment-3-1');
  -- (4, 'comment-4-1');

SELECT *
FROM posts;

SELECT *
FROM comments;


PRAGMA table_info(posts);
PRAGMA table_info(comments);
PRAGMA database_list;