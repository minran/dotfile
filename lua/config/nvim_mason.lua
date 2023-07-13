require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "yamlls", "cssls", "html", "lua_ls", "rust_analyzer", "volar", "tsserver", "solidity" },
  automatic_installation = true,
})
