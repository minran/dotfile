vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use {
    'nvim-tree/nvim-web-devicons',
  }

  use {
    'goolord/alpha-nvim',
  }

  use {
    'tanvirtin/monokai.nvim',
  }

  use {
    'folke/tokyonight.nvim',
  }

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
  }

  use 'neovim/nvim-lspconfig'

  use {
    'nvim-treesitter/nvim-treesitter',
    --run = ':TSUpdate',
  }

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

  -- lspkind icon
  use 'mortepau/codicons.nvim'

  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

end)
