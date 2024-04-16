return {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	config = function()
		require("project_nvim").setup({
			manual_mode = false,
			detection_methods = {  "pattern" },
			patterns = { "=secedge" },
			-- ignore_lsp = { "go" },
			show_hidden = false,
			-- exclude_dirs = { "~/go/*/*/*/*", "~/.cargo/*" },
			silent_chdir = true,
			datapath = vim.fn.stdpath("data"),
		})
	end,
}
