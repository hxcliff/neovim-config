require('lazy').setup({
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        integrations = {
          blink_cmp = true,
          fidget = true,
          indent_blankline = {
            colored_indent_levels = true
          },
          mason = true,
          telescope = {
            enabled = true,
            style = 'nvchad'
          }
        }
      })
      vim.cmd.colorscheme('catppuccin-mocha')
    end
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
  {
    'm4xshen/autoclose.nvim',
    config = function()
      require('autoclose').setup({})
    end
  },
  'rafamadriz/friendly-snippets',
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp'
  },
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
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false
  },
  {
    'saecki/crates.nvim',
    tag = 'stable',
    event = { 'BufRead Cargo.toml' },
    config = function()
      require('crates').setup({
        lsp = {
          enabled = true,
          completion = true
        }
      })
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
  'williamboman/mason-lspconfig.nvim',
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'codecompanion' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }
  },
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter'
    }
  },
  'mfussenegger/nvim-jdtls'
})
