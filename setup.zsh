#!/bin/zsh

for dotfile in _*
do
	echo "Linking $dotfile to $HOME/.${dotfile#_}"
	ln -f "${dotfile}" "$HOME/.${dotfile#_}"
done
