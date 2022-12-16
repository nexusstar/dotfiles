local packer_bootstrap = false
-- Automatically install packer

local function packer_init()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		PACKER_BOOTSTRAP = fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		print("Installing packer close and reopen Neovim...")
		vim.cmd([[packadd packer.nvim]])
	end

	-- Run PackerCompile if there are changes in this file
	-- vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
	local packer_grp = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
	vim.api.nvim_create_autocmd(
		{ "BufWritePost" },
		{ pattern = "init.lua", command = "source <afile> | PackerCompile", group = packer_grp }
	)
end

-- packer.nvim configuration
local conf = {
	profile = {
		enable = true,
		threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
	},

	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
}

-- Plugins
local function plugins(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/popup.nvim" }) -- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs" }) -- Auto pairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" }) -- Easily comment stuff
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "akinsho/bufferline.nvim" })
	use({ "moll/vim-bbye" }) -- Close buffers without messing up the layout
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" }) -- Toggle multiple terminals
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "goolord/alpha-nvim" }) -- nvim Dashboard
	use({ "antoinemadec/FixCursorHold.nvim" }) -- This is needed to fix lsp doc highlight
	use({ "folke/which-key.nvim" })
	use({ "ThePrimeagen/harpoon" }) -- file navigation on steroids

	-- Legendary
	use({
		"mrjones2014/legendary.nvim",
		opt = true,
		keys = { [[<C-p>]] },
		-- wants = { "dressing.nvim" },
		module = { "legendary" },
		cmd = { "Legendary" },
		config = function()
			require("config.legendary").setup()
		end,
		-- requires = { "stevearc/dressing.nvim" },
	})

	use({
		"phaazon/hop.nvim",
		event = "BufRead",
		config = function()
			require("config.hop").config()
		end,
	}) -- Buffer search and jump to

	-- Colorschemes
	use({ "lunarvim/darkplus.nvim" })
	use({ "folke/tokyonight.nvim", as = "tokyonight" })
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "hrsh7th/cmp-cmdline" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" }) -- nvim-cmp source for neovim's built-in language server client.
	use({ "hrsh7th/cmp-nvim-lua" }) -- nvim-cmp source for neovim Lua API.

	use({
		"andymass/vim-matchup",
		event = "BufReadPost",
		config = function()
			vim.g.matchup_enabled = 1
			vim.g.matchup_surround_enabled = 1
			vim.g.matchup_matchparen_deferred = 1
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	})

	-- AI completion
	use({
		"github/copilot.vim",
		config = function()
			vim.g.copilot_no_tab_map = false
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_tab_fallback = ""
			vim.g.copilot_filetypes = {
				["*"] = false,
				python = true,
				lua = true,
				go = true,
				rust = true,
				html = true,
				c = true,
				cpp = true,
				java = true,
				javascript = true,
				typescript = true,
				javascriptreact = true,
				typescriptreact = true,
				terraform = true,
			}
		end,
	})
	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp").setup()
		end,
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "jayp0521/mason-null-ls.nvim" },
			"folke/neodev.nvim",
			"RRethy/vim-illuminate",
			"jose-elias-alvarez/null-ls.nvim",
			{
				"j-hui/fidget.nvim",
				config = function()
					require("fidget").setup({})
				end,
			},
			{ "jose-elias-alvarez/typescript.nvim", module = { "typescript" } },
			{
				"SmiteshP/nvim-navic",
				-- "alpha2phi/nvim-navic",
				config = function()
					require("nvim-navic").setup({})
				end,
				module = { "nvim-navic" },
			},
			{
				"simrat39/inlay-hints.nvim",
				config = function()
					require("inlay-hints").setup()
				end,
			},
			{
				"zbirenbaum/neodim",
				event = "LspAttach",
				config = function()
					require("config.neodim").setup()
				end,
				disable = true,
			},
			{
				"theHamsta/nvim-semantic-tokens",
				config = function()
					require("config.semantictokens").setup()
				end,
				disable = false,
			},
			{
				"David-Kunz/markid",
				disable = true,
			},
			{
				"simrat39/symbols-outline.nvim",
				cmd = { "SymbolsOutline" },
				config = function()
					require("symbols-outline").setup()
				end,
				disable = true,
			},
		},
	})
	--
	--[[ use "williamboman/nvim-lsp-installer" -- simple to use language server installer ]]
	use({ "tamago324/nlsp-settings.nvim" }) -- language server settings defined in json for
	--[[ use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters ]]

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })

	use({
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup({
				backends = { "treesitter", "lsp" },
				on_attach = function(bufnr)
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
			})
		end,
		module = { "aerial", "telescope._extensions.aerial" },
		cmd = { "AerialToggle" },
	})

	-- Git
	use({ "lewis6991/gitsigns.nvim" })

	-- UI helpers
	use({
		"norcalli/nvim-colorizer.lua", -- colorize color codes
		config = function()
			require("config.colorizer").config()
		end,
	})
	-- Surround
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
	-- Bootstrap Neovim
	if packer_bootstrap then
		print("Neovim restart is required after installation!")
		require("packer").sync()
	end
end

-- run and install on first use
packer_init()

local packer = require("packer")

pcall(require, "impatient")
-- Init packer and have it use a popup window
packer.init(conf)
packer.startup(plugins)
