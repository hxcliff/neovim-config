vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- disable gf
map('n', 'gf', '<nop>', opt)

map('v', '<C-y>', '"+y', opt)
map('i', '<C-f>', '<Right>', opt)

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
map('n', ',t', ':Neotree toggle<CR>', opt)
map('n', ',o', ':Outline<CR>', opt)

map('n', '<A-h>', ':BufferLineCyclePrev<CR>', opt)
map('n', '<A-l>', ':BufferLineCycleNext<CR>', opt)
map('n', '<A-w>', ':lua require(\'bufdelete\').bufdelete(0, true)<CR>', opt)

map('n', 'gc', ':lua require(\'treesitter-context\').go_to_context()<CR>', opt)

local pluginKeys = {}

pluginKeys.cmp = function(cmp)
  local luasnip = require('luasnip')

  local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
  end

  return {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
  }
end

return pluginKeys
