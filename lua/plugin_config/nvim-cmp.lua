local lspkind = require('lspkind')
local luasnip = require('luasnip')
local cmp = require('cmp')
local luasnip_vscode = require('luasnip.loaders.from_vscode')

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end
  },
  sorting = {
    comparators = {
      cmp.config.compare.sort_text,
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.kind,
      cmp.config.compare.length,
      cmp.config.compare.order,
    }
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'crates' }
  }, {
    { name = 'buffer' }
  }),
  mapping = require('keybindings').cmp(cmp),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      with_text = true,
      maxwidth = 80,
      before = function(entry, item)
        item.menu = '[' .. string.upper(entry.source.name) .. ']'
        return item
      end
    })
  }
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  })
})

-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })

luasnip_vscode.lazy_load()
