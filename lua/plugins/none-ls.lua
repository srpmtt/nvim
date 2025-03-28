return {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      lazy = true,
    },
  },
  config = function()
    local null_ls = require "null-ls"

    null_ls.setup {
      debug = false,
    }
  end,
}
