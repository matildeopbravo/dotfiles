#!/bin/bash

for dest; do true; done

i=1    

for file in $*; do

    if [[ $i == $# ]]; then
        break

    elif [[ -h $file ]]; then

        path=$(readlink -f $file)
        rm $file
        ln -sf $path $dest # dest must be an absolute path

    else
        mv -iv $file $dest
    fi

    (( i++ ))

done




