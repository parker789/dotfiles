local get_setup = function(name)
	return function()
		require(string.format("pv.setupbak.%s", name))
	end
end

return {
	"nvim-lua/plenary.nvim",
	"nathom/filetype.nvim",
	"nvim-tree/nvim-web-devicons",
	{ "nvim-telescope/telescope.nvim", dependencies = "nvim-lua/plenary.nvim", config = get_setup("telescope") },
	"folke/tokyonight.nvim",
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{ "kyazdani42/nvim-tree.lua", config = get_setup("nvim-tree") },

	{
		"folke/which-key.nvim",
		config = get_setup("which-key"),
	},

	-- { "akinsho/bufferline.nvim", config = get_setup("bufferline") },
	{ "romgrk/barbar.nvim" },
	{ "nvim-lualine/lualine.nvim", config = get_setup("lualine") },

	{ "numToStr/Comment.nvim", config = get_setup("comment") },
	{
		"TimUntersberger/neogit",
		dependencies = "nvim-lua/plenary.nvim",
		config = get_setup("neogit"),
	},
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
			})
		end,
	},
	-- {
	-- 	"goolord/alpha-nvim",
	-- 	config = function()
	-- 		require("alpha").setup(require("alpha.themes.startify").config)
	-- 	end,
	-- },
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = get_setup("nvim-treesitter"),
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"p00f/nvim-ts-rainbow",
		},
	},

	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- useful status updates for LSP
			"j-hui/fidget.nvim",
		},
		config = get_setup("lsp"),
	},

	-- Autocompletion

	-- map('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<cr>")
	-- map('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<cr>")
	-- map('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<cr>")
	-- map('n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<cr>")
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
		config = get_setup("nvim-cmp"),
	},

	{ "jose-elias-alvarez/null-ls.nvim", dependencies = "nvim-lua/plenary.nvim", config = get_setup("null-ls") },

	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
	},

	-- git
	{
		"lewis6991/gitsigns.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("gitsigns").setup({ current_line_blame = true })
		end,
	},
	"christoomey/vim-tmux-navigator",

	"voldikss/vim-floaterm",

	{
		"windwp/nvim-autopairs",
		config = get_setup("autopairs"),
	},

	{
		"ThePrimeagen/harpoon",
		config = get_setup("harpoon"),
	},

	"github/copilot.vim",
	"psliwka/vim-smoothie",

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		config = get_setup("nvim-neorg"),
	},
}
