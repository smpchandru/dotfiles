local execute = vim.api.nvim_command
vim.opt.termguicolors = true
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
	return
end

packer.init({
	-- compile_path = vim.fn.stdpath('data')..'/site/pack/loader/start/packer.nvim/plugin/packer_compiled.vim',
	compile_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "plugin", "packer_compiled.vim"),
	git = { clone_timeout = 300 },
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return packer.startup({
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
			config = function()
				require("Comment").setup()
			end,
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
		-- project
		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup({
					manual_mode = false,
					detection_methods = { "lsp", "pattern" },
					patterns = { ".git","Makefile" },
					-- ignore_lsp = { "go" },
					show_hidden = false,
					exclude_dirs = { "~/go/*/*/*/*" },
					silent_chdir = true,
					datapath = vim.fn.stdpath("data"),
				})
				vim.g.nvim_tree_update_cwd = 1
				vim.g.nvim_tree_respect_buf_cwd = 1
			end,
		})

		use({
			"L3MON4D3/LuaSnip",
			config = function()
				require("snippets")
				require("luasnip/loaders/from_vscode").load({
					include = { "go", "python", "bash" },
					paths = { "~/.local/share/nvim/site/pack/packer/opt/friendly-snippets/" },
				})
			end,
			requires = { "rafamadriz/friendly-snippets", event = "InsertCharPre" },
		})
		if O.lsp_client == true then
			use({
				"neovim/nvim-lspconfig",
			})
			use({
				"williamboman/nvim-lsp-installer",
			})
			use({
				"hrsh7th/nvim-cmp",
				opt = false,
				requires = {
					"hrsh7th/cmp-nvim-lsp",
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
					"hrsh7th/cmp-calc",
					"hrsh7th/cmp-nvim-lua",
					"f3fora/cmp-spell",
					"kdheepak/cmp-latex-symbols",
					"windwp/nvim-autopairs",
					"hrsh7th/cmp-cmdline",
					"uga-rosa/cmp-dictionary",
					-- "hrsh7th/cmp-nvim-lsp-signature-help",
					"saadparwaiz1/cmp_luasnip",
				},
			})
			use({
				"ray-x/lsp_signature.nvim",
			})
			use({
				"simrat39/symbols-outline.nvim",
				cmd = "SymbolsOutline",
				setup = function()
					require("ch-symboloutline")
				end,
				disable = not O.plugin.symbol_outline.enable,
			})
			use({
				"sumneko/lua-language-server",
				disable = not O.plugin.sumneko.enable,
			})
			use({"onsails/lspkind-nvim"})
			require("lsp")
		end
		-- git related
		use({
			"lewis6991/gitsigns.nvim",
			lock = true,
			config = function()
				require("ch-gitsign").config()
			end,
			requires = {
				"nvim-lua/plenary.nvim",
			},
			disable = not O.plugin.gitsigns.enable,
			event = "BufRead",
		})
		use({
			"rhysd/git-messenger.vim",
			disable = not O.plugin.gitmessenger.enable,
		})
		use({
			"TimUntersberger/neogit",
			opt = false,
			requires = {
				"nvim-lua/plenary.nvim",
				"sindrets/diffview.nvim",
			},
			disable = not O.plugin.neogit.enable,
			config = function()
				require("ch-neogit")
			end,
		})
		use({
			"kevinhwang91/nvim-bqf",
			disable = not O.plugin.bqbf.enable,
		})
		use({
			"nvim-telescope/telescope.nvim",
			config = function()
				require("ch-telescope")
				require("telescope").load_extension("media_files")
				require("telescope").load_extension("fzf")
			end,
			disable = not O.plugin.telescope.enable,
			requires = {
				{ "nvim-telescope/telescope-media-files.nvim" },
				{ "nvim-telescope/telescope-fzf-writer.nvim" },
				{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			},
		})
		use({
			"phaazon/hop.nvim",
			event = "BufRead",
			config = function()
				require("ch-hop").config()
			end,
			disable = not O.plugin.hop.enable,
			opt = true,
		})
		-- select wondow
		--[[ use({
			"t9md/vim-choosewin",
			disable = not O.plugin.choosewin.enable,
		}) ]]
		-- golang related
		use({
			"fatih/vim-go",
			ft = "go",
			disable = not O.plugin.vim_go.enable,
			config = function()
				require("ch-vimgo")
			end,
		})
		use({
			"ray-x/go.nvim",
			ft = "go",
			requires = {
				"mfussenegger/nvim-dap",
				"rcarriga/nvim-dap-ui",
				"theHamsta/nvim-dap-virtual-text",
			},
			config = function()
				require("go").setup()
			end,
		})
		use({
			"sebdah/vim-delve",
			-- disable = not O.plugin.delve.enable,
			ft = "go",
		})
		-- status/tab line
		use({
			"NTBBloodbath/galaxyline.nvim",
			branch = "main",
			-- your statusline
			config = function()
				require("ch-galaxyline")
			end,
			disable = not O.plugin.galaxyline.enable,
			-- some optional icons
			requires = {
				{ "kyazdani42/nvim-web-devicons", opt = true },
			},
		})
		use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function () require('ch-bufferline') end
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
		-- terminal related
		use({
			"voldikss/vim-floaterm",
			disable = not O.plugin.floaterm.enable,
			config = function()
				require("ch-floaterm").config()
			end,
		})
		-- appearance and color schmes
		use({
			"christianchiarulli/nvcode-color-schemes.vim",
			disable = not O.plugin.nvcode.enable,
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			commit = "8769230e6dff7b4243798a97de6072cf3c8b0df8",
		run = ":TSUpdate",
			config = function()
				require("ch-treesitter").config()
			end,
			requires = {
				"nvim-treesitter/nvim-treesitter-refactor",
				"nvim-treesitter/nvim-treesitter-textobjects",
				"romgrk/nvim-treesitter-context",
				"p00f/nvim-ts-rainbow",
			},
			disable = not O.plugin.treesitter.enable,
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("ch-indentline").config()
			end,
			disable = not O.plugin.indentblankline.enable,
		})
		use({
			"folke/which-key.nvim",
			config = function()
				require("ch-whichkey").config()
			end,
			--config = function () vim.cmd() end,
			--config = function() vim.cmd('source $HOME/.config/nvim/vimscripts/whichkey/init.vim') end,
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
			config = function()
				vim.g.matchup_matchparen_offscreen = {method = 'popup'}
			end,
			disable = not O.plugin.matchup.enable,
		})
		--   -- Dashboard
		use({
			"ChristianChiarulli/dashboard-nvim",
			event = "BufWinEnter",
			config = function()
				require("ch-dashboard").setup()
			end,
			disable = not O.plugin.dashboard.enable,
		})
		--[[ use({
			"lewis6991/spellsitter.nvim",
			config = function()
				require("spellsitter").setup()
			end,
		}) ]]
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		})
		--[[ use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("ch-null-ls")
			end,
			disable = true,
			requires = { "nvim-lua/plenary.nvim" },
		}) ]]
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("trouble").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				})
			end,
		})
		use {
			'Mofiqul/vscode.nvim',
		}
		require("packer_compiled")
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},

})
