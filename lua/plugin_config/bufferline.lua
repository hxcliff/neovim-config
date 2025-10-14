local bufferline = require('bufferline')

bufferline.setup({
  highlights = require("catppuccin.special.bufferline").get_theme(),
  options = {
    separator_style = 'thin',
    close_command = 'Bdelete %d',
    right_mouse_command = 'Bdelete %d',
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'File Explorer',
        highlight = 'Directory',
        separator = true
      }
    }
  }
})
