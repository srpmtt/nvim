return {
  "ptdewey/yankbank-nvim",
  event = "VeryLazy",
  config = function()
    require('yankbank').setup({
      max_entries = 10,
      sep = "",
      keymaps = {
        navigation_next = "j",
        navigation_prev = "k",
      },
      num_behavior = "prefix",
    })
  end
}
