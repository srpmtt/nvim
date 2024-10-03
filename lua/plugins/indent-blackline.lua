return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  config = function()
    require("ibl").setup {
      whitespace = {
        remove_blankline_trail = true,
      },
      scope = { enabled = false },
    }
  end
}
