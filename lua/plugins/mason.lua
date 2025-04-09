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
  "williamboman/mason.nvim",
  cmd = "Mason",
  event = "VeryLazy",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      lazy = true
    },
    {
      "jay-babu/mason-null-ls.nvim",
      lazy = true
    }
  },
  config = function()
    require("mason").setup(settings)
    require("mason-lspconfig").setup {
      -- ensure_installed = require("utils.servers"),
    }
    require("mason-null-ls").setup {
      ensure_installed = require("utils.formatters"),
      automatic_installation = true,
    }
  end
}
