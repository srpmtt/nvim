return {
  "echasnovski/mini.comment",
  version = false,
  event = "VeryLazy",
  config = function()
    require('mini.comment').setup
    {
      options = {
        custom_commentstring = nil,
        ignore_blank_line = false,
        start_of_line = false,
        pad_comment_parts = true,
      },
      mappings = {
        comment = '.',
        comment_line = '.',
        comment_visual = '.',
        textobject = '.',
      },
      hooks = {
        pre = function() end,
        post = function() end,
      },
    }
  end
}
