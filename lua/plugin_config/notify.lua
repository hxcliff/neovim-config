local notify = require('notify')

notify.setup({
  on_open = function(win)
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_set_config(win, { border = 'single' })
    end
  end
})
