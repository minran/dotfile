require("mason").setup()
require("mason-lspconfig").setup({
   ensure_installed = { "yamlls", "sumneko_lua", "rust_analyzer", "volar", "tsserver", "solidity" }
})
