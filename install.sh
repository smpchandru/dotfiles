#!/bin/bash
if ! which nvim 
then
	echo "Neovim not present installing"
	curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
	sudo dpkg -i nvim-linux64.deb
	sudo apt-get install python3-neovim
fi
git clone https://github.com/smpchandru/cnvim.git ~/.config/nvim
nvim --headless \
-c 'autocmd User PackerComplete quitall' \

