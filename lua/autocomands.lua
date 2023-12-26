local _ = vim.api.nvim_create_augroup("general", {
	clear = true,
})
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
	pattern = "*",
	command = "set nu rnu",
	group = "general",
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
	pattern = "*",
	command = "set norelativenumber",
	group = "general",
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.py",
	group = "general",
	command = "lua require('utils').SetPythonIndent()",
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.c",
	group = "general",
	command = "lua require('utils').SetCCIndent()",
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.yaml", "*.yml" },
	group = "general",
	command = "set filetype=yaml foldmethod=indent",
})
vim.api.nvim_create_autocmd({ "FileType", "BufRead" }, {
	pattern = { "yaml" },
	group = "general",
	command = "setlocal ts=2 sts=2 sw=2 expandtab",
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "Jenkinsfile",
	group = "general",
	command = "setf groovy",
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "qf",
	group = "general",
	command = "nnoremap <buffer><silent> <esc> :quit<cr>",
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "qf",
	group = "general",
	command = "nnoremap <buffer><silent> <esc> :quit<cr>",
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "*",
	group = "general",
	command = ":lua vim.lsp.buf.format{ async = true}",
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "*.go",
	group = "general",
	command = "silent! lua require('go.format').goimport()",
})
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*",
	group = "general",
	command = 'normal `"',
})
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = "*",
	group = "general",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 2000 })
	end,
})

vim.cmd(
	[[ autocmd User fugitive if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' | nnoremap <buffer> .. :edit %:h<CR> | endif ]]
)

--[[ vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint(0, true)
		end
	end,
}) ]]
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		if not (ev.data and ev.data.client_id) then
			return
		end
		-- local bufnr = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if client.name ~= "gopls" then
			return
		end
		client.config = vim.tbl_deep_extend("force", client.config, {
			settings = {
				gopls = {
					allExperiments = true,
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValue = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},
			},
		})
	end,
})
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		if not (ev.data and ev.data.client_id) then
			return
		end
		-- local bufnr = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if client.name ~= "lua_ls" then
			return
		end

		client.config = vim.tbl_deep_extend("force", client.config, {
			settings = {
				Lua = {
					hint = {
						enable = true,
						arrayIndex = "Enable",
						setType = true,
					},
				},
			},
		})
	end,
})
