require("mini.ai").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.git").setup()
require("mini.diff").setup({
  view = {
    style = "sign",
    signs = { add = "┃", change = "┃", delete = "┃" }
  },
})
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
