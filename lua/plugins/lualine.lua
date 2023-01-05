local M = {
	"nvim-lualine/lualine.nvim",
}
M.config = function()
	local colors = {
		bg = "#202328",
		fg = "#bbc2cf",
		yellow = "#ECBE7B",
		cyan = "#008080",
		darkblue = "#081633",
		green = "#98be65",
		orange = "#FF8800",
		violet = "#a9a1e1",
		magenta = "#c678dd",
		blue = "#51afef",
		red = "#ec5f67",
	}
	local s = {}
	require("lualine").setup({
		options = {
			theme = "gruvbox-material",
			component_separators = "|",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {
				{
					"mode",
					separator = { left = "" },
					right_padding = 2,
				},
			},
			lualine_b = {
				"branch",
				"filename",
				{
					"diff",
					on_click = function(_, _, _)
						require("gitsigns").diffthis("~")
					end,
					symbols = {
						added = " ",
						modified = "柳",
						removed = " ",
					},
				},
			},
			lualine_c = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " " },
					diagnostics_color = {
						color_error = { fg = colors.red },
						color_warn = { fg = colors.yellow },
						color_info = { fg = colors.cyan },
					},
				},
			},
			lualine_x = {
				{
					function()
						local msg = "No Active Lsp"
						local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
						local clients = vim.lsp.get_active_clients()
						if next(clients) == nil then
							return msg
						end
						for _, client in ipairs(clients) do
							local filetypes = client.config.filetypes
							if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
								return client.name
							end
						end
						return msg
					end,
					icon = "",
					color = { fg = colors.cyan },
				},
			},
			lualine_y = { "progress" },
			lualine_z = {
				{ "location", separator = { right = "" }, left_padding = 2 },
			},
		},
		inactive_sections = {
			lualine_a = {
				{ "filename" },
			},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		tabline = {},
		extensions = {},
	})
end
return M
