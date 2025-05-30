return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = { "NEOVIM" }
    dashboard.section.buttons.val = {
      dashboard.button("f", " Find file", ":Telescope find_files hidden=false<CR>"),
      dashboard.button("n", " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("e", " Explorer", ":NvimTreeOpen<CR>"),
      dashboard.button("p", " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
      dashboard.button("r", " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", " Config", ":e $MYVIMRC <CR>"),
      dashboard.button("q", " Quit", ":qa<CR>"),
    }

    -- local function footer()
    --   return "footer"
    -- end

    -- dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end
}
