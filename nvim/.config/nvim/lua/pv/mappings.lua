-- function _G.reload_config()
-- 	for name, _ in pairs(package.loaded) do
-- 		if name:match("^pv") then
-- 			package.loaded[name] = nil
-- 		end
-- 	end
--
-- 	dofile(vim.env.MYVIMRC)
-- 	vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
-- end

function _G.reload_config()
  local reload = require("plenary.reload").reload_module
  reload("pv", false)

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

-- map helper function
local function map(mode, key, cmd, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, key, cmd, options)
end

-- window movement
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- file saves
map("n", "<C-s>", ":w<cr>")

-- map('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<cr>")
-- map('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<cr>")
-- map('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<cr>")
-- map('n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<cr>")

-- which key
local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register({
  f = {
    name = "file", -- optional group name
    f = { ":Telescope find_files hidden=true<cr>", "Find File" }, -- create a binding with label
    g = { ":Telescope live_grep<cr>", "Find Text" }, -- create a binding with label
    b = { ":Telescope buffers<cr>", "Find Buffers" }, -- create a binding with label
    h = { ":Telescope help_tags<cr>", "Find Help" }, -- create a binding with label
  },
  p = {
    name = "Packer",
    s = { ":PackerSync<cr>", "Sync" },
  },
  v = {
    name = "Vim",
    e = { ":e $MYVIMRC<cr>", "Edit init.lua" },
    s = { ":lua reload_config()<cr> :noh<cr>", "Source init.lua" },
  },
  t = {
    name = "Toggle",
    t = { ":NvimTreeToggle<cr>", "NvimTree" },
    T = { ":NnnPicker %:p:h<cr>", "nnn" },
    d = { ":TroubleToggle<cr>", "Trouble" },
  },
  g = { ":FloatermNew --name=lazygit --title=lazygit --height=0.85 --width=0.85 lazygit<cr>", "Lazygit" },
  -- g = { ":Neogit<cr>", "Neogit" },
}, { prefix = "<leader>" })
