vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },

	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate" },
	{ src = "https://github.com/stevearc/conform.nvim" },

	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/mrcjkb/rustaceanvim", version = vim.version.range("^9") },
	{ src = "https://github.com/dmtrKovalenko/fff.nvim" },

	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },

	{ src = "https://github.com/folke/snacks.nvim" },

	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },

	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/marekh19/meowsoot.nvim" },
	"https://github.com/nvim-tree/nvim-tree.lua",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/Aejkatappaja/cendre",
  "https://github.com/sponkurtus2/angelic.nvim",
  "https://github.com/Yazeed1s/minimal.nvim",
  "https://github.com/metalelf0/jellybeans-nvim",
  "https://github.com/ficd0/ashen.nvim",
  "https://github.com/mellow-theme/mellow.nvim",
})

-- Completion
require("plugins.blink-cmp")
require("plugins.conform")

-- Package manager
require("plugins.lsp.mason")
require("plugins.fff")

-- LSP
require("plugins.lsp.lspconfig")

-- Treesitter
require("plugins.treesitter")

require("plugins.mini")
require("plugins.snacks")

require("plugins.colorscheme")
require("plugins.nvim-web-devicons")
require("plugins.nvim-tree")
