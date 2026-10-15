vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "H", "^", { desc = "move to start of line" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "move to end of line" })
vim.keymap.set("n", "<C-m>", "gcc", { desc = "toggle comment current line", remap = true, silent = true })
vim.keymap.set("v", "<C-m>", "gc", { desc = "toggle comment current line", remap = true, silent = true })
vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, { desc = "Format current buffer" })
vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], { desc = "Exit terminal mode", remap = true })
