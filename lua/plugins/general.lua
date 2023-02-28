return {
	--"tpope/vim-surround",
	{ "tpope/vim-repeat", event = "InsertEnter" },
	{ "numToStr/Comment.nvim", config = true, event = "VeryLazy" },
	{ "nvim-lua/popup.nvim", event = "VimEnter" },
	{ "rcarriga/nvim-notify", event = "VeryLazy", enabled = false },
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
	{ "nvim-tree/nvim-web-devicons", event = "VeryLazy" }, -- optional dependency
	{ "rhysd/open-pdf.vim", event = "VeryLazy" },
	{ "folke/trouble.nvim", config = true, event = "VimEnter" },
	{
		"junegunn/fzf",
		event = "BufEnter",
		dependencies = {
			"junegunn/fzf.vim",
		},
	},
}
