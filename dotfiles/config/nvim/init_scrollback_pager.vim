call plug#begin('~/.local/share/nvim/plugged')

Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'morhetz/gruvbox'

call plug#end()

" Appearance
syntax on
set background=dark
colorscheme gruvbox
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Required for operations modifying multiple buffers like rename.
set hidden
set number

set clipboard+=unnamedplus

