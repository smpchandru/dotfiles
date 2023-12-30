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
		config = true,
	},
	-- { "folke/trouble.nvim", config = true, event = "VimEnter" },
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
	{ "tiagovla/scope.nvim", event = "VeryLazy", opts = {} },
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		config = true,
	},
}
