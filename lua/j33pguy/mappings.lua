local map = vim.keymap.set

vim.g.mapleader = " "

--Move to diff panes by using CNTRL HJKL 
map("n","<C-h>", "<C-w>h")
map("n","<C-j>", "<C-w>j")
map("n","<C-k>", "<C-w>k")
map("n","<C-l>", "<C-w>l")

--Open NETRW for file exploration
map("n","<leader>pv",vim.cmd.Ex)


--Move highlighted lines while in visual mode
--Remeber: use <C-v> to go into visual block mode
map("v","J",":m '>+1<CR>gv=gv")
map("v","K",":m '<-2<CR>gv=gv")

--Half page jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

--Keep search terms in middle
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

--Paste over selection and put to void buffer
--Allows you to keep what you copied after you paste
map("x","<leader>p", "\"_dP")

--Yank into system clipboard
map("n", "<leader>y","\"+y")
map("v", "<leader>y","\"+y")
map("n", "<leader>Y","\"+Y")

--Vim quickfix keymaps
map("n", "<C-k>","<cmd>cnext<CR>zz")
map("n", "<C-j>","<cmd>cprev<CR>zz")
map("n", "<leader>k","<cmd>lnext<CR>zz")
map("n", "<leader>j","<cmd>lprev<CR>zz")

--Vim replace word is selected 
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--make file im on executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


