vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/akinsho/bufferline.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/refractalize/oil-git-status.nvim",
  "https://github.com/dmtrKovalenko/fff",
  -- "https://github.com/folke/tokyonight.nvim",
  -- "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/mrcjkb/rustaceanvim",
  "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
  "https://github.com/martindur/zdiff.nvim",
  "https://github.com/ernesxavier/biomes.nvim",
  "https://github.com/rafamadriz/friendly-snippets"
})

vim.cmd.colorscheme("biomes-end")
require("plugins.rustaceanvim")
require("plugins.tiny-diag")
require("plugins.oil")
require("plugins.fff")
require("plugins.lualine")
require("plugins.bufferline")
require("plugins.blink-cmp")
require("plugins.lsp.lsp-config")
require("plugins.lsp.mason")
require("plugins.mini")
