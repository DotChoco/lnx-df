# Git functions for Zsh

# Git Add All
gta() {
  if [[ $# -eq 0 ]]; then
    echo "Adding all files..."
    git add .
  else
    echo "Adding specified files: $@"
    git add "$@"
  fi
}

# Git Diff
gtd() {
  if [[ -z "$1" ]]; then
    echo "Error: You must specify a file or path."
    return 1
  fi
  echo "Showing diff for: $1"
  git diff "$1"
}

# Git Commit
gtm() {
  local comment="$1"
  if [[ -z "$comment" ]]; then
    comment="f: minor update"
  fi
  echo "Committing changes with message: '$comment'"
  git commit -m "$comment"
}

# Git Log
gtl() {
  local index="$1"
  if [[ -z "$index" || "$index" -eq 0 ]]; then
    echo "Showing full git log..."
    git log
  else
    echo "Showing last $index commits..."
    git log -"$index"
  fi
}

# Fast Commit (Add, Commit, Push)
fcm() {
  local comment="$1"
  echo "Performing fast commit..."
  gta && gtm "$comment" && gtp
}

# Git Include (remove assume-unchanged)
gti() {
  if [[ $# -eq 0 ]]; then
    echo "Error: Specify at least one file to include."
    return 1
  fi
  echo "Including files: $@"
  git update-index --no-assume-unchanged "$@"
}

# Git Exclude (mark as assume-unchanged)
gte() {
  if [[ $# -eq 0 ]]; then
    echo "Error: Specify at least one file to exclude."
    return 1
  fi
  echo "Excluding files: $@"
  git update-index --assume-unchanged "$@"
}

# Git Restore
gtr() {
  if [[ $# -eq 0 ]]; then
    echo "Error: Specify at least one file to restore."
    return 1
  fi
  echo "Restoring files: $@"
  git restore "$@"
}

# Git Switch Branch
gsb() {
  if [[ -z "$1" ]]; then
    echo "Error: You must specify a branch name."
    return 1
  fi
  echo "Switching to branch: $1"
  git checkout "$1"
}


# Shortcuts
alias glb="git branch -a" # Git List Branches
alias gts="git status" # Git Status
alias gtp="git push" # Git Push
alias gtpl="git pull" # Git Pull
alias gtin="git init"
