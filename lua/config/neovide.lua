if vim.g.neovide then
  vim.cmd("set mouse=a")
  vim.o.pumblend = 30
  vim.o.winblend = 30
  vim.o.linespace = -1
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_transparency = 0.95
  vim.g.neovide_scroll_animation_far_lines = 0
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_theme = "auto"
  -- vim.g.neovide_cursor_animation_length = 0.09
  vim.g.neovide_refresh_rate = 90
  vim.g.neovide_cursor_vfx_mode = "wireframe"
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h18"
  vim.g.neovide_text_gamma = 0.8
  vim.g.neovide_text_contrast = 0.1
  -- vim.o.guifont = "JetBrains Mono:h16"
  vim.g.gruvbox_contrast_dark = "hard"
  vim.g.gruvbox_material_transparent_background = 0
  vim.cmd([[
let g:neovide_fullscreen = v:true
command -nargs=0 NeovideToggleFullscreen :let g:neovide_fullscreen = !g:neovide_fullscreen
noremap <F11> :NeovideToggleFullscreen<CR>
]])
end
