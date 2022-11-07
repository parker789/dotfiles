require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					home = "~/notes/home",
					das = "~/notes/das",
				},
			},
		},
	},
})
