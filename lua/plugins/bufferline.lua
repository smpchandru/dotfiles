return {
	"akinsho/nvim-bufferline.lua",
	event = "VeryLazy",
	enabled = true,
	opts = {
		options = {
			-- mode = "tabs",
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}
