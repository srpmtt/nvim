-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- resize with arrows
keymap("n", "<C-Up>", ":resize -2<cr>", opts)
keymap("n", "<C-Down>", ":resize +2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- tabs
keymap("n", "<leader>1", "<cmd>tabn 1<cr>", opts)
keymap("n", "<leader>2", "<cmd>tabn 2<cr>", opts)
keymap("n", "<leader>3", "<cmd>tabn 3<cr>", opts)
keymap("n", "<leader>4", "<cmd>tabn 4<cr>", opts)
keymap("n", "<leader>5", "<cmd>tabn 5<cr>", opts)
keymap("n", "<leader>6", "<cmd>tabn 6<cr>", opts)
keymap("n", "<leader>7", "<cmd>tabn 7<cr>", opts)
keymap("n", "<leader>8", "<cmd>tabn 8<cr>", opts)
keymap("n", "<leader>9", "<cmd>tabn 9<cr>", opts)

-- default
vim.cmd [[
      nnoremap dw diw
    ]]
