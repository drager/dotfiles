call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql']
  \ }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'neomake/neomake', { 'for': ['rust', 'haskell', 'typescript'] }
Plug 'plasticboy/vim-markdown'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'mhartington/nvim-typescript'

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Rust Plugins
if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
endif

Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'

call plug#end()

" appearance
syntax on
set background=dark
colorscheme gruvbox
" set termguicolors
"set ttyfast
"set t_ut=
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Required for operations modifying multiple buffers like rename.
set hidden
set number

set clipboard+=unnamedplus

let g:rustfmt_autosave = 1
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'typescript.tsx': ['tcp://127.0.0.1:2089'],
    \ }

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <Leader>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <Leader>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <Leader>f :call LanguageClient#textDocument_formatting()<CR>
nnoremap <Leader>H :call LanguageClient#textDocument_hover()<CR>

let NERDTreeShowHidden = 1

" autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'


" Prettier
let g:prettier#autoformat = 1
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#semi = 'false'
