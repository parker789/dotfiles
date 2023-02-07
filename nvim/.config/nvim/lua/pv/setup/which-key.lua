local wk = require("which-key")

wk.setup({
	plugins = {
		marks = false,
		registers = false,
		spelling = {
			enabled = false,
			suggestions = 20,
		},
		presets = {
			operators = false,
			motions = false,
			text_objects = false,
			windows = false,
			nav = false,
			z = false,
			g = false,
		},
	},
	key_labels = {
		["<space>"] = "SPC",
		["<cr>"] = "RET",
		["<tab>"] = "TAB",
	},
	ignore_missing = true,
	show_help = true,
	show_keys = true,
	triggers = "auto",
})

wk.register({
	s = {
		name = "[S]earch", -- optional group name
		f = { require("telescope.builtin").find_files, "[F]iles" },
		h = { require("telescope.builtin").help_tags, "[H]elp" },
		w = { require("telescope.builtin").grep_string, "current [W]ord" },
		g = { require("telescope.builtin").live_grep, "[G]rep" },
		d = { require("telescope.builtin").diagnostics, "[D]iagnostics" },
		b = { require("telescope.builtin").buffers, "[B]uffers" },
	},
	p = {
		name = "[P]acker",
		s = { ":PackerSync<cr>", "[S]ync" },
	},
	v = {
		name = "[V]im",
		e = { ":e $MYVIMRC<cr>", "[E]dit init.lua" },
		s = { ":lua reload_config()<cr> :noh<cr>", "[S]ource init.lua" },
	},
	t = {
		name = "[T]oggle",
		t = { ":NvimTreeToggle<cr>", "Nvim[T]ree" },
		-- T = { ":NnnPicker %:p:h<cr>", "nnn" },
		d = { ":TroubleToggle<cr>", "Trouble [D]iagnostics" },
	},
	g = { ":FloatermNew --name=lazygit --title=lazygit --height=0.85 --width=0.85 lazygit<cr>", "Lazy[G]it" },
	G = { ":Neogit<cr>", "Neogit" },
}, { prefix = "<leader>" })
