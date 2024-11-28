local lspkind = require('lspkind')
local luasnip = require('luasnip')
local cmp = require('cmp')
local luasnip_vscode = require('luasnip.loaders.from_vscode')

cmp.setup({
  enabled = function()
    local context = require 'cmp.config.context'
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
    end
  end,
  completion = {
    completeopt = 'menu,menuone',
  },
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'crates' }
  }, {
    { name = 'buffer' },
    { name = 'path' }
  }),
  mapping = require('keybindings').cmp(cmp),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      with_text = true,
      maxwidth = 50,
      before = function(entry, item)
        item.menu = '[' .. string.upper(entry.source.name) .. ']'
        return item
      end
    })
  }
})

cmp.setup.cmdline({ '/', '?' }, {
  completion = { autocomplete = false, completeopt = 'menu,menuone,preview' },
  sources = {
    {
      name = 'buffer',
      option = {
        keyword_pattern = [=[[^[:blank:]].*]=]
      }
    }
  }
})

cmp.setup.cmdline(':', {
  completion = { autocomplete = false, completeopt = 'menu,menuone,preview' },
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

luasnip_vscode.lazy_load()
