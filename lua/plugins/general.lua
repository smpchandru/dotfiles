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
	-- { "smpchandru/gruvbox-material" },
	{ "kevinhwang91/nvim-bqf", event = "VeryLazy", enabled = false },
	{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },
	{ "mg979/vim-visual-multi", event = "VeryLazy" },
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"mlaursen/vim-react-snippets",
		event = "VeryLazy",
		enabled = false,
	},
	{
		"NvChad/nvim-colorizer.lua",
		-- event = "VeryLazy",
		config = true,
	},
	{
		"KabbAmine/vCoolor.vim",
		event = "VeryLazy",
	},
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		-- branch = "nightly",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = true,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
	},
	{
		"tpope/vim-dadbod",
		event = "VeryLazy",
		dependencies = {
			"kristijanhusak/vim-dadbod-completion",
			"kristijanhusak/vim-dadbod-ui",
		},
	},
	-- lazy.nvim
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"tris203/precognition.nvim",
		enabled = false,
		config = {
			startVisible = true,
			showBlankVirtLine = true,
			-- highlightColor = { link = "Comment"),
			-- hints = {
			--      Caret = { text = "^", prio = 2 },
			--      Dollar = { text = "$", prio = 1 },
			--      MatchingPair = { text = "%", prio = 5 },
			--      Zero = { text = "0", prio = 1 },
			--      w = { text = "w", prio = 10 },
			--      b = { text = "b", prio = 9 },
			--      e = { text = "e", prio = 8 },
			--      W = { text = "W", prio = 7 },
			--      B = { text = "B", prio = 6 },
			--      E = { text = "E", prio = 5 },
			-- },
			gutterHints = {
				--     -- prio is not currently used for gutter hints
				G = { text = "", prio = 0 },
				gg = { text = "", prio = 0 },
				PrevParagraph = { text = "", prio = 0 },
				NextParagraph = { text = "", prio = 0 },
			},
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			indent = { enabled = true },
		},
	},
}
