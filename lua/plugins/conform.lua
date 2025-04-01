return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        -- cs = { "csharpier" },
        c = { "clang-format" },
        css = { "prettier" },
        go = { "gofumpt" },
        html = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        rust = { "rustfmt" },
        sh = { "beautysh" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        yaml = { "prettier" },
      },
      notify_on_error = false,
      default_format_opts = {
        lsp_format = "fallback",
      },
    }
  end,
}
