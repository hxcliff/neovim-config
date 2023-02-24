return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'dracula/vim',
    as = 'dracula',
    config = function() vim.cmd [[colorscheme dracula]] end
  }
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update {with_sync = true} end
  }
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function() require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'} end
  }
  use {
    'PHSix/faster.nvim',
    event = {'VimEnter *'},
    config = function()
      vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_j)', {noremap = false, silent = true})
      vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_k)', {noremap = false, silent = true})
    end
  }
  use 'simnalamburt/vim-mundo'
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use {'SirVer/ultisnips', requires = {{'honza/vim-snippets', rtp = '.'}}}
  use 'onsails/lspkind-nvim'
  -- use 'liuchengxu/vista.vim'
  use {'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}, tag = 'nightly'}
  use 'rcarriga/nvim-notify'
end)
