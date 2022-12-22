#!/bin/bash
if ! which nvim 
then
	echo "Neovim not present installing"
	curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
	sudo dpkg -i nvim-linux64.deb
	sudo apt-get install python3-neovim
fi
if [ -d "$HOOME/.config/nvim" ]
then
	echo "Neovim config exist taking backup as $HOME/.config/nvim_old"
	mv $HOME/.config/nvim $HOME/.config/nvim_old
fi
git clone https://github.com/smpchandru/cnvim.git ~/.config/nvim
nvim 

