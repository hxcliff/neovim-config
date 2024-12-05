require('lazy').setup({
  {
    'gbprod/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nord').setup({})
      vim.cmd.colorscheme('nord')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  'nvim-treesitter/nvim-treesitter-textobjects',
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({})
    end
  },
  'folke/flash.nvim',
  {
    'PHSix/faster.nvim',
    event = { 'VimEnter *' },
    config = function()
      vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_j)', { noremap = false, silent = true })
      vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_k)', { noremap = false, silent = true })
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = 'nvim-lua/plenary.nvim'
  },
  'nvim-telescope/telescope-ui-select.nvim',
  'neovim/nvim-lspconfig',
  {
    'saghen/blink.cmp',
    lazy = false,
    version = 'v0.*'
  },
  'rafamadriz/friendly-snippets',
  {
    'L3MON4D3/LuaSnip',
    version = "v2.*",
    build = "make install_jsregexp"
  },
  'onsails/lspkind-nvim',
  {
    'zbirenbaum/neodim',
    event = 'LspAttach'
  },
  {
    'j-hui/fidget.nvim'
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl'
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    branch = 'main',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  'famiu/bufdelete.nvim',
  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      require('crates').setup({})
    end
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    }
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({})
    end
  },
  'stevearc/conform.nvim',
  {
    'DNLHC/glance.nvim',
    cmd = 'Glance',
    config = function()
      require('glance').setup({
        height = 25,
        detached = false,
        preview_win_opts = {
          number = false
        }
      })
    end
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async'
  },
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim'
})
