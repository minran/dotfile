let mapleader = ','
set nobackup "表示不需要备份文件
set noswapfile "表示不创建临时交换文件
set nowritebackup "表示编辑的时候不需要备份文件
set noundofile "表示不创建撤销文件
call plug#begin('~/.config/plugin')

" 全局搜索插件 Ack'
Plug 'wincent/ferret'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"lualine
"Plug 'nvim-lualine/lualine.nvim'

" neovim 快速跳转插件
Plug 'Lokaltog/vim-easymotion'
" 替换插件 Leap.nvim
" 标签
Plug 'mattesgroeger/vim-bookmarks'
" 启动页
" git
"Plug 'tpope/vim-fugitive'
"Plug 'junegunn/gv.vim'
"Plug 'airblade/vim-gitgutter'
" 改变包围结构
Plug 'anyakichi/vim-surround'
" 注释插件
Plug 'scrooloose/nerdcommenter'
"Plug 'jparise/vim-graphql'
"Plug 'google/vim-colorscheme-primary'

" wiki
Plug 'vimwiki/vimwiki'
" calendar
Plug 'itchyny/calendar.vim'

call plug#end()

" Ack 快捷键
" Instead of <leader>a, use <leader>x.
nmap <leader>x <Plug>(FerretAck)
" Instead of <leader>s, use <leader>z.
nmap <leader>z <Plug>(FerretAckWord)

" 搜索文件
nnoremap <silent> <c-p> :Files <CR>
"}

"if vimwiki {
let g:vimwiki_listsyms = '✗○◐●✓'
"endif

"bookmark
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

" calendar
nmap <leader>ca :Calendar<cr>
autocmd FileType calendar nmap <buffer> <CR> :<C-u>call vimwiki#diary#calendar_action(b:calendar.day().get_day(), b:calendar.day().get_month(), b:calendar.day().get_year(), b:calendar.day().week(),"V")<CR>
let g:rustfmt_autosave = 1
let g:rust_cargo_use_clippy = 1
" need FiraCode font-family
lua << END
require('init')
END

