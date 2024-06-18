#!/bin/bash

function brew_update() {
	echo "Update brew installed software"
	
	rm ~/Brewfile || rm ~/.venv/Brewfile 
	
	brew update
	brew upgrade
	brew update --cask
	brew upgrade --cask
	brew cleanup
	brew bundle dump
	
	# Get a list of installed casks (using zsh word splitting)
	casks=($(brew list --cask))
	
	# Loop through each cask and upgrade
	for cask in "${casks[@]}"; do
		echo "Upgrading cask: $cask"
		brew upgrade --cask "$cask"
	done
	
	rm ~/Brewfile || rm ~/.venv/Brewfile 
	
	echo "Brew software successfully updated "
}
