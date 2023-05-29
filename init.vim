call plug#begin('~/.config/plugin')

" neovim 快速跳转插件
Plug 'Lokaltog/vim-easymotion'
" 替换插件 Leap.nvim
" 标签

" 改变包围结构
"Plug 'anyakichi/vim-surround'
" 注释插件
Plug 'scrooloose/nerdcommenter'
"Plug 'jparise/vim-graphql'
"Plug 'google/vim-colorscheme-primary'

" wiki
Plug 'vim<iki/vim>iki'
" calendar
Plug 'itchyny/calendar.vim'

call plug#end()

" need FiraCode font-family
lua << END
require('init')
END

