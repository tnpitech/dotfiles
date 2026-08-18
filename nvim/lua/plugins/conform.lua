require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports" },
		javascript = { "prettier", stop_after_first = true },
		typescript = { "prettier", stop_after_first = true },
		html = { "prettier" },
		css = { "prettier" },
	},
	-- format_on_save = {
	-- 	timeout_ms = 500,
	-- 	lsp_fallback = true,
	-- },
})
