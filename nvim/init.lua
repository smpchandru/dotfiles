-- require("impatient")
require("default-config")
vim.cmd("luafile " .. CONFIG_PATH .. "/ch-config.lua")
require("plugins")
require("options")
require("utils")
require("keybindings")
require("autocomands")
