vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

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

map('n', ',f', ':Telescope find_files<CR>', opt)
map('n', ',w', ':Telescope live_grep<CR>', opt)
map('n', ',b', ':Telescope buffers<CR>', opt)
map('n', ',t', ':ToggleTerm<CR>', opt)

map("n", "<A-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<A-w>", ":BufferLinePickClose<CR>", opt)

local pluginKeys = {}

pluginKeys.cmp = function(cmp)
  local luasnip = require('luasnip')

  return {
    ['<Tab>'] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        else
          cmp.complete()
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
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
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
        else
          cmp.complete()
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
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
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i', 'c' }),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<CR>'] = cmp.mapping({
      i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      c = function(fallback)
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        else
          fallback()
        end
      end
    })
  }
end

return pluginKeys
