require('competitest').setup() 

local keymap = vim.keymap
local opts = { noremap=true, silent=true }
local api = vim.api

function Delete()
    api.nvim_command(':! rm -f ./%< && rm -f ./%<_*.txt')
    require("notify")("󰆴 Test Samples Delete completed")
end

api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "cpp",
    callback = function()
      local data = {
        buf = vim.fn.expand("<abuf>"),
        file = vim.fn.expand("<afile>"),
        match = vim.fn.expand("<amatch>"),
        file_name = vim.fn.expand("%<"),
      }
      vim.schedule(function ()
        print(vim.inspect(data))
      end)
      keymap.set('n', 'rr', ':CompetiTestRun<CR>', opts)
      keymap.set('n', 'ra', ':CompetiTestAdd<CR>', opts)
      keymap.set('n', 're', ':CompetiTestEdit<CR>', opts)
      keymap.set('n', 'ri', ':CompetiTestReceive testcases<CR>', opts)
      keymap.set('n', 'rd', ':CompetiTestDelete<CR>', opts)
      keymap.set('n', 'rm', Delete, opts)
    end
  }
)
