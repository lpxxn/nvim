local golang_setup = {
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach(signature_setup, bufnr)  -- Note: add in lsp client on-attach
  end,
  
}

require'lspconfig'.gopls.setup(golang_setup)
