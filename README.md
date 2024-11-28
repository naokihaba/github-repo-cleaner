# GitHub Repo Cleaner

A tool for bulk deletion of GitHub repositories.

## Features

- Display list of repositories to be deleted
- Bulk repository deletion

## Setup

1. Clone this repository

```bash
$ git clone https://github.com/yourusername/github-repo-cleaner.git
$ cd github-repo-cleaner
```

2. Initial setup

```bash
$ make init
```

3. Configure GitHub Personal Access Token

```bash
$ gh auth refresh -h github.com -s delete_repo
```

## Usage

### Display list of repositories to be deleted

```bash
$ make list-delete-repos
```

### Execute bulk repository deletion

- Execute after entering target repository names in `delete.txt`

```bash
$ make delete-repos
```

⚠️ **Warning**: Repository deletion cannot be undone. Always verify the repository list before execution.
