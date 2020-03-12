let g:python_host_prog = '/usr/bin/python'  " here if python --version show 3.0+ you should use let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'

set number
set encoding=UTF-8
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
" 默认选择第一个提示
set completeopt=menu,noinsert

set autoread " 自动加载选项

set expandtab
" if macunix{
  "开始折叠
  set foldenable
  "用缩进表示折叠
  set foldmethod=indent
  "打开文件是默认不折叠代码
  set foldlevelstart=99
  "zc      折叠
  "zC     对所在范围内所有嵌套的折叠点进行折叠
  "zo      展开折叠
  "zO     对所在范围内所有嵌套的折叠点展开
  "[z       到当前打开的折叠的开始处。
  "]z       到当前打开的折叠的末尾处。
  "zj       向下移动。到达下一个折叠的开始处。关闭的折叠也被计入。
  "zk      向上移动到前一折叠的结束处。关闭的折叠也被计入。
" }

set ruler                   " 打开状态栏标尺
syntax on                   " 自动语法高亮
set hlsearch                " 搜索时高亮显示被找到的文本
set showmatch
set cursorline              " 高亮当前行

set termguicolors
"colorscheme janah
colorscheme hopscotch
"colorscheme monokai

" tree
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" if map {

  let mapleader = ','
  " 清除搜索字符
  nmap <silent> <leader>/ :nohlsearch<CR>
  " 窗口切换
  "map <C-J> <C-W>j<C-W>_
  map <C-J> <C-W>j
  map <C-K> <C-W>k
  map <C-L> <C-W>l
"  map <C-H> <C-W>h
  
  " 标签页切换
  map <S-H> gT
  map <S-L> gt
  nmap <leader>v "+gp
  nmap <leader>c "+y
"}

call plug#begin('~/.config/plugin')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " 全局搜索插件 Ack'
  Plug 'wincent/ferret'
  " Typescript 高亮插件
  Plug 'leafgarland/typescript-vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'junegunn/fzf'
  Plug 'majutsushi/tagbar'
  " NerdTree
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'

  " airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'bling/vim-bufferline'

  " if jsx or React
  Plug 'sheerun/vim-polyglot'
  " neovim 快速跳转插件
  Plug 'Lokaltog/vim-easymotion'
  " 文件搜索
  Plug 'ctrlpvim/ctrlp.vim'
  " 标签
  Plug 'mattesgroeger/vim-bookmarks'
  " 启动页
  Plug 'mhinz/vim-startify'
  " git
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'airblade/vim-gitgutter'
  " 改变包围结构
  Plug 'anyakichi/vim-surround'
  Plug 'scrooloose/nerdcommenter'
  Plug 'jparise/vim-graphql'
  Plug 'wakatime/vim-wakatime'
call plug#end()

" Ack 快捷键
" Instead of <leader>a, use <leader>x.
nmap <leader>x <Plug>(FerretAck)
" Instead of <leader>s, use <leader>z.
nmap <leader>z <Plug>(FerretAckWord)

" if NerdTree {
  map <C-e> :NERDTreeToggle<CR>
  map <leader>e :NERDTreeFind<CR>
  nmap <leader>nt :NERDTreeFind<CR>
  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'
  " 显示隐藏文件
  let NERDTreeShowHidden=1
  " 显示书签列表
  let NERDTreeShowBookmarks=1

" if airline {
  let g:airline_theme='molokai'

  set laststatus=2  "永远显示状态栏
  let g:airline_powerline_fonts = 1  " 支持 powerline 字体
  let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''
"}

" if jsx {
  let g:jsx_ext_required = 0
  "autocmd BufNewFile,BufRead *.tsx  set filetype=typescript.tsx
  autocmd BufRead,BufNewFile *.tsx setlocal syntax=typescript.jsx
"}

" if ts | tsx {
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:yats_host_keyword = 1
"}

" if ctrlp {
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
"      \ --ignore .git
"      \ --ignore node_modules
"      \ --ignore .svn
"      \ --ignore .hg
"      \ --ignore .DS_Store
"      \ --ignore "**/*.pyc"
"      \ --ignore "**/*.swp"
"      \ --ignore "**/*.swo"
"      \ -g ""'
""}

"if Tagbar {
  nnoremap <silent> <leader>tt :TagbarToggle<CR>

  "let g:tagbar_ctags_bin = 'ctags'
  let g:tagbar_type_javascript = {
        \ 'ctagsbin': 'ctags',
        \ 'ctagstype': 'javascript',
        \ 'kinds': [
        \ 'a:arrays',
        \ 'p:properties',
        \ 't:tags',
        \ 'o:objects',
        \ 'g:generator functions',
        \ 'f:functions',
        \ 'c:constructors/classes',
        \ 'm:methods',
        \ 'v:variables',
        \ 'i:imports',
        \ 'e:exports',
        \ 's:styled components'
        \ ]}

  let g:tagbar_type_typescript = {
    \ 'ctagsbin': 'ctags',
    \ 'ctagstype': 'typescript',
    \ 'kinds': [
      \ 'c:classes',
      \ 'n:modules',
      \ 'f:functions',
      \ 'v:variables',
      \ 'v:varlambdas',
      \ 'm:members',
      \ 'i:interfaces',
      \ 'e:enums',
    \ ]
  \ }
"}

set hidden
"autocmd BufNewFile,BufRead *.ts set filetype=typescript
"au BufNewFile,BufRead *.tsx set filetype=typescript

let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'

"bookmark
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

au BufWritePost *.vim source $MYVIMRC | AirlineRefresh
au BufWritePost .vimrc source $MYVIMRC | AirlineRefresh

" if coc{
  " if hidden is not set, TextEdit might fail.
  set hidden

  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  " Better display for messages
  set cmdheight=2

  " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " always show signcolumns
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[c` and `]c` to navigate diagnostics
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add status line support, for integration with other plugin, checkout `:h coc-status`
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

