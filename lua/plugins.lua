return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'dracula/vim',
    as = 'dracula',
    config = function() vim.cmd [[colorscheme dracula]] end
  }
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  use 'arkav/lualine-lsp-progress'
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
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'
  use 'akinsho/flutter-tools.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'onsails/lspkind-nvim'
end)
