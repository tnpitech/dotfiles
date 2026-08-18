vim.g.mapleader = " "

-- [ Global ]
vim.keymap.set("n", "<Esc>", ":q<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "H", "^", { desc = "move to start of line" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "move to end of line" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "exit insert mode on terminal" })
vim.keymap.set("n", "<C-M>", "gcc", { desc = "toggle comment current line", remap = true, silent = true })
vim.keymap.set("v", "<C-M>", "gc", { desc = "toggle comment current line", remap = true, silent = true })

-- [ Conform ]
vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format whole file or range (in visual mode) with" })

-- [ fff.nvim ]
vim.keymap.set("n", "ff", function()
	require("fff").find_files()
end, { desc = "FFFind files" })

-- [ Mini.nvim ]
-- buffer
vim.keymap.set("n", "<C-q>", function()
	require("mini.bufremove").delete(0, false)
end)
vim.keymap.set("n", "<Tab>", "<Cmd>bnext<CR>", { desc = "go to next buffer" })
vim.keymap.set("n", "<S-Tab>", "<Cmd>bprevious<CR>", { desc = "go to previous buffer" })
-- files
-- vim.keymap.set("n", "<C-n>", function()
-- 	local tree = require("nvim-tree.api").tree
--   tree.toggle({})
-- end)
vim.keymap.set("n", "<C-n>", function()
	local minifiles = require("mini.files")
	if not minifiles.close() then
		minifiles.open()
	end
end)
-- starter
vim.api.nvim_create_autocmd("User", {
	pattern = "MiniStarterOpened",
	callback = function(ev)
		local ministarter = require("mini.starter")
		-- delete move default key
		vim.keymap.del("n", "<C-n>", { buffer = ev.buf })
		vim.keymap.del("n", "<C-p>", { buffer = ev.buf })
		-- use Ctrl + k/j to move instead
		vim.keymap.set("n", "<C-k>", function()
			ministarter.update_current_item("prev")
		end, { buffer = true })
		vim.keymap.set("n", "<C-j>", function()
			ministarter.update_current_item("next")
		end, { buffer = true })
	end,
})
-- [ snacks.nvim ]
vim.keymap.set({ "n", "v" }, "<leader>gg", function()
	require("snacks").lazygit()
end, { desc = "Lazygit" })
