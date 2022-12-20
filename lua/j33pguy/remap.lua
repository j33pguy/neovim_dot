vim.g.mapleader = " "

--Move to diff panes by using CNTRL HJKL 
vim.keymap.set("n","<C-h>", "<C-w>h")
vim.keymap.set("n","<C-j>", "<C-w>j")
vim.keymap.set("n","<C-k>", "<C-w>k")
vim.keymap.set("n","<C-l>", "<C-w>l")

--Open file explorer
vim.keymap.set("n","<leader>pv",vim.cmd.Ex)

--Move highlighted lines while in visual mode
vim.keymap.set("v","J",":m '>+1<CR>gv=gv")
vim.keymap.set("v","K",":m '<-2<CR>gv=gv")

--Half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--Keep search terms in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--Paste over selection and put to void buffer
--Allows you to keep what you copied after you paste
vim.keymap.set("x","<leader>p", "\"_dP")

--Yank into system clipboard
vim.keymap.set("n", "<leader>y","\"+y")
vim.keymap.set("v", "<leader>y","\"+y")
vim.keymap.set("n", "<leader>Y","\"+Y")

--Vim quickfix keymaps
vim.keymap.set("n", "<C-k>","<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>","<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k","<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j","<cmd>lprev<CR>zz")

--Vim replace word is selected 
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--make file im on executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

