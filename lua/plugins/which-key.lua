local opts = {
  mode = "n",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
  expr = false,
}

local keymap = vim.keymap.set
keymap("", "<Space>", "<Nop>")
keymap("", "a", "<Nop>")
keymap("", "r", "<Nop>")
keymap("", "q", "<Nop>")

local mappings = {

  -- alpha
  -- ["<leader>D"] = { "<cmd>Alpha<cr>", "dashboard" },

  -- bufferline
  -- ["<leader>b"] = { name = "+buffer" },
  -- ["<leader>bc"] = { "<cmd>Bdelete!<cr>", "close" },
  -- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", "pick open" },
  -- ["<leader>bf"] = { "<cmd>Telescope buffers previewer=false<cr><cr>", "find" },
  -- ["<leader>bn"] = { "<cmd>BufferLineCycleNext<cr>", "next" },
  -- ["<leader>bb"] = { "<cmd>BufferLineCyclePrev<cr>", "prev" },
  -- ["<leader>be"] = { "<cmd>BufferLinePickClose<cr>", "pick close" },
  -- ["<leader>bh"] = { "<cmd>BufferLineCloseLeft<cr>", "close left" },
  -- ["<leader>bl"] = { "<cmd>BufferLineCloseRight<cr>", "close right" },
  -- ["<leader>ba"] = { "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr><cmd>Bdelete!<cr>", "close all" },

  -- buffers
  ["<leader>b"] = { name = "+buffers" },
  ["<leader>bb"] = { "<cmd>JABSOpen<cr>", "buffers" },
  ["<leader>bc"] = { "<cmd>bd<cr>", "close" },
  ["<leader>bC"] = { "<cmd>bufdo bd<cr>", "close all" },
  ["<S-l>"] = { "<cmd>bnext<cr>", "next buffer" },
  ["<S-h>"] = { "<cmd>bprevious<cr>", "previous buffer" },

  -- debug
  ["<leader>d"] = { name = "+debug" },
  ["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "breakpoint" },
  ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "continue" },
  ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "step into" },
  ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "step over" },
  ["<leader>dO"] = { "<cmd>lua require'dap'.step_out()<cr>", "step out" },
  ["<leader>dp"] = { "<cmd>lua require'debugprint'.debugprint()<cr>", "debug print" },
  ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "replay" },
  ["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<cr>", "run last" },
  ["<leader>du"] = { "<cmd>lua require'dapui'.toggle()<cr>", "toggle UI" },
  ["<leader>dt"] = { "<cmd>lua require'dap'.terminate()<cr>", "terminate" },

  -- find
  ["<leader>f"] = { name = "+find" },
  ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "find buffer" },
  ["<leader>ff"] = { "<cmd>Telescope find_files hidden=false<cr>", "find file" },
  ["<leader>fn"] = { "<cmd>enew<cr>", "new file" },
  ["<leader>fp"] = { "<cmd>Telescope projects<cr>", "find projects" },
  ["<leader>fr"] = { ":%s/<C-r><C-w>//g<Left><Left>", "replace" },
  ["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "find text" },

  -- git
  ["<leader>g"] = { name = "+git" },
  ["<leader>gg"] = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "lazygit" },
  ["<leader>gd"] = { "<cmd>DiffviewOpen<cr>", "Diffview" },

  -- hop
  ["<leader>h"] = { name = "+hop" },
  ["<leader>ha"] = { "<cmd>HopAnywhere<cr>", "hop anywhere" },
  ["<leader>hc"] = { "<cmd>HopChar1<cr>", "hop char" },
  ["<leader>hw"] = { "<cmd>HopWord<cr>", "hop word" },
  ["<leader>hl"] = { "<cmd>HopLine<cr>", "hop line" },

  -- lsp
  ["<leader>l"] = { name = "+lsp" },
  ["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "action" },
  ["<leader>lD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "declaration" },
  ["<leader>ld"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "definition" },
  ["<leader>le"] = { "<cmd>lua vim.diagnostic.open_float(nil, {focus=false, scope='buffer'})<cr>", "diagnostic" },
  ["<leader>li"] = { "<cmd>LspInfo<cr>", "info" },
  ["<leader>lf"] = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "format" },
  ["<leader>lh"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "hover" },
  ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "references" },
  ["<leader>lR"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "rename" },
  ["<leader>lq"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace diagnostics" },
  ["<leader>ls"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "signature" },
  ["<leader>lt"] = { "<cmd>lua require('alternate-toggler').toggleAlternate()<cr>", "toggle" },
  ["<leader>lx"] = { "<cmd>Telescope lsp_document_symbols<cr>", "symbols" },

  -- neovim
  ["<leader>n"] = { name = "+neovim" },
  ["<leader>nl"] = { "<cmd>Lazy<cr>", "lazy" },
  ["<leader>nc"] = { "<cmd>e $MYVIMRC<cr>", "neovim configuration" },
  ["<leader>nm"] = { "<cmd>Mason<cr>", "mason" },
  ["<leader>nt"] = { "<cmd>TSUpdate<cr>", "treesitter update" },

  -- misc
  ["<leader>q"] = { name = "+misc" },
  ["<leader>qc"] = { "<cmd>ColorizerToggle<cr>", "toggle colorizer" },
  ["<leader>qk"] = { "<cmd>Telescope keymaps<cr>", "keymaps" },
  ["<leader>qm"] = { "<cmd>MarkdownPreview<cr>", "markdown preview" },
  ["<leader>qp"] = { "<cmd>lua require('telescope').extensions.neoclip.default()<cr>", "paste" },
  ["<leader>qs"] = { "<cmd>CarbonNowSh<cr>", "screenshot" },

  -- nvimtree
  ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "explorer" },

  -- rows
  ["r"] = { name = "+rows" },
  ["rr"] = { "Vyp", "duplicate" },
  ["r<Up>"] = { "<cmd>m -2<cr>", "move up" },
  ["r<Down>"] = { "<cmd>m +1<cr>", "move down" },

  -- save
  ["<leader>w"] = { "<cmd>lua vim.lsp.buf.format{ async = false }<cr><cmd>w<cr>", "save" },

  -- split
  ["<leader>s"] = { name = "+split" },
  ["<leader>sh"] = { "<cmd>split<cr>", "split horizontal" },
  ["<leader>sv"] = { "<cmd>vsplit<cr>", "split vertical" },

  -- tabs
  ["<leader>t"] = { name = "+tabs" },
  ["<leader>tn"] = { "<cmd>tabnew<cr>", "new tab" },
  ["<leader>tt"] = { "<cmd>tabnew | term<cr>", "terminal" },
  ["<leader>tc"] = { "<cmd>tabclose<cr>", "close tab" },
  ["<leader>tl"] = { "<cmd>tabnext<cr>", "next tab" },
  ["<leader>th"] = { "<cmd>tabprevious<cr>", "previous tab" },
}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup(
      {
        window = {
          border = "none"
        },
        plugins = {
          presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
          }
        },
        ignore_missing = true
      }
    )
    require("which-key").register(mappings, opts)
  end
}
