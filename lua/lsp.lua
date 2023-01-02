-- Lspkind config
local M = {}
function M.on_attach(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	--[[ nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")
]]
	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
	-- lsp signature related settings
end

function M.setup()
	local servers = {
		rust_analyzer = {},
		gopls = {},
		bashls = {},
		jsonls = {},
		yamlls = {},
		terraformls = {},
		sumneko_lua = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
			},
		},
	}
	require("neodev").setup()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
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
				capabilities = capabilities,
				on_attach = M.on_attach,
				settings = servers[server_name],
			})
		end,
		-- Next, you can provide targeted overrides for specific servers.
		["rust_analyzer"] = function()
			require("rust-tools").setup({})
		end,
	})
	require("fidget").setup()

	require("lspkind").init({
		mode = "symbol_text",
		preset = "codicons",
	})
	require("plugincfg.comp").config()
	require("plugincfg.autopairs")
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

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
	require("lsp_signature").setup({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
		floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
		fix_pos = true, -- set to true, the floating window will not auto-close until finish all parameters
		hint_enable = false, -- virtual hint enable
		hint_prefix = "🐼 ", -- Panda for parameter
		hint_scheme = "String",
		use_lspsaga = false, -- set to true if you want to use lspsaga popup
		hi_parameter = "Underlined", -- how your parameter will be highlight,
		max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
		max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
		transpancy = 100,
		handler_opts = {
			border = "single", -- double, single, shadow, none
		},
		extra_trigger_chars = { "(", "," }, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
	})
end

return M
