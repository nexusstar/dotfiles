local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs" -- Auto pairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye" -- Close buffers without messing up the layout
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim" -- Toggle multiple terminals
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim" -- nvim Dashboard
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use "ThePrimeagen/harpoon" -- file navigation on steroids
  use {
      "phaazon/hop.nvim",
      event = "BufRead",
      config = function()
        require("config.hop").config()
      end,
    } -- Buffer search and jump to

  -- Colorschemes
  use "lunarvim/darkplus.nvim"
  use({"folke/tokyonight.nvim", as="tokyonight"})
  use({"catppuccin/nvim",	as="catppuccin"})

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in language server client.
  use "hrsh7th/cmp-nvim-lua" -- nvim-cmp source for neovim Lua API.

  use {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_enabled = 1
      vim.g.matchup_surround_enabled = 1
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  }

  -- AI completion
  use {
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
  }
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- UI helpers
  use {
    "norcalli/nvim-colorizer.lua", -- colorize color codes
    config = function()
      require("config.colorizer").config()
    end
  }
-- DAP debugging
  --[[ use { ]]
  --[[   "mfussenegger/nvim-dap", ]]
  --[[   module = "dap", ]]
  --[[   event = "BufReadPre", ]]
  --[[   requires = { ]]
  --[[     { "Pocco81/dap-buddy.nvim", branc="dev" }, ]]
  --[[     "theHamsta/nvim-dap-virtual-text", ]]
  --[[     "rcarriga/nvim-dap-ui", ]]
  --[[     "mfussenegger/nvim-dap-python", ]]
  --[[     "nvim-telescope/telescope-dap.nvim", ]]
  --[[     { "leoluz/nvim-dap-go", module = "dap-go" }, ]]
  --[[     { "jbyuki/one-small-step-for-vimkind", module = "osv" }, ]]
  --[[   }, ]]
  --[[   config = function() ]]
  --[[     require("dap").setup() ]]
  --[[   end, ]]
  --[[ } ]]
  -- Grammar checker
  -- use "rhysd/vim-grammarous"
  -- [[ use "mustache/vim-mustache-handlebars" ]]
  -- Surround
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
  -- Automatically set up configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
