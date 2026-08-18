require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-s>"] = { "show", "hide" },
		["<CR>"] = { "accept", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
	},
	appearance = { nerd_font_variant = "mono" },
	completion = {
		menu = { auto_show = true },
		documentation = { auto_show = true },
	},
	sources = { default = { "lsp", "path", "buffer", "snippets" } },
	fuzzy = { implementation = "prefer_rust" },
})
