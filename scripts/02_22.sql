DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  message TEXT
);

DROP TABLE IF EXISTS comments;

CREATE TABLE comments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  post_id INTEGER,
  comment TEXT
);

INSERT INTO posts (message)
VALUES ('post-1'),
  ('post-2'),
  ('post-3');

INSERT INTO comments (post_id, comment)
VALUES (1, 'comment-1-1'),
  (1, 'comment-1-2'),
  (3, 'comment-3-1'),
  (4, 'comment-4-1');

SELECT posts.id,
  message,
  comment
FROM posts
  INNER JOIN comments ON posts.id = comments.post_id;