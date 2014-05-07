set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set number 

"vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" " alternatively, pass a path where Vundle should install plugins
" "let path = '~/some/path/here'
" "call vundle#rc(path)
"
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
filetype plugin indent on     " required

"CtrlP configure
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

nmap <silent> <C-F> :NERDTreeToggle<CR> 

if has("gui_running")
    syntax on
    set guioptions-=r
    set guioptions-=l
    set guifont=Monaco:h18
    colorscheme codeschool
else
    syntax on
    set term=builtin_ansi
	:map <C-A> <Home>
	:map <C-E> <End>
endif

if has("cscope")
    set cscopetag
    set csto=0
    if filereadable("cscope.out")
        cs add cscope.out  
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
endif
