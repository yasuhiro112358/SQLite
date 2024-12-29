CREATE TABLE IF NOT EXISTS posts (
  message TEXT, -- SQLiteではVARCHARの代わりにTEXTを使用するのが一般的です
  likes INTEGER -- SQLiteではINTの代わりにINTEGERを使用します
);

-- テーブルのスキーマ（構造）を表示
PRAGMA table_info(posts);

-- データベース内のテーブル一覧を表示
-- SELECT name FROM sqlite_master WHERE type='table';

.tables
