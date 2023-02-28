local M = {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.bracketed").setup()
		require("mini.surround").setup()
		-- require("mini.animate").setup()
	end,
	event = "VeryLazy",
}
return M
