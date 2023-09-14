require('noice').setup({
  cmdline = {
    format = {
      cmdline = { icon = ':' },
      search_down = { icon = ' 󰁝' },
      search_up = { icon = ' 󰁅' },
      filter = { title = ' Command ', icon = '!' },
      lua = { icon = 'L' },
      help = { icon = '?' }
    }
  },
  views = {
    popup = {
      border = {
        style = 'single'
      }
    },
    hover = {
      border = {
        style = 'none'
      }
    },
    cmdline = {
      border = {
        style = 'none'
      }
    },
    mini = {
      border = {
        style = 'single'
      }
    },
    cmdline_popup = {
      border = {
        style = 'single'
      }
    },
    confirm = {
      border = {
        style = 'single'
      }
    }
  },
  lsp = {
    progress = {
      enabled = false
    },
    hover = {
      enabled = true,
    },
    signature = {
      enabled = true,
    },
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    }
  },
  smart_move = {
    enabled = false
  },
  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false
  }
})
