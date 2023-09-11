local lspkind = require('lspkind')
local luasnip = require("luasnip")
local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup {
  completion = {
    completeopt = 'menu,menuone,noinsert',
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
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find("^_+")
        local _, entry2_under = entry2.completion_item.label:find("^_+")
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0

        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
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
  mapping = require 'keybindings'.cmp(cmp),
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
}
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
