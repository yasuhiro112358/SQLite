import sqlite3 # 標準ライブラリに含まれる
import os # 標準ライブラリに含まれる

# データベースファイル
DB_FILE = "data/database.db"
# スクリプトディレクトリ
SCRIPTS_DIR = "scripts/"

def execute_sql(file_name):
    """指定したSQLファイルを実行する"""
    file_path = os.path.join(SCRIPTS_DIR, file_name)
    if not os.path.exists(file_path):
        print(f"SQLファイルが見つかりません: {file_path}")
        return

    with open(file_path, 'r', encoding='utf-8') as f:
        sql = f.read()

    try:
        with sqlite3.connect(DB_FILE) as conn: # DB_FILEが存在しない場合は新規作成される
            cursor = conn.cursor() # カーソルを取得
            cursor.executescript(sql) # 複数のSQLを実行
            conn.commit() # executescript() で実行したSQLが全て成功した場合にのみコミットされる
            print(f"{file_name} のSQLを実行しました")
    except sqlite3.Error as e:
        print(f"エラーが発生しました: {e}")

def list_sql_scripts():
    """スクリプトディレクトリ内のSQLファイルをリスト表示"""
    return [f for f in os.listdir(SCRIPTS_DIR) if f.endswith('.sql')]

def main():
    """メイン処理"""
    print("実行可能なSQLスクリプト一覧:")
    scripts = list_sql_scripts()
    for i, script in enumerate(scripts):
        print(f"{i + 1}. {script}")

    choice = input("\n実行したいスクリプトの番号を入力してください (終了: q): ")
    if choice.lower() == 'q':
        print("終了します")
        return

    try:
        index = int(choice) - 1
        if 0 <= index < len(scripts):
            print(f"{scripts[index]} を実行します")
            execute_sql(scripts[index])
        else:
            print("無効な番号です")
    except ValueError:
        print("無効な入力です")

if __name__ == "__main__":
    main()
