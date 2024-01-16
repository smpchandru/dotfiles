return {
	"windwp/nvim-spectre",
	config = function()
		require("spectre").setup()
	end,
	keys = {
		{ "<leader>s", "<cmd>lua require('spectre').open_visual()<CR>", desc = "SearchReplace" },
	},
}
