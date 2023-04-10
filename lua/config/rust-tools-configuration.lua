local rt = require("rust-tools")
local keymap = vim.keymap
local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.8.1'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
      keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
      keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    end,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(
    codelldb_path, liblldb_path)
  }
}
rt.setup(opts)
