source ~/.profile

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '$XDG_CONFIG_HOME/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=$XDG_CONFIG_HOME/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

export HISTCONTROL=ignoreboth:erasedups # ignore duplicates in command history

autoload -U select-word-style
select-word-style bash

bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word
bindkey ";3C" forward-word
bindkey ";3D" backward-word

PS1="┌─╼ %F{cyan}%n%f%F{magenta}::%f%F{cyan}%m%f %B%F{red}%~%f%b %F{green}[%j]%f"$'\n'"└──╼ "
RPS1="(%?) %F{magenta}[%T]%f"

xhost &> /dev/null || source $XDG_CONFIG_HOME/zsh/colors-tty.sh

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
