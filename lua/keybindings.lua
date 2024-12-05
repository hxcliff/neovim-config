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
