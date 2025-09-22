local nvim_lsp = require('lspconfig')

return {
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false,
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
}
