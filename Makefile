.PHONY: delete-file

init:
	@touch delete.txt
	chmod +x ./scripts/*

list-all-repos:
	sh ./scripts/list-all-repos.sh

delete-repos:
	sh ./scripts/delete-repos.sh