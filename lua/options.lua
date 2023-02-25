local opt = {
	hidden = true, -- Required to keep multiple buffers open multiple buffers
	fileencoding = "utf-8", -- The encoding written to file
	splitbelow = true, -- Horizontal splits will automatically be below
	splitright = true, -- Vertical splits will automatically be to the right
	conceallevel = 0, -- So that I can see `` in markdown files
	showmode = false, -- We don't need to see things like -- INSERT -- anymore
	backup = false, -- This is recommended by coc
	writebackup = false, -- This is recommended by coc
	updatetime = 50, -- Faster completion
	timeoutlen = 500, -- By default timeoutlen is 1000 ms
	shiftwidth = 4,
	tabstop = 4,
	smarttab = true,
	autoindent = true,
	laststatus = 3,
	background = "dark",
	syntax = "on",
	filetype = "on",
	number = true,
	shell = "/bin/bash",
	pumheight = 10,
	swapfile = false,
	numberwidth = 2,
	completeopt = { "menuone", "noinsert", "noselect" },
	termguicolors = true,
	showtabline = 2,
	listchars = { eol = "↲", tab = "▸ ", trail = "·" },
	foldcolumn = "auto",
	mouse = "",
}
for k, v in pairs(opt) do
	vim.opt[k] = v
end
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
vim.o.pumblend = 10
vim.o.winblend = 10
vim.fn.has("")
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
if vim.g.neovide then
	vim.cmd("set mouse=a")
	vim.cmd([[
let g:neovide_fullscreen = v:true
command -nargs=0 NeovideToggleFullscreen :let g:neovide_fullscreen = !g:neovide_fullscreen
noremap <F11> :NeovideToggleFullscreen<CR>
]])
end
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
--vim.notify = require("notify")
vim.o.ch = 0
vim.o.scrolloff = 3
vim.cmd([[
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1
]])
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
vim.bo.expandtab = false -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = true -- set numbered lines
vim.wo.cursorline = false -- Enable highlighting of the current line
vim.wo.wrap = false -- Display long lines as just one line
--vim.cmd(":hi Keyword cterm=italic gui=italic")
--vim.api.nvim_set_hl("Noraml", { bg = "none" })
vim.o.guifont = "JetBrainsMono Nerd Font Mono:h20"
vim.wo.signcolumn = "no" -- Always show the signcolumn, otherwise it would shift the text each time
