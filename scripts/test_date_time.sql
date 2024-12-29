CREATE TABLE IF NOT EXISTS date_time_test (
  id INTEGER PRIMARY KEY,
  -- ISO8601文字列形式
  text_date TEXT,
  -- ユリウス日付
  real_date REAL,
  -- Unixエポック時間
  int_date INTEGER
);

-- データの挿入
INSERT INTO date_time_test (text_date, real_date, int_date)
VALUES (
    '2023-10-01 12:34:56',
    julianday('2023-10-01 12:34:56'),
    strftime('%s', '2023-10-01 12:34:56')
  );

-- データの確認
SELECT *
FROM date_time_test;

-- 日付と時刻の操作
SELECT id,
  text_date,
  datetime(text_date, '+1 day') AS text_date_plus_one_day,
  datetime(real_date, '+1 day') AS real_date_plus_one_day,
  datetime(int_date, 'unixepoch', '+1 day') AS int_date_plus_one_day
FROM date_time_test;