# Configures zinit as the plugin manager
# Set the path where it should be installed
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Only download if it isn't installed yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source configuration files given by plugins
source "${ZINIT_HOME}/zinit.zsh"

# Load shell integrations
eval "$(fzf --zsh)"

# Load the starship.rs theme
zinit ice as"command" from"gh-r" \
    atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
    atpull"%aclone" src"init.zsh"
zinit light starship/starship

# Add plugins using zinit
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load all completions
autoload -U compinit && compinit

# Configure completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Set how to add a history
HISTFILE=~/.zsh-history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Keybindings
bindkey '^y' autosuggest-accept
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward

# Aliases
alias ls='ls -vA --color'
alias ll='ls -vAl --color'
