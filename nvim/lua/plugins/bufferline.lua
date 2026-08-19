require("bufferline").setup({
  options = {
    mode = "buffers",
    diagnostics = "nvim_lsp",
    separator_style = "thick", -- "slant", "thick", "padded_slash"
    show_buffer_close_icons = true,
    show_close_icon = false,
    always_show_bufferline = false,
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", text_align = "center" },
    },
  },
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<C-q>", "<Cmd>bdelete<CR>", { desc = "Close buffer" })
