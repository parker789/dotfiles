-- aliases
local o = vim.o -- global
local g = vim.g -- global for let options
local wo = vim.wo -- window local
local bo = vim.bo -- buffer local
local fn = vim.fn -- access vim functions
local cmd = vim.cmd -- vim commands
local api = vim.api -- api commands

-- global options
o.swapfile = false
o.smartcase = true
o.laststatus = 2
o.hlsearch = false
o.incsearch = true
o.ignorecase = true
o.scrolloff = 3
o.showcmd = true
o.wildmenu = false
o.mouse = "a"
o.showmatch = true
o.ruler = true
o.showmode = true
o.shiftround = true
o.completeopt = "menuone,noselect"
o.timeoutlen = 500
o.cmdheight = 2
o.splitright = true
o.clipboard = "unnamed,unnamedplus" --- Copy-paste between vim and everything else
o.lazyredraw = true
o.timeoutlen = 100
o.number = true
o.relativenumber = true
o.laststatus = 3

-- window options
wo.signcolumn = "yes"
wo.cursorline = true

-- buffer local
bo.smartindent = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
bo.expandtab = true
