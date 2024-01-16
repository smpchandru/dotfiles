local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "VeryLazy" },
	--[[ build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end, ]]
	build = ":TSUpdate",
	dependencies = {
		{ "nvim-treesitter/playground",                 cmd = "TSPlaygroundToggle" },
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "romgrk/nvim-treesitter-context",             event = "BufReadPre" },
		{ "HiPhish/nvim-ts-rainbow2" },
		{ "windwp/nvim-ts-autotag" },
		{ "theHamsta/nvim-treesitter-pairs" },
	},
}

M.config = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "vim", "go", "yaml", "json", "python", "rust", "lua", "markdown", "vim", "vimdoc" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		-- TODO seems to be broken
		ignore_install = { "haskell" },
		highlight = {
			enable = true, -- false will disable the whole extension
		},
		pairs = {
			enable = true,
			disable = {},
			highlight_pair_events = { "CursorMoved" }, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
			highlight_self = true,                   -- whether to highlight also the part of the pair under cursor (or only the partner)
			goto_right_end = false,                  -- whether to go to the end of the right partner or the beginning
			fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
			keymaps = {
				goto_partner = "<leader>%",
				delete_balanced = "X",
			},
			delete_balanced = {
				only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
				fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
				longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
				-- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
			},
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
		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = true,
		},
		rainbow = {
			enable = true,
			-- list of languages you want to disable the plugin for
			disable = { "jsx", "cpp" },
			-- Which query to use for finding delimiters
			query = "rainbow-parens",
			-- Highlight the entire buffer all at once
			strategy = require("ts-rainbow.strategy.global"),
		},
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
					["ai"] = "@loop.inner",
					["ac"] = "@conditional.outer",
					["ic"] = "@conditional.inner",
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
