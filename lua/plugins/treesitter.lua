require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "help", "cpp", "javascript", "json", "python", "go" },

  ident = { enable = true },
  highlight = { enable = true},

  rainbow = {
      enable = true,
      extended_more = true,
      max_file_lines = nil,
  }
}
