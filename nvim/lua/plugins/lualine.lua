require("lualine").setup({
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'lsp_status', 'filetype' },
		lualine_y = { 'filesize' },
		lualine_z = { 'location' }
	},
  options = {
    component_separators = "|",
    section_separators = "",
  },
})
