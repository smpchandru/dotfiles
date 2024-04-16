return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	init = function()
		vim.g.neo_tree_remove_legacy_commands = 1
		if vim.fn.argc() == 1 then
			local stat = vim.loop.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				require("neo-tree")
			end
		end
	end,
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<CR>", "NeoTree Explorer", { silent = true } },
	},
	opts = {
		open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" },
		filesystem = {
			bind_to_cwd = true,
			follow_current_file = true,
			use_libuv_file_watcher = true,
		},
		source_selector = {
			-- winbar = true, -- toggle to show selector on winbar
			statusline = true, -- toggle to show selector on statusline
						--tabs_layout = "equal",
			show_scrolled_off_parent_node = true,
			-- sources = {
				{ source = "filesystem" },
				{ source = "buffers" },
				-- { source = "git_status" },
			-- },
			window = {
				width = 30,
				mappings = {
					["<space>"] = "none",
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		},
	},
	config = true,
}
