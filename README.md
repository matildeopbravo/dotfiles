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
- [mv.sh](./scripts/mv.sh) - mv on steroids which doesn't cause **dead symlinks**,
    instead it recreates them.
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
- [fetch-lyrics](./scripts/fetch-lyrics) - Fetches lyrics for a given song
