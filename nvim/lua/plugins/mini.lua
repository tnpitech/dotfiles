require("mini.surround").setup()
require("mini.pairs").setup()
local header_art =
[[
d888888b d8b   db d8888b. d888888b d888888b d88888b  .o88b. db   db
`~~88~~' 888o  88 88  `8D   `88'   `~~88~~' 88'     d8P  Y8 88   88
   88    88V8o 88 88oodD'    88       88    88ooooo 8P      88ooo88
   88    88 V8o88 88~~~      88       88    88~~~~~ 8b      88~~~88
   88    88  V888 88        .88.      88    88.     Y8b  d8 88   88
   YP    VP   V8P 88      Y888888P    YP    Y88888P  `Y88P' YP   YP
]]

local starter = require("mini.starter")
starter.setup({
  header = header_art,
  footer = "",
  evaluate_single = true,
  items = {
    { name = "f Find file", action = "FFFFind",                                                   section = "Actions" },
    { name = "r Recent",    action = "lua require('fff').find_files({ sort_by_recency = true })", section = "Action" },
    { name = "e Explorer",  action = "Oil",                                                       section = "Actions" },
    { name = "q Quit",      action = "qa",                                                        section = "Actions" },
  },
  content_hooks = {
    starter.gen_hook.aligning("center", "center"),
  },
})
