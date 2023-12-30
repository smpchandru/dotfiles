return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		local ftMap = {
			vim = { "indent", "" },
			python = { "indent", "" },
			git = "",
			["neo-tree"] = "",
			noice = "",
		}
		require("ufo").setup({
			open_fold_hl_timeout = 150,
			close_fold_kinds = { "imports", "comment" },
			preview = {
				win_config = {
					border = { "", "─", "", "", "", "─", "", "" },
					winhighlight = "Normal:Folded",
					winblend = 0,
				},
				mappings = {
					scrollU = "<C-u>",
					scrollD = "<C-d>",
					jumpTop = "[",
					jumpBot = "]",
				},
			},
			provider_selector = function(bufnr, filetype, _)
				-- if you prefer treesitter provider rather than lsp,
				-- return ftMap[filetype] or {'treesitter', 'indent'}
				return ftMap[filetype] or { "lsp", "treesitter" }

				-- refer to ./doc/example.lua for detail
			end,
		})
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { noremap = true })
		vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { noremap = true }) -- closeAllFolds == closeFoldsWith(0)
		vim.keymap.set("n", "K", function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end)
	end,
}
