-- doing this early in config to avoid any issues
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true

require("pv.config.lazy")
require("pv.config.theme")
require("pv.config.settings")
require("pv.config.mappings")
