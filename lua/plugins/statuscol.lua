return {
	"luukvbaal/statuscol.nvim",
	branch = "0.10",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			-- configuration goes here, for example:
			-- relculright = true,
			segments = {
				{
					text = { builtin.lnumfunc, " " },
					condition = { true, builtin.not_empty },
					click = "v:lua.ScLa",
				},
				{ text = { "%s" }, click = "v:lua.ScSa" },
				-- { text = { "%C" }, click = "v:lua.ScFa" },
			},
		})
	end,
}
