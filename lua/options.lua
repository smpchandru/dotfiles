local opt = vim.opt
opt.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.wo.wrap = false -- Display long lines as just one line
opt.fileencoding = "utf-8" -- The encoding written to file
-- opt.mouse = "" -- Enable your mouse
opt.splitbelow = true -- Horizontal splits will automatically be below
opt.termguicolors = true -- set term giu colors most terminals support this
opt.splitright = true -- Vertical splits will automatically be to the right
opt.conceallevel = 0 -- So that I can see `` in markdown files
vim.bo.expandtab = false -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = true -- set numbered lines
vim.wo.cursorline = false -- Enable highlighting of the current line
--opt.showtabline = 1 -- Always show tabs
opt.showmode = false -- We don't need to see things like -- INSERT -- anymore
opt.backup = false -- This is recommended by coc
opt.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.updatetime = 50 -- Faster completion
opt.timeoutlen = 1000 -- By default timeoutlen is 1000 ms
opt.shiftwidth = 4
opt.tabstop = 4
vim.o.guifont = "JetBrainsMono Nerd Font Mono:h20"
-- vim.o.guifont = "JetBrains Mono Regular"
-- vim.o.guifont = "JetBrains Mono Regular:h24"
-- opt.guifont = "DejaVu SansMono for PowerlineBook:h20"
-- opt.guifont = "Droid SansMono for Powerline:h20"
-- opt.guifont = "Source Code Pro for Powerline:h14"
-- opt.guifont = "JetBrains Mono Regular:h30"
opt.smarttab = true
opt.autoindent = true
opt.laststatus = 3
opt.background = "dark"
opt.syntax = "on"
opt.filetype = "on"
opt.number = true
opt.shell = "/bin/bash"
opt.pumheight = 10
opt.numberwidth = 2
vim.cmd("set t_ut=")
vim.cmd("set history=1000")
vim.cmd("set diffopt+=iwhite")
vim.cmd("set diffopt+=vertical")
vim.cmd("set noshowmode")
vim.cmd("set iskeyword+=-") -- treat dash separated words as a word text object"
vim.cmd("set shortmess+=c") -- Don't pass messages to |ins-completion-menu|.
vim.cmd("set whichwrap+=<,>,[,],h,l") -- move to next line with theses keys
vim.cmd("set ts=4") -- Insert 2 spaces for a tab
vim.cmd("set nocompatible")
vim.cmd("set relativenumber")
opt.swapfile = false
vim.o.pumblend = 10
vim.o.winblend = 10
vim.fn.has("")
if vim.fn.has("termguicolors") then
	opt.termguicolors = true
end
vim.cmd("set formatoptions-=cro")
vim.g.mapleader = O.leader_key
vim.g.maplocalleader = ";"
vim.cmd("highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15")
vim.cmd("highlight ColorColumn ctermbg=1")
vim.cmd("hi Search cterm=NONE ctermfg=grey ctermbg=blue")
vim.cmd("highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15")
vim.g.highlightedyank_highlight_duration = 10000
vim.g.gruvbox_material_background = "dark"
vim.cmd("colorscheme " .. O.colorscheme)
vim.opt.listchars:append("eol:↴")
vim.opt.mouse = ""
if vim.g.neovide then
	vim.cmd("set mouse=a")
	vim.cmd([[
let g:neovide_fullscreen = v:true
command -nargs=0 NeovideToggleFullscreen :let g:neovide_fullscreen = !g:neovide_fullscreen
noremap <F11> :NeovideToggleFullscreen<CR>
]])
end
vim.notify = require("notify")
vim.o.ch = 0
vim.o.scrolloff = 3
vim.cmd([[
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1
]])
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
--vim.cmd(":hi Keyword cterm=italic gui=italic")
--vim.api.nvim_set_hl("Noraml", { bg = "none" })
