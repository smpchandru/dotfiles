return {

  "folke/tokyonight.nvim",
  opts = {
    transparent = false,
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "dark", -- style for sidebars, see below floats = "dark", -- style for floating windows
      floats = "normal",
    },
    lualine_bold = true,
    dim_inactive = true,
    on_highlights = function(hl, c)
      hl.WinSeparator = { fg = c.blue7, bg = c.none, bold = true }
      hl.NormalNC = { fg = c.fg, bg = c.bg } -- normal text
      -- hl.CursorLineNr = { fg = c.bg }
      -- hl.NormalFloat = { fg = c.fg, bg = c.none }
      -- hl.CmpDocumentation = { fg = c.fg, bg = c.none }
      -- hl.CmpBorder = { fg = c.bg, bg = c.none }
      -- hl.CmpDocumentationBorder = { fg = c.border_highlight, bg = c.none }
      hl.TelescopeBorder = { fg = c.blue7, bg = c.none }
      hl.TelescopeNormal = { fg = c.fg, bg = c.none }
      hl.FloatBorder = { fg = c.blue7, bg = c.none }
      hl.FloatNormal = { fg = c.fg, bg = c.none }
      hl.LspSignatureActiveParameter = { fg = c.red, bold = true }
      hl.DiffAdd = { bg = c.gitSigns.add }
      hl.DiffChange = { bg = c.gitSigns.change, fg = c.git.change }
      hl.DiffDelete = { bg = c.gitSigns.delete }
    end,
  },
}
