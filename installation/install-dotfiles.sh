#!/bin/bash

dotfiles_dir=$(dirname "$0")
chrome_dir="$HOME/.mozilla/firefox/*default/chrome"

main() {

   install_packages
   create_chrome_dir
   create_symlinks
}

create_symlinks() {


   local dest_dir

   while read -r line ; do   

     if [[ "$line" = dest_dir* ]]
     then
        eval "$line" #dest_dir= directory where symlink will be created
     else
     link_name="$(basename "$line")"
         rm -r "{$dest_dir:?}/$link_name"
         ln -sf "$dotfiles_dir/$line" "$dest_dir/$link_name"
    fi
    done < symlinks.txt

}

create_chrome_dir() {

   firefox-developer-edition & disown
   sleep 5;
   mkdir -p "$chrome_dir"

}

install_packages(){

   ################### install yay ########################################################################
   
   read -p "do you wish to install yay (aur helper) ? (defaults to yes)" -n 1 -r
   
   if [ "$REPLY" != "n" ]
   then 
       yay_dir=~/.local/share/yay
       git clone https://aur.archlinux.org/yay.git $yay_dir
       cd $yay_dir || exit
       makepkg -si
   fi
   echo

   #############################install every other packages #########################################################

   while read -r packageName 
   do
      pacman -S --needed --noconfirm "$packageName" || pacman -Qi "$packageName" || yay -S "$packageName"

   done < packages.txt
   
   echo "Installed all the packages"
   
   ###################install zplug ######################################################################
   
   export ZPLUG_HOME=~/.local/share/zplug
   git clone https://github.com/zplug/zplug $ZPLUG_HOME
   

}
