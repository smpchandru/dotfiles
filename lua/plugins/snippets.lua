local M = {
	"L3MON4D3/LuaSnip",
	event = "VeryLazy",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
}

M.config = function()
	local ls = require("luasnip")
	local types = require("luasnip.util.types")
	ls.config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
		enable_autosnippets = true,
		ext_opts = {
			[types.choiceNode] = {
				active = {
					virt_text = {
						{
							"<-Current Choice",
						},
					},
				},
			},
		},
	})

	vim.keymap.set({ "i", "s" }, "<c-k>", function()
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		end
	end, { silent = true })
	vim.keymap.set({ "i", "s" }, "<c-j>", function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end, { silent = true })
	vim.keymap.set({ "i", "s" }, "<c-l>", function()
		if ls.choice_active() then
			ls.change_choice(1)
		end
	end, { silent = true })
	require("luasnip/loaders/from_vscode").load({
		include = { "go", "python", "bash", "rust", "html", "css", "javascript", "typescriptreact" },
		paths = { "~/.local/share/nvim/lazy/friendly-snippets/" },
	})
	require("luasnip").filetype_extend("typescript", { "javascript" })
	-- require("mysnippets")
end
return M
