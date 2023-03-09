require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "gopls",
  },
})

require'lspconfig'.gopls.setup{}
