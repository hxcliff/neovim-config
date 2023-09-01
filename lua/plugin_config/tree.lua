local neo_tree = require('neo-tree')

neo_tree.setup({
  close_if_last_window = true,
  popup_border_style = 'single',
  window = {
    position = 'left',
    width = 40
  },
  filesystem = {
    follow_current_file = {
      enabled = true
    }
  }
})
