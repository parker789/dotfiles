local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local get_setup = function(name)
	return string.format('require("pv.setup.%s")', name)
end

require("packer").startup(function(use)
	-- manage packer recursively!
	use({ "wbthomason/packer.nvim" })

	-- general stuff
	use({ "nvim-lua/plenary.nvim" })
	use({ "nathom/filetype.nvim" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim", config = get_setup("telescope") })
	use({ "folke/tokyonight.nvim" })
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup()
		end,
	})
	-- 	use({ "lukas-reineke/indent-blankline.nvim", config = get_setup("indent-blankline") })
	-- use({ "karb94/neoscroll.nvim", config = get_setup("neoscroll") })
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	--use { 'folke/twilight.nvim', config = function() require('twilight').setup() end }
	use({ "kyazdani42/nvim-tree.lua", config = get_setup("nvim-tree") })
	use({
		"folke/which-key.nvim",
		config = get_setup("which-key"),
	})
	use({ "akinsho/bufferline.nvim", config = get_setup("bufferline") })
	use({ "nvim-lualine/lualine.nvim", config = get_setup("lualine") })

	use({ "numToStr/Comment.nvim", config = get_setup("comment") })

	-- use({
	-- 	"nvim-neorg/neorg",
	-- ft  "norg",
	-- run = ":Neorg sync-parsers",
	-- config = get_setup("nvim-neorg"),
	-- 	requires = "nvim-lua/plenary.nvim",
	-- })

	-- use({
	-- 	"nvim-orgmode/orgmode",
	-- 	config = get_setup("orgmode"),
	-- })

	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = get_setup("neogit"),
	})
	use({
		"glepnir/dashboard-nvim",

		config = get_setup("dashboard-nvim"),
	})
	-- use { 'goolord/alpha-nvim', config = function () require('alpha').setup(require('alpha.themes.dashboard').config) end }

	-- use { 'famiu/feline.nvim', config = function() require('plugins.feline') end }
	--

	--- file explorer
	-- use({
	-- 	"luukvbaal/nnn.nvim",
	-- 	config = function()
	-- 		require("nnn").setup()
	-- 	end,
	-- })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = get_setup("nvim-treesitter"),
	})
	use({ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" })
	use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })

	-- lsp
	--  use { 'neovim/nvim-lspconfig' }
	-- use { 'williamboman/mason.nvim', after = 'nvim-lspconfig', config = function() require('mason').setup() end }
	-- use { 'williamboman/mason-lspconfig.nvim', after = 'nvim-lspconfig' }
	-- use { 'williamboman/nvim-lsp-installer', config = get_setup('lsp') }

	-- LSP Configuration
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- useful status updates for LSP
			"j-hui/fidget.nvim",
		},
		config = get_setup("lsp"),
	})

	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
		config = get_setup("nvim-cmp"),
	})

	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim", config = get_setup("null-ls") })

	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
	})

	-- git
	use({
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("gitsigns").setup({ current_line_blame = true })
		end,
	})
	--use { 'sindrets/diffview.nvim'  }
	use({ "christoomey/vim-tmux-navigator" })

	use({ "voldikss/vim-floaterm" })

	use({
		"windwp/nvim-autopairs",
		config = get_setup("autopairs"),
	})

	use({
		"ThePrimeagen/harpoon",
		config = get_setup("harpoon"),
	})

	use({ "github/copilot.vim" })
	use({ "psliwka/vim-smoothie" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)

-- Automatically source and re-compile packer whenever you save this file
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerCompile",
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})

-- previously used
--use { 'mg979/vim-visual-multi' }
--use { 'catppuccin/nvim' }
--use { 'yamatsum/nvim-cursorline', config = function() require('nvim-cursorline').setup() end }
--use { 'ggandor/lightspeed.nvim' }
--use { 'ellisonleao/gruvbox.nvim', requires = 'rktjmp/lush.nvim' }