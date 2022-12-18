-- Normal mode key bindgings
--
local map = vim.api.nvim_set_keymap
map("n", "<Space>", "<NOP>", { noremap = true, silent = true })
map(
	"n",
	"<Leader>m",
	':lua require("utils").ToggleMouse()<CR>',
	{ desc = "Toggle mounse", noremap = true, silent = true }
)
if O.plugin.symbol_outline.enable == true then
	map("n", "<leader>o", ":SymbolsOutline<CR>", { desc = "Symbol outline", silent = true })
end
-- resize windows
map("n", "<M-j>", ":resize -2<CR>", { desc = "Resize window down", noremap = true, silent = true })
map("n", "<M-k>", ":resize +2<CR>", { desc = "Resize window up", noremap = true, silent = true })
map("n", "<M-h>", ":vertical resize -2<CR>", { desc = "Resize window left", noremap = true, silent = true })
map("n", "<M-l>", ":vertical resize +2<CR>", { desc = "Resize window right", noremap = true, silent = true })
-- windows navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to the left window", silent = true })
map("n", "<C-j>", "<C-w>j", { desc = "Move to the down window", silent = true })
map("n", "<C-k>", "<C-w>k", { desc = "Move to the up window", silent = true })
map("n", "<C-l>", "<C-w>l", { desc = "Move to the right window", silent = true })
-- map("n", "<leader><leader>s", "<cmd>luafile ~/.config/nvim/lua/snippets.lua<CR>", { silent = false })

map("n", "<C-y>", ":e $MYVIMRC<CR>", { desc = "Config", noremap = true, silent = true })
map("n", "<C-f>", "<C-f>M", { desc = "Scroll down", noremap = true, silent = true })
map("n", "<C-b>", "<C-b>M", { desc = "Scroll up", noremap = true, silent = true })
-- navigate buffers
map("n", "<C-p>", "<cmd>Files<CR>", { desc = "Search files", noremap = true, silent = true })
map("n", "<leader>b", "<cmd>Buffers<CR>", { desc = "Search buffers", noremap = true, silent = true })
map("n", "Y", "y$", { desc = "Copy till end of line", silent = true, noremap = true })
map("n", "C", "c$", { silent = true, noremap = true })
map("n", "<C-/>", "gcc", { desc = "(n)Comment line", silent = true })
if O.plugin.hop.enable == true then
	map("n", "s", ":HopChar2<cr>", { desc = "Hop 2 chars", silent = true })
	map("n", "S", ":HopWord<cr>", { desc = "Hop word", silent = true })
end
map("n", "<C-RightMouse>", "<C-t>", { desc = "Back to caller", silent = true })
map("n", "<C-LeftMouse>", ":lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition", silent = true })
-- projects explorer
map("n", "<leader>w", ":Telescope projects<CR>", { desc = "Workspaces", silent = true })
map("n", "<tab>", ":bnext<CR>", { desc = "Next buffer", silent = true, noremap = true })
map("n", "<s-tab>", ":bp<CR>", { desc = "Previous buffer", silent = true, noremap = true })
-- misc
map("n", "n", "nzzv", { silent = true, noremap = true })
map("n", "N", "Nzzv", { silent = true, noremap = true })
map("n", "J", "mzJ`z", { silent = true, noremap = true })
map("n", "\\y", '"+y', { desc = "Copy to system clipboard", silent = true, noremap = true })
map("n", "\\dd", '"_dd', { desc = "Copy to system clipboard", silent = true, noremap = true })
map("n", "\\p", '"+p', { desc = "Copy to system clipboard", silent = true, noremap = true })
vim.cmd([[
        inoremap <A-h> <C-\><C-N><C-w>h
        inoremap <A-j> <C-\><C-N><C-w>j
        inoremap <A-k> <C-\><C-N><C-w>k
        inoremap <A-l> <C-\><C-N><C-w>l
]])
-- visual mode mapings
-- Use tab to move visully selected text
map("v", "<S-TAB>", "<gv", { desc = "Move visul text left", noremap = true, silent = true })
map("v", "<TAB>", ">gv", { desc = "Move visual text rigt ", noremap = true, silent = true })
map("v", "<C-/>", "gb", { desc = "Comment block", silent = true })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down", silent = true, noremap = true })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "move text up", silent = true, noremap = true })
map("v", "\\y", '"+y', { desc = "Copy to system clipboard", silent = true, noremap = true })
map("v", "\\d", '"_d', { desc = "Delete with black hole", silent = true, noremap = true })

map("x", "\\p", '"_dP', { desc = "Paste without yank", silent = true, noremap = true })
-- map("i", ",,", "<c-g>u", { silent = true, noremap = true })
-- map("i", "))", "<c-g>u", { silent = true, noremap = true })
-- map("i", ".", ".<c-g>u", { silent = true, noremap = true })
