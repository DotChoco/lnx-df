# Global Variables
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
DCONF="$HOME/.conf"
DEVD="$HOME/dev"
DFL="$HOME/dot-files"


#Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


# Load Resources
source "${ZINIT_HOME}/zinit.zsh"
source "${DFL}/config/zsh/plugins.zsh"
source "${DFL}/config/zsh/aliases.zsh"
source "${DFL}/config/zsh/git.zsh"
source "${DFL}/config/zsh/powerline.zsh"
# source "${DFL}/config/zsh/psdk.zsh" # Only Uncomment if you have de SDK's




