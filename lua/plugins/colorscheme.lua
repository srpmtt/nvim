return {
  "shaunsingh/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.nord_bold = false
    vim.g.nord_italic = false
    local status_ok, _ = pcall(vim.cmd.colorscheme, "nord")
    if not status_ok then
      return
    end
  end
}
