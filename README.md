# SQLite
- SQLiteの基本的な使い方


## SQLite
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