#!/bin/bash

for packageName in $(cat packages.txt)
do
   pacman -S --needed --noconfirm $packageName
done

echo "Installed all the packages"

###################install zplug ######################################################################

export ZPLUG_HOME=~/.local/share/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME
source $ZPLUG_HOME/init.zsh

################### install yay ########################################################################

read -p "do you wish to install yay (aur helper) ? (defaults to yes)" -n 1 

if [ "$REPLY" != "n" ]
then 
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
fi
echo


