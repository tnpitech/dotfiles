local snacks = require("snacks")
snacks.setup({
  terminal = {
    win = {
      style = "terminal",
    }
  },
})

vim.keymap.set({ "n", "v" }, "<leader>gg", function() snacks.lazygit() end, { desc = "LazyGit" })
vim.keymap.set({ "n", "t" }, "<C-t>", function() snacks.terminal.toggle() end, { desc = "Toggle terminal" })
