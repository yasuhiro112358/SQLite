DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  message TEXT UNIQUE,
  likes INTEGER CHECK (
    likes >= 0
    AND likes <= 200
  )
);

INSERT INTO posts (message, likes)
VALUES ('Thanks', 12),
  ('Arigato', 4),
  -- ('Arigato', 5),
  -- ('Merci', 254),
  ('Merci', 154);

SELECT *
FROM posts;