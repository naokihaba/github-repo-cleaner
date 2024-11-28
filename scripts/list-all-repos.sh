#!/bin/bash

# 出力ファイル名を設定
output_file="github_repos.txt"

echo "GitHubリポジトリ一覧を取得します"
echo "ユーザー名を入力してください："
read username

if [ -z "$username" ]; then
    echo "ユーザー名が入力されていません"
    exit 1
fi

# リポジトリ名のみを取得してファイルに出力
gh repo list $username --limit 300 --json name -q '.[].name' > "$output_file"

echo "リポジトリ名を ${output_file} に保存しました"