-- copy paste from system clipboard
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')

-- change default remove register
vim.keymap.set({'n', 'x'}, 'x', '"_x')

-- select all
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

vim.keymap.set('n', '<F6>', ':NERDTreeToggle<CR>')
vim.keymap.set('n', 'gv', ':Gvdiff<CR>')

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<C-i>', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

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
