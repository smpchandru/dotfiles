local M = {
	"utilyre/barbecue.nvim",
	enabled = false,
	dependencies = {
		"neovim/nvim-lspconfig",
		"smiteshp/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
}
function M.config()
	require("barbecue").setup()
end

return M
