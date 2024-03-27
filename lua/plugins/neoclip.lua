return {
  "acksld/nvim-neoclip.lua",
  dependencies = {
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    require('neoclip').setup({
      history = 100,
      enable_persistent_history = false,
      length_limit = 1048576,
      continuous_sync = false,
      db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
      filter = nil,
      preview = true,
      prompt = nil,
      default_register = '"',
      default_register_macros = 'q',
      enable_macro_history = true,
      content_spec_column = false,
      on_select = {
        move_to_front = false,
      },
      on_paste = {
        set_reg = false,
        move_to_front = false,
      },
      on_replay = {
        set_reg = false,
        move_to_front = false,
      },
      keys = {
        telescope = {
          i = {
            select = '<cr>',
            paste = '<c-p>',
            paste_behind = '<c-k>',
            replay = '<c-q>',
            delete = '<c-d>',
            custom = {},
          },
          n = {
            select = '<cr>',
            paste = 'p',
            paste_behind = 'P',
            replay = 'q',
            delete = 'd',
            custom = {},
          },
        },
        fzf = {
          select = 'default',
          paste = 'ctrl-p',
          paste_behind = 'ctrl-k',
          custom = {},
        },
      },
    })

    require('telescope').load_extension('neoclip')
  end
}
