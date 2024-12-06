local luasnip = require('luasnip')
local cmp = require('blink.cmp')

cmp.setup({
  keymap = {
    ['<A-k>'] = { 'select_prev', 'fallback' },
    ['<A-j>'] = { 'select_next', 'fallback' },
    ['<C-k>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-j>'] = { 'scroll_documentation_down', 'fallback' },
    ['<A-space>'] = { 'select_and_accept' },
    ['<Tab>'] = { 'snippet_forward', 'fallback' },
    ['<S-Tab>'] = { 'snippet_backward', 'fallback' }
  },
  appearance = {
    nerd_font_variant = 'mono'
  },
  snippets = {
    expand = function(snippet) luasnip.lsp_expand(snippet) end,
    active = function(filter)
      if filter and filter.direction then
        return luasnip.jumpable(filter.direction)
      end
      return luasnip.in_snippet()
    end,
    jump = function(direction) luasnip.jump(direction) end,
  },
  sources = {
    completion = {
      enabled_providers = { 'lsp', 'path', 'luasnip', 'buffer' }
    }
  },
  signature = {
    enabled = true
  },
  completion = {
    accept = {
      auto_brackets = {
        enabled = true
      }
    },
    menu = {
      draw = {
        treesitter = true,
        padding = { 1, 1 },
        columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind', gap = 1 } },
        components = {
          kind = {
            width = { fill = true }
          },
          label = {
            width = { max = 20 }
          },
          label_description = {
            width = { max = 15 }
          }
        }
      }
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 50
    }
  }
})

require('luasnip.loaders.from_vscode').lazy_load()
