return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        c = { "clang-format" },
        css = { "prettier" },
        go = { "gofumpt" },
        haskell = { "ormolu" },
        html = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        ocaml = { "ocamlformat" },
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
