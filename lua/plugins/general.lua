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
	{ "machakann/vim-highlightedyank" },
	{ "smpchandru/gruvbox-material" },
	{ "chaoren/vim-wordmotion" },
	{ "ahmedkhalf/project.nvim" },
	{ "rhysd/git-messenger.vim" },
	{ "kevinhwang91/nvim-bqf" },
	{ "chaoren/vim-wordmotion" },
	{ "ThePrimeagen/vim-be-good" },
	{ "mg979/vim-visual-multi" },
	{
		"junegunn/fzf",
	},
	{
		"junegunn/fzf.vim",
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.surround").setup()
		end,
	},
}
