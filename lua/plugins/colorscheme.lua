return {
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  config = function()
    local status_ok, _ = pcall(vim.cmd.colorscheme, "github_dark_dimmed")
    if not status_ok then
      return
    end
  end
}
