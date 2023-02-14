local components = {
	active = {
		{
			{
				provider = "vi_mode",
				hl = function()
					return {
						name = require("feline.providers.vi_mode").get_mode_highlight_name(),
						fg = require("feline.providers.vi_mode").get_mode_color(),
						style = "bold",
					}
				end,
				right_sep = " ",
			},

			{
				provider = {
					name = "file_info",
					hl = {
						fg = "white",
						bg = "oceanblue",
						style = "bold",
					},
					left_sep = { " ", "slant_left_2" },
					right_sep = { "slant_right_2", " " },
				},
			},

			{
				provider = "file_size",
				right_sep = {
					{
						str = "slant_left_2",
						hl = {
							fg = "fg",
							bg = "bg",
						},
					},
				},
			},
		},

		{
			{
				provider = "file_encoding",
			},
		},

		{
			{
				provider = "git_branch",
				hl = {
					fg = "white",
					bg = "black",
					style = "bold",
				},
				right_sep = {
					str = " ",
					hl = {
						fg = "NONE",
						bg = "black",
					},
				},
			},
		},
	},
	inactive = {
		-- left
		{},

		-- right
		{},
	},
}

require("feline").setup({
	force_inactive = {
		filetypes = {
			"^NvimTree$",
			"^packer$",
			"^startify$",
			"^fugitive$",
			"^fugitiveblame$",
			"^qf$",
			-- '^help$'
		},
		buftypes = {
			"^terminal$",
		},
		bufnames = {},
	},
})
