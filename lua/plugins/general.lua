return {
	--"tpope/vim-surround",
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "numToStr/Comment.nvim", config = true, event = "VeryLazy" },
	{ "nvim-lua/popup.nvim", event = "VeryLazy" },
	{ "rcarriga/nvim-notify", event = "VeryLazy" },
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
	},
	{ "smpchandru/gruvbox-material" },
	{ "sainnhe/everforest" },
	{ "chaoren/vim-wordmotion", event = "VeryLazy" },
	{ "rhysd/git-messenger.vim", event = "VeryLazy" },
	{ "kevinhwang91/nvim-bqf", event = "VeryLazy" },
	{ "chaoren/vim-wordmotion", event = "VeryLazy" },
	{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },
	{ "mg979/vim-visual-multi", event = "VeryLazy" },
	{ "nvim-tree/nvim-web-devicons", event = "VeryLazy" }, -- optional dependency
	{ "rhysd/open-pdf.vim", event = "VeryLazy" },
	{ "folke/trouble.nvim", config = true, event = "VeryLazy" },
	{
		"junegunn/fzf",
		event = "VeryLazy",
	},
	{
		"junegunn/fzf.vim",
		event = "VeryLazy",
	},
	{
		enabled = false,
		"echasnovski/mini.animate",
		event = "VeryLazy",
		config = function()
			require("mini.animate").setup()
		end,
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.surround").setup()
		end,
		event = "VeryLazy",
	},
}
