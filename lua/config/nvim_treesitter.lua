-- Treesitter Plugin Setup 
require('nvim-treesitter.configs').setup({
  ensure_installed = { "dot", "vim", "lua", "rust", "toml", "javascript", "typescript", "vue", "scss", "css", "html" },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
})

-- 开启 Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
