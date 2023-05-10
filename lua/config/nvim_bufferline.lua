local status, bufferline = pcall(require, "bufferline")
if not status then
  vim.notify("没有找到 bufferline")
  return
end
vim.opt.termguicolors = true
-- bfferline 配置
bufferline.setup({
  options = {
    indicator = {
      style = 'icon',
      icon = "▎",
    },
    --buffer_close_icon = "",
    buffer_close_icon = '',
    -- buffer_close_icon = '',
    modified_icon = "●",
    close_icon = '',
    -- buffer_close_icon = '',
    -- close_icon = '',
    left_trunc_marker = " ",
    right_trunc_marker = " ",
    -- 关闭 Tab 的命令
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    -- 侧边栏配置
    -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    -- 使用 nvim 内置 LSP  后续课程会配置
    diagnostics = "nvim_lsp",
    -- 可选，显示 LSP 报错图标
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
  },
})
