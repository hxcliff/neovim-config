local telescope = require('telescope')

telescope.setup({
  pickers = {
    find_files = {
      find_command = { 'fd', '--no-require-git' }
    },
    live_grep = {
      additional_args = function() return { '--no-require-git' } end
    }
  }
})

telescope.load_extension('ui-select')
