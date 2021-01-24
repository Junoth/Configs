set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'preservim/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdcommenter'
Plugin 'DoxygenToolkit.vim'
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" Buffer
map <C-j> :bnext<CR>
map <C-k> :bprev<CR>
map <C-D> :bdelete<CR>

" Doxygen
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns "
let g:DoxygenToolkit_authorName="Junoth"

" vim-airline
set ambiwidth=double
let laststatus = 2
let g:airline_powerline_fonts = 1 
let g:airline_theme="dark"       
let g:airline#extensions#tabline#enabled = 1    
let g:airline#extensions#tabline#left_sep = ' '   
let g:airline#extensions#tabline#left_alt_sep = '|'   
let g:airline#extensions#tabline#buffer_nr_show = 1 

syntax on
set tabstop=2
set shiftwidth=2
set termwinsize=20x0
set expandtab
set ai
set number
set hlsearch
set ruler
set splitbelow
set foldmethod=syntax
set foldlevel=99
highlight Comment ctermfg=green
