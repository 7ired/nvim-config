local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('jiangmiao/auto-pairs')
Plug('hkupty/iron.nvim')
Plug('preservim/nerdtree')
Plug('girishji/pythondoc.vim')
Plug('folke/which-key.nvim')
Plug('vim-airline/vim-airline')
Plug('ryanoasis/vim-devicons')
Plug 'srcery-colors/srcery-vim'
Plug 'arcticicestudio/nord-vim'

vim.call('plug#end')

-- Set leader key to Space
vim.g.mapleader = ' '

-- Yank to clipboard
vim.api.nvim_set_option("clipboard", "unnamed")

-- NERDTree toggle mapping
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- Line numbers
vim.wo.relativenumber = true
vim.wo.number = true  -- This enables absolute line numbers in addition to relative ones

-- Requires
require('plugins.iron')

-- theme
vim.cmd('colorscheme nord')
