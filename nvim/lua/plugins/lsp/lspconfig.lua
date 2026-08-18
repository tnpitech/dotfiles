local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}

vim.diagnostic.config({
	virtual_text = { prefix = "", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		focusable = false,
		style = "minimal",
	},
})

do
	local orig = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded"
		return orig(contents, syntax, opts, ...)
	end
end

local function lsp_on_attach(ev)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if not client then
		return
	end

	local bufnr = ev.buf
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	if client:supports_method("textDocument/codeAction", bufnr) then
		vim.keymap.set("n", "<leader>oi", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
				bufnr = bufnr,
			})
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50)
		end, opts)
	end
end

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", { group = augroup, callback = lsp_on_attach })

vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "MiniStatusline", "hl" },
			},
			completion = { callSnippet = "Replace" },
		},
	},
})

vim.lsp.config("gopls", {
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				ST1000 = false,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})

vim.lsp.config("emmet_language_server", {
	filetypes = {
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"typescriptreact",
	},
	init_options = {
		includeLanguages = {},
		excludeLanguages = {},
		extensionsPath = {},
		preferences = {},
		showAbbreviationSuggestions = true,
		showExpandedAbbreviation = "always",
		showSuggestionsAsSnippets = false,
		syntaxProfiles = {},
		variables = {},
	},
})

-- emmet_ls
vim.lsp.config("emmet_ls", {
	filetypes = {
		"astro",
		"html",
		"typescriptreact",
		"javascriptreact",
		"css",
		"sass",
		"scss",
		"less",
		"svelte",
	},
})

-- ts_ls (TypeScript/JavaScript)
vim.lsp.config("ts_ls", {
	workspace_required = false,
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	single_file_support = true,
	init_options = {
		preferences = {
			includeCompletionsForModuleExports = true,
			includeCompletionsForImportStatements = true,
		},
	},
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayVariableTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "none",
				includeInlayVariableTypeHints = false,
				includeInlayFunctionParameterTypeHints = false,
			},
		},
	},
})

vim.lsp.config("cssls", {
	filetypes = { "css", "scss", "less" },
	init_options = { provideFormatter = true },
	single_file_support = true,
	settings = {
		css = {
			lint = {
				unknownAtRules = "ignore",
			},
			validate = true,
		},
		scss = {
			lint = {
				unknownAtRules = "ignore",
			},
			validate = true,
		},
		less = {
			lint = {
				unknownAtRules = "ignore",
			},
			validate = true,
		},
	},
})

vim.lsp.config("tailwindcss", {
	filetypes = {
		"html",
		"css",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"svelte",
		"vue",
		"astro",
	},
	init_options = {
		userLanguages = {
			astro = "html",
		},
	},
})

vim.lsp.enable({
	"lua_ls",
	"gopls",
	"ts_ls",
	"emmet_language_server",
	"emmet_ls",
	"tailwindcss",
	"rust_analyzer",
	"prismals",
  "pylsp",
})
