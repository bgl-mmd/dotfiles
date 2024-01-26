call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'dracula/vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'tobi-wan-kenobi/zengarden'
Plug 'airblade/vim-gitgutter'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'talha-akram/noctis.nvim'

call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

" THEME
colorscheme zengarden
set background=dark

" SYNTAX
set nu     		" Enable line numbers
syntax on  		" Enable syntax highlighting
set tabstop=4 		" How many columns of whitespace a \t is worth
set shiftwidth=4 	" How many columns of whitespace a "level of indentation" is worth
set expandtab 		" Use spaces when tabbing

" SEARCH
set incsearch  		" Enable incremental search
set hlsearch   		" Enable highlight search

" TERM
" set termwinsize=12x0   	" Set terminal size
set splitbelow         	" Always split below

" MOUSE
set mouse=a            	" Enable mouse drag on window splits

" KEY
nnoremap <F6> :NERDTreeToggle<CR>
nnoremap gv :Gvdiff<CR>

nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <C-i> <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

" To map <Esc> to exit terminal-mode
:tnoremap <Esc> <C-\><C-n>

" To simulate i_CTRL-R in terminal-mode
:tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" To use ALT+{h,j,k,l} to navigate windows from any mode
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" git-gutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

let g:gitgutter_max_signs = -1   " default value (otherwise)

