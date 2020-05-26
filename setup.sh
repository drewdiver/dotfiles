#!/bin/bash

cleanup () {
	# ...
}

install () {
	dotfile="$1"
  	dest="$HOME/.${dotfile#_*}"
  	if [ "$dotfile" ]; then
  		ln -f -s "$(pwd)/$dotfile" "$dest"
  	fi
}

for source in $(find . -name '_*' | sort); do
	if [ -d "$source" ]; then
		for dotfile in $(find "$source" -type f | sort); do
			install "$dotfile"
    	done
  	else
		install "$source"
	fi
done

trap cleanup EXIT
