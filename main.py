import sqlite3 # 標準ライブラリに含まれる
import os # 標準ライブラリに含まれる
import subprocess # 標準ライブラリに含まれる

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
    
    try:
        # sqlite3コマンドを使ってSQLファイルを実行
        # subprocess.run() はコマンドを実行する関数
        # shell=True でシェル経由でコマンドを実行
        # check=True でコマンドがエラーの場合に例外を発生させる
        # text=True でバイト列ではなく文字列を取得
        # capture_output=True で標準出力を取得。result.stdout に標準出力が格納される
        result = subprocess.run(f"sqlite3 {DB_FILE} < {file_path}", shell=True, check=True, text=True, capture_output=True)
        print(f"{file_name} のSQLを実行しました")
        print()
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print(f"エラーが発生しました: {e.stderr}")

def list_sql_scripts():
    """スクリプトディレクトリ内のSQLファイルをリスト表示"""
    return [f for f in os.listdir(SCRIPTS_DIR) if f.endswith('.sqlite')]

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
