return {
  "el-mastor/bufferlist.nvim",
  lazy = true,
  dependencies = "nvim-tree/nvim-web-devicons",
  cmd = "BufferList",
  opts = {
    keymap = {
      close_buf_prefix = "c",
      force_close_buf_prefix = "f",
      save_buf = "s",
      visual_close = "d",
      visual_force_close = "f",
      visual_save = "s",
      multi_close_buf = "m",
      multi_save_buf = "w",
      save_all_unsaved = "a",
      close_all_saved = "d0",
      toggle_path = "p",
      close_bufferlist = "q",
    },
    win_keymaps = {
      {
        "<cr>",
        function(opts)
          local curpos = vim.fn.line "."
          vim.cmd("bwipeout | buffer " .. opts.buffers[curpos])
        end,
        { desc = "BufferList: open buffer" },
      },
      {
        "x",
        function(opts)
          local curpos = vim.fn.line "."
          vim.cmd("bwipeout | bd! " .. opts.buffers[curpos])
          opts.open_bufferlist()
          vim.fn.cursor(math.max(curpos - 1, 1), 1)
        end,
        { desc = "BufferList: close buffer" },
      },
    },
    bufs_keymaps = {},
    width = 40,
    icons = {
      prompt = "",
      save_prompt = "󰆓 ",
      line = "▎",
      modified = "󰝥",
    },
    top_prompt = true,
    show_path = false,
  },
}
