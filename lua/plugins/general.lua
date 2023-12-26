return {
	{ "tpope/vim-repeat", event = "InsertEnter" },
	{ "numToStr/Comment.nvim", config = true, event = "VeryLazy" },
	{
		"andymass/vim-matchup",
		event = "VeryLazy",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	{
		"tpope/vim-fugitive",
		dependencies = {
			"tommcdo/vim-fubitive",
		},
		event = "VeryLazy",
	},
	{
		"tpope/vim-unimpaired",
		event = "VeryLazy",
		enabled = false,
	},
	{ "smpchandru/gruvbox-material" },
	{ "folke/tokyonight.nvim" },
	{ "sainnhe/everforest" },
	{ "chaoren/vim-wordmotion", event = "VeryLazy" },
	{ "rhysd/git-messenger.vim", event = "VeryLazy" },
	{ "kevinhwang91/nvim-bqf", event = "VeryLazy" },
	{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },
	{ "mg979/vim-visual-multi", event = "VeryLazy" },
	{
		"nvim-tree/nvim-web-devicons",
	}, -- optional dependency
	-- { "ryanoasis/vim-devicons" },
	{ "rhysd/open-pdf.vim", event = "VeryLazy" },
	{ "folke/trouble.nvim", config = true, event = "VimEnter" },
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				-- Builtin line number string options for ScLn() segment
				thousands = false, -- or line number thousands separator string ("." / ",")
				relculright = false, -- whether to right-align the cursor line number with 'relativenumber' set
				-- Builtin 'statuscolumn' options
				setopt = true, -- whether to set the 'statuscolumn', providing builtin click actions
				ft_ignore = nil, -- lua table with filetypes for which 'statuscolumn' will be unset
				-- Default segments (fold -> sign -> line number + separator)
				segments = {
					{ text = { "%s" }, click = "v:lua.ScSa" },
					-- {
					{
						text = { builtin.lnumfunc, " " },
						condition = { true, builtin.not_empty },
						click = "v:lua.ScLa",
					},
					-- 	text = { "", builtin.foldfunc, "" },
					-- 	condition = { builtin.not_empty, true, builtin.not_empty },
					-- 	click = "v:lua.ScFa",
					-- },
				},
				clickhandlers = {
					Lnum = builtin.lnum_click,
					FoldClose = builtin.foldclose_click,
					FoldOpen = builtin.foldopen_click,
					FoldOther = builtin.foldother_click,
					DapBreakpointRejected = builtin.toggle_breakpoint,
					DapBreakpoint = builtin.toggle_breakpoint,
					DapBreakpointCondition = builtin.toggle_breakpoint,
					DiagnosticSignError = builtin.diagnostic_click,
					DiagnosticSignHint = builtin.diagnostic_click,
					DiagnosticSignInfo = builtin.diagnostic_click,
					DiagnosticSignWarn = builtin.diagnostic_click,
					GitSignsTopdelete = builtin.gitsigns_click,
					GitSignsUntracked = builtin.gitsigns_click,
					GitSignsAdd = builtin.gitsigns_click,
					GitSignsChangedelete = builtin.gitsigns_click,
					GitSignsDelete = builtin.gitsigns_click,
				},
			})
		end,
	},
	{
		"junegunn/fzf",
		event = "BufEnter",
		dependencies = {
			"junegunn/fzf.vim",
		},
	},
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
	{
		"rmagatti/goto-preview",
		config = true,
	},
	{
		"SmiteshP/nvim-navbuddy",
		opts = {
			lsp = {
				auto_attach = true,
			},
		},
		config = true,
	},
	{
		"lvimuser/lsp-inlayhints.nvim",
		config = true,
	},
	-- {
	-- 	"Bekaboo/dropbar.nvim",
	-- },
	{
		"davidgranstrom/nvim-markdown-preview",
	},
	{ "mattn/emmet-vim" },
	{ "mlaursen/vim-react-snippets" },
	{
		"NvChad/nvim-colorizer.lua",
		config = true,
	},
	{
		"KabbAmine/vCoolor.vim",
	},
	{
		"stevearc/conform.nvim",
		config = true,
		opts = {},
	},
}
