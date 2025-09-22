vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.fillchars = { eob = " " }
vim.opt.foldenable = false
vim.opt.foldmethod = "indent"
vim.opt.formatoptions:remove { "c", "r", "o" }
vim.opt.guifont = "monospace:h17"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.iskeyword:append "-"
vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = {
  space = "·",
  tab = "--",
  -- eol = "↵"
}
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.scrolloff = 30
vim.opt.shiftwidth = 2
vim.opt.shortmess:append "c"
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.wrap = true
vim.opt.writebackup = false

vim.g.loaded_matchparen = true
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")
