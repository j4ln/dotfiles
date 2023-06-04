#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Command prefix - "~ $ "
PS1="\W $ "

# Add to the path
PATH="~/.local/bin:${PATH}"
PATH="~/.scripts:${PATH}"
PATH="/opt/android-sdk/cmdline-tools/latest/bin:${PATH}"

# Set editor to nvim
EDITOR=nvim

# History
export HISTFILESIZE=
export HISTSIZE=

# Custom alias'
alias lg='lazygit'
alias ls='ls --color=auto'
alias nv='nvim'
alias r='ranger'
alias venv='. */bin/activate'
alias al='nvim ~/.config/alacritty/alacritty.yml'
alias ba='nvim ~/.bashrc'
alias bsp='nvim ~/.config/bspwm/bspwmrc'
alias sx='nvim ~/.config/sxhkd/sxhkdrc'

# bare dotfiles alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# use nvm
source /usr/share/nvm/init-nvm.sh
