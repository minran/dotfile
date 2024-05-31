-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local lspconfig = require('lspconfig')
local opts = { noremap = true, silent = true }
local keymap = vim.keymap
--require("lsp-format").setup {}
vim.lsp.set_log_level("trace")
keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  --require("lsp-format").on_attach(client)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
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
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

lspconfig['clangd'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

lspconfig['solidity'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

lspconfig['yamlls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

lspconfig['cssls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

lspconfig['lua_ls'].setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        },
      },
    },
  },
})

lspconfig['volar'].setup {
  filetypes = {'vue'},
  init_options = {
    vue = {
      hybridMode = false,
    },
    typescript = {
      tsdk = '/usr/local/lib/node_modules/typescript/lib'
      -- tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
    }
  },
  on_attach = on_attach,
  flags = lsp_flags,
}

lspconfig['tsserver'].setup {
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
}

lspconfig['eslint'].setup {
  -- autostart = false,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}
