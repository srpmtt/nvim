return {
  "phaazon/hop.nvim",
  branch = "v2",
  event = "VeryLazy",
  config = function()
    require("hop").setup()
  end
}
