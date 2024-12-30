-- DBのリストを表示する
PRAGMA database_list;

-- マスタ情報を表示する
SELECT *
FROM sqlite_master;

-- テーブル一覧を表示する
SELECT *
FROM sqlite_master
WHERE type = 'table';

-- テーブル一覧を表示する
.tables

-- ビュー一覧を表示する
SELECT *
FROM sqlite_master
WHERE type = 'view';

-- トリガー一覧を表示する
SELECT *
FROM sqlite_master
WHERE type = 'trigger';

-- インデックス一覧を表示する
SELECT *
FROM sqlite_master
WHERE type = 'index';

-- テーブルのスキーマ（構造）を表示する
PRAGMA table_info(users);
PRAGMA table_info(sqlite_sequence);
PRAGMA table_info(posts);
PRAGMA table_info(logs);

-- テーブルのスキーマ（構造）を表示する
.schema comments

