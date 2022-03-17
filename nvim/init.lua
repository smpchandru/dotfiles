vim.g.vscode_style = "dark"
vim.g.vscode_italic_comment = 1
-- vim.g.vscode_transparent = 1
--require("impatient")
require("default-config")
vim.cmd("luafile " .. CONFIG_PATH .. "/ch-config.lua")
require("plugins")
require("options")
require("utils")
require("keybindings")
require("autocomands")
-- require('ch-gitblame')
vim.cmd("source $HOME/.config/nvim/vimscripts/vis.vim")
vim.cmd("source $HOME/.config/nvim/vimscripts/functions.vim")
vim.cmd("source $HOME/.config/nvim/vimscripts/misc.vim")
