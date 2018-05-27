call plug#begin('~/.vim/plugged')
"Plug 'wincent/command-t', {
"   \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
"    \ }
"
Plug 'Shougo/denite.nvim'
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'

Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'

Plug 'Shougo/deoplete.nvim'
Plug 'chemzqm/unite-location'

Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'

Plug 'majutsushi/tagbar'

" go
Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'jodosha/vim-godebug'

" java
Plug 'artur-shaik/vim-javacomplete2'

" php
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

Plug 'zchee/deoplete-jedi'

" latex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" common lisp
Plug 'l04m33/vlime', {'rtp': 'vim/'}

"Plug '~/.vim/plugged/test-autocompletion'

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

" lightline
set laststatus=2

" nerdtree
let NERDTreeShowHidden=0

nmap <leader>j :NERDTreeFind<CR>
nmap <leader>n :NERDTreeToggle<CR>

autocmd VimEnter * NERDTreeMirror
autocmd BufWinEnter * NERDTreeMirror
autocmd VimEnter * wincmd p

" denite
nmap <leader>t :Denite file_rec buffer<CR>

" neomake
call neomake#configure#automake('nrwi')
let g:neomake_open_list = 0

call denite#custom#source('quickfix', 'sorters', 'sorter_reverse')
call denite#custom#source('location_list', 'sorters', 'sorter_reverse')

" autoformat with neoformat
augroup astyle
    autocmd!
    autocmd BufWritePre * Neoformat
augroup END

let g:neoformat_only_msg_on_error = 1

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
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)


" php
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
autocmd FileType php setlocal omnifunc=phpcd#CompletePHP

" settings project plugin settings
let g:project_enable_welcome = 1
let g:project_use_nerdtree = 1


" set workspace
" cd ~/Documents/Programmieren/

