local vscode = require('vscode')
local colors = require('vscode.colors').get_colors()

vscode.setup({
  transparent = true,
  italic_comments = true,
  disable_nvimtree_bg = true,
  color_overrides = {
    vscLineNumber = '#FFFFFF',
  },
  group_overrides = {
    Cursor = {
      fg = colors.vscDarkBlue,
      bg = colors.vscLightGreen,
      bold = true
    }
  }
})

vscode.load()
