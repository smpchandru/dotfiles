return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = require("telescope.themes").get_dropdown({ preview = false }),
    --[[ pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false,
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
      },
      projects = {
        theme = "dropdown",
        previewer = false,
      }, ]]
  },
}
