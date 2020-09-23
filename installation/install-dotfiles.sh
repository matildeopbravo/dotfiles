#!/bin/bash

dotfiles_dir="$PWD/$(dirname "$0" | xargs dirname)"
installation_dir="$dotfiles_dir/installation"

main() {

   install_packages
   create_chrome_dir
   create_symlinks
   rest
}


create_symlinks() {


   local dest_dir

   while read -r line ; do   

     if [[ "$line" = dest_dir* ]] ; then
        eval "$line" #dest_dir= directory where symlink will be created

     elif [[ "$line" != "" ]] ; then
     	 link_name="$(basename "$line")"
          rm -rv "${dest_dir:?}/$link_name" 2>/dev/null
          ln -sf "$dotfiles_dir/$line" "$dest_dir/$link_name" 
     fi

     done < "$installation_dir/symlinks.txt"

}

create_chrome_dir() {

   firefox-developer-edition 
   profile_name="$(ls ~/.mozilla/firefox/ | grep ".default" | head -1)"
   profile_dir="$HOME/.mozilla/firefox/$profile_name"
   mkdir "$profile_dir"/chrome

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

   # spotify keys
   curl -sS https://download.spotify.com/debian/pubkey.gpg | gpg --import -
   gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

   while read -r packageName 
   do
      sudo pacman -S --noconfirm --needed "$packageName" || pacman -Qi "$packageName" || yay -S "$packageName" </dev/tty

   done < "$installation_dir/packages.txt"
   
   echo "Installed all the packages"
   
   ###################install zplug ######################################################################
   
   export ZPLUG_HOME=~/.local/share/zplug
   git clone https://github.com/zplug/zplug $ZPLUG_HOME

   ###################install python packages ###############################################################

   pip install -r "$installation_dir/requirements.txt"
}

rest(){

   mkdir -p ~/.local/cached # create directory which will be used by zsh to store history
   ln -sf "$dotfiles_dir"/zsh/gitprompt /usr/local/sbin # add git prompt to path
   #pip3 install --user pynvim # install pynvim module for deoplete plug-in
}

#main
