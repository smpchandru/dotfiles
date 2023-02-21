return {
	"windwp/nvim-spectre",
	config = function()
		require("spectre").setup()
	end,
	keys = {
		{ "<leader>s", "<cmd>lua require('spectre').open()<CR>", desc = "SearchReplace" },
	},
}
