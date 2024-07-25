local telescope = require('telescope')

telescope.setup({
  pickers = {
    find_files = {
      find_command = { 'fdfind', '--no-require-git' }
    },
    live_grep = {
      additional_args = function() return { '--no-require-git' } end
    }
  },
  defaults = {
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }
  }
})

telescope.load_extension('ui-select')
