vim.g.gruvbox_material_transparent_background = 2
vim.g.gruvbox_material_enable_italic = 1
vim.api.nvim_set_hl(0, "transparentBG", { bg = "NONE", fg = "LightGray" })
require("config.neovide")
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
-- vim.cmd("colorscheme gruvbox-material")
