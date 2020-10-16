#!/bin/bash

path="$0"
symlink_file="symlinks.txt"
package_file="packages.txt"


if [[ "${path:0:1}" = "/" ]] # check if an absolute path is provided
then
   installation_dir=$(dirname "$path")
else
   installation_dir=$(dirname "$PWD"/"$path")
fi
dotfiles_dir=$(dirname "$installation_dir")

main() {
   
   echo "$installation_dir"
   echo "$dotfiles_dir"

   if [[ "$#" -eq 0 ]] 
   then
        packages ; browser ; symlinks ; rest
   else
      for fun in "$@"
      do
        eval "$fun" 
      done
   fi
   
}

symlinks() {

   local dest_dir

   if [[ ! -d "$HOME/.config" ]]
   then 
      mkdir ~/.config
   fi

   while read -r line ; do   

     if [[ "$line" = dest_dir* ]] ; then
        eval "$line" #dest_dir= directory where symlink will be created

     elif [[ "$line" != "" ]] ; then
     	 link_name="$(basename "$line")"
          rm -rv "${dest_dir:?}/$link_name" 2>/dev/null
          ln -sfv "$dotfiles_dir/$line" "$dest_dir/$link_name" 
     fi

   done < "$installation_dir/$symlink_file"

   sudo ln -sfv "$dotfiles_dir"/configs/zsh/gitprompt /usr/local/sbin # add git prompt to path
   sudo ln -sfv "$dotfiles_dir/nobodywantsthis/touchpad/* /etc/X11/xorg.conf.d"

}

browser() {

   firefox-developer-edition --headless --first-startup & 
   sleep 15;
   profile_name="$(ls ~/.mozilla/firefox/ | grep ".default" | head -1)"
   profile_dir="$HOME/.mozilla/firefox/$profile_name"
   mkdir "$profile_dir"/chrome

}

packages(){

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

   done < "$installation_dir/$package_file"
   
   echo "Installed all the packages"
   
   ###################install zplug ######################################################################
   
   export ZPLUG_HOME=~/.local/share/zplug
   git clone https://github.com/zplug/zplug $ZPLUG_HOME

   ###################install python packages ###############################################################

   pip install -r "$installation_dir/python-packages.txt"
   #pynvim package for deoplete and i3 package for alternating layouts
   vim +PlugInstall +qall

}

rest(){

   mkdir -p ~/.local/cached # create directory which will be used by zsh to store history
   sudo rmmod pcspkr
   echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/nobeep.conf #disable pc speaker
   chmod -R +x ~/scripts
   sudo chsh
   source ~/.zprofile
   lxappearance

}

ssh() {
   
   symlink_file="ssh-symlinks.txt"
   package_file="ssh-packages.txt"
   symlinks
   packages
   chmod -R +x ~/scripts
   source ~/.bash_profile 
    

}
main "$@"
