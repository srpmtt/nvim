return {
  "matbme/JABS.nvim",
  event = "VeryLazy",
  config = function()
    require("jabs").setup {
      position = { 'center', 'top' },
      relative = 'editor',
      clip_popup_size = false,
      width = 60,
      height = 20,
      border = 'rounded',
      offset = {
        top = 2,
        bottom = 2,
        left = 2,
        right = 2,
      },
      sort_mru = true,
      split_filename = true,
      split_filename_path_width = 20,
      preview_position = 'left',
      preview = {
        width = 40,
        height = 60,
        border = 'rounded',
      },
      highlight = {
        current = "StatusLine",
        hidden = "StatusLine",
        split = "StatusLine",
        alternate = "StatusLine"
      },
      symbols = {
        current = "",
        split = "",
        alternate = "",
        hidden = "﬘",
        locked = "",
        ro = "",
        edited = "",
        terminal = "",
        default_file = "",
        terminal_symbol = ""
      },
      keymap = {
        close = "x",
        jump = "<cr>",
        h_split = "h",
        v_split = "v",
        preview = "p",
      },
      use_devicons = true
    }
  end
}
