let g:python3_host_prog='C:\Users\Sebastian\AppData\Local\Programs\Python\Python36-32\python.exe'
let g:python_host_prog='C:\Python27\python.exe'

call plug#begin('~/.vim/plugged')

Plug 'Shougo/denite.nvim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'bling/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme one
set background=dark

set number

" call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap <C-p> :Unite file_rec/async<cr>
