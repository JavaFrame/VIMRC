call plug#begin('~/.vim/plugged')
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'

Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'jodosha/vim-godebug'

Plug 'artur-shaik/vim-javacomplete2'
Plug 'neomake/neomake'

Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

Plug 'zchee/deoplete-jedi'
call plug#end()

set number
filetype on
filetype plugin on
syntax on
colorscheme Tomorrow-Night

set guifont=Menlo\ Regular:h18

set lines=35 columns=150
set colorcolumn=90

let mapleader=' '

"better undo/redoing
imap <Space> <Space><C-G>u

" setting history settings
set hidden
set history=100

" indenting
filetype indent on
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" removing whitespaces at the end of a line
autocmd BufWritePre * :%s/\s\+$//e

" search settings
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" showing paranthese matches
set showmatch

" command-t
noremap <Leader>r :CommandTFlush<Cr>

" lightline
set laststatus=2

" nerdtree
let NERDTreeShowHidden=1

nmap <leader>j :NERDTreeFind<CR>
nmap <leader>n :NERDTreeToggle<CR>

autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTree
autocmd VimEnter * wincmd p

" neomake
call neomake#configure#automake('nrwi')
let g:neomake_open_list = 2

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]<.\w*'
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


" java
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" php
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
autocmd FileType php setlocal omnifunc=phpcd#CompletePHP

" set workspace
cd ~/Documents/Programmieren/

