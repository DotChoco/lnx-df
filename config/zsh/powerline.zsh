# ---------------------------
# Two-line boxed prompt: badge + boxed top line (dir/time/git) + boxed '>' line
# ---------------------------

autoload -Uz colors && colors
setopt PROMPT_SUBST

# ---- Colors (adjust hex or names if you want) ----
BADGE_BG="#2f3136"    # small left badge background
TOP_BG="#242629"      # main box background
DIR_FG="#61AFEF"      # dir color (blue)
TIME_FG="#98C379"     # time color (green)
GIT_FG="#E06C75"      # git color (pink/red)
SYMBOL_FG="#C678DD"   # > symbol color
RESET_FG="%f"
RESET_BG="%k"

# ---- Git branch helper (uses  glyph if font supports it) ----
git_branch() {
  [[ -d .git || -n $(git rev-parse --git-dir 2>/dev/null) ]] || return 0
  local branch dirty
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) \
    || branch=$(git rev-parse --short HEAD 2>/dev/null) || return 0
  [[ -n $(git status --porcelain 2>/dev/null) ]] && dirty=' !' || dirty=''
  printf " %s%s " "$branch" "$dirty"
}


# ---- Build prompt ----
build_prompt() {
  local cwd="$(basename -- "$PWD")"
  local time_str
  time_str=$(date +"%H:%M ")
  local g
  g=$(git_branch)

  local top="%K{$BADGE_BG}%F{$DIR_FG} ${cwd}%F{$TIME_FG} at ${time_str}"
  if [[ -n $g ]]; then
    top+="%F{$GIT_FG} ${g}"
  fi
  top+="%f%k"

  local bottom="%K{$TOP_BG}%F{$SYMBOL_FG}  >  %f%k"
  PROMPT="${top}"$'\n'"${bottom} "
}

precmd_functions+=(build_prompt)

