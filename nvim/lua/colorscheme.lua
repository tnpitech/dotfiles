require("kanagawa").setup({
  colors = {
    palette = {
      waveAqua2 = "#dcd7ba",
    },
  },
  overrides = function(colors)
    local theme = colors.theme
    return {
      NormalFloat = { bg = "none" },
      FloatBorder = { bg = "none" },
      FloatTitle = { bg = "none" },
      LineNr = { bg = theme.ui.bg },
      SignColumn = { bg = theme.ui.bg },
      CursorLineSign = { bg = theme.ui.bg_p1 },
      Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
      PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
      PmenuSbar = { bg = theme.ui.bg_m1 },
      PmenuThumb = { bg = theme.ui.bg_p2 },
    }
  end,
})
require("tokyonight").setup()
require("cyberdream").setup()
