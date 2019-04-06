call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
"Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'python',
    \ 'ruby',
    \ 'html'] }
"Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'plasticboy/vim-markdown'
Plug 'LnL7/vim-nix'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'idris-hackers/idris-vim'
"Plug 'peitalin/vim-jsx-typescript'
"Plug 'mxw/vim-jsx'
"Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'HerringtonDarkholme/yats.vim'
"Plug 'mhartington/nvim-typescript'

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
"Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'jlanzarotta/bufexplorer'

Plug 'sakhnik/nvim-gdb'
Plug 'neomake/neomake', { 'for': ['rust', 'haskell', 'typescript'] }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

" Appearance
syntax on
filetype on
filetype plugin indent on
set background=dark
colorscheme gruvbox
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" Check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

" Required for operations modifying multiple buffers like rename.
set hidden
set number

set clipboard+=unnamedplus

"let g:jsx_ext_required = 2

let g:rustfmt_autosave = 1

" LanguageClient
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
		\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'typescript': ['javascript-typescript-stdio'],
		\ 'typescript.tsx': ['tcp://127.0.0.1:2089'],
    \ }


nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <Leader>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <Leader>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <Leader>f :call LanguageClient#textDocument_formatting()<CR>
nnoremap <Leader>H :call LanguageClient#textDocument_hover()<CR>
nnoremap <C-L> :buffers<CR>:buffer<Space>
nnoremap <Leader>' :call LanguageClient#textDocument_codeAction()<CR>
autocmd BufWritePre *.re :call LanguageClient#textDocument_formatting()

" NERDTree
let NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
nmap <silent> <C-t> :NERDTreeToggle<CR>


" Prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 1
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#semi = 'false'

"let g:ale_fix_on_save = 1
"let g:ale_fixers = {
"\   'javascript': ['prettier', 'eslint'],
"\   'typescript': ['prettier', 'tslint'],
"\}

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx PrettierAsync
