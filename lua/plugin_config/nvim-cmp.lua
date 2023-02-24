local lspkind = require('lspkind')
local cmp = require('cmp')

local ultisnips = require('plugin_config/ultisnips')
ultisnips.setup()

cmp.setup {
  snippet = {expand = function(args) vim.fn['UltiSnips#Anon'](args.body) end},
  sources = cmp.config.sources({{name = 'nvim_lsp'}, {name = 'ultisnips'}},
                               {{name = 'buffer'}, {name = 'path'}}),
  mapping = require'keybindings'.cmp(cmp),
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
  completion = {autocomplete = false},
  sources = {{name = 'buffer', opts = {keyword_pattern = [=[[^[:blank:]].*]=]}}}
})

cmp.setup.cmdline(':', {
  completion = {autocomplete = false},
  sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

