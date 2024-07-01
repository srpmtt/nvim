return {
  "mistweaverco/kulala.nvim",
  event = "VeryLazy",
  config = function()
    vim.filetype.add({
      extension = {
        ['http'] = 'http',
      },
    })
    require('kulala').setup()
  end
}
