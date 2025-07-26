local cmp_nvim_lsp = require "cmp_nvim_lsp"

return {
  "neovim/nvim-lspconfig",
  lazy = true,
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
  config = function()
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities.textDocument.completion.completionItem.snippetSupport = true
    -- capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    --
    -- local lspconfig = require "lspconfig"
    --
    -- for _, server in pairs(require "utils.servers") do
    --   local require_ok, conf_opts = pcall(require, "lsp." .. server)
    --
    --   local Opts = {
    --     capabilities = capabilities,
    --   }
    --
    --   if require_ok then
    --     Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
    --   end
    --
    --   lspconfig[server].setup(Opts)
    -- end

    local x = vim.diagnostic.severity
    vim.diagnostic.config {
      signs = {
        text = {
          [x.ERROR] = "E",
          [x.WARN] = "W",
          [x.INFO] = "I",
          [x.HINT] = "H",
        },
      },
    }

    local config = {
      virtual_text = false,
      update_in_insert = true,
      underline = false,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
        suffix = "",
      },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })
  end,
}
