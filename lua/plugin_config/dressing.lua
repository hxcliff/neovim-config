local dressing = require('dressing')

dressing.setup({
  input = {
    border = 'single'
  },
  select = {
    backend = { 'telescope' },
    telescope = {
      defaults = {
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }
      }
    }
  }
})
