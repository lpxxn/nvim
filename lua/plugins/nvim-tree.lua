-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
  hijack_netrw = false,
  open_on_setup = true,
  update_focused_file = {
    enable = true,
  },
  view = {
     hide_root_folder = true
  }
})


