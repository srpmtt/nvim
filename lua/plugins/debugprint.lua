return {
  "andrewferrier/debugprint.nvim",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      lazy = true
    },
  },
  opts = {
    create_keymaps = false,
    create_commands = false
  },
  event = "VeryLazy",
  config = function()
    require("debugprint").setup({
      vim.keymap.set("n", "<leader>dp", function()
          return require("debugprint").debugprint()
        end,
        {
          expr = true
        })
    })
  end
}
