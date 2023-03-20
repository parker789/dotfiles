local wt = require("wezterm")

return {
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	font = wt.font("Hack Nerd Font"),
	font_size = 14,
	colors = {
		foreground = "#c0caf5",
		background = "#1a1b26",
		cursor_bg = "#c0caf5",
		cursor_border = "#c0caf5",
		cursor_fg = "#1a1b26",
		selection_bg = "#33467c",
		selection_fg = "#c0caf5",

		ansi = { "#15161e", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
		brights = { "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" },

		tab_bar = {
			inactive_tab_edge = "#16161e",
			background = "#191b28",
			active_tab = {
				fg_color = "#7aa2f7",
				bg_color = "#1a1b26",
			},
			inactive_tab = {
				bg_color = "#16161e",
				fg_color = "#545c7e",
			},
			inactive_tab_hover = {
				bg_color = "#16161e",
				fg_color = "#7aa2f7",
			},
			new_tab_hover = {
				fg_color = "#16161e",
				bg_color = "#7aa2f7",
			},
			new_tab = {
				fg_color = "#7aa2f7",
				bg_color = "#191b28",
			},
		},
	},
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},
}
