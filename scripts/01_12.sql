DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  message TEXT,
  -- likes INTEGER NOT NULL
  -- likes INTEGER DEFAULT 0
  likes INTEGER NOT NULL DEFAULT 0
);

INSERT INTO posts (message, likes)
VALUES ('Thanks', 12),
  ('Arigato', 4),
  ('Merci', 4);

INSERT INTO posts (message)
VALUES ('Gracias');

SELECT *
FROM posts;