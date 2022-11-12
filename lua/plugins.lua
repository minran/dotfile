vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use {
    "williamboman/mason.nvim",
  }
  use {
    "williamboman/mason-lspconfig.nvim",
  }

  -- rust-toos.nvim
  use 'simrat39/rust-tools.nvim'

  -- Debugging
  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'
  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- Snippet engine and snippet template
  use { "SirVer/ultisnips", event = "InsertEnter" }
  use { "honza/vim-snippets", after = "ultisnips" }

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
  use { "quangnguyen30192/cmp-nvim-ultisnips", after = { "nvim-cmp", "ultisnips" } }
  if vim.g.is_mac then
    use { "hrsh7th/cmp-emoji", after = "nvim-cmp" }
  end
end)
