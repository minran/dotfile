local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  {
    'nvim-lua/plenary.nvim',
  },
  ------------------ 弹窗窗口 -----------------
  {
    'rcarriga/nvim-notify',
  },
  {
    'MunifTanjim/nui.nvim',
  },
  {
    'folke/noice.nvim',
  },
  ------------------ 图标 -----------------
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'goolord/alpha-nvim',
  },
  ------------------ 主题 -----------------
  {
    'tanvirtin/monokai.nvim',
  },
  {
    'folke/tokyonight.nvim',
  },
  {
    'olimorris/onedarkpro.nvim'
  },
  {
    'sainnhe/sonokai'
  },
  {
    'Mofiqul/vscode.nvim'
  },

  ------------------ telescope -----------------
  {
    'nvim-telescope/telescope.nvim', version = '0.1.0',
    -- or                            , branch = '0.1.x',
  },
  { "nvim-telescope/telescope-live-grep-args.nvim", },
  { "nvim-telescope/telescope-live-grep-raw.nvim", },
  { "LinArcX/telescope-env.nvim", },
  { "nvim-telescope/telescope-ui-select.nvim", },
  { "nvim-telescope/telescope-rg.nvim", },
  { "nvim-telescope/telescope-dap.nvim", },
  {'neovim/nvim-lspconfig'},
  {
    'nvim-treesitter/nvim-treesitter',
    --run = ':TSUpdate',
  },
  {'nvim-treesitter/nvim-treesitter-textobjects'},
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},

  ------------------ rust-toos.nvim -----------------
  {'simrat39/rust-tools.nvim'},
  ------------------ Debugging -----------------
  {'mfussenegger/nvim-dap'},
  ------------------ nvim-tree -----------------
  {
    'nvim-tree/nvim-tree.lua',
    version = 'nightly' -- optional, updated every week. (see issue #1193)
  },
  ------------------ Snippet engine and snippet template -----------------
  { "SirVer/ultisnips" },

  { "onsails/lspkind-nvim" },
  ------------------ auto-completion engine -----------------
  { "hrsh7th/nvim-cmp" },
  ------------------ nvim-cmp completion sources -----------------
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-omni" },
  { "quangnguyen30192/cmp-nvim-ultisnips" },
  { "hrsh7th/cmp-emoji", enabled = vim.g.is_mac  },

  ------------------ lspkind icon -----------------
  {'mortepau/codicons.nvim'},
  {'akinsho/bufferline.nvim', version = "v3.*", dependencies = 'nvim-tree/nvim-web-devicons'},
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  },

  ------------------ new plug -----------------
  
  ------------------ taglist -----------------
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },

  ------------------ 全局搜索插件 Ack -----------------
  { 'wincent/ferret' },
  { 'junegunn/fzf' },
  { 'junegunn/fzf.vim' },
  
  ------------------ 改变包围结构插件 -----------------
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },

  ------------------ 快速跳转插件 -----------------
  {

    "phaazon/leap.nvim",

    lazy = true,

    event = "BufReadPost",
  },
  
  ------------------ 快速跳转插件 -----------------
  -- TODO 
})
