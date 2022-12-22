--local settings = require("settings")
--local utils = require("utils")
local o = vim.opt
--local fn = vim.fn

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

o.guicursor = ""

o.nu = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.smartindent = true
o.smartcase = true

o.wrap = false

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .."/.vim/undodir" --Longrunning undos
o.undofile = true

o.hlsearch = false
o.incsearch = true

o.termguicolors = true

o.scrolloff = 8 --always keep 8 lines displayed
o.signcolumn = "yes"
o.isfname:append("@-@")

o.updatetime = 50

o.colorcolumn = "80"

o.background = "dark"

o.wildmode = "full"
o.wildignorecase = true
