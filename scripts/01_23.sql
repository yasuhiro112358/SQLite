DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  message TEXT,
  likes INTEGER,
  -- SQLiteではDATETIMEをTEXTとして保存します
  created TEXT
);

INSERT INTO posts (message, likes, created)
VALUES ('Thanks', 12, '2024-12-28'),
  ('Merci', 4, '2020-05-03'),
  ('Arigato', 4, '2020-06-14'),
  ('Gracias', 15, '2020-07-04'),
  ('Danke', 8, '2020-08-22');

-- SQLiteではYEAR, MONTH, DAY関数がないため、strftime関数を使用します
SELECT created,
  strftime('%Y', created) AS year
FROM posts;

SELECT created,
  strftime('%m', created) AS month
FROM posts;

SELECT created,
  strftime('%d', created) AS day
FROM posts;

-- SQLiteではDATE_FORMAT関数がないため、strftime関数を使用します
-- 月や曜日を単語での取得はできない
SELECT created,
  CASE
    strftime('%m', created)
    WHEN '01' THEN 'January'
    WHEN '02' THEN 'February'
    WHEN '03' THEN 'March'
    WHEN '04' THEN 'April'
    WHEN '05' THEN 'May'
    WHEN '06' THEN 'June'
    WHEN '07' THEN 'July'
    WHEN '08' THEN 'August'
    WHEN '09' THEN 'September'
    WHEN '10' THEN 'October'
    WHEN '11' THEN 'November'
    WHEN '12' THEN 'December'
  END AS month,
  strftime('%d', created) AS day,
  strftime('%Y', created) AS year,
  CASE
    strftime('%w', created)
    WHEN '0' THEN 'Sunday'
    WHEN '1' THEN 'Monday'
    WHEN '2' THEN 'Tuesday'
    WHEN '3' THEN 'Wednesday'
    WHEN '4' THEN 'Thursday'
    WHEN '5' THEN 'Friday'
    WHEN '6' THEN 'Saturday'
  END AS weekday
FROM posts;

-- SQLiteではDATE_ADD関数がないため、date関数を使用します
SELECT created,
  date(created, '+7 days')
FROM posts;

-- SQLiteではNOW関数がないため、datetime関数を使用します
SELECT created,
  -- 現在日時の文字列が取得できる
  datetime('now'),
  -- 現在日時がユリウス日付で取得できる。日付であることがポイント。
  julianday('now'),
  julianday(created) - julianday('now'),
  -- INTEGER型にCASTすると、端数は切り捨てられる
  CAST(julianday(created) - julianday('now') AS INTEGER) AS diff
FROM posts;

