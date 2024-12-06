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
    use_nvim_cmp_as_default = true,
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
  completion = {
    menu = {
      auto_show_delay_ms = 500,
      draw = {
        padding = { 1, 0 },
        columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind', gap = 1 } },
        components = {
          kind_icon = {
            ellipsis = false,
            width = { fill = true }
          },
          kind = {
            ellipsis = false,
            width = { fill = true }
          },
          label = {
            ellipsis = true,
            width = { max = 20 }
          },
          label_description = {
            ellipsis = true,
            width = { max = 15 }
          }
        }
      }
    },
    accept = { auto_brackets = { enabled = true } },
    signature = { enabled = true },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 250
    }
  }
})

require('luasnip.loaders.from_vscode').lazy_load()
