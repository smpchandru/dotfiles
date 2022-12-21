--vim.opt.termguicolors = true
local M = {}

function M.setup(bootstrap)
	local packer_ok, packer = pcall(require, "packer")
	if not packer_ok then
		return
	end

	packer.init({
		git = { clone_timeout = 300 },
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
		ensure_dependencies = true,
		compile_on_sync = true,
		auto_reload_compiled = true,
	})
	packer.startup({
		function(use)
			-- Packer can manage itself as an optional plugin
			use("lewis6991/impatient.nvim")
			use("wbthomason/packer.nvim")
			-- use 'tpope/vim-sleuth'
			use({
				"tpope/vim-surround",
				disable = not O.plugin.surround.enable,
			})
			use({
				"tpope/vim-repeat",
				disable = not O.plugin.vim_repeat.enable,
			})
			use({
				"numToStr/Comment.nvim",
			})
			use({
				"machakann/vim-highlightedyank",
				disable = not O.plugin.highlightedyank.enable,
			})
			use({
				"aklt/plantuml-syntax",
				ft = "puml",
				disable = not O.plugin.puml_syntax.enable,
			})
			use({
				"nvim-lua/popup.nvim",
				lock = true,
				disable = not O.plugin.popup.enable,
			})
			use({
				"ahmedkhalf/project.nvim",
			})
			use({
				"L3MON4D3/LuaSnip",
				requires = {
					"rafamadriz/friendly-snippets",
				},
			})
			use({
				"ray-x/go.nvim",
				requires = {
					"ray-x/guihua.lua",
				},
			})
			use({
				"neovim/nvim-lspconfig",
				requires = {
					"j-hui/fidget.nvim",
					"folke/neodev.nvim",
					"onsails/lspkind-nvim",
					"williamboman/mason.nvim",
					"williamboman/mason-lspconfig.nvim",
					"ray-x/lsp_signature.nvim",
					"simrat39/symbols-outline.nvim",
					"sumneko/lua-language-server",
					"windwp/nvim-autopairs",
				},
			})
			use({
				"hrsh7th/nvim-cmp",
			})
			use({
				after = "hrsh7th/nvim-cmp",
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "hrsh7th/cmp-calc" },
				{ "hrsh7th/cmp-nvim-lua" },
				{ "f3fora/cmp-spell" },
				{ "kdheepak/cmp-latex-symbols" },
				{ "hrsh7th/cmp-cmdline" },
				-- { "uga-rosa/cmp-dictionary" },
				{ "hrsh7th/cmp-nvim-lsp-signature-help" },
				{ "saadparwaiz1/cmp_luasnip" },
			})
			-- git related
			use({
				"lewis6991/gitsigns.nvim",
				lock = true,
				requires = {
					"nvim-lua/plenary.nvim",
				},
				disable = not O.plugin.gitsigns.enable,
				-- event = "BufRead",
			})
			use({
				"rhysd/git-messenger.vim",
				disable = not O.plugin.gitmessenger.enable,
			})
			use({
				"TimUntersberger/neogit",
				disable = not O.plugin.neogit.enable,
			})
			use({
				"kevinhwang91/nvim-bqf",
				disable = not O.plugin.bqbf.enable,
			})
			use({
				"nvim-telescope/telescope.nvim",
				disable = not O.plugin.telescope.enable,
				requires = {
					{ "nvim-telescope/telescope-media-files.nvim" },
					{
						"nvim-telescope/telescope-fzf-native.nvim",
						run = "make",
					},
				},
			})
			use({
				"phaazon/hop.nvim",
				disable = not O.plugin.hop.enable,
			})
			use({
				"sebdah/vim-delve",
				ft = "go",
			})
			use({
				"NTBBloodbath/galaxyline.nvim",
			})
			-- markdown
			use({
				"iamcco/markdown-preview.nvim",
				ft = "markdown",
				run = function()
					vim.fn["mkdp#util#install"]()
				end,
				disable = not O.plugin.markdown_preview.enable,
			})
			use({
				"nvim-treesitter/nvim-treesitter",
				run = function()
					require("nvim-treesitter.install").update({ with_sync = true })
				end,
			})
			use({
				"nvim-treesitter/playground",
				after = "nvim-treesitter",
			})
			use({
				"nvim-treesitter/nvim-treesitter-textobjects",
				after = "nvim-treesitter",
			})
			use({
				"romgrk/nvim-treesitter-context",
				after = "nvim-treesitter",
			})
			use({
				"p00f/nvim-ts-rainbow",
				after = "nvim-treesitter",
			})

			use({
				"lukas-reineke/indent-blankline.nvim",
				disable = not O.plugin.indentblankline.enable,
			})
			use({
				"folke/which-key.nvim",
				disable = not O.plugin.whichkey.enable,
			})
			use({
				"mg979/vim-visual-multi",
				disable = not O.plugin.visul_multi.enable,
			})
			use({
				"KabbAmine/vCoolor.vim",
				disable = not O.plugin.vcolor.enable,
			})
			use({
				"andymass/vim-matchup",
				event = "CursorMoved",
				disable = not O.plugin.matchup.enable,
			})
			use({
				"sainnhe/gruvbox-material",
			})
			use({
				"cespare/vim-go-templates",
			})
			use({
				"rcarriga/nvim-notify",
			})
			use({
				"simrat39/rust-tools.nvim",
			})
			use({
				"anuvyklack/hydra.nvim",
				requires = "anuvyklack/keymap-layer.nvim",
			})
			use({
				"junegunn/fzf",
				run = function()
					vim.fn["fzf#install()"]()
				end,
			})
			use({
				"junegunn/fzf.vim",
			})
			use({ "dstein64/vim-startuptime" })
			use({
				"max397574/colortils.nvim",
			})
			use({
				"echasnovski/mini.nvim",
			})
			use({
				"jose-elias-alvarez/null-ls.nvim",
			})
			use("chaoren/vim-wordmotion")
			use("ThePrimeagen/vim-be-good")
			if bootstrap then
				require("packer").sync()
			end
		end,
		config = {
			display = {
				open_fn = require("packer.util").float,
			},
			compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
		},
	})
	local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
	vim.api.nvim_create_autocmd("BufWritePost", {
		command = "source <afile> | PackerCompile",
		group = packer_group,
		pattern = vim.fn.expand("$MYVIMRC"),
	})
	if bootstrap then
		return
	end
	M.config()
end

function M.config()
	require("Comment").setup()
	require("plugincfg.rust-tools")
	require("plugincfg.hydracfg")
	require("colortils").setup({
		register = "+", -- register in which color codes will be copied: any register
		color_preview = "█ %s", -- preview for colors, if it contains `%s` this will be replaced with a hex color code of the color
		border = "rounded", -- border for the float
	})
	require("project_nvim").setup({
		manual_mode = false,
		detection_methods = { "lsp", "pattern" },
		patterns = { ".git", "Makefile" },
		-- ignore_lsp = { "go" },
		show_hidden = false,
		exclude_dirs = { "~/go/*/*/*/*" },
		silent_chdir = true,
		datapath = vim.fn.stdpath("data"),
	})
	vim.g.nvim_tree_update_cwd = 1
	vim.g.nvim_tree_respect_buf_cwd = 1
	require("plugincfg.snippets")
	require("luasnip/loaders/from_vscode").load({
		include = { "go", "python", "bash", "rust" },
		paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets/" },
	})
	require("snippets")
	-- require("fidget").setup()
	-- require("neodev").setup()
	require("plugincfg.gonvim")
	-- require("plugincfg.mason")
	require("plugincfg.comp").config()
	require("lsp")
	require("plugincfg.symboloutline")
	require("plugincfg.gitsign").config()
	require("plugincfg.neogit")
	require("plugincfg.telescope")
	require("telescope").load_extension("media_files")
	require("telescope").load_extension("fzf")
	require("plugincfg.hop").config()
	require("plugincfg.galaxyline")
	require("plugincfg.treesitter").config()
	require("plugincfg.indentline").config()
	require("plugincfg.whichkey").config()
	vim.g.matchup_matchparen_offscreen = { method = "popup" }
	require("mini.surround").setup()
	vim.api.nvim_set_keymap("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { noremap = true })
	require("plugincfg.nullls")
end

return M
