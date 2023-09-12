local dressing = require('dressing')
local themes = require('telescope.themes')

local dropdown = themes.get_dropdown()
dropdown.borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }

dressing.setup({
  input = {
    border = 'single'
  },
  select = {
    backend = { 'telescope' },
    telescope = dropdown
  }
})
