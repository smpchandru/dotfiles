return {
	{ "tpope/vim-repeat",      event = "InsertEnter" },
	{ "numToStr/Comment.nvim", config = true,        event = "VeryLazy" },
	{
		"tpope/vim-fugitive",
		dependencies = {
			"tommcdo/vim-fubitive",
		},
		event = "VeryLazy",
	},
	{ "smpchandru/gruvbox-material" },
	{ "chaoren/vim-wordmotion",     event = "VeryLazy" },
	{ "rhysd/git-messenger.vim",    event = "VeryLazy" },
	{ "kevinhwang91/nvim-bqf",      event = "VeryLazy" },
	{ "ThePrimeagen/vim-be-good",   event = "VeryLazy" },
	{ "mg979/vim-visual-multi",     event = "VeryLazy" },
	{
		"nvim-tree/nvim-web-devicons",
	},
	{ "folke/trouble.nvim",         config = true, event = "VimEnter" },
	{
		"junegunn/fzf",
		event = "BufEnter",
		dependencies = {
			"junegunn/fzf.vim",
		},
	},
	{
		"davidgranstrom/nvim-markdown-preview",
		ft = "markdown",
	},
	{ "mattn/emmet-vim" },
	{ "mlaursen/vim-react-snippets" },
	{
		"NvChad/nvim-colorizer.lua",
	},
	{
		"KabbAmine/vCoolor.vim",
	},
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{ "tiagovla/scope.nvim", event = "VeryLazy", opts = {} },
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		config = true,
	},
}
