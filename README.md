# GitHub Repo Cleaner

GitHubのリポジトリを一括で削除するためのツールです。

## 機能

- 削除対象のリポジトリ一覧の表示
- リポジトリの一括削除

## 必要条件

- GitHub Personal Access Token
- シェルスクリプトが実行可能な環境
- `make` コマンドがインストールされていること

## セットアップ

1. このリポジトリをクローン

```bash
git clone https://github.com/yourusername/github-repo-cleaner.git
cd github-repo-cleaner
```

2. 初期設定

```bash
make init
```

3. GitHubのPersonal Access Tokenを設定

```bash
gh auth refresh -h github.com -s delete_repo
```

## 使用方法

### 削除対象のリポジトリ一覧を表示

```bash
make list-delete-repos
```

### リポジトリの一括削除を実行

```bash
make delete-repos
```

⚠️ **注意**: リポジトリの削除は取り消しできません。実行前に必ずリポジトリ一覧を確認してください。
