local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	dependencies = {
		{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
		"nvim-treesitter/nvim-treesitter-textobjects",
		{ "romgrk/nvim-treesitter-context", event = "BufReadPre" },
		"p00f/nvim-ts-rainbow",
	},
}

M.config = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "vim", "go", "yaml", "json", "python", "rust", "lua" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		-- TODO seems to be broken
		ignore_install = { "haskell" },
		highlight = {
			enable = true, -- false will disable the whole extension
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
			keybindings = {
				toggle_query_editor = "o",
				toggle_hl_groups = "i",
				toggle_injected_languages = "t",
				toggle_anonymous_nodes = "a",
				toggle_language_display = "I",
				focus_language = "f",
				unfocus_language = "F",
				update = "R",
				goto_node = "<cr>",
				show_help = "?",
			},
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "<c-up>",
				scope_incremental = "<a-up>",
				node_decremental = "<c-down>",
			},
		},
		indent = {
			enable = true,
			disable = { "go", "python" },
		},
		autopairs = { enable = true },
		rainbow = { enable = true },
		textobjects = {
			lsp_interop = {
				enable = true,
				border = "rounded",
				peek_definition_code = {
					["<leader>df"] = "@function.outer",
				},
			},
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["al"] = "@loop.outer",
					["ac"] = "@conditional.outer",
				},
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
					["@class.outer"] = "<c-v>", -- blockwise
				},
				include_surrounding_whitespace = false,
			},
		},
		refactor = {
			highlight_definitions = { enable = true },
			smart_rename = {
				enable = true,
				keymaps = {
					smart_rename = "grr",
				},
			},
			highlight_current_scope = {
				disable = {},
				enable = false,
				module_path = "nvim-treesitter-refactor.highlight_current_scope",
			},
		},
	})
end
return M
