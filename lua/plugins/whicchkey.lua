local M = {
	"folke/which-key.nvim",
}

-- Config for whick key
M.config = function()
	require("which-key").setup({
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			presets = {
				operators = true, -- adds help for operators like d, y, ...
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows z = true, -- bindings for folds, spelling and others prefixed with z g = true, -- bindings for prefixed with g
			},
		},
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
		},
		window = {
			border = "rounded", -- none, single, double, shadow
			position = "bottom", -- bottom, top
			margin = { 1, 5, 1, 5 }, -- extra window margin [top, right, bottom, left]
			padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
			winblend = 20,
		},
		layout = {
			height = { min = 4, max = 15 },                                     -- min and max height of the columns
			width = { min = 20, max = 50 },                                     -- min and max width of the columns
			spacing = 3,                                                        -- spacing between columns
		},
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
		show_help = true,                                                       -- show help message on the command line when the popup is visible
	})

	-- Set leader
	vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
	vim.g.mapleader = " "

	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	}

	local mappings = {
		["o"] = "Outline",
		["m"] = "Mouse Toggle",
		["w"] = "Workspase/Projects",
		["g"] = "Git(hydra)",
		["f"] = "File system",
		t = {
			name = "Telescope",
			t = { ":Telescope<CR>", "Telescope" },
			h = { ":Telescope help_tags<CR>", "Help" },
			f = { ":Telescope find_files<CR>", "files" },
			k = { ":Telescope keymaps<CR>", "Keys" },
			b = { ":Telescope buffers<CR>", "Buffers" },
			g = { ":Telescope live_grep<CR>", "Grep" },
			s = { ":Telescope lsp_document_symbols<CR>", "Symbols" },
		},
		l = {
			name = "+lsp",
			a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Actions" },
			r = { ":lua vim.lsp.buf.references()<cr>", "References" },
		},
		j = {
			name = "which_key_ignore",
		},
		k = {
			name = "which_key_ignore",
		},
	}
	local wk = require("which-key")
	wk.register(mappings, opts)
	wk.register({ ["<leader>w"] = { "<cmd>Telescope projects<cr>", "List projects(telescope)" } })
end
return M

