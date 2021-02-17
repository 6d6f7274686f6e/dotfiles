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

# aliases and commands
alias cp='cp --verbose'
alias mv='mv --verbose'
alias mpc='mpc --wait'
alias ls='ls -h --color=always'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias less='less -R'
alias wine64="WINEPREFIX=$XDG_DATA_HOME/wine/64bit/ WINEARCH=win64 wine64"
alias winecfg64="WINEPREFIX=$XDG_DATA_HOME/wine/64bit/ WINEARCH=win64 winecfg"
alias winetricks64="WINEPREFIX=$XDG_DATA_HOME/wine/64bit/ WINEARCH=win64 winetricks"
alias vim='nvim'
alias feh='feh --scale-down'
alias startx="startx $XDG_CONFIG_HOME/xserver/xinitrc"
alias twitter="twitter --oauth=$XDG_CONFIG_HOME/.twitter_oauth"
alias diff='diff --color=always'

autoload -U select-word-style
select-word-style bash

bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word
bindkey ";3C" forward-word
bindkey ";3D" backward-word

PS1="┌─╼ %F{cyan}%n%f%F{magenta}::%f%F{cyan}%m%f %B%F{red}%~%f%b %F{green}[%j]%f"$'\n'"└──╼ "
RPS1="(%?) %F{magenta}[%T]%f"

xhost &> /dev/null && source /usr/share/powerline/bindings/zsh/powerline.zsh

## TODO : make this work
# xhost &> /dev/null || $XDG_CACHE_HOME/wal/colors-tty.sh
