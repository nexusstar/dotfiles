local M = {}
function M.setup()
  -- Automatically install packer
  local function packer_init()
    local fn = vim.fn
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

    -- Run PackerCompile if there are changes in this file
    -- vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
    local packer_grp = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
    vim.api.nvim_create_autocmd(
      { "BufWritePost" },
      { pattern = "init.lua", command = "source <afile> | PackerCompile", group = packer_grp }
    )
  end

  -- Plugins
  local function plugins(use)
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

    -- Legendary
    use {
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
    }

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
    -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
    require("neodev").setup({
      -- add any options here, or leave empty to use the default settings
    })
    -- LSP
    use {
      "neovim/nvim-lspconfig",
      opt = true,
      event = { "BufReadPre" },
      wants = {
        -- "nvim-lsp-installer",
        "mason.nvim",
        "mason-lspconfig.nvim",
        "mason-tool-installer.nvim",
        "cmp-nvim-lsp",
        "vim-illuminate",
        "null-ls.nvim",
        "schemastore.nvim",
        "typescript.nvim",
        "nvim-navic",
      },
      config = function()
        require("config.lsp").setup()
      end,
      requires = {
        -- "williamboman/nvim-lsp-installer",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        -- { "lvimuser/lsp-inlayhints.nvim", branch = "readme" },
        "RRethy/vim-illuminate",
        "jose-elias-alvarez/null-ls.nvim",
        "b0o/schemastore.nvim",
        "jose-elias-alvarez/typescript.nvim",
        {
          "SmiteshP/nvim-navic",
          config = function()
            require("nvim-navic").setup {}
          end,
          module = { "nvim-navic" },
        },
      },
    }
    --[[ use "williamboman/nvim-lsp-installer" -- simple to use language server installer ]]
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    --[[ use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters ]]

    -- Telescope
    use "nvim-telescope/telescope.nvim"

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Rust
    use {
      "simrat39/rust-tools.nvim",
      requires = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim" },
      opt = true,
      module = "rust-tools",
      ft = { "rust" },
      -- config = function()
      --   require("config.rust").setup()
      -- end,
    }
    use {
      "saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      requires = { { "nvim-lua/plenary.nvim" } },
      config = function()
        -- local null_ls = require "null-ls"
        require("crates").setup {
          null_ls = {
            enabled = true,
            name = "crates.nvim",
          },
        }
      end,
      disable = false,
    }

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- UI helpers
    use {
      "norcalli/nvim-colorizer.lua", -- colorize color codes
      config = function()
        require("config.colorizer").config()
      end
    }
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
      print "Neovim RESTART is required after installation!"
      require("packer").sync()
    end
  end

  -- run and install on first use
  packer_init()

  local packer = require "packer"

  pcall(require, "impatient")
  -- Init packer and have it use a popup window
  packer.init {
    profile = {
      enable = true,
      threshold = 0, -- the amount of ms that a plugins load time must be over for it to be included in the profile
    },
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }
  packer.startup(plugins)
end

return M
