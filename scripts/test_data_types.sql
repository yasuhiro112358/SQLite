-- SQLiteの設定ファイルの読み込み
.read sqlite_settings.sql

DROP TABLE IF EXISTS data_types_test;

CREATE TABLE IF NOT EXISTS data_types_test (
  id INTEGER PRIMARY KEY,
  -- 主キー
  text_col TEXT,
  -- テキストデータ
  int_col INTEGER,
  -- 整数データ
  real_col REAL,
  -- 浮動小数点データ
  blob_col BLOB,
  -- バイナリデータ
  bool_col INTEGER,
  -- SQLiteではINTEGER型で表現
  numeric_col NUMERIC -- 動的型付けデータ
);

-- データの挿入
INSERT INTO data_types_test (
    text_col,
    int_col,
    real_col,
    blob_col,
    bool_col,
    numeric_col
  )
VALUES (
    'Sample Text',
    123,
    456.789,
    X'53514C697465',
    1,
    987.654
  ),
  (
    'Another Text',
    456,
    123.456,
    X'42696E617279',
    0,
    321.987
  );

-- データの確認
SELECT *
FROM data_types_test;