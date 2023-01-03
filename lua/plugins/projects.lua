return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			manual_mode = false,
			detection_methods = { "lsp", "pattern" },
			patterns = { ".git", "Makefile" },
			-- ignore_lsp = { "go" },
			show_hidden = false,
			exclude_dirs = { "~/go/*/*/*/*" },
			silent_chdir = true,
			datapath = vim.fn.stdpath("data"),
		})
	end,
}