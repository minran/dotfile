require("mason").setup()
require("mason-lspconfig").setup({
   ensure_installed = { "yamlls", "rust_analyzer", "volar", "tsserver", "solidity" }
})
