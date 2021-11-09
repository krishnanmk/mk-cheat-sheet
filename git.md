# Git Commands

Describes frequently used/required Git commands.

```sh
# Clean or Revert all uncommitted files including files mentioned in .gitignore
git clean -f -X

# Update remote branches information in local repo
# (Either one of the following should work)
# --dry-run is if you only want to list them down, not actually remove them
git remote update --prune
git remote prune origin [--dry-run]

# Delete remote branches
git push origin --delete branch-name1 branch-name2 branch-name3 ...

```
