local bufferline = require('bufferline')

bufferline.setup({
  options = {
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
