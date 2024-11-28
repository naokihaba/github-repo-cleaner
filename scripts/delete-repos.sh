#!/bin/bash

# エラーハンドリングを有効化
set -e

# GitHub CLIの存在確認
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) がインストールされていません"
    exit 1
fi

# delete.txtの存在確認
if [ ! -f "delete.txt" ]; then
    echo "Error: delete.txt が見つかりません"
    exit 1
fi

echo "GitHubユーザー名を入力してください: "
read uname

if [ -z "$uname" ]; then
    echo "Error: ユーザー名が入力されていません"
    exit 1
fi

# 削除対象のリポジトリを表示
echo "以下のリポジトリを削除します："
while IFS= read -r repo || [ -n "$repo" ]; do
    if [ ! -z "$repo" ]; then
        echo "- $uname/$repo"
    fi
done < "delete.txt"

# 確認プロンプト
echo "続行しますか？ (y/N): "
read confirm

if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "削除をキャンセルしました"
    exit 0
fi

# リポジトリの削除を実行
echo "削除を開始します..."
while IFS= read -r repo || [ -n "$repo" ]; do
    if [ ! -z "$repo" ]; then
        reponame="$uname/$repo"
        echo "削除中: $reponame"
        if gh repo delete "$reponame" --yes; then
            echo "✓ $reponame を削除しました"
        else
            echo "⚠ $reponame の削除に失敗しました"
        fi
    fi
done < "delete.txt"

echo "処理が完了しました"