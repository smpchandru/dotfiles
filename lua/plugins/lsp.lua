local servers = {
	rust_analyzer = {},
	gopls = {
		settings = {
			gopls = {
				allExperiments = true,
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					constantValue = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
			},
		},
	},
	bashls = {},
	jsonls = {},
	yamlls = {},
	terraformls = {},
	lua_ls = {
		single_file_support = true,
		settings = {
			Lua = {
				workspace = {
					checkThirdParty = true,
				},
				completion = {
					workspaceWord = true,
					callSnippet = "Both",
				},
				misc = {
					parameters = {
						"--log-level=trace",
					},
				},
				hint = {
					enable = true,
					arrayIndex = "Enable",
					setType = true,
				},
				diagnostics = {
					-- enable = false,
					groupSeverity = {
						strong = "Warning",
						strict = "Warning",
					},
					groupFileStatus = {
						["ambiguity"] = "Opened",
						["await"] = "Opened",
						["codestyle"] = "None",
						["duplicate"] = "Opened",
						["global"] = "Opened",
						["luadoc"] = "Opened",
						["redefined"] = "Opened",
						["strict"] = "Opened",
						["strong"] = "Opened",
						["type-check"] = "Opened",
						["unbalanced"] = "Opened",
						["unused"] = "Opened",
					},
					unusedLocalExclude = { "_*" },
				},
				format = {
					enable = false,
					defaultConfig = {
						indent_style = "space",
						indent_size = "2",
						continuation_indent_size = "2",
					},
				},
			},
		},
	},
}
-- vim.api.nvim_buf_set_lines
local caps = vim.lsp.protocol.make_client_capabilities()
caps.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
caps.textDocument.completion.completionItem.snippetSupport = true
-- caps = require("cmp_nvim_lsp").default_capabilities(caps)
local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end
	nmap("<F2>", vim.lsp.buf.rename, "Rename")
	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", vim.lsp.buf.references, "[G]oto [D]efinition")
	nmap("]d", vim.diagnostic.goto_next, "Next diagnostics")
	nmap("[d", vim.diagnostic.goto_prev, "Prevous Diagnostic")
	nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	-- nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format({ async = true })
	end, { desc = "Format current buffer with LSP" })
end
local M = {
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		event = "VeryLazy",
	},
	{
		enable = false,
		"folke/neodev.nvim",
		event = "VeryLazy",
		config = function()
			require("neodev").setup({
				library = {
					enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
					runtime = true, -- runtime path
					types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
					plugins = { "nvim-treesitter" },
				},
				setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
				-- for your Neovim config directory, the config.library settings will be used as is
				-- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
				-- for any other directory, config.library.enabled will be set to false
				override = function(root_dir, options) end,
				-- With lspconfig, Neodev will automatically setup your lua-language-server
				-- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
				-- in your lsp start options
				lspconfig = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		opts = {
			inlay_hints = { enabled = true },
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = false,
			})
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},
	{
		"onsails/lspkind-nvim",
		event = "VeryLazy",
		config = function()
			require("lspkind").init({
				mode = "symbol_text",
				preset = "codicons",
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		event = "VeryLazy",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufReadPre",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				automatic_installation = true,
			})
			require("mason-lspconfig").setup_handlers({
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = caps,
						on_attach = function(client, bufnr)
							on_attach(client, bufnr)
						end,
						settings = servers[server_name],
					})
				end,
				["rust_analyzer"] = function()
					require("rust-tools").setup({
						tools = {
							inlay_hints = {
								auto = false,
							},
						},
						server = {
							on_attach = on_attach,
						},
					})
				end,
			})
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		event = "VeryLazy",
		config = true,
	},
	{ "sumneko/lua-language-server", tag = "3.6.9", ft = "lua", event = "VeryLazy" },
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		disable = true,
		config = function()
			local status_ok, npairs = pcall(require, "nvim-autopairs")
			if not status_ok then
				return
			end

			npairs.setup({
				check_ts = true,
				ts_config = {
					lua = { "string", "source" },
					javascript = { "string", "template_string" },
					java = false,
				},
				disable_filetype = { "TelescopePrompt", "spectre_panel" },
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
					offset = 0, -- Offset from pattern match
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "PmenuSel",
					highlight_grey = "LineNr",
				},
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if not cmp_status_ok then
				return
			end
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.code_actions.gitsigns,
					null_ls.builtins.formatting.prettier,
				},
			})
		end,
	},
	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	},
}
return M
