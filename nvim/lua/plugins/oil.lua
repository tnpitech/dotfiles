require("oil").setup({
  win_options = {
    signcolumn = "auto:2",
  },
  default_file_explorer = true,
  skip_confirm_for_simple_edits = true,
  view_options = { show_hidden = true },
  keymaps = {
    ["<Esc>"] = { "actions.close", mode = "n" },
    ["l"] = { "actions.select" },
    ["h"] = { "actions.parent", mode = "n" },
  }
})

require("oil-git-status").setup({
  show_ignored = true,
})

vim.keymap.set("n", "<C-n>", "<CMD>Oil<CR>", { desc = "Open parent directory" })
