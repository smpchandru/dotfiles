local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-calc" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "f3fora/cmp-spell" },
		{ "kdheepak/cmp-latex-symbols" },
		{ "hrsh7th/cmp-cmdline" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "uga-rosa/cmp-dictionary" },
	},
	config = function()
		--	cmp_hghlights()
		local compare = require("cmp.config.compare")
		local types = require("cmp.types")
		local comp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		comp.setup({
			completion = {
				autocomplete = {
					types.cmp.TriggerEvent.InsertEnter,
					types.cmp.TriggerEvent.TextChanged,
				},
				completeopt = "menu,menuone,noselect",
				keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
				keyword_length = 1,
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				documentation = {
					border = "single",
					winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
				},
				completion = {
					border = "single",
					winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
				},
			},
			confirmation = {
				default_behavior = comp.ConfirmBehavior.Replace,
			},
			sorting = {
				priority_weight = 2,
				comparators = {
					compare.offset,
					compare.exact,
					compare.score,
					compare.kind,
					compare.sort_text,
					compare.length,
					compare.order,
				},
			},
			mapping = {
				["<C-p>"] = comp.mapping.select_prev_item(),
				["<C-n>"] = comp.mapping.select_next_item(),
				["<C-b>"] = comp.mapping.scroll_docs(-4),
				["<C-f>"] = comp.mapping.scroll_docs(4),
				["<C-Space>"] = comp.mapping.complete(),
				["<C-e>"] = comp.mapping.close(),
				["<CR>"] = comp.mapping.confirm({
					behavior = comp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = comp.mapping(function(fallback)
					if comp.visible() then
						comp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						comp.complete()
					else
						fallback()
					end
				end, { "i", "s", "c" }),

				["<S-Tab>"] = comp.mapping(function(fallback)
					if comp.visible() then
						comp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s", "c" }),
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = lspkind.cmp_format({
					with_text = false,
					maxwidth = 50,
					menu = {
						buffer = "[buf]",
						nvim_lsp = "[lsp]",
						luasnip = "[snp]",
						nvim_lua = "[lua]",
						latex_symbols = "[ltx]",
						dictionary = "[dic]",
						path = "[Pat]",
						calc = "[Cal]",
					},
				}),
			},
			experimental = {
				native_menu = false,
				ghost_text = true,
			},
			sources = {
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "calc" },
				{ name = "spell" },
				{ name = "path" },
				{ name = "vim-dadbod-completion" },
				{ name = "latex_symbols" },
				{ name = "buffer", keyword_length = 5 },
				{ name = "dictionary", keyword_length = 4 },
				-- { name = "nvim_lsp_signature_help" },
			},
		})
		comp.setup.cmdline("/", {
			sources = {
				{ name = "buffer" },
			},
		})
		comp.setup.cmdline(":", {
			sources = comp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
		require("cmp_dictionary").setup({
			dic = {
				["*"] = "/usr/share/dict/words",
			},
			exact = 2,
			async = false,
			capacity = 5,
			debug = false,
		})
	end,
}
return M
