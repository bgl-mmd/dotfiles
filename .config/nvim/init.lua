vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- copy paste from system clipboard
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')

-- change default remove register
vim.keymap.set({'n', 'x'}, 'x', '"_x')

-- select all
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- lazy.nvim plugin manager
local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  -- You can "comment out" the line below after lazy.nvim is installed
  -- lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
  {'folke/tokyonight.nvim'},
  {'tjdevries/colorbuddy.nvim'},
  {'svrana/neosolarized.nvim'},
  {'nvim-lualine/lualine.nvim'},
  {'ryanoasis/vim-devicons'},

  {'scrooloose/nerdtree'},
  {'tpope/vim-fugitive'},
  {'airblade/vim-gitgutter'},
  {'nvim-telescope/telescope.nvim', tag = '0.1.1', dependencies = { 'nvim-lua/plenary.nvim' } },
  {'neovim/nvim-lspconfig'},

  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-vsnip'},
  {'hrsh7th/vim-vsnip'},

  {'hrsh7th/vim-vsnip'},

  {"rebelot/kanagawa.nvim"},  -- neorg needs a colorscheme with treesitter support
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  }
})

vim.opt.termguicolors = true
-- require('neosolarized').setup({
--   comment_italics = true,
--   background_set = true,
-- })

require('lualine').setup({
  options = {
    icons_enabled = false,
    section_separators = '',
    component_separators = '',
  }
})

vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

-- local augroup = vim.api.nvim_create_augroup('user_cmds', {clear = true})
-- 
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = {'help', 'man'},
--   group = augroup,
--   desc = 'Use q to close the window',
--   command = 'nnoremap <buffer> q <cmd>quit<cr>'
-- })
-- 
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   group = augroup,
--   desc = 'Highlight on yank',
--   callback = function(event)
--     vim.highlight.on_yank({higroup = 'Visual', timeout = 200})
--   end
-- })

vim.keymap.set('n', '<F6>', ':NERDTreeToggle<CR>')
vim.keymap.set('n', 'gv', ':Gvdiff<CR>')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-i>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- To map <Esc> to exit terminal-mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- To use ALT+{h,j,k,l} to navigate windows from any mode
vim.keymap.set({'t', 'i'}, '<A-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set({'t', 'i'}, '<A-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set({'t', 'i'}, '<A-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set({'t', 'i'}, '<A-l>', '<C-\\><C-N><C-w>l')

vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')
-- git-gutter
vim.keymap.set('n', ']h', '<Plug>(GitGutterNextHunk)')
vim.keymap.set('n', '[h', '<Plug>(GitGutterPrevHunk)')

vim.g.gitgutter_max_signs = -1   -- default value (otherwise)

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {
  capabilities = capabilities,
}

require'lspconfig'.angularls.setup{
  capabilities = capabilities,
}

vim.cmd.colorscheme('kanagawa')

