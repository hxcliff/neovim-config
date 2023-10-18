local lspkind = require('lspkind')
local luasnip = require("luasnip")
local cmp = require('cmp')
local luasnip_vscode = require('luasnip.loaders.from_vscode')

cmp.setup({
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = 'menu,menuone,noselect',
  },
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end
  },
  matching = {
    disallow_fuzzy_matching = false,
    disallow_fullfuzzy_matching = false,
    disallow_partial_fuzzy_matching = false,
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = "crates" }
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
  completion = { autocomplete = false, completeopt = "menu,menuone,noinsert,preview" },
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
  completion = { autocomplete = false, completeopt = "menu,menuone,noinsert,preview" },
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

luasnip_vscode.lazy_load()
