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
      hl.WinSeparator = { fg = c.fg_dark, bold = true }
      hl.CursorLineNr = { fg = c.bg }
      hl.CmpDocumentation = { fg = c.fg, bg = c.none }
      hl.CmpBorder = { fg = c.fg, bg = c.none }
      hl.CmpDocumentationBorder = { fg = c.border_highlight, bg = c.none }
      hl.TelescopeBorder = { fg = c.border_highlight, bg = c.none }
      hl.TelescopeNormal = { fg = c.fg, bg = c.none }
      hl.LspSignatureActiveParameter = { fg = c.red, bold = true }
      hl.GitSignsAdd = { fg = "#527A58" } -- diff mode: Added line |diff.txt|
    end,
  },
}
