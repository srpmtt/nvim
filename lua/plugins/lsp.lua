local cmp_nvim_lsp = require "cmp_nvim_lsp"

return {
  "neovim/nvim-lspconfig",
  lazy = true,
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp"
    }
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    local lspconfig = require "lspconfig"

    for _, server in pairs(require("utils.servers")) do
      local require_ok, conf_opts = pcall(require, "lsp." .. server)

      local Opts = {
        capabilities = capabilities,
      }

      if require_ok then
        Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
      end

      lspconfig[server].setup(Opts)
    end


    local signs = {
      -- { name = "DiagnosticSignError", text = "" },
      -- { name = "DiagnosticSignWarn", text = "" },
      -- { name = "DiagnosticSignHint", text = "" },
      -- { name = "DiagnosticSignInfo", text = "" },
      { name = "DiagnosticSignError", text = "E" },
      { name = "DiagnosticSignWarn",  text = "W" },
      { name = "DiagnosticSignHint",  text = "H" },
      { name = "DiagnosticSignInfo",  text = "I" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
      virtual_text = false,
      signs = {
        active = signs,
      },
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
  end
}
