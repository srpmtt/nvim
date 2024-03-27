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

    local on_attach = function(client)
      if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
      end

      if client.name == "sumneko_lua" then
        client.server_capabilities.documentFormattingProvider = false
      end
    end

    for _, server in pairs(require("utils.servers")) do
      Opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      if server == "omnisharp" then
        local pid = vim.fn.getpid()
        Opts = {
          on_attach = on_attach,
          capabilities = capabilities,
          cmd = { vim.fn.stdpath("data") .. "/mason/packages/omnisharp/omnisharp", '--languageserver', '--hostPID', tostring(pid) },
        }
      end

      server = vim.split(server, "@")[1]

      local require_ok, conf_opts = pcall(require, "utils." .. server)

      if require_ok then
        Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
      end

      lspconfig[server].setup(Opts)
    end

    local bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services"
    local command_fmt =
    [[& '%s/PowerShellEditorServices/Start-EditorServices.ps1' -BundledModulesPath '%s' -LogPath '%s/powershell_es.log' -SessionDetailsPath '%s/powershell_es.session.json' -FeatureFlags @() -AdditionalModules @() -HostName nvim -HostProfileId 0 -HostVersion 1.0.0 -Stdio -LogLevel Normal]]
    local temp_path = vim.fn.stdpath("cache")
    local command = command_fmt:format(bundle_path, bundle_path, temp_path, temp_path)
    lspconfig.powershell_es.setup({
      filetypes = { "ps1" },
      bundle_path = vim.fn.stdpath("data") .. "/mason/packages/omnisharp",
      cmd = { "pwsh", "-NoLogo", "-Command", command },
    })

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
      underline = true,
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
