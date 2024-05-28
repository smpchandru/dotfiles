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
    {
      "onsails/lspkind-nvim",
      event = "VeryLazy",
      config = function()
        require("lspkind").init({
          mode = "symbol_text",
          preset = "codicons",
        })
      end,
    },
  },
  config = function(_, opts)
    --	cmp_hghlights()
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end
    local compare = require("cmp.config.compare")
    local types = require("cmp.types")
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    cmp.setup({
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
        --[[ completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(), ]]
        documentation = {
          border = "single",
          winhighlight = "NormalFloat:TelescopeNormal,FloatBorder:TelescopeBorder",
        },
        completion = {
          border = "single",
          -- winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
          winhighlight = "NormalFloat:TelescopeNormal,FloatBorder:TelescopeBorder",
        },
      },
      confirmation = {
        default_behavior = cmp.ConfirmBehavior.Replace,
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
        ["<C-p>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-n>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        --[[ ["C-y"] = cmp.mapping(
          cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
          { "i", "c" }
        ), ]]
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s", "c" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s", "c" }),
      },
      formatting = {
        expandable_indicator = true,
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
        ghost_text = { hl_group = "CmpGhostText" },
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
    local Kind = cmp.lsp.CompletionItemKind
    cmp.event:on("confirm_done", function(event)
      if not vim.tbl_contains(opts.auto_brackets or {}, vim.bo.filetype) then
        return
      end
      local entry = event.entry
      local item = entry:get_completion_item()
      if vim.tbl_contains({ Kind.Function, Kind.Method }, item.kind) then
        local keys = vim.api.nvim_replace_termcodes("()<left>", false, false, true)
        vim.api.nvim_feedkeys(keys, "i", true)
      end
    end)
    cmp.setup.cmdline("/", {
      sources = {
        { name = "buffer" },
      },
    })
    cmp.setup.cmdline(":", {
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
    cmp.setup.filetype({ "sql" }, {
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
      },
    })
    require("cmp_dictionary").setup({
      dic = {
        ["*"] = "/usr/share/dict/words",
      },
      exact_length = 2,
      async = false,
      debug = false,
    })
  end,
}
return M
