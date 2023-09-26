local winbar = require('winbar')

winbar.setup({
  enabled = true,

  show_file_path = true,
  show_symbols = true,

  colors = {
    path = '',
    file_name = '',
    symbols = '',
  },

  icons = {
    file_icon_default = '',
    seperator = '>',
    editor_state = '●',
    lock_icon = '',
  },

  exclude_filetype = {
    'neo-tree',
    'help',
    'startify',
    'dashboard',
    'neogitstatus',
    'NvimTree',
    'Trouble',
    'alpha',
    'lir',
    'Outline',
    'spectre_panel',
    'toggleterm',
    'qf',
  }
})
