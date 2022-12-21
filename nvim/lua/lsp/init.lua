-- Lspkind config
local M = {}
function getLuaLibPath()
	local i, t, popen = 0, {}, io.popen
	local parentDir = {
		vim.fn.stdpath("data") .. "/site/pack/packer/start/",
		vim.fn.stdpath("data") .. "/site/pack/packer/opt/",
	}
	for _, k in pairs(parentDir) do
		print(k)
		local pfile = popen('ls -1D "' .. k .. '"')
		for filename in pfile:lines() do
			print(filename)
			i = i + 1
			t[i] = k .. filename .. "/lua"
		end
		pfile:close()
	end
	return t
end

require("lspkind").init({
	mode = "symbol_text",
	preset = "codicons",
})
-- nvim-cmp settings
require("plugincfg.comp").config()
require("plugincfg.autopairs")
-- lsp signature related settings
local sigConfig = {
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	-- If you want to hook lspsaga or other signature handler, pls set to false
	doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
	floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
	fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
	hint_enable = false, -- virtual hint enable
	hint_prefix = "🐼 ", -- Panda for parameter
	hint_scheme = "String",
	use_lspsaga = false, -- set to true if you want to use lspsaga popup
	hi_parameter = "Underlined", -- how your parameter will be highlight
	max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
	max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
	transpancy = 100,
	handler_opts = {
		border = "rounded", -- double, single, shadow, none
	},
	extra_trigger_chars = { "(", "," }, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
}

require("lsp_signature").on_attach(sigConfig)
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})
vim.keymap.set(
	"n",
	"[d",
	"<cmd>lua vim.diagnostic.goto_prev()<CR>",
	{ desc = "Prev diagnostic", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"]d",
	"<cmd>lua vim.diagnostic.goto_next()<CR>",
	{ desc = "Next diagnostic", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<space>q",
	"<cmd>lua vim.diagnostic.setloclist()<CR>",
	{ desc = "Diag quickfix", noremap = true, silent = true }
)
--vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.keymap.set(
	"n",
	"gD",
	"<cmd>lua vim.lsp.buf.declaration()<CR>",
	{ desc = "Declaration", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"gd",
	"<cmd>lua vim.lsp.buf.definition()<CR>",
	{ desc = "Definition", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"gr",
	"<cmd>lua vim.lsp.buf.references()<CR>",
	{ desc = "References", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"C-]",
	"<cmd>lua vim.lsp.buf.definition()<CR>",
	{ desc = "Definition", noremap = true, silent = true }
)
vim.keymap.set("n", "<s-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover", noremap = true, silent = true })
vim.keymap.set(
	"n",
	"gi",
	"<cmd>lua vim.lsp.buf.implementation()<CR>",
	{ desc = "implementation", noremap = true, silent = true }
)
-- vim.keymap.set("n", "<s-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename", noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<space>f",
	"<cmd>lua vim.lsp.buf.format{ async = true }<CR>",
	{ desc = "Format", noremap = true, silent = true }
)
