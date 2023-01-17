return {
	--"tpope/vim-surround",
	"tpope/vim-repeat",
	{ "numToStr/Comment.nvim", config = true },
	"nvim-lua/popup.nvim",
	"rcarriga/nvim-notify",
	{
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	{
		"tpope/vim-fugitive",
		dependencies = {
			"tommcdo/vim-fubitive",
		},
	},
	{
		"tpope/vim-unimpaired",
	},
	{ "smpchandru/gruvbox-material" },
	{ "sainnhe/everforest" },
	{ "chaoren/vim-wordmotion" },
	{ "rhysd/git-messenger.vim" },
	{ "kevinhwang91/nvim-bqf" },
	{ "chaoren/vim-wordmotion" },
	{ "ThePrimeagen/vim-be-good" },
	{ "mg979/vim-visual-multi" },
	{ "folke/trouble.nvim", config = true },
	{
		"junegunn/fzf",
	},
	{
		"junegunn/fzf.vim",
	},
	{
		"echasnovski/mini.animate",
		config = function()
			require("mini.animate").setup()
		end,
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.surround").setup()
		end,
	},
}
