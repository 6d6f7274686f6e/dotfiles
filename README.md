# dotfiles
Those are configuration files for my Arch Linux install.
It should work with other distributions too.

## Components
Here's a list of some of the packages I use. Most of them are available on official repositories or the AUR.
* Boot manager : [rEFInd](https://www.rodsbooks.com/refind/) with the [rEFInd-minimal](https://github.com/EvanPurkhiser/rEFInd-minimal/) theme.
* Display manager : [lightdm](https://github.com/canonical/lightdm) with [lightdm-mini-greeter](https://github.com/prikhi/lightdm-mini-greeter)
* Window manager : my [custom dwm build](https://github.com/6d6f7274686f6e/dwm)
* Composite window manager : [xcompmgr](https://xorg.freedesktop.org/)
* Notification manager : [dunst](https://dunst-project.org/)
* Lock screen : [i3lock-color](https://github.com/Raymo111/i3lock-color)
* Application launcher : [rofi](https://github.com/DaveDavenport/rofi)
* Terminal : [rxvt-unicode](http://software.schmorp.de/pkg/rxvt-unicode.html) with [powerline](https://github.com/powerline/powerline)
  and the [resize-font](https://github.com/simmel/urxvt-resize-font) plugin.
* Shell : [zsh](https://www.zsh.org)
* Graphics card driver : [nvidia](https://www.nvidia.com)
* Disk Management : [udisks](https://www.freedesktop.org/wiki/Software/udisks)
* WiFi : [wpa_supplicant](https://w1.fi/wpa_supplicant/)
* Audio : [pulseaudio](https://www.freedesktop.org/wiki/Software/PulseAudio/) on top of [ALSA](https://www.alsa-project.org),
  with [pavucontrol](https://freedesktop.org/software/pulseaudio/pavucontrol/)
* Input : [ibus](https://github.com/ibus/ibus/wiki) (change keyboard layouts on the fly)
* Editor : [neovim](https://neovim.io) with plugins (details below)
* File explorer : [ranger](https://ranger.github.io)
* PDF viewer : [zathura](https://pwmt.org/projects/zathura/)
* Image viewer : [feh](https://feh.finalrewind.org/)
* Music player : [mpd](https://www.musicpd.org), controlled via [ncmpcpp](https://ncmpcpp.rybczak.net/), scrobbling with [yams](https://github.com/Berulacks/yams)
* Video player : [mpv](https://mpv.io/)
* Web browser : [firefox](https://www.mozilla.org/firefox) with a load of privacy plugins and extensions
* Windows emulation : [wine](http://www.winehq.com) with [winetricks](https://wiki.winehq.org/winetricks)
* Games : [Steam](https://steampowered.com/)
* Voice chat : [Discord](https://discordapp.com)
* Schedule daemon : [cronie](https://github.com/cronie-crond/cronie/)
* Calendar : [calcurse](https://calcurse.org/)
* Twitter command-line client : [python2-twitter](http://mike.verdone.ca/twitter/)
* Color theme : Auto-generated from my wallpaper with [wal](https://github.com/dylanaraps/wal), [oomox/themix](https://github.com/themix-project/oomox), 
  [LXAppearance](https://wiki.lxde.org/en/LXAppearance), and additional custom scripts to coordinate every theme files.
* Fonts : [FontAwesome](https://github.com/gabrielelana/awesome-terminal-fonts), [powerline fonts](https://github.com/powerline/powerline),
  [nerd fonts](https://github.com/ryanoasis/nerd-fonts)
* Extra : [numlockx](https://github.com/rg3/numlockx) (always have numlock key activated at startup),
  [cpupower](https://www.kernel.org) (for [CPU frequency scaling](https://wiki.archlinux.org/index.php/CPU_frequency_scaling)), ...
* And probably more.

## Details
### Scripts 
I built a bunch of various shell script over the last few years. 
Those that are called by shortcuts in `dwm` are in the `/usr/local/bin/scripts/dwm/` folder.
Shell scripts are in `~/.local/bin/`.
### Home cleaning
I like to keep my Home folder clean, with as little hidden files and folders as possible.
Most of this is made possible by the
[XDG Base Directory specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html), 
along with this
[catalog of supported and unsupported applications](https://wiki.archlinux.org/index.php/XDG_Base_Directory#Support) on
the Arch Linux Wiki. I chose to put related environment variables in the `~/.profile/` file because LightDM loads this
file before starting the X Server. This file also contains aliases.

Unfortunately, a lot of applications have hardcoded paths which often can't be modified without using unstable cheap
tricks like modifying the source code directly or calling the program with a different `$HOME` environment variable.

### Haskell
Developing in Haskell on Arch Linux with the official repositories became a huge pain since the
[switch to dynamically linked packages](https://www.reddit.com/r/linux/comments/9emwtu/arch_linux_ama/e5qssdz/?context=3),
which relies on a **lot** of dependencies on small `haskell-` packages.
Because of this, I prefer to use a direct installation of [stack](https://docs.haskellstack.org/en/stable/README/)
(via `curl -sSL https://get.haskellstack.org/ | sh` and `stack upgrade`) and only install haskell packages with `stack install`.

### Non-latin alphabets fonts 
I use additional fonts to display non-latin alphabets correctly in the terminal:
* South Asian : [sanskrit-fonts](http://github.com/sanskrit-coders/sanskrit-fonts), [sil-padauk](https://software.sil.org/padauk/)
* Korean : [baekmuk](https://kldp.net/baekmuk/)
* Japanese : [Hanazono](https://fonts.jp/hanazono/), [Kochi](http://sourceforge.jp/projects/efont/)

### BTRFS
I use [BTRFS](https://btrfs.wiki.kernel.org) on my home partition. It allows for instantaneous backups (with Copy-On-Write)
and, above all, file compression and deduplication, which I am very happy to use. I try to run the scripts in the
`/usr/local/sbin/scripts/maintenance/` folder roughly one time per month to defragment and deduplicate my partition and
gain even more disk space. I haven't gotten into any trouble with this filesystem so far.

### MPDiscord
[mpd_discord_richpresence](https://github.com/justas-d/mpd-rich-presence-discord) is a daemon that runs in the background
and sends mpd's current song to Discord, displaying it below your username.
I don't like the default MPD logo, so I changed it for a very simple "musical note" logo and put that in my own
application (and called it `mpdiscord`). I didn't release it yet since this is for personal use, but the code doesn't
differ much from the original (I basically only changed the application ID).

## Installation instructions
Those installation instructions are more like notes to myself than a precise installation guide. 
You can refer to specific subsection if you want to install a program in particular, however I strongly recommend that
you read everything since most of my files refer to one another quite often. If you want to directly install all these
files, you'll have to do this on a *fresh* install. You'll most likely break things if you follow these instructions
blindly on an old one.

Basically, all you have to do is copy the contents of the `files/home/` folder into your home folder, `files/etc/` into
`/etc/`, ... (pay attention to any file you could overwrite), then read the following subsections, and reboot.

### rEFInd
You'll have to install rEFInd on your own since it will be specific to your system. I personally use the
`/boot/refind_linux.conf` file but this may depend on how you installed it. To use the same
[theme](https://github.com/EvanPurkhiser/rEFInd-minimal/) as me, copy `files/boot/EFI/refind/themes/rEFInd-minimal`
into `/boot/EFI/refind/themes/` and add `include themes/rEFInd-minimal/theme.conf` at the end of `/boot/EFI/refind/refind.conf`.

### LightDM
This is pretty straightforward. You just need to enable the `lightdm` service with `systemctl enable lightdm` (or
whatever else you use on your system to enable a desktop manager) and put your username in
`/etc/lightdm/lightdm-mini-greeter.conf`. This install uses a custom background and colors but you can also change that
quite easily by reading the comments in `/etc/lightdm/lightdm-mini-greeter.conf`.

### Profile file
The first paragraph in `~/.profile` defines XDG folders : you can change them to different folders if you'd like but I
wouldn't advise you to do so. From now on, I'll assume that your XDG folder variables are the same as mine: for example
I'll write `~/.config/` in lieu of `$XDG_CONFIG_HOME`.

The third paragraph lists environment variable for various applications that you may or may not need : 
* [rust](https://www.rust-lang.org/)
* [nvidia](https://www.nvidia.com/)
* [wine](http://www.winehq.com)
* [stack](https://docs.haskellstack.org/en/stable/README/)

I suggest you leave them here just in case you need to install one of those applications.

### dwm
This build uses my own custom [dwm build](https://github.com/6d6f7274686f6e/dwm). 
You'll **need** to change the config file in this build if you don't have a french AZERTY keyboard.
There's also some screen setup in there that most likely won't work on your system.

Some scripts that can be launched through keyboard or statusbar shortcuts may ask for your password to launch other
scripts with admin privileges. Those scripts are made to be owned by root, and I tried to make it as safe as possible by
only calling root-owned programs in them.

You'll find more information on this in my `dwm` and `dwmblocks` (upcoming!) repos.

### ZSH
Set ZSH as your default shell by typing `chsh -s /bin/zsh`.
Its configuration files are located in `~/.config/zsh/`. When starting a console session without a graphical environment,
it will try to read the `~/.zshrc` file: to avoid duplicates, you'll have to link it with `ln -s ~/.config/zsh/.zshrc ~/.zshrc`. 

### Wine
Wine prefixes are stored in `~/.local/share/wine/xxbit/` where `xx` is either `32` or `64`. It will default to 32bit
when run as `wine`, and 64bit when run as `wine64`.

I like to have a shared `My Documents` directory between my two prefixes. To do so, first run `winecfg` then `winecfg64`
to generate both prefixes if they do not exist yet, then
`cp -r ~/.local/share/wine/32bit/drive_c/users/YOUR_NAME ~/.local/share/wine/docs/`,
`rm -r ~/.local/share/wine/{32,64}bit/drive_c/users/YOUR_NAME` and finally
`ln -s ~/.local/share/wine/docs/ ~/.local/share/wine/{32,64}bit/drive_c/users/YOUR_NAME`.

### Neovim
Neovim needs a little bit of setup. First, run
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim`.
Then start `nvim` and type `:PluginInstall` to install the plugins listed in `~/.config/nvim/init.vim` (don't hesitate
to comment out those you don't need or add your own!). Quit and restart Neovim; if you get any errors, it should go away
by typing `:UpdateRemotePlugins` and restarting.

### Music 
Configuration files for music applications are `~/.config/mpd/mpd.conf` and `~/.config/ncmpcpp/config`.
You'll need to change `~/Music` to wherever your music library is located in both of those files.

To scrobble tracks to [last.fm](https://last.fm), I use [YAMS](https://github.com/Berulacks/yams).

### Twitter
I installed a small twitter command-line utility with `pip2 install twitter`. Right after that, run `twitter` in the
command line and follow the instructions to authentificate. All the twitter scripts should run normally from now on.

### crond
I use `cronie` to trigger alarms when it's late or someone replies to me on Twitter. Use `crontab -e` to edit the
schedule.

### Admin scripts
Subfolders of `/usr/local/sbin/scripts/` store scripts that should only be executed with admin privileges.
Their ownership should be set to root (`sudo chown root:root -R /usr/local/sbin/scripts/`).
You should also make sure that they are executable with `sudo chmod +x /usr/local/sbin/scripts/ -R`.

The `powerplans` subfolder holds scripts that change the computer speeds to maximize either performance or battery life.
They are specific to Intel computers and you ideally shouldn't have to use them unless your computer has temperature or
battery issues. They're tied to the `Super+Shift+X` keys in `dwm`.

I try to run the `maintenance` scripts roughly one time per month, to free up space on my home partition.
They'll only be useful if you use [BTRFS](https://btrfs.wiki.kernel.org) on your home partition.
If you have BTRFS installed I'd assume you know what you are doing and should be able to correctly modify these scripts
to suit your needs anyway. The `deduplication` script depends on [duperemove](https://github.com/markfasheh/duperemove).

### Theme
Themes are automatically generated from your wallpaper with the `~/.config/i3/scripts/theme` script.
When given no arguments (or only the `transparent` argument), this script will try to set the theme from the
[wal](https://github.com/dylanaraps/wal) configuration (which may not exist). To get colors from a wallpaper, pass the
image's path to the script. If you add the `transparent` argument, it will make the terminal windows slightly
transparent (this only works with [urxvt](http://software.schmorp.de/pkg/rxvt-unicode.html)).

The script can be called in [ranger](https://ranger.github.io) with the `bg` shortcut (or `bt` if you want transparent
terminals). 

By default, it will also generate a GTK theme. To activate this theme, run `lxappearance`, choose the `oomox-autotheme`
theme in the list on the left, and click `Apply` then `Close`. You won't need to do this anymore after that, even if you
change your wallpaper and theme. You can even delete the `.icons` folder and `.gtkrc-x.x` file it created in your home
folder without consequences.
