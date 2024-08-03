vim.g.mapleader = ","
local opt = {
  noremap = true,
  silent = true,
}

local builtin = require('telescope.builtin')

-- 本地变量
local map = vim.api.nvim_set_keymap

-- basic

map("n", "<space>w", ":w<CR>", opt)
map("n", "<space>qq", ":qa<CR>", opt)

-- bufferline
-- 左右Tab切换
map("n", "<space>h", ":BufferPrevious<CR>", opt)
map("n", "<space>l", ":BufferNext<CR>", opt)
map("n", "<space>c", ":BufferClose<CR>", opt)
-- "moll/vim-bbye" 关闭当前 buffer
map("n", "<leader>bc", ":bdelete!<CR>", opt)
--map("n", "<space>w", ":bdelete!<CR>", opt)
-- 关闭左/右侧标签页
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- 关闭其他标签页
map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
-- 关闭选中标签页
map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)



-- vim 移动快捷键
map("n", "<leader>/", ":nohlsearch<CR>", opt)
-- 窗口切换
map("n", "<C-J>", "<C-W>j", opt)
map("n", "<C-K>", "<C-W>k", opt)
map("n", "<C-L>", "<C-W>l", opt)
map("n", "<C-H>", "<C-W>h", opt)
-- 标签页切换
map("n", "<S-H>", "gT", opt)
map("n", "<S-l>", "gt", opt)

map("n", "<leader>v", '"+gp', opt)
map("n", "<leader>c", '"+y', opt)
map("n", "<leader>t", ':tabnew<CR><C-E>', opt)

map("i", "jj", "<ESC>", opt)

--date 
map("n", '<leader>rd', 'i<C-R>=strftime("%Y-%m-%d %a")<CR><Esc>', opt)
map("i", '<leader>rd', '<C-R>=strftime("%Y-%m-%d %a")<CR><Esc>', opt)
-- time 
map("n", '<leader>rt', 'i<C-R>=strftime("%H:%M:%S")<CR><Esc>', opt)
map("i", '<leader>rt', '<C-R>=strftime("%H:%M:%S")<CR><Esc>', opt)
--command Date execute "normal i<C-R>=strftime('%F %T')<CR><ESC>"

--git
map('n', '<leader>gs', '<CMD>G<CR>', opt)
map('n', '<leader>gq', '<CMD>G<CR><CMD>q<CR>', opt)
map('n', '<leader>gw', '<CMD>Gwrite<CR>', opt)
map('n', '<leader>gr', '<CMD>Gread<CR>', opt)
map('n', '<leader>gh', '<CMD>diffget //2<CR>', opt)
map('n', '<leader>gl', '<CMD>diffget //3<CR>', opt)
map('n', '<leader>gp', '<CMD>Git push<CR>', opt)


-- telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

local function telescope_live_grep_open_files()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end
vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })

-- ferret
vim.keymap.set('n', '<Leader>x', '<Plug>(FerretAck)', {})
vim.keymap.set('n', '<Leader>z', '<Plug>(FerretAckWord)', {})

-- symbols_outline
map('n', '<leader>tt', ':SymbolsOutline<CR>', opt)

-- markdown-preview
map("n", '<Leader>mp', '<Plug>MarkdownPreview', opt)
map("n", '<Leader>ms', '<Plug>MarkdownPreviewStop', opt)
map("n", '<Leader>mt', '<Plug>MarkdownPreviewToggle', opt)

-- setup mapping to call :LazyGit
map("n", "<leader>gg", ":LazyGit<CR>", opt)
