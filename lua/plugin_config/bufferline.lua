local bufferline = require('bufferline')

bufferline.setup({
  highlights = require('nord.plugins.bufferline').akinsho(),
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
