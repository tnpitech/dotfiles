local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup({
  keymap = {
    preset = "none",

    ["<C-j>"] = { "select_next", "fallback" },
    ["<C-k>"] = { "select_prev", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = { "accept", "fallback" },
    ["<C-e>"] = { "cancel", "fallback" },
  },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
