local ibl = require('ibl')

ibl.setup({
  indent = {
    char = '▏'
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
