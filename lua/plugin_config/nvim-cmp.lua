local lspkind = require('lspkind')
local luasnip = require("luasnip")
local cmp = require('cmp')

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup {
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end
  },
  sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'luasnip' } },
    { { name = 'buffer' }, { name = 'path' } }),
  mapping = require 'keybindings'.cmp(cmp),
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 50,
      before = function(entry, vim_item)
        vim_item.menu = '[' .. string.upper(entry.source.name) .. ']'
        return vim_item
      end
    })
  }
}
cmp.setup.cmdline('/', {
  completion = { autocomplete = false },
  sources = { { name = 'buffer', opts = { keyword_pattern = [=[[^[:blank:]].*]=] } } }
})

cmp.setup.cmdline(':', {
  completion = { autocomplete = false },
  sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
})
