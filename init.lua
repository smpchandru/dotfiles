local execute = vim.api.nvim_command
local fn = vim.fn
local bootstrap = false

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	bootstrap = true
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end
if not bootstrap then
	require("impatient")
end
require("default-config")
dofile(CONFIG_PATH .. "/ch-config.lua")
require("plugins").setup(bootstrap)
if bootstrap then
	return
end
require("options")
require("utils")
require("keybindings")
require("autocomands")
