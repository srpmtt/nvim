local nvim_lsp = require('lspconfig')

return {
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
}
