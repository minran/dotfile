require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "yamlls",
    "cssls",
    "html",
    "lua_ls",
    "rust_analyzer",
    "volar",
    "ts_ls",
    "solidity",
    "eslint",
    "tailwindcss",
  },
  automatic_installation = true,
})
