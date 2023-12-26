return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	--[[ keys = {
		{ "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
		{ "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
	}, ]]
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
	opts = {
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = true,
			use_libuv_file_watcher = true,
		},
		source_selector = {
			winbar = true, -- toggle to show selector on winbar
			statusline = false, -- toggle to show selector on statusline
			tabs_layout = "start",
			source_selector = {
				winbar = false, -- toggle to show selector on winbar
				statusline = false, -- toggle to show selector on statusline
				show_scrolled_off_parent_node = false, -- boolean
				sources = { -- table
					{
						source = "filesystem", -- string
						display_name = "  Files ", -- string | nil
					},
					{
						source = "buffers", -- string
						display_name = "  Buffers ", -- string | nil
					},
					{
						source = "git_status", -- string
						display_name = "  Git ", -- string | nil
					},
				},
				content_layout = "start", -- string
				tabs_layout = "equal", -- string
				truncation_character = "…", -- string
				tabs_min_width = nil, -- int | nil
				tabs_max_width = nil, -- int | nil
				padding = 0, -- int | { left: int, right: int }
				separator = { left = "▏", right = "▕" }, -- string | { left: string, right: string, override: string | nil }
				separator_active = nil, -- string | { left: string, right: string, override: string | nil } | nil
				show_separator_on_edge = false, -- boolean
				highlight_tab = "NeoTreeTabInactive", -- string
				highlight_tab_active = "NeoTreeTabActive", -- string
				highlight_background = "NeoTreeTabInactive", -- string
				highlight_separator = "NeoTreeTabSeparatorInactive", -- string
				highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
			},
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
		config = true,
	},
}
