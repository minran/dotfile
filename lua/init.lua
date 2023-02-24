require("plugins")
require("plugin_config")
require('keybinding')

vim.cmd[[colorscheme onelight]]
--vim.cmd[[colorscheme tokyonight]]
--vim.cmd[[colorscheme monokai]]

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

local set = vim.opt

set.hidden = true
set.number = true
set.encoding="UTF-8"
set.tabstop=2
set.softtabstop=2
set.shiftwidth=2
set.autoindent = true --自动缩进
set.copyindent = true --复制保持原来的缩进
set.smartindent = true
set.expandtab = true
-- if macunix{
-- 开始折叠
set.foldenable = true;
-- 用缩进表示折叠
set.foldmethod="indent"
-- 打开文件是默认不折叠代码
set.foldlevelstart=99
--zc      折叠
--zC     对所在范围内所有嵌套的折叠点进行折叠
--zo      展开折叠
--zO     对所在范围内所有嵌套的折叠点展开
--[z       到当前打开的折叠的开始处。
--]z       到当前打开的折叠的末尾处。
--zj       向下移动。到达下一个折叠的开始处。关闭的折叠也被计入。
--zk      向上移动到前一折叠的结束处。关闭的折叠也被计入。
-- }

set.ruler = true               -- 打开状态栏标尺
set.hlsearch = true            -- 搜索时高亮显示被找到的文本
--set.showmatch = true
set.cursorline = true          -- 高亮当前行
set.backup = true 		         -- 不创建备份文件			
set.infercase = true           -- 区分大小写


-- set.background="dark" -- 黑色
set.background="light" -- 白色


