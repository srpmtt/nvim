return {
  "mason-org/mason-lspconfig.nvim",
  event = "BufRead",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = require "utils.servers",
    automatic_enable = true,
    automatic_installation = true,
  },
}
