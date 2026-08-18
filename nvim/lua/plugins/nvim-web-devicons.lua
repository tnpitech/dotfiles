require("nvim-web-devicons").setup({
	override = {
		go = {
			icon = "󰟓",
			color = "#2596be",
			name = "Go",
		},
		lua = {
			icon = "",
			name = "Lua",
		},
		css = {
			icon = "",
			color = "#53CBF3",
			name = "Css",
		},
	},
	override_by_filename = {
		["go.mod"] = {
			icon = "󰟓",
			color = "#FF4081",
			cterm_color = "38",
			name = "GoMod",
		},
		["go.sum"] = {
			icon = "󰟓",
			color = "#FF4081",
			cterm_color = "38",
			name = "GoSum",
		},
		["makefile"] = {
			icon = "",
			color = "#6D8086",
			cterm_color = "66",
			name = "Makefile",
		},
	},
	color_icons = true,
	default = true,
})
