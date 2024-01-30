require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "yamlls", "cssls", "html", "lua_ls", "rust_analyzer", "volar", "tsserver", "solidity", "eslint" },
  automatic_installation = true,
})
