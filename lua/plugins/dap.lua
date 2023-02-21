return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = function()
				require("dapui").setup()
			end,
		},
		{
			"theHamsta/nvim-dap-virtual-text",
			config = function()
				require("nvim-dap-virtual-text").setup()
			end,
		},
	},
	config = function()
		local dap = require("dap")
		dap.adapters.delve = {
			type = "server",
			port = "${port}",
			executable = {
				command = "dlv",
				args = { "dap", "-l", "127.0.0.1:${port}" },
			},
		}
		dap.configurations.go = {
			{
				type = "delve",
				name = "Debug",
				request = "launch",
				program = "${file}",
				dlvToolPath = vim.fn.exepath("dlv"),
			},
		}
	end,
}
