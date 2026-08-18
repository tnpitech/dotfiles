require("mini.ai").setup({})
require("mini.move").setup({})
require("mini.cursorword").setup({})
require("mini.surround").setup({})
require("mini.indentscope").setup({})
require("mini.pairs").setup({})
require("mini.bufremove").setup({})
require("mini.tabline").setup()
require("mini.diff").setup({})
require("mini.git").setup({})
require("mini.files").setup({
	mappings = {
		go_in_plus = "<CR>",
	},
})

local starter = require("mini.starter")
starter.setup({
	header = require("ascii").nvimghost,
	footer = "",
	autoopen = true,
	evaluate_single = true,
	items = {
		{
			name = "f Find Files",
			action = function()
				require("fff").find_files()
			end,
			section = "Menu",
		},
		{
			name = "c Config Neovim",
			action = function()
				vim.cmd("edit" .. vim.fn.stdpath("config"))
			end,
			section = "Menu",
		},
		{
			name = "q Quit Neovim",
			action = "qa",
			section = "Menu",
		},
		starter.sections.recent_files(5, false, true),
	},
	content_hooks = {
		starter.gen_hook.adding_bullet("◦︎ ", true),
		starter.gen_hook.aligning("center", "center"),
	},
})

require("mini.statusline").setup({
	content = {
		active = function()
			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local filename = MiniStatusline.section_filename({ trunc_width = 140 })
			local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
			local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
			local location = function()
				if MiniStatusline.is_truncated(75) then
					return ""
				end
				return string.format("%d:%d", vim.fn.line("."), vim.fn.col("$") - 1)
			end
			return MiniStatusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
				"%<", -- Mark general truncate point
				{ hl = "MiniStatuslineFilename", strings = { filename } },
				"%=", -- End left alignment
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { search, location() } },
			})
		end,
	},
})
