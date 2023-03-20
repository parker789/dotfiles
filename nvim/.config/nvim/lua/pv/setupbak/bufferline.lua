require("bufferline").setup({
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp",
		separator_style = "slant",
		offsets = {
			{
				filetype = "NvimTree",
				text_align = "center",
				separator = true,
			},
		},
	},
})
