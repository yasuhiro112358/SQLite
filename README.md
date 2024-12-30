# SQLite
- SQLiteの基本的な使い方


## sqlite3コマンド
```bash
# version確認
sqlite3 --version

# shell起動
sqlite3

# DBを指定してshell起動
sqlite3 test.db
```

## SQLite Shell
```sql
-- デーブル一覧を表示
.tables

-- テーブルのスキーマ（構造）を表示
.schema [table_name]

-- データの確認（SQL）
SELECT * FROM [table_name];

-- 表示形式の変更
.mode column
.headers on

-- shell終了
.quit
```

## データ型
SQLiteのデータ型（storage class）は、次の５つ：
- NULL: NULL値。
- INTEGER: 符号付き整数。1、2、3、4、6、または8バイトの長さ。
- REAL: 浮動小数点数。8バイトのIEEE浮動小数点数。
- TEXT: テキスト文字列。UTF-8、UTF-16BE、またはUTF-16LEエンコーディング。
- BLOB: バイナリデータ。入力されたそのままの形式。

NUMERICを使用すると、動的型付けとなる。文字列は変換可能なときは数値（INTEGER or REAL）として扱われる。

その他のデータ型キーワードについては、上記５つに振り分けられる：
- DOUBLE: REAL型にキャストされる
- FLOAT: REAL型にキャストされる
- BOOLEAN: NUMERIC型にキャストされる
- DATE: NUMERIC型にキャストされる
- DATETIME: NUMERIC型にキャストされる
- 日時はTEXT型で保持できる（YYYY-MM-DD HH:MM:SS形式）。datetime関数を使用して操作が可能。
- データの長さは指定しても無視される
*詳細：https://www.sqlite.org/datatype3.html

## 計算関数
- SQLiteには、FLOOR関数とCEIL関数がない。CAST等を使用して代用する。
- 日数差の計算は、julianday関数を使用する。

## タイムスタンプ
- タイムスタンプの更新は、トリガーを使用する（01_26.sqlを参照）

## 条件分岐
- IF関数はない
- CASE式を使用する（02_04.sqlを参照）

## CTE (Common Table Expression)
- SQLiteは、CTEをサポートしている
- 02_29.sqlを参照

## その他のMySQLとの違い
- UNION ALLの前後のサブクエリには()が使えない
- last_insert_rowid()関数を使用して、最後に挿入された行のIDを取得する
- LOAD DATA LOCAL INFILE 構文がない


## Note
### 環境構築 with Python
```bash
# 仮想環境の作成
python3 -m venv venv

# 仮想環境の有効化
source venv/bin/activate

# 仮想環境の無効化
deactivate

# 依存パッケージのインストール
pip install -r requirements.txt
```