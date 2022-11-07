local db = require("dashboard")
-- db.custom_header  -- type can be nil,table or function(must be return table in function)
-- if not config will use default banner
-- db.custom_center  -- table type and in this table you can set icon,desc,shortcut,action keywords. desc must be exist and type is string
-- icon type is nil or string
-- icon_hl table type { fg ,bg} see `:h vim.api.nvim_set_hl` opts
-- shortcut type is nil or string also like icon
-- action type can be string or function or nil.
-- if you don't need any one of icon shortcut action ,you can ignore it.
-- db.custom_footer  -- type can be nil,table or function(must be return table in function)
-- db.preview_file_Path    -- string or function type that mean in function you can dynamic generate height width
-- db.preview_file_height  -- number type
-- db.preview_file_width   -- number type
-- db.preview_command      -- string type (can be ueberzug which only work in linux)
-- db.confirm_key          -- string type key that do confirm in center select
-- db.hide_statusline      -- boolean default is true.it will hide statusline in dashboard buffer and auto open in other buffer
-- db.hide_tabline         -- boolean default is true.it will hide tabline in dashboard buffer and auto open in other buffer
-- db.session_directory    -- string type the directory to store the session file
-- db.header_pad           -- number type default is 1
-- db.center_pad           -- number type default is 1
-- db.footer_pad           -- number type default is 1
--

db.custom_center = {
	{ icon = "some icon", desc = "some desc", action = "Telescope find_files" },
}

-- db.custom_center = {
--   -- {icon_hl={fg="color_code"},icon ="some icon",desc="some desc"}, --correct
--   -- { icon = 'some icon' desc = 'some description here' }, --correct if you don't action filed
--   -- { desc = 'some description here' },                    --correct if you don't action and icon filed
--   { desc = 'some description here' action = 'Telescope find files'} --correct if you don't icon filed
-- }
