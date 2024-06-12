-- Normal mode key bindgings
--
--
local map = vim.keymap.set
-- map("n", "<Space>", "<NOP>", { noremap = true, silent = true })
-- map("n", "<Leader>m", require("utils").ToggleMouse, { desc = "Toggle mounse", noremap = true, silent = true })
map("n", "<Leader>F", ":lua MiniFiles.open()<CR>", { desc = "File System edit", noremap = true, silent = true })
-- resize windows
map("n", "<C-M-j>", ":resize -2<CR>", { desc = "Resize window down", noremap = true, silent = true })
map("n", "<C-M-k>", ":resize +2<CR>", { desc = "Resize window up", noremap = true, silent = true })
map("n", "<C-M-h>", ":vertical resize -2<CR>", { desc = "Resize window left", noremap = true, silent = true })
map("n", "<C-M-l>", ":vertical resize +2<CR>", { desc = "Resize window right", noremap = true, silent = true })
-- windows navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to the left window", silent = true })
map("n", "<C-j>", "<C-w>j", { desc = "Move to the down window", silent = true })
map("n", "<C-k>", "<C-w>k", { desc = "Move to the up window", silent = true })
map("n", "<C-l>", "<C-w>l", { desc = "Move to the right window", silent = true })
-- scroll related mapings

map("n", "<C-f>", "<C-f>M", { desc = "Scroll down", noremap = true, silent = true })
map("n", "<C-b>", "<C-b>M", { desc = "Scroll up", noremap = true, silent = true })
-- navigate buffers
map("n", "<C-p>", "<cmd>Telescope find_files <CR>", { desc = "Search files", noremap = true, silent = true })
map("n", "<leader>bb", "<cmd>Telescope buffers <CR>", { desc = "Search buffers", noremap = true, silent = true })
map("n", "Y", "y$", { desc = "Copy till end of line", silent = true, noremap = true })
map("n", "C", "c$", { silent = true, noremap = true })
map("n", "<C-/>", "gcc", { desc = "(n)Comment line", remap = true, silent = true })
map("n", "<C-RightMouse>", "<C-t>", { desc = "Back to caller", silent = true })
map("n", "<C-LeftMouse>", vim.lsp.buf.definition, { desc = "Go to definition", silent = true })
-- projects explorer
map("n", "<tab>", ":bnext<CR>", { desc = "Next buffer", silent = true, noremap = true })
map("n", "<s-tab>", ":bp<CR>", { desc = "Previous buffer", silent = true, noremap = true })
-- misc
map("n", "n", "nzz", { silent = true, noremap = true })
map("n", "N", "Nzz", { silent = true, noremap = true })
map("n", "J", "mzJ`z", { silent = true, noremap = true })
map("n", "\\y", '"+y', { desc = "Copy to system clipboard", silent = true, noremap = true })
map("n", "\\dd", '"_dd', { desc = "Delete without copy", silent = true, noremap = true })
map("n", "\\p", '"+p', { desc = "Paste from system clipboard", silent = true, noremap = true })
map("n", "\\r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- visual mode mapings
-- Use tab to move mapings selected text
map("v", "<S-TAB>", "<gv", { desc = "Move visual text left", noremap = true, silent = true })
map("v", "<TAB>", ">gv", { desc = "Move visual text rigt ", noremap = true, silent = true })
map("v", "<C-/>", "gb", { desc = "Comment block", remap = true, silent = true })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down", silent = true, noremap = true })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "move text up", silent = true, noremap = true })
map("v", "\\y", '"+y', { desc = "Copy to system clipboard", silent = true, noremap = true })
map("v", "\\d", '"_d', { desc = "Delete with black hole", silent = true, noremap = true })
map("x", "\\p", '"_dP', { desc = "Paste without yank on visual selection", silent = true, noremap = true })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "status" })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "diff" })
map("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", { desc = "Neovide toggle full screen" })
