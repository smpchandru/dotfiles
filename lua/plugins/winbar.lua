local M = {
	"utilyre/barbecue.nvim",
	event = "VeryLazy",
	enabled = false,
	dependencies = {
		"neovim/nvim-lspconfig",
		"smiteshp/nvim-navic",
	},
}
function M.config()
	require("barbecue").setup()
end

return M
