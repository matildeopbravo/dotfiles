# Dotfiles

![alt text](https://github.com/matildeopbravo/dotfiles/raw/master/screenshot.png "Screenshot")


## [Packages](./installation/packages.txt):

 - **Window Manager** : i3-gaps;
 - **Terminal** : alacritty
 - **Shell** : zsh
 - **Editor** : neovim
 - **Compositor** : picom-tryone-git
 - **Terminal Font** : Hack Nerd Font
 - **Status Bar** : polybar
 - **Locker** : i3lock (with blur-lock script) ; xautolock
 - **Screen Capturing** : scrot; flameshot
 - **Clipboard Manager** : xclip
 - **Audio tool** : pactl; pacmixer
 - **File Manager** : ranger
 - **Image Viewer** : sxiv ; feh
 - **Video Player** : mpv
 - **Document Viewer** : zathura
 - **Hotkey Daemon** : sxhkd
 - **Notification Daemon** : dunst

## [Scripts](./scripts):


Scripts I use on a daily basis.
- [install-dotfiles.sh](./installation/install-dotfiles.sh) - Installs all of my **packages**, creates all of the **symlinks** to my configuration files, among other things.
- [wallpaper](.scripts/wallpaper) - Picks a random picture from a given
    directory and changes the wallpaper using a symlink.
- [lock](.scripts/lock) - Collection of scripts for locking computer.


   - [my-lock-script](./scripts/lock/my-lock-script) - Suspends computer after a certain amount of time if **no audio** is being played. (**main** script which requires [blur-lock](./scripts/lock/blur-lock) and [lock-on-supend](./scripts/lock/lock-on-suspend)).

   - [blur-lock](./scripts/lock/blur-lock) - Provides **i3-lock** with a **blurred** screenshot of the computer just before it was locked.
    - [lock-on-supend](./scripts/lock/lock-on-suspend) -  Locks computer **only before** it's suspended (i3-lock can)
- [fetch-iso](./scripts/fetch-iso) - Gets the most recent Arch Linux ISO magnet
    and installs it with my bitorrent client.
- [termFromHere](./scripts/termFromHere) - Opens terminal in the **current working directory** (currently not in use because Alacritty supports this by default).
- [alternating_layouts.py](./scripts/alternating_layouts.py) - Opens new windows using the opposite **splith/splitv layout** as the parent.
- [spotify_status.py](./scripts/spotify_status.py) - Returns information about the song which is currently being played on **Spotify**
- [change_ip](./scripts/change_ip) - Replaces my raspberry pi's old internal ip address in `.ssh/config`with the new one. (temporary fix for a constantly-changing ip address)
- [f](./scripts/f) - A file explorer and app launcher based on `fzf` which opens
    files with their default apps, including vim.
- [vim-anywhere](./scripts/vim-anywhere) - A script which creates a temporary
    file and opens it with neovim and then copies what was written to it to clipboard. (when you want to type a lot in a website/app and still want to use neovim)
- [updateReadMe](./scripts/updateReadMe) - Script which updates my dotfile's
    README.md whenever I create a new script. It prompts me for a description of
    the newly created script.
- [nospace](./scripts/nospace) - Removes spaces from filenames (made by [JFF](https://github.com/JoseFilipeFerreira/toolbelt))
- [lyrics](./scripts/lyrics) - Fetches lyrics for a given song or the current
    playing song on spotify by default
- [ssh_menu](./scripts/ssh_menu) - Dmenu which shows all hosts in config file and starts an ssh connection with the selected one.
- [crypto.sh](./scripts/crypto.sh) - Gets current value of my choice of cryptocurrencies and calculates how much money I have in my crypto wallet in euros
- [changeMeWall.spell](./scripts/changeMeWall.spell) - Pick colors for current wallpaper to be used in dmenu
- [rotate_monitor.sh](./scripts/rotate_monitor.sh) - Toggle rotates monitor
- [dmenu_script.sh](./scripts/dmenu_script.sh) - Launches custom dmenu with history and commonly used programs
- [test_code.sh](./scripts/test_code.sh) - Tests my program's output files against teacher's
- [spotify_lyrics](./scripts/spotify_lyrics) - Script I made which continuously displays lyrics for current song playing on spotify (updates as song changes).
- [spotify_song_info](./scripts/spotify_song_info) - Displays information about the current song playing on spotify
- [refresh_firefox.sh](./scripts/refresh_firefox.sh) - Refreshes firefox
- [termfromhere-ssh](./scripts/termfromhere-ssh) - Opens another terminal with the same cwd as the focused one. Works while using an ssh connection
- [binaries_to_replace](./scripts/binaries_to_replace) - gst
