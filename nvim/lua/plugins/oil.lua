require("oil").setup({
				default_file_explorer = true,
        skip_confirm_for_simple_edits = true,
				keymaps = {
								["<Esc>"] = { "actions.close", mode = "n" },
								["l"] = { "actions.select" },
								["h"] = { "actions.parent", mode =  "n" },
				}
})

vim.keymap.set("n", "<C-n>", "<CMD>Oil<CR>", { desc = "Open parent directory" })
