require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					notes = "~/notes",
					poker = "~/notes/poker",
				},
			},
		},
	},
})
