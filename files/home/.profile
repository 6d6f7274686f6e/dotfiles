export HOME=~
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

export XINITRC=$XDG_CONFIG_HOME/xserver/xinitrc
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export GTK_RC_FILES=$XDG_CONFIG_HOME/gtk-1.0/gtkrc
export LESSHISTFILE=- # disables less history
export SUDO_EDITOR=nvim
export EDITOR=nvim
export ADMINSCRIPTS=$HOME/.local/scripts
export PATH=$PATH:$ADMINSCRIPTS:$HOME/.local/bin

export CARGO_HOME=$XDG_CONFIG_HOME/cargo
export STACK_ROOT=$XDG_DATA_HOME/stack
export WINEPREFIX=$XDG_DATA_HOME/wine/32bit
export WINEARCH=win32
export __GL_SHADER_DISK_CACHE_PATH=$XDG_CACHE_HOME/nv

## Doesn't work with lightdm ? TODO: look into this
#export ERRFILE=$XDG_CONFIG_HOME/xserver/xsessions-errors
#export XAUTHORITY=$XDG_CONFIG_HOME/xserver/Xauthority
