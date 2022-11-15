vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use { 'nvim-lua/popup.nvim', disable = true }

  use { 'MunifTanjim/nui.nvim', disable = true }

  use {
    'nvim-tree/nvim-web-devicons',
  }

  use {
    'goolord/alpha-nvim',
  }

  use{
    "glepnir/lspsaga.nvim",
    disable = true,
    branch = "main",
    config = function()
        local saga = require("lspsaga")

        saga.init_lsp_saga({
            -- your configuration
        })
    end,
  }

  use {
    'tanvirtin/monokai.nvim',
  }

  use {
    'folke/tokyonight.nvim',
    disable = true
  }

  use 'neovim/nvim-lspconfig'

  use 'nvim-treesitter/nvim-treesitter'

  use {'nvim-treesitter/nvim-treesitter-textobjects'}

  use {"williamboman/mason.nvim"}

  use {"williamboman/mason-lspconfig.nvim"}

  -- rust-toos.nvim
  use 'simrat39/rust-tools.nvim'


  -- Debugging
  use 'mfussenegger/nvim-dap'
  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- Snippet engine and snippet template
  use { "SirVer/ultisnips" }

  use { "onsails/lspkind-nvim" }
  -- auto-completion engine
  use {
    "hrsh7th/nvim-cmp",
  }
  -- nvim-cmp completion sources
  use { "hrsh7th/cmp-vsnip", after = "nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
  use { "hrsh7th/cmp-path", after = "nvim-cmp" }
  use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
  use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
  use { "quangnguyen30192/cmp-nvim-ultisnips" }
  if vim.g.is_mac then
    use { "hrsh7th/cmp-emoji", after = "nvim-cmp" }
  end
end)

