-- require('nvim-treesitter.ts_utils').get_vim_rangec
vim.g.mapleader = " "
require("default-config")
dofile(CONFIG_PATH .. "/ch-config.lua")
require("lazy.config")
require("options")
require("utils")
require("keybindings")
require("autocomands")
