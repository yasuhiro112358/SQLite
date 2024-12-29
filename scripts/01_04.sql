-- ==== SQLiteの設定 ====
-- ヘッダーを表示
.headers on
-- データを表形式で表示
.mode table 
-- NULLの値を表示する文字列を指定
.nullvalue NULL
-- カラムの幅を自動調整
.width auto
-- ======================================

CREATE TABLE IF NOT EXISTS posts (
  message TEXT, -- SQLiteではVARCHARの代わりにTEXTを使用するのが一般的です
  likes INTEGER -- SQLiteではINTの代わりにINTEGERを使用します
);

-- データベース内のテーブル一覧を表示
-- SELECT * FROM sqlite_master;
SELECT name FROM sqlite_master WHERE type='table';

-- テーブルのスキーマ（構造）を表示
PRAGMA table_info(posts);