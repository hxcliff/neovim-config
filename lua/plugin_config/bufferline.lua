local bufferline = require('bufferline')
local mocha = require('catppuccin.palettes').get_palette('mocha')

bufferline.setup({
  highlights = require('catppuccin.groups.integrations.bufferline').get({
    styles = { 'italic', 'bold' },
    custom = {
      all = {
        fill = { bg = '#000000' },
      },
      mocha = {
        background = { fg = mocha.text },
      },
      latte = {
        background = { fg = '#000000' },
      },
    },
  }),
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
