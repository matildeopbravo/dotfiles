#!/bin/bash

dotfiles_dir=$(dirname "$0" | xargs dirname)
chrome_dir="$HOME/.mozilla/firefox/*default/chrome"

main() {

   create_symlinks
}

create_symlinks() {


   local dest_dir

   while read -r line ; do   

     if [[ "$line" = dest_dir* ]] ; then
        eval "$line" #dest_dir= directory where symlink will be created
	echo "evaled this $line"
     elif [[ "$line" != "" ]] ; then
     	 link_name="$(basename "$line")"
         echo "tryna rm this ${dest_dir:?}/$link_name"
         echo "tryna link this$dotfiles_dir/$line" "$dest_dir/$link_name" 
     fi
     done < ""$dotfiles_dir"/installation/symlinks.txt"

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
	sudo pacman -S --needed --noconfirm "$packageName" || pacman -Qi "$packageName" || yay -S "$packageName"

   done < ""$dotfiles_dir"/installation/packages.txt"
   
   echo "Installed all the packages"
   
   ###################install zplug ######################################################################
   
   export ZPLUG_HOME=~/.local/share/zplug
   git clone https://github.com/zplug/zplug $ZPLUG_HOME
   

}
main
