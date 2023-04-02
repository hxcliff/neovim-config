local telescope = require('telescope')

telescope.setup({
  pickers = {
    find_files = {
      find_command = { "fd", "--hidden", "--no-require-git" }
    },
    live_grep = {
      additional_args = function() return { "--hidden", "--no-require-git" } end
    }
  },
  defaults = {
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'}
  }
})
