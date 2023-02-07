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

-- file movement
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- file saves
map("n", "<C-s>", ":update<cr>")
map("i", "<C-s>", "<Esc>:update<cr>a")

-- open file in browser
map("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]])

-- harpoon mappings
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>1", function()
  ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>2", function()
  ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>3", function()
  ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>4", function()
  ui.nav_file(4)
end)

-- map('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<cr>")
-- map('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<cr>")
-- map('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<cr>")
-- map('n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<cr>")
