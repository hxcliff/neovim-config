local ibl = require('ibl')

ibl.setup({
  indent = {
    char = '▏',
    highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan"
    }
  },
  scope = {
    show_start = false,
    show_end = false
  },
  exclude = {
    filetypes = { 'help', 'git', 'markdown', 'snippets', 'text' },
    buftypes = { 'terminal' }
  }
})
