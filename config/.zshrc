# Global Variables
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
DCONF="$HOME/.config"
DEVD="$HOME/dev"
DFL="$HOME/lnx-df"



# Load Resources
source "${ZINIT_HOME}/zinit.zsh"
source "${DCONF}/gvar.zsh"
source "${DCONF}/zsh/plugins.zsh"
source "${DCONF}/zsh/aliases.zsh"
source "${DCONF}/zsh/git.zsh"
source "${DCONF}/zsh/powerline.zsh"
source "${DCONF}/zsh/env.zsh"
# source "${DCONF}/zsh/psdk.zsh" # Only Uncomment if you have de SDK's




