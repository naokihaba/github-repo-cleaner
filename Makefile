.PHONY: delete-file

init:
	@touch delete.txt
	chmod +x ./scripts/*

list-delete-repos:
	sh ./scripts/list-delete-repos.sh

delete-repos:
	sh ./scripts/delete-repos.sh