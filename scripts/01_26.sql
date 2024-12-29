DROP TABLE IF EXISTS posts;

CREATE TABLE IF NOT EXISTS posts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  message TEXT,
  likes INTEGER,
  created TEXT DEFAULT (datetime('now')),
  -- ON UPDATE CURRENT_TIMESTAMPはSQLiteではサポートされていない
  updated TEXT DEFAULT (datetime('now'))
);

-- 更新トリガーを作成して、更新時にupdatedカラムを更新
CREATE TRIGGER update_posts_trigger
AFTER UPDATE ON posts 
FOR EACH ROW 
BEGIN
  UPDATE posts
  SET updated = datetime('now')
  WHERE id = NEW.id;
END;

-- テーブルの設定を確認
SELECT *
FROM sqlite_master
WHERE tbl_name = 'posts';


INSERT INTO posts (message, likes)
VALUES ('Thanks', 12),
  ('Merci', 4),
  ('Arigato', 4),
  ('Gracias', 15),
  ('Danke', 8);

SELECT id,
  created,
  updated
FROM posts;