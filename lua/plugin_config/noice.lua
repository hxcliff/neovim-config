require('noice').setup({
  cmdline = {
    format = {
      cmdline = { icon = ':' },
      search_down = { icon = ' 󰁝' },
      search_up = { icon = ' 󰁅' },
      -- filter = { icon = '!' },
      lua = { icon = '󰢱' },
      help = { icon = '󰋖' },
    },
  },
  views = {
    popupmenu = {
      border = { style = 'single' },
    }
  },
  lsp = {
    progress = {
      enabled = false
    },
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = true
  }
})
