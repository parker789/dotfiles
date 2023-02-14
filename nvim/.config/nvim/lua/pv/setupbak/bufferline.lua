require("bufferline").setup({
	options = {
		mode = "tabs",
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text_align = "center",
				separator = true,
			},
		},
	},
})
