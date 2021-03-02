#!/bin/bash
# dmenu app launcher with history
source "$DOTFILES/configs/zsh/functions.zsh"
cache="$HOME/.cache"
cache_file="$cache/IQhist"

mkdir -p "$cache"
touch "$cache_file"


most_used=$(sort -nr -k2 "$cache_file" | cut -f1)

never_used_cmd=$(echo -e "$(cat "$HOME"/most_used;  ls ~/scripts)" | grep -F -x -v -f <(echo -e "$most_used"))

cmd=$(echo -e "${most_used}\n${never_used_cmd}" | dmenu -l 20 -i) # -sb "#05A0CE" -nb "#066F9B")

[[ "$cmd" ]] || exit 1

if ! grep -q "$cmd" "$cache_file";
then
    echo -e "$cmd\t1" >> "$cache_file"
else
  tmp_cache="$(mktemp)"

    awk -v c="$cmd" \
        -F'\t' \
        '$1 == c {print($1"\t"$2 + 1)} $1 != c {print}' \
        "$cache_file" > "$tmp_cache"

    mv "$tmp_cache" "$cache_file"
fi

case $cmd in
    *\; ) "$TERMINAL" -e "$(printf "%s" "${cmd}" | cut -d';' -f1)";;
    * ) ${cmd} ;;
esac
