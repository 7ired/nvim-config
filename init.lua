local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('jiangmiao/auto-pairs')		   -- Matching brackets
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug('hkupty/iron.nvim')		   -- Send to REPL
Plug('preservim/nerdtree')   		   -- File explorer
Plug('/tpope/vim-commentary')		   -- Comment out
Plug('girishji/pythondoc.vim') 		   -- Python docs
Plug('folke/which-key.nvim')		   -- Which key?
Plug('vim-airline/vim-airline') 	   -- Status bar
Plug('ryanoasis/vim-devicons')		   -- Tree icons
Plug 'srcery-colors/srcery-vim' 	   -- Srcery theme
Plug 'arcticicestudio/nord-vim' 	   -- Nord theme
-- LSP and autocompletion plugins
Plug 'neovim/nvim-lspconfig'               -- Collection of LSP configs
Plug 'hrsh7th/nvim-cmp'                    -- Completion plugin
Plug 'hrsh7th/cmp-nvim-lsp'                -- LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'                  -- Buffer completions
Plug 'hrsh7th/cmp-path'                    -- Path completions

-- Snippet support
Plug 'L3MON4D3/LuaSnip'                    -- Snippet engine
Plug 'saadparwaiz1/cmp_luasnip'            -- Snippet completions

-- Python-specific linting and formatting
Plug 'psf/black'                           -- Code formatter
Plug 'dense-analysis/ale'                  -- Linting plugin

vim.call('plug#end')

-- Set language to English
vim.cmd("language en_US")

-- Set leader key to Space
vim.g.mapleader = ' '

-- Yank to clipboard
vim.api.nvim_set_option("clipboard", "unnamed")

-- NERDTree toggle mapping
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- remove trailing whitespaces
vim.api.nvim_set_keymap('n', '<leader>tr', '::%s/\\s\\+$//e<CR>', {noremap = true, silent = true})

-- Add file to Harpoon
vim.api.nvim_set_keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = true })

-- Toggle Harpoon menu
vim.api.nvim_set_keymap("n", "<leader>m", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true })

-- Navigate to files
vim.api.nvim_set_keymap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true, silent = true })

-- Line numbers
vim.wo.relativenumber = true
vim.wo.number = true  -- This enables absolute line numbers in addition to relative ones

-- Line too long
vim.g.ale_python_black_args = '--line-length 100'
vim.g.ale_python_flake8_options = '--max-line-length=100'

-- Requires
require('plugins.iron')
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

-- nvim-cmp setup for autocompletion
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
})

-- theme
vim.cmd('colorscheme nord')
