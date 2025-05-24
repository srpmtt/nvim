local keymap = vim.keymap.set
keymap("", "<Space>", "<Nop>")
keymap("", "a", "<Nop>")
keymap("", "r", "<Nop>")
keymap("", "K", "<S-Up>")
keymap("", "J", "<S-Down>")
keymap("", "<S-l>", "<cmd>bnext<cr>")
keymap("", "<S-h>", "<cmd>bprevious<cr>")

function custom_surround(delimiter)
  local selected_text = vim.fn.getreg("v", 1)
  local exceptions = { ["<"] = ">", ["["] = "]", ["{"] = "}", ["("] = ")" }
  local closing_char = exceptions[delimiter] or delimiter
  local command = string.format("'<,'>s/\\(.*\\)/%s\\1%s/g", delimiter, closing_char)
  vim.cmd(command)
  vim.cmd "nohl"
end

keymap("v", "s", [[:<C-u>lua custom_surround(vim.fn.input('surround with: '))<cr>]], { noremap = true, silent = true })

---@class wk.Opts
local defaults = {
  ---@type false | "classic" | "modern" | "helix"
  preset = "classic",
  ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
  delay = function(ctx)
    return 3000
  end,
  spec = {},
  notify = true,
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = false,
      nav = false,
      z = true,
      g = true,
    },
  },
  win = {
    row = -1,
    padding = { 1, 2 },
    title = true,
    title_pos = "center",
    zindex = 1000,
    bo = {},
    wo = {},
  },
  layout = {
    width = { min = 20 },
    spacing = 3,
    align = "left",
  },
  keys = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  sort = { "local", "order", "group", "alphanum", "mod", "lower", "icase" },
  expand = 1,
  ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
  replace = {
    key = {
      function(key)
        return require("which-key.view").format(key)
      end,
    },
    desc = {
      { "<Plug>%((.*)%)", "%1" },
      { "^%+", "" },
      { "<[cC]md>", "" },
      { "<[cC][rR]>", "" },
      { "<[sS]ilent>", "" },
      { "^lua%s+", "" },
      { "^call%s+", "" },
      { "^:%s*", "" },
    },
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
    ellipsis = "…",
    rules = false,
    colors = true,
    keys = {
      Up = " ",
      Down = " ",
      Left = " ",
      Right = " ",
      C = "󰘴 ",
      M = "󰘵 ",
      S = "󰘶 ",
      CR = "󰌑 ",
      Esc = "󱊷 ",
      ScrollWheelDown = "󱕐 ",
      ScrollWheelUp = "󱕑 ",
      NL = "󰌑 ",
      BS = "⌫",
      Space = "󱁐 ",
      Tab = "󰌒 ",
    },
  },
  show_help = true,
  show_keys = true,
  disable = {
    ft = {},
    bt = {},
  },
}

local mappings = {
  -- alpha
  -- ["<leader>D"] = { "<cmd>Alpha<cr>", desc = "dashboard" },

  -- buffers
  { "<leader>b", group = "buffers" },
  { "<leader>bC", "<cmd>bufdo bd<cr>", desc = "close all" },
  { "<leader>bc", "<cmd>bd!<cr>", desc = "close" },
  { "<leader>bb", "<cmd>BufferList<cr>", desc = "buffers" },
  { "<leader>bn", "<cmd>enew<cr>", desc = "new buffer" },
  {
    "<leader>bv",
    "<cmd>vnew<cr>",
    desc = "new buffer vertical",
  },

  -- debug
  { "<leader>d", group = "debug" },
  { "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", desc = "step out" },
  { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "breakpoint" },
  { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "continue" },
  {
    "<leader>dfb",
    "<cmd>lua require'dapui'.float_element('breakpoints', {position='center',width=80,height=40,enter=true})<cr>",
    desc = "breakpoints",
  },
  {
    "<leader>dfs",
    "<cmd>lua require'dapui'.float_element('scopes', {position='center',width=80,height=40,enter=true})<cr>",
    desc = "scopes",
  },
  {
    "<leader>dfw",
    "<cmd>lua require'dapui'.float_element('watches', {position='center',width=80,height=40,enter=true})<cr>",
    desc = "watches",
  },
  { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "step into" },
  { "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", desc = "run last" },
  { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "step over" },
  { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "replay" },
  { "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", desc = "terminate" },
  { "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "toggle UI" },

  -- find
  { "<leader>f", group = "find" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "find buffer" },
  { "<leader>ff", "<cmd>Telescope find_files hidden=false<cr>", desc = "find file" },
  { "<leader>fn", "<cmd>enew<cr>", desc = "new file" },
  { "<leader>fr", ":%s/<C-r><C-w>/", desc = "replace" },
  {
    "<leader>fp",
    "<cmd>Telescope projects<cr>",
    desc = "find projects",
  },
  { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "find text" },

  -- git
  { "<leader>g", group = "git" },
  { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
  { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", desc = "lazygit" },

  --hop
  { "<leader>h", group = "hop" },
  {
    "<leader>ha",
    "<cmd>HopAnywhere<cr>",
    desc = "hop anywhere",
  },
  { "<leader>hc", "<cmd>HopChar1<cr>", desc = "hop char" },
  { "<leader>hl", "<cmd>HopLine<cr>", desc = "hop line" },
  { "<leader>hw", "<cmd>HopWord<cr>", desc = "hop word" },

  -- lsp
  { "<leader>l", group = "lsp" },
  { "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "declaration" },
  { "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "rename" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "action" },
  { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "definition" },
  { "<leader>le", "<cmd>lua vim.diagnostic.open_float(nil, {focus=false, scope='buffer'})<cr>", desc = "diagnostic" },
  { "<leader>lf", "<cmd>lua require'conform'.format{ async = false }<cr>", desc = "format" },
  { "<leader>lh", "<cmd>lua vim.lsp.buf.hover({border='rounded'})<cr>", desc = "hover" },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "info" },
  {
    "<leader>lq",
    "<cmd>Telescope diagnostics<cr>",
    desc = "workspace diagnostics",
  },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "references" },
  { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "signature" },
  { "<leader>lt", "<cmd>lua require('alternate-toggler').toggleAlternate()<cr>", desc = "toggle" },
  { "<leader>lx", "<cmd>Telescope lsp_document_symbols<cr>", desc = "symbols" },

  -- neovim
  { "<leader>n", group = "neovim" },
  {
    "<leader>nc",
    "<cmd>e $MYVIMRC<cr>",
    desc = "neovim configuration",
  },
  { "<leader>nl", "<cmd>Lazy<cr>", desc = "lazy" },
  { "<leader>nm", "<cmd>Mason<cr>", desc = "mason" },
  {
    "<leader>nt",
    "<cmd>TSUpdate<cr>",
    desc = "treesitter update",
  },

  -- nvimtree
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "explorer" },

  --misc
  { "<leader>q", group = "misc" },
  {
    "<leader>qc",
    "<cmd>ColorizerToggle<cr>",
    desc = "toggle colorizer",
  },
  { "<leader>qk", "<cmd>Telescope keymaps<cr>", desc = "keymaps" },
  {
    "<leader>qm",
    "<cmd>MarkdownPreview<cr>",
    desc = "markdown preview",
  },
  { "<leader>qp", "<cmd>YankBank<cr>", desc = "paste" },
  { "<leader>qr", "<cmd>lua require('kulala').run()<cr>", desc = "kulala" },

  -- rows
  { "r", group = "rows" },
  { "r<Down>", "<cmd>m +1<cr>", desc = "move down" },
  { "r<Up>", "<cmd>m -2<cr>", desc = "move up" },
  { "rr", "Vyp", desc = "duplicate" },

  -- save
  -- { "<leader>w",  "<cmd>lua vim.lsp.buf.format{ async = false }<cr><cmd>w<cr>",                 desc = "save", },
  { "<leader>w", "<cmd>lua require'conform'.format({async=false})<cr><cmd>w<cr>", desc = "save" },

  -- split
  { "<leader>s", group = "split" },
  {
    "<leader>sh",
    "<cmd>split<cr>",
    desc = "split horizontal",
  },
  {
    "<leader>sv",
    "<cmd>vsplit<cr>",
    desc = "split vertical",
  },
  {
    "<leader>st",
    "<cmd>vsplit | terminal<cr>i",
    desc = "split terminal",
  },

  -- tabs
  { "<leader>t", group = "tabs" },
  { "<leader>tc", "<cmd>tabclose<cr>", desc = "close tab" },
  {
    "<leader>th",
    "<cmd>tabprevious<cr>",
    desc = "previous tab",
  },
  { "<leader>tl", "<cmd>tabnext<cr>", desc = "next tab" },
  { "<leader>tn", "<cmd>tabnew<cr>", desc = "new tab" },
  { "<leader>tt", "<cmd>tabnew | term<cr>", desc = "terminal" },
}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup(defaults)
    local wk = require "which-key"
    wk.add(mappings)
  end,
}
