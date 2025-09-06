local settings = {
  ui = {
    border = "single",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

return {
  "mason-org/mason.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "jay-babu/mason-null-ls.nvim",
      lazy = true,
    },
  },
  config = function()
    require("mason").setup(settings)
    require("mason-null-ls").setup {
      ensure_installed = require "utils.formatters",
      automatic_installation = true,
    }
  end,
}
