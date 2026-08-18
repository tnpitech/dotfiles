local trans = false
vim.g.oh_lucy_transparent_background = trans
require("meowsoot").setup({ transparent = trans })
require("tokyonight").setup({
	transparent = trans,
})
require("kanagawa").setup({
	transparent = trans,
	colors = {
		palette = {
			waveAqua2 = "#dcd7ba",
		},
	},
	overrides = function(colors)
		local theme = colors.theme
		return {
			NormalFloat = { bg = "none" },
			FloatBorder = { bg = "none" },
			FloatTitle = { bg = "none" },

			-- Current line number
			LineNr = { bg = theme.ui.bg },
			SignColumn = { bg = theme.ui.bg },
			CursorLineSign = { bg = theme.ui.bg_p1 },
			-- Completion to darker
			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
			PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = theme.ui.bg_p2 },
		}
	end,
})
