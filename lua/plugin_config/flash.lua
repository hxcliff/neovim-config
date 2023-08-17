local flash = require('flash')
flash.setup({})

vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
  flash.jump({
    search = {
      mode = function(str)
        return '\\<' .. str
      end
    }
  })
end)

vim.keymap.set({ 'n', 'x', 'o' }, 'S', function()
  flash.treesitter()
end)

vim.keymap.set({ 'o' }, 'r', function()
  flash.remote()
end)

vim.keymap.set({ 'o', 'x' }, 'R', function()
  flash.treesitter_search()
end)
