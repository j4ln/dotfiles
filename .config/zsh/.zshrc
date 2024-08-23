# options
setopt AUTO_CD
setopt NO_BEEP
setopt EXTENDED_HISTORY # record command start time
setopt INC_APPEND_HISTORY_TIME # append command to history after execution

# completions
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# path
PATH="$HOME/.local/bin:${PATH}"
PATH="$HOME/.scripts:${PATH}"
PATH="/opt/android-sdk/cmdline-tools/latest/bin:${PATH}"

# history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=1000000 # max lines to keep in history file
HISTSIZE=1000000 # max lines to keep in memory

# load alias'
source "$HOME/.alias"

# use nvm
source /usr/share/nvm/init-nvm.sh

# antidote plugin management
source /usr/share/zsh-antidote/antidote.zsh
antidote load "$ZDOTDIR/.zplugins"

# fzf auto completion and key bindings
source "/usr/share/fzf/completion.zsh"
source "/usr/share/fzf/key-bindings.zsh"
