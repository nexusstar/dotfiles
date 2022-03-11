local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Map ; to : so instead of Shift+; just use ;
keymap("n", ";", ":", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Clear highlighting
keymap("n", "<CR>", ":nohlsearch<CR>/<BS>", opts)

-- Corrects the spelling under the cursor with first suggestion
keymap("n", "<S-z>", "<Cmd>normal 1z=<CR>", {silent = true}) -- FIXME Does not work

-- Default formatting, and keep the cursor in place
keymap("n", "Q", "mzgg=G`z", opts)

-- Harpoon UI
keymap("n", "<C-Space>", "<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>", opts)

-- Debugger (DAP)
keymap("n",  "<F5>", "<cmd>lua require('dap').continue()<CR>", opts)
keymap("n",  "<F10>", "<cmd>lua require('dap').step_over()<CR>", opts)
keymap("n",  "<F11>", "<cmd>lua require('dap').step_into()<CR>", opts)
keymap("n",  "<F12>", "<cmd>lua require('dap').step_out()<CR>", opts)
keymap("n",  "<leader>lp", "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap("n",  "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>", opts)
keymap("n", "<leader>dt", "<cmd>lua require('dap-go').debug_test()<CR>", opts)
require("dap-go").setup();
require("dapui").setup();

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Make word uppercase with <C-u>
keymap("i", "<C-u>", "<Esc>mzgUiw`za", opts)

-- Remap copilot accept
keymap("i", "<C-J>", "copilot#Accept(\"\\<CR>\")", {expr = true, silent= true})

-- Visual --
-- Default formatting, and keep the cursor in place
keymap("v", "Q", "mz=`z", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Put in visual mode
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
