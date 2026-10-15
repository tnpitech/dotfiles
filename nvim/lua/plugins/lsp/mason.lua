require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls" },
  automatic_enable = {
    exclude = { "rust_analyzer" },
  },
})
