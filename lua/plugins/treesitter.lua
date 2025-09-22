return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
    },
  },
  config = function()
    local treesitter = require "nvim-treesitter"
    local configs = require "nvim-treesitter.configs"

    configs.setup {
      ensure_installed = {
        "bash",
        "c_sharp",
        "css",
        "gitignore",
        "html",
        "http",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "rust",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },

      ignore_install = { "" },
      sync_install = false,

      highlight = {
        enable = true,
        disable = { "css" },
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = true, disable = { "python", "css" } },
    }
  end,
}
