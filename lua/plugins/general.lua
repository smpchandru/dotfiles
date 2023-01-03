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
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					signature = {
						enabled = false,
					},
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = false, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
	},
}
