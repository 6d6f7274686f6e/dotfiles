#!/bin/zsh

source $XDG_CACHE_HOME/wal/colors.sh

[ "${TERM:-none}" = "linux" ] || exit
echo -en "\e]P0$color0" | sed s/#//
echo -en "\e]P1$color1" | sed s/#//
echo -en "\e]P2$color2" | sed s/#//
echo -en "\e]P3$color3" | sed s/#//
echo -en "\e]P4$color4" | sed s/#//
echo -en "\e]P5$color5" | sed s/#//
echo -en "\e]P6$color6" | sed s/#//
echo -en "\e]P7$color7" | sed s/#//
echo -en "\e]P8$color8" | sed s/#//
echo -en "\e]P9$color9" | sed s/#//
echo -en "\e]PA$color10" | sed s/#//
echo -en "\e]PB$color11" | sed s/#//
echo -en "\e]PC$color12" | sed s/#//
echo -en "\e]PD$color13" | sed s/#//
echo -en "\e]PE$color14" | sed s/#//
echo -en "\e]PF$color15" | sed s/#//
echo -en "\ec"
