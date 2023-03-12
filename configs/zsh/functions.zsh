#!/bin/bash

# start_time end_time input_file_name
cut_video() {
    output_file=${4:-output.mp4}
    ffmpeg -ss "$1" -to "$2" -i "$3" -c copy "$output_file"

}

recompile_serve() {
    latexmk -f -pdf -silent -pdflatex="xelatex --shell-escape --interaction=nonstopmode --file-line-error %O %S" "$1"
    serve "${1%.*}".pdf

}


gcp() {
    git commit -m "$@" && git push
}


last_n() {
    n=${1:-1}
    nospace * && ls -t | head -"$n" | tr '\n' ' '
}

my_ip() {
    if [ -z "$1" ]; then
        echo -n "Public ip: "
        curl ifconfig.me
    else
        echo -n "Local ip: "
        ip -o -4 addr list | grep -E "(w|eth|en)".*a | awk '{print $4}'
    fi
}

scan_hosts() {
    sudo nmap -snP $(my_ip p | awk '{print $3}') | grep --color=always -E "^|\(.*\)$"
}


alarm() {
    if [ $# -lt 1 ]; then
        echo "provide a time for the alarm"
        return 1
    fi
    current_epoch=$(date +%s)
    current_date=$(date +'%m/%d/%Y')
    target_epoch=$(date -d "$current_date $1" +%s)
    sleep_seconds=$(( $target_epoch - $current_epoch ))
    timer "$sleep_seconds"
}

timer() {
    if [ $# -lt 1 ]; then
        echo "provide a time string"
        return 1
    fi
    {
        sleep "$1"
        mpv --no-video /usr/share/sounds/freedesktop/stereo/alarm*
        notify-send -u critical "Alarm" "$2" -a "$(basename "$0")"
    } &
    disown
}

op () {
    for i in "$@"
    do
      xdg-open "$i" & disown
done
}

nospace() {
    for file in *; do
        grep ' ' <<<"$file" || continue
        new_name=$(sed -r "s/['&,()!]//g;s/ ([-_]) /\\1/g;s/ /_/g;s/_+/_/g" <<<"$file")
        if [ -e "$new_name" ]; then
            echo "can't rename $file to $new_name. A file with that name already exists"
        else
            mv -vn "$file" "$new_name"
        fi
    done
}
md () {
  #nvim -c ":MarkdownPreview" "$1"
  pandoc "$1" -o ${1%.*}.html && chromium ${1%.*}.html
}

fix_firefox() {
    cd "$HOME/.mozilla/firefox/$1"
    mkdir -p chrome
    ln -sf $(ls $DOTFILES/configs/firefox/*.{js,css}) $PWD/chrome
    killall firefox
    firefox-developer-edition & disown
}

graw () {
  main_link=$(xclip -out -selection clipboard)
  user=$(echo "$main_link" | cut -d '/' -f 4)
  repo=$(echo "$main_link" | cut -d '/' -f 5)
  branch=$(echo "$main_link" | cut -d '/' -f 7)
  path_to_file=$(echo "$main_link" | cut -d '/' -f 8-)
  raw_link="https://raw.githubusercontent.com/$user/$repo/$branch/$path_to_file"
  curl "$raw_link" -s > "$(echo "$path_to_file" | rev | cut -d '/' -f 1 | rev)"
}

serve() {
  scp "$1" berrygood:~/.hdd/webserver/public/files
  echo "http://pasok.xyz/files/$(basename $1)" | xclip -selection c
}
sendfile() {
    scp -r "$1" berrygood:~/.hdd/
}

blue() {
    sudo rfkill unblock all
    sudo systemctl start bluetooth
    blueman-applet & disown
}

u() {
    cd "$HOME/uni/2ano2sem/$1" || cd "$HOME/uni/2ano1sem/$1" || cd "$HOME/uni/1ano1sem/$1"
}

rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	xdg-open "$file"
}

extract() {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 -v "$1"   ;;
      *.rar)       unrar x "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *.xz)        xz -d "$1"     ;;
      *)           echo "$1 cannot be extracted via ex()" ;;
    esac
  else
    echo "$1 is not a valid file"
  fi
}

layout(){

    setxkbmap -layout pt -option caps:escape &
    xmodmap -e "clear lock"
    xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
    xmodmap -e "keycode 66 = Escape NoSymbol Escape"

}

monitor() {

  if [[ "$1" == "single" ]]; then
    xrandr --output HDMI-1 --off
  elif [[ "$1" == "cesium" ]]; then
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal
  else
    xrandr --output HDMI-1 --auto
    xrandr --output HDMI-1 --left-of eDP-1
  fi
  killall picom ; killall polybar
  picom -b --backend glx --experimental-backends & disown
  bash ~/.config/polybar/launch.sh
  i3-msg restart
  layout

}

mkcd() {
  mkdir "$@"
  cd "$@"
}

randfile() {
    length=$(ls $1 | wc -l)
    number=$(($RANDOM%$length))
    name=`ls $1 | head -$number | tail -1`
    echo $name

}

send-sms() {

  curl -X POST https://textbelt.com/text \
       --data-urlencode phone="$1" \
       --data-urlencode message="$2" \
       -d key=textbelt
}

torrent(){
  transmission-daemon --download-dir "$HOME/Downloads"
  transmission-remote "$1" "$2" 2> /dev/null
}

connect_bluetooth() {
    sudo systemctl start bluetooth
    bluetoothctl power on &> /dev/null
    bluetoothctl devices | grep -i "$1" | cut -d " " -f 2 | xargs bluetoothctl connect
}

my_sshfs() {
    [ -z "$1" ] && echo "Please provide a hostname" && return
    host="$1"
    to_mount="$host:/home/pasok"
    mkdir -p "$host"
    if [ "$host" = "architect" ]; then
        ssh berrygood "mkdir -p architect && { mount | grep architect; } || sshfs architect:/home/pasok architect" ; to_mount="berrygood:/home/pasok/architect"
    fi
    { mount | grep "$host"; } || sshfs -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 "$to_mount" "$host"
}

my_echo() {
    cat < <(cat <<< "$@")
}

rg() {
    /usr/bin/rg -p "$@" | less  -RFX
}
