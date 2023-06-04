#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Command prefix - "~ $ "
PS1="\W $ "

# Add .scripts to path at the start, priority given over rest
PATH="~/.scripts:${PATH}"

# Add python user packages to path at start, priority given over rest
PATH="~/.local/bin:${PATH}"

# Set editor to nvim
EDITOR=nvim

# Custom alias'
alias lg='lazygit'
alias ls='ls --color=auto'
alias nv='nvim'
alias r='ranger'
alias venv='. */bin/activate'
alias c='clear'
alias al='nvim ~/.config/alacritty/alacritty.yml'
alias ba='nvim ~/.bashrc'
alias bsp='nvim ~/.config/bspwm/bspwmrc'
alias sx='nvim ~/.config/sxhkd/sxhkdrc'
alias pi='nvim ~/.config/picom/picom.conf'
alias po='nvim ~/.config/polybar/config.ini'
alias ra='nvim ~/.config/ranger/rc.conf'
alias ro='nvim ~/.config/rofi/config.rasi'

# bare dotfiles alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# use nvm
source /usr/share/nvm/init-nvm.sh
