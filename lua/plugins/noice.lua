local M = {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		--"rcarriga/nvim-notify",
	},
}

function M.config()
	local focused = true
	vim.api.nvim_create_autocmd("FocusGained", {
		callback = function()
			focused = true
		end,
	})
	vim.api.nvim_create_autocmd("FocusLost", {
		callback = function()
			focused = false
		end,
	})
	require("noice").setup({
		debug = false,
		lsp = {
			signature = {
				enabled = false,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		routes = {
			{
				filter = {
					cond = function()
						return not focused
					end,
				},
				view = "notify_send",
				-- view = "mini",
				opts = { stop = false },
			},
			{
				filter = {
					event = "msg_show",
					find = "%d+L, %d+B",
				},
				view = "mini",
			},
		},
		presets = {
			bottom_search = false,
			command_palette = false,
			long_message_to_split = true,
			inc_rename = true,
			cmdline_output_to_split = false,
			lsp_doc_border = true,
		},
		commands = {
			all = {
				-- options for the message history that you get with `:Noice`
				view = "split",
				opts = { enter = true, format = "details" },
				filter = {},
			},
		},
		format = {
			level = {
				icons = true,
			},
		},
	})

	vim.keymap.set("c", "<S-Enter>", function()
		require("noice").redirect(vim.fn.getcmdline())
	end, { desc = "Redirect Cmdline" })

	vim.keymap.set("n", "<leader>nl", function()
		require("noice").cmd("last")
	end, { desc = "Noice Last Message" })

	vim.keymap.set("n", "<leader>nh", function()
		require("noice").cmd("history")
	end, { desc = "Noice History" })

	vim.keymap.set("n", "<leader>na", function()
		require("noice").cmd("all")
	end, { desc = "Noice All" })

	vim.keymap.set("n", "<c-f>", function()
		if not require("noice.lsp").scroll(4) then
			return "<c-f>"
		end
	end, { silent = true, expr = true })

	vim.keymap.set("n", "<c-b>", function()
		if not require("noice.lsp").scroll(-4) then
			return "<c-b>"
		end
	end, { silent = true, expr = true })

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "markdown",
		callback = function(event)
			vim.schedule(function()
				require("noice.text.markdown").keys(event.buf)
			end)
		end,
	})
end

return M
