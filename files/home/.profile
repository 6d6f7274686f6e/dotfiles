export HOME=~
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

export __GL_SHADER_DISK_CACHE_PATH=$XDG_CACHE_HOME/nv
## Doesn't work with lightdm ? TODO: look into this
#export ERRFILE=$XDG_CONFIG_HOME/xserver/xsessions-errors
#export XAUTHORITY=$XDG_CONFIG_HOME/xserver/Xauthority
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat
export XINITRC=$XDG_CONFIG_HOME/xserver/xinitrc
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export CARGO_HOME=$XDG_CONFIG_HOME/cargo
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export GTK_RC_FILES=$XDG_CONFIG_HOME/gtk-1.0/gtkrc
export STACK_ROOT="$XDG_DATA_HOME"/stack
export WINEPREFIX=$XDG_DATA_HOME/wine/32bit
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

export LESSHISTFILE=- # disables less history
export SUDO_EDITOR=nvim
export EDITOR=nvim
export WINEARCH=win32

source /usr/local/share/adminvars

if [[ ":$PATH:" != *":"$HOME"/.local/bin:"* ]]; then
  export PATH=$PATH:$HOME/.local/bin
fi


# aliases and commands
alias cp='cp --verbose'
alias mv='mv --verbose'
alias mpc='mpc --wait'
alias ls='ls -h --color=always'
alias diff='diff --color=always'
alias grep='grep --color=always'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias less='less -R'
alias wine64="WINEPREFIX=$XDG_DATA_HOME/wine/64bit/ WINEARCH=win64 wine64"
alias winecfg64="WINEPREFIX=$XDG_DATA_HOME/wine/64bit/ WINEARCH=win64 winecfg"
alias winetricks64="WINEPREFIX=$XDG_DATA_HOME/wine/64bit/ WINEARCH=win64 winetricks"
alias remote_desktop='xfreerdp /u:LOGIN /d:SERVER /dynamic-resolution /v:URL'
alias vim='nvim'
alias feh='feh --scale-down'
alias startx="startx $XDG_CONFIG_HOME/xserver/xinitrc"
alias twitter="twitter --oauth=$XDG_CONFIG_HOME/.twitter_oauth"
alias diff='diff --color=always'
alias djvu2pdf='ddjvu -format=pdf -quality=85 -verbose'
alias lf='lfub'
alias anic='ani-cli'
alias anicc='ani-cli -c'
alias lobsterc='lobster -c'
alias memo='vim memo$(date +%Y%m%d)'

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
