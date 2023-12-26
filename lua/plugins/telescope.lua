local M = {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
}
M.config = function()
	local actions = require("telescope.actions")
	local fb_actions = require("telescope._extensions.file_browser.actions")
	require("telescope").setup({
		defaults = {
			find_command = {
				"rg",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			prompt_prefix = " ",
			selection_caret = " ",
			entry_prefix = "  ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "descending",
			layout_strategy = "vertical",
			layout_config = {
				horizontal = { mirror = false, width = 0.75 },
				vertical = { mirror = false, width = 0.6, height = 0.5, prompt_position = "bottom" },
			},
			file_sorter = require("telescope.sorters").get_fzy_sorter,
			file_ignore_patterns = {},
			generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
			winblend = 0,
			border = {},
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			color_devicons = true,
			use_less = true,
			set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			-- Developer configurations: Not meant for general override
			buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
			mappings = {
				i = {
					["<C-c>"] = actions.close,
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					-- ["<c-t>"] = trouble.open_with_trouble,
					["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					-- To disable a keymap, put [map] = false
					-- So, to not map "<C-n>", just put
					-- ["<c-x>"] = false,
					["<esc>"] = actions.close,
					-- Otherwise, just set the mapping to the function that you want it to be.
					-- ["<C-i>"] = actions.select_horizontal,

					-- Add up multiple actions
					["<CR>"] = actions.select_default + actions.center,
					-- You can perform as many actions in a row as you like
					-- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
				},
				n = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					-- ["<c-t>"] = trouble.open_with_trouble,
					["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					-- ["<C-i>"] = my_cool_custom_action,
				},
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
			media_files = {
				-- filetypes whitelist
				-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
				filetypes = { "png", "webp", "jpg", "jpeg" },
				find_cmd = "rg", -- find command (defaults to `fd`)
			},
			file_browser = {
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
				mappings = {
					["i"] = {
						["<A-c>"] = fb_actions.create,
						["<S-CR>"] = fb_actions.create_from_prompt,
						["<A-r>"] = fb_actions.rename,
						["<A-m>"] = fb_actions.move,
						["<A-y>"] = fb_actions.copy,
						["<A-d>"] = fb_actions.remove,
						["<C-o>"] = fb_actions.open,
						["<C-g>"] = fb_actions.goto_parent_dir,
						["<C-e>"] = fb_actions.goto_home_dir,
						["<C-w>"] = fb_actions.goto_cwd,
						["<CR>"] = fb_actions.change_cwd,
						["<C-f>"] = fb_actions.toggle_browser,
						["<C-h>"] = fb_actions.toggle_hidden,
						["<C-s>"] = fb_actions.toggle_all,
						-- your custom insert mode mappings
					},
				},
			},
		},
		pickers = {
			-- Your special builtin config goes in here
			buffers = {
				sort_lastused = true,
				-- theme = "ivy",
				-- previewer = false,
				-- mappings = {
				-- 	i = {
				-- 		["<c-d>"] = require("telescope.actions").delete_buffer,
				-- 	},
				-- 	n = {
				-- 		["<c-d>"] = require("telescope.actions").delete_buffer,
				-- 	},
				-- },
			},
		},
	})

	require("telescope").load_extension("media_files")
	require("telescope").load_extension("projects")
	require("telescope").load_extension("file_browser")
end
return M
