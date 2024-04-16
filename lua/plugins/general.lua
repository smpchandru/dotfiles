--local rainbow_delimiters = require("rainbow-delimiters")
return {
	{ "tpope/vim-repeat", event = "InsertEnter" },
	{ "numToStr/Comment.nvim", config = true, event = "VeryLazy" },
	{
		"tpope/vim-fugitive",
		dependencies = {
			"tommcdo/vim-fubitive",
		},
		event = "VeryLazy",
	},
	{ "smpchandru/gruvbox-material" },
	{ "chaoren/vim-wordmotion", event = "VeryLazy" },
	{ "rhysd/git-messenger.vim", event = "VeryLazy" },
	{ "kevinhwang91/nvim-bqf", event = "VeryLazy" },
	{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },
	{ "mg979/vim-visual-multi", event = "VeryLazy" },
	{
		"nvim-tree/nvim-web-devicons",
	},
	{ "folke/trouble.nvim", config = true, event = "VimEnter" },
	-- {
	-- 	"junegunn/fzf",
	-- 	event = "BufEnter",
	-- 	dependencies = {
	-- 		"junegunn/fzf.vim",
	-- 	},
	-- },
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
		branch = "nightly",
		config = true,
	},
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			"skim",
			winopts = {
				height = 0.6,
				row = 0.5,
				col = 0.5,
				width = 0.55,
				preview = {
					hidden = "hidden",
					vertical = "down:90%",
					layout = "flex",
				},
			},
		},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
	},
}
