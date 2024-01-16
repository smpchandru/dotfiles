return {
	"luukvbaal/statuscol.nvim",
	branch = "0.10",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			-- configuration goes here, for example:
			-- relculright = true,
			segments = {
				{ text = { "%s" } },
				{
					sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
					click = "v:lua.ScSa",
				},
				{ text = { builtin.lnumfunc, " " } },
				{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
			},
		})
	end,
}
