vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

map('v', '<C-y>', '"+y', opt)

map('i', '<C-f>', '<Right>', opt)

map('n', '<leader>x', '<C-w>c', opt)

map('n', '<leader>t', '<C-w>T', opt)

map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)
map('v', 'J', ':move \'>+1<CR>gv-gv', opt)
map('v', 'K', ':move \'<-2<CR>gv-gv', opt)

map('n', '<leader>1', '1gt<ct>', opt)
map('n', '<leader>2', '2gt<ct>', opt)
map('n', '<leader>3', '3gt<ct>', opt)
map('n', '<leader>4', '4gt<ct>', opt)
map('n', '<leader>5', '5gt<ct>', opt)

map('n', '<leader>w', ':HopWord<CR>', opt)
map('n', '<leader>l', ':HopLine<CR>', opt)

-- map('n', '<leader>\\', ':Vista!!<CR>', {noremap = true})
-- map('n', '<leader>u', ':MundoToggle<CR>', opt)
-- map('n', '<leader>e', ':NvimTreeToggle<CR>', opt)

map('n', ',f', ':Telescope find_files<CR>', opt)
map('n', ',w', ':Telescope live_grep<CR>', opt)
map('n', ',b', ':Telescope buffers<CR>', opt)

map("n", "<A-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<A-w>", ":BufferLinePickClose<CR>", opt)

local pluginKeys = {}

pluginKeys.mapLSP = function(mapbuf)
  mapbuf('n', ',r', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  mapbuf('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  mapbuf('n', 'gk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  mapbuf('n', 'gj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  mapbuf('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', {noremap = true})
end

pluginKeys.cmp = function(cmp)
  local luasnip = require('luasnip')
  local t = function(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end
  return {
    ['<Tab>'] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_next_item({behavior = cmp.SelectBehavior.Insert})
        else
          cmp.complete()
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_next_item({behavior = cmp.SelectBehavior.Insert})
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end,
      s = function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end
    }),
    ['<S-Tab>'] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_prev_item({behavior = cmp.SelectBehavior.Insert})
        else
          cmp.complete()
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({behavior = cmp.SelectBehavior.Insert})
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
      s = function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end
    }),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
                             {'i', 'c'}),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
                           {'i', 'c'}),
    ['<C-e>'] = cmp.mapping({i = cmp.mapping.close(), c = cmp.mapping.close()}),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<CR>'] = cmp.mapping({
      i = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
      c = function(fallback)
        if cmp.visible() then
          cmp.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true})
        else
          fallback()
        end
      end
    })
  }
end

return pluginKeys
