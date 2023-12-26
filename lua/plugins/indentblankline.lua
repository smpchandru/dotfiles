local M = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	event = "VeryLazy",
}

M.config = function()
	--[[ vim.g.indent_blankline_buftype_exclude = { "terminal" }
	vim.g.indent_blankline_filetype_exclude = {
		"help",
		"startify",
		"dashboard",
		"packer",
		"neogitstatus",
		"mason",
		"lazy",
		"Outline",
		"noice",
	}
	vim.g.indent_blankline_char = "▏"
	vim.g.indent_blankline_context_char = "▏"
	--vim.g.indent_blankline_char = "|"
	vim.g.indent_blankline_use_treesitter = false
	vim.g.indent_blankline_show_trailing_blankline_indent = false
	vim.g.indent_blankline_show_current_context = true
	vim.g.indent_blankline_context_patterns = {
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^while",
		"jsx_element",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
		"if_statement",
		"else_clause",
		"jsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
	} ]]
	vim.opt.list = true
	local highlight = {
		"RainbowRed",
		"RainbowYellow",
		"RainbowBlue",
		"RainbowOrange",
		"RainbowGreen",
		"RainbowViolet",
		"RainbowCyan",
	}

	local hooks = require("ibl.hooks")
	-- create the highlight groups in the highlight setup hook, so they are reset
	-- every time the colorscheme changes
	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
		vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
		vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
		vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
		vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
		vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
		vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
	end)

	-- vim.opt.listchars:append("space:⋅")
	vim.opt.listchars:append("eol:↴")
	require("ibl").setup({
		-- space_char_blankline = " ",
		-- show_current_context = true,
		-- show_current_context_start = true,
		indent = { highlight = highlight,char='▏' },
		scope = {
			enabled = true,
			highlight = highlight,
		},
	})
	hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end
return M
